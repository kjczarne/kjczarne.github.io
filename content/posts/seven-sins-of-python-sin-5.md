---
title: "Seven Sins of Python - Sin 5"
date: 2021-12-28T23:43:52+01:00
showToc: true
categories:
  - software-development
tags:
  - seven-sins-of-python
---

## Sin number 5: `global` destruction

Every time I am asked about `global` keyword in Python, I get a split-second heart attack. Personally I think it is one of the most unnecessary and dangerous keywords that Python has to offer. I will go one step further and postulate that if you're using `nonlocal` you're probably doing it wrong.

> 👉 The essence of this problem is misunderstanding the purpose or the mechanics of **scope** in Python.

### Whence the temptation?

Consider a very simple example. Imagine you've just learned about the existence of functions in Python and you want to reuse repetitive pieces of code as much as possible:

```python
def concatenate_all_strings():
    string1 = "a"
    string2 = "b"
    string3 = "c"
    return string1 + string2 + string3


print(concatenate_all_strings())
```

Great! This works. But what if you want to use `string1` somewhere else? Let's say I type up 100 more lines of code and I'm suddenly in need of printing out the `string1` variable:

```python
def concatenate_all_strings():
    string1 = "a"
    string2 = "b"
    string3 = "c"
    return string1 + string2 + string3


print(concatenate_all_strings())

# 100 more lines of some code...

print(string1)
```

What you get when you run this script would be: `NameError: name 'string1' is not defined`. Now you start searching the Internet for a solution to your problem and inadvertently you find that the simplest way to make a variable that exists within a function body accessible elsewhere is to use `global`. You will then merrily refactor the above to:

```python
def concatenate_all_strings():
    global string1
    global string2
    global string3
    string1 = "a"
    string2 = "b"
    string3 = "c"
    return string1 + string2 + string3


print(concatenate_all_strings())

# 100 more lines of some code...

print(string1)
```

### Why is this a sin?

This creates a potential for name conflicts and introduces a lack of clarity. When you refuse to use scoped variables and declare everything as `global` when you want to share variables, you will inadvertetly run into situations where a local variable has the same name as one in an outer scope and depending on which one is evaluated when, you will either end up with the value declared in the outer scope or the inner scope. Furthermore, any implicit modification of the global state makes code harder to understand because you end up searching for the variables in each function body.

This is especially painful when you realize how easy it is to avoid using `global` altogether and that avoiding `global` comes naturally when you know some proper functional patterns.

### How to recognize a sinner?

Any use of `global` or `nonlocal` should put up red flags. Honestly, I haven't seen any piece of code in my life that couldn't be refactored to avoid these keywords and such refactoring always resulted in improvements in code maintainability.

> 👀 Remember, just because some solution is more concise and quicker to implement, doesn't mean that it will lead to better maintainability. Always assume that somebody else will read your code, thus you should use patterns that make it easy to pinpoint the flow of information in a clear way. `global` is not one of those patterns. Also, consider that even if nobody else will end up reading your code in the future, your future self might not remember what the project was about in a few weeks. So if not for the sake of your colleagues, avoid antipatterns as a good deed for your future self.

### How to repent?

#### Understand and leverage scope

Most uses of `global` stem from the misunderstanding of scope. Scope essentially means that whatever is _within_ a function or a class belongs to that function or class if it's declared there. Anything from the outer scope is accessible to the inner scope but the inverse is not true. You should put variable declarations into such a scope that can be accessed by all the consumers of those variables. In our example this would be the top-level scope of the Python module that we were running:

```python
string1 = "a"  # accessible to both `concatenate_all_strings` and top-level `print`

def concatenate_all_strings():
    string2 = "b"  # accessible only within this function
    string3 = "c"  # accessible only within this function
    return string1 + string2 + string3


print(concatenate_all_strings())

# 100 more lines of some code...

print(string1)
```

The good part is that if I needed to declare a variable named `string2` in the top-level of the script and print it but I would like to keep the original `string2` value within the function I could simply do this:

```python
string1 = "a"
string2 = "lol"

def concatenate_all_strings():
    string2 = "b"  # accessible only within this function
    string3 = "c"  # accessible only within this function
    return string1 + string2 + string3


print(concatenate_all_strings())  # prints "abc"

# 100 more lines of some code...

print(string1)  # prints "a"
print(string2)  # prints "lol"
```

With scoping it's clear where a particular variable belongs. Every time you enter function scope or class scope it's a bit like entering a different room in a house. The mirror that hangs on the wall of your own bedroom looks different to the one in your bathroom. The name is still the same but the value doesn't have to be and it still makes sense that two rooms have a `mirror` object within them.

#### Treat functions like physical factory machines

If you've worked with Python for a while you will realize that the solution above is kind of lousy and lazy as well. And if you paid attention in math classes you will realize that our function `concatenate_all_strings` does not really behave like a mathematical function.

> 👀 In mathematics, a function is an instrument that takes a set of arguments and produces one value from that set of arguments. In programming, we call functions equivalent to mathematical functions _pure functions_.

Whenever you have the chance you should **parameterize what you can and use pure functions**. In Python, if you combine that with type hints, the function signature, i.e. the function name alongside its parameters and return type, gives you a very clear idea of what the function does and how it should behave.

```python
string1 = "a"
string2 = "b"
string3 = "c"

def concatenate_all_strings(string1: str, string2: str, string3: str) -> str:
    return string1 + string2 + string3


print(concatenate_all_strings(string1=string1, string2=string2, string3=string3))

# 100 more lines of some code...

print(string1)
```

Notice how `def concatenate_all_strings(string1: str, string2: str, string3: str) -> str` tells you almost everything you need to know about the function. It takes in 3 strings and returns a single string and if the name is to be trusted it will probably concatenate the input strings. This function is **pure**. It does not modify the input in any way, it simply takes the input and produces some output, like a factory machine that takes in some raw material and returns a product. Actually, it's even better because it does not destroy `string1`, `string2` and `string3` in the process so these can be later reused.

#### Identify repetition and parameterize

Finally, the way I would refactor the example:

```python
from typing import List

string1 = "a"
string2 = "b"
string3 = "c"

def concatenate_all_strings(string_list: List[str]) -> str:
    result = ""
    for s in string_list:
        result += s
    return result


print(concatenate_all_strings([string1, string2, string3]))

# 100 more lines of some code...

print(string1)
```

When parameterizing functions that used to abuse `global` or `nonlocal` you will realize that there may be some sensless repetition involved and the number of parameters quickly explodes. What if I wanted to concatenate not 3 but 4, 5, 6, etc. strings? Every time I would like to add another one, I'd need to add it to the parameter list and then call the function with an additional argument. This is tedious. When you realize this is the way it's going, think about generalizing the parameter set a bit more. In this case a list of arbitrary length might be the best choice. In other cases you might want to use generators, dictionaries, etc.

> 🤔 You might be wondering why I didn't use the `*args` idiom and used a list as a parameter. Type annotations on `*args` and `**kwargs` can sometimes get tricky and this makes the function signature almost always less explicit. Some programming languages do not even support variable number of arguments in functions, Rust for example allows you to do that only in macros, which are essentially generating Rust code before compilation happens and are not functions that will be evaluated at runtime. My advice is to avoid `*args` and `**kwargs` unless there is a very good reason for the user interface to leverage them.

#### Learn advanced scope patterns

Last, let's take a look at something more advanced if you're coming here for some more serious patterns.

Scoping can be really powerful. My favorite example is a closure. In Rust closures are basically lambda functions that can capture their outer scope:

```rust
fn do_something() {
  let x: i32 = 5;

  let add_x = |i| i + x;  // `x` is grabbed from the outer scope
  add_x  // `add_x` is returned
}

let lazy_add_x = do_something();
let result = lazy_add_x(5);
println!("{}", result);
```

In Python, _all_ functions can capture their outer scope. Thus the idea of a closure should usually be expressed with a nested function:

```python
from typing import Callable


def add_x(i: int) -> Callable[[], int]:
    x = 5

    def wrapper():
        # `x` is grabbed from outer scope
        return i + x

    return wrapper


lazy_add_x = add_x(5)
result = lazy_add_x()
print(result)
print(x)  # fails, `x` only exists within `add_x` scope
```

#### Conclusions

> 👉 Never use `global` and `nonlocal`. If you find you need it, it's probably because you have a design flaw in your code or you're misunderstanding scope.

> 👉 When using functions parameterize what you can for better code reuse.

> 👉 Use pure functions whenever you can. Don't silently modify state, return values instead.

> 👉 If you find yourself copy-pasting or repeating more or less the same thing over and over again, there's probably a more general parameter set that you could leverage.
