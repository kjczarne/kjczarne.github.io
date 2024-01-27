---
title: "Seven Sins of Python - Sin 4"
date: 2021-12-27T20:46:12+01:00
showToc: true
categories:
  - software-development
tags:
  - seven-sins-of-python
---

## Sin number 4: Exception frenzy

Python's `Exception` class is probably one of the most abused and misused features of the language. It's also something that no developer can escape from.

### Whence the temptation?

An `Exception` is a pretty natural element of any language. In all languages one will always have some need for a runtime error. In case of Python, most runtime errors inherit from the `Exception` class. Though technically not a base class (for that would be `BaseException`), it should be treated like a base class and it often isn't.

One of the most common forms of antipatterns with exceptions in Python are:

- catching exceptions instead of checking values
- using `Exception` class for user-defined exceptions directly
- abusing `try/except` clause

### Why is this a sin?

Proper patterns enforced when using exceptions mean that your code is more stable and more readable at the same time. Novice developers will often abuse `try/except` and `raise` just because it's easy to catch _something wrong_ or cause _something wrong_ to happen.

### How to recognize a sinner?

This is by far the most common antipattern I've seen, which almost always appears when working with dictionaries:

```python
try:
    print(some_dict["sth"])
except Exception:
    pass
```

There are two problems with this solution. First, what's _caught_ is a general `Exception` class. This means that if we place any other code into the `try` block that throws any other type of exception, we will not be able to detect the problem:

```python
try:
    print(some_dict["sth"])
    int("I cannot be converted to an integer")
except Exception:
    pass
```

The code above will run without any issues reported! To fix this we could hone in on the concrete type of an exception that the invalid key access throws for a dictionary:

```python
try:
    print(some_dict["sth"])
    int("I cannot be converted to an integer")
except KeyError:
    pass
```

Now, we're catching only the `KeyError`s. That's good because this means that our ridiculous `int` cast in the example above will crash the application and we'll be forced to fix the issue. I guess you can now see how dangerous operating `try/except` can be.

#### Exceptions can be too general

This also explains why we should create subclasses from `Exception` instead of raising `Exception` itself everywhere in our program. Most exceptions are not equivalent and it will be easier for the consumers of your Python package to handle failure cases. So doing this would be fairly bad:

```python
x = 0
if type(x) is not int:
    raise Exception("x should be int")
if x > 0:
    raise Exception("x should not be greater than 0")
```

### How to repent?

So let's fix the issues that we've outlined in the previous section. We've already covered catching `KeyError` but frankly if you are able to avoid `try/except`, do it. In case of dictionary key access, it's pretty easy:

```python
if "sth" in some_dict.keys():
    print(some_dict["sth"])
else:
    print("No sth key in dict")
```

I like to call this pattern: _check for values instead of catching errors_. You should always try to cover all possibilities when working with something that _might_ fail. Languages with strong functional paradigms like Rust will usually enforce this with structural pattern matching. Python 3.10 has introduced pattern matching, so if you're a fan of functional, you could express the same like this:

```python
match some_dict:
    case {"sth": x}:
        print(x)
    case _:
        print("No sth key in dict")
```

I find pattern matching an absolutely brilliant option. Notice that in the example above I didn't have to use `.keys()` and `in` at any point, I just told the interpreter to pattern-match a sub-dict of the `some_dict` and place the value into a variable named `x`.

Probably the cleanest solution is to use `collections.defaultdict`:

```python
from collections import defaultdict
some_defaultdict = defaultdict(lambda: None, some_dict)
print(some_dict["sth"] or "No key sth in dict")
```

`defaultdict` behaves just like a normal dictionary but when it's created you give it a function that will _make_ a default value when a particular key is missing. I usually like to use it with `lambda: None` so that subsequently I can use the `something or default` idiom.

> 👉 Avoid `try/except` when you can unless you really have to handle an error and there is no way to check for a value without resorting to error handling.

#### Making exceptions more precise

So going one step further if you're creating your own exception cases you should also make subclasses from the `Exception` class for each family of errors. The example that we used before in the previous section to demonstrate this should ideally be refactored as:

```python
x = 0
if type(x) is not int:
    raise TypeError("x should be int")
if x > 0:
    raise ValueError("x should not be greater than 0")
```

`TypeError` and `ValueError` are already built-in error classes in Python which are a great option for generic errors when a wrong value or an improper type has been provided. But consider the following example:

```python
if obj_a == obj_b:
    raise Exception("Objects should not be identical")
```

This one doesn't really fit with `ValueError` or `TypeError` since it's more about equality of two custom objects (assumming `obj_a` and `obj_b` exist). Instead we should define a custom `Exception` type and `raise` it:

```python
class ObjectsIdenticalException(Exception):
    """Raised when two objects are identical"""
    pass


if obj_a == obj_b:
    raise ObjectsIdenticalException("Objects should not be identical")
```

This way any consumer of your package can decide to catch `ObjectsIdenticalException` just as we have caught `KeyError` for the dictionary keys instead of catching the most general `Exception`.
