---
title: "Seven Sins of Python - Sin 7"
date: 2022-07-04T22:01:01+02:00
showToc: true
categories:
  - software-development
tags:
  - seven-sins-of-python
---

## Sin number 7: `from nightmare import *`

I've been thinking long about which sin to name as the last in the grand seven of Python No-Nos. It finally came to me when working on one of legacy projects I've been contributing to (sadly this one is not open-source, so I cannot share the details).

_star_ imports -> imports formed like the titular `from nightmare import *`.

### Whence the temptation?

Star imports are tempting because they seem to reduce boilerplate. For example, instead of importing a number of objects from a module by importing them explicitly, you could just use a `*` and all available objects would be imported:

```python
from magic_module import magic_wand, magic_cape, magic_hat
# vs.
from magic_module import *
```

If you've worked with Python for a little while you almost certainly have seen a star import somewhere.

### Why is this a sin?

While they are really nice to keep the top of the file with the import statements tidy, they are a huge pain in the neck for anybody who is supposed to read and understand your code and also might cause unnecessary namespace pollution.

#### A wild object appears

Why is this bad? Well, imagine that in our example from before I didn't care much for explicitly importing stuff and just used `from magic_module import *`.

Now imagine I use two of the three objects that I've imported before throughout the script:

```python
from magic_module import *

# a lot of code here...

def put_on(hat):
    if type(hat) == type(magic_hat):
        print("Abracadabra")
    else:
        print("I am an average hat enjoyer")

# a lot of code here...

def do_magic():
    magic_wand.use()

# a lot of code here...
```

Now imagine the `magic_module` is not the only module I import:

```python
from magic_module import *
from special_module import *
from very_special_module import *
from not_so_special_module import *
from no_ideas_for_names_module import *
```

Suppose you have never seen the script before and you know nothing about any of these modules. Fair enough.

So now, a question: where do `magic_wand` and `magic_hat` come from? Perhaps they were imported from `special_module`? Or perhaps `not_so_special_module`? Essentially in such a situation people usually rely on their IDEs to find that symbol throughout the modules but this usually costs a lot of memory, e.g. PyCharm likes to build an index of these and that's why I never touch PyCharm for Python development, since it consumes a lot of resources. For me it was generally slow, bloated and confusing since the very beginning.

#### Let's invite everybody to the party

On the flipside let's imagine what would happen with a `*` import if the module you're importing from has a lot of importable symbols. Imagine for a brief moment that you want to invite your friends to a birthday party with a Python import statement (I know it's dumb, bear with me please):

```python
from friends import Adam, Anna, Eve, Evelyn, Derek, Fabian, Felicia, ...
```

At some point you get tired and you're like _you know what, let's just invite everybody_:

```python
from friends import *
```

The day of the party comes and you see an ocean of people flooding your suburban street carrying a giant birthday cake and singing _Happy Birthday_ in a volume that's making your house windows rattle. You were expecting 30 people, you got over 1000.

But how could have this happened?

You inspect the `friends` module and horrified you find that it contains:

```python
from contact_list import *
```

You've invited everybody from your contact list, because the module was importing all contacts first in order to classify them as friends. Is there any way you could have avoided that?

Well there would have been two ways. First, you could have just stopped using `*` imports and explicitly list all the people that were invited. But if you really for some reason wanted to still do `from friends import *` without the consequence of actually _importing everybody_, then you could have set `__all__` in the `friends` module:

```python
from contact_list import *

__all__ = ['Adam', 'Anna', 'Eve', 'Evelyn', 'Derek', 'Fabian', 'Felicia', ...]
# Note that `__all__` contains symbol _names_, not literal symbols
```

`__all__` is a nifty little module-level attribute that lets you control what symbols will be visible to other modules that import the current module. In other words, it restricts the number of symbols that are automatically exposed when doing star imports. In some way it is analogous to the `export` keyword from JavaScript, however here it still would be possible to _explicitly_ import something that is not mentioned in `__all__`, unlike in JS.

### How to recognize a sinner?

Star imports are not necessarily the bane of my existence. Generally it is possible to figure out what comes from where but namespace pollution that often results from them (the _everyone instead of friends_ situation) can be very painful for the users of your project. You generally don't want the user to have access to every single implementation detail of your module and you should actually prefer to expose the bare minimum that still offers enough flexibility to get the user's job done.

But... I haven't used star imports for years and I will likely never use them. I really hope you will stop using them as well after having understood the problems associated.

### How to repent?

Here's what we should do (in my humble opinion):

- Forget the existence of the star imports in our own code -> i.e. stop using `from x import *` and start using `from x import y, z`.
- Make our user-facing interface be _resilient against others using the start imports_ -> i.e. modules you consider public, should have `__all__` defined as a list of symbol names that you actually want the users to get, should they do `from your_module import *`.
