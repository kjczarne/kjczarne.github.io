---
title: "Seven Sins of Python - Sin 3"
date: 2021-12-17T22:26:21+01:00
showToc: true
tags:
  - seven-sins-of-python
---

## Sin number 3: Unconditional romance with ducktyping

### Whence the temptation?

Python is truly awesome. In C++17 there is no easy way of expressing ranges. In Python an integer range \\(\langle 0, 4 \rangle\\) is simply `range(0, 5)`.

The syntactic simplicity and high conciseness of the language was originally related to the fact that Python does not have static typing. In Python [ducktyping](https://en.wikipedia.org/wiki/Duck_typing) means that you can actually call a function that expects an integer with a string and you will likely only realize at runtime, since there is no compilation step. It makes coding in Python, well... very easy to begin with but it comes at a huge cost of bugs appearing in production code.

### Why is this a sin?

Actually, let's make it an example:

```python
def add_two_ints(x, y):
    return x + y
```

If we call this like `add_two_ints(2, 2)`, we will get 4.

What will we get if we invoke `add_two_ints(2, "lol")`? Is it even possible? Well, kind of. You can call the function but you will get a runtime error:

```plaintext
TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

Adding a `2` to a `"lol"` string is quite ambiguous and in most cases probably a bug so the interpreter throws an error. But notice that we were able to call the function and there was no type checking happening up to the point of `x + y` operation.

If we tweak this function slightly:

```python
def add_two_ints(x, y):
    print(f"x is {x}, y is {y}")
    return x + y
```

The `print` will run just fine and give us `"x is 2, y is 2"`! So the input was not checked in any way before the function body has been executed.

The example is trivial. But as your code expands, these problems will grow out of control very quickly. We should have a way of controlling the types of input values we're invoking the function with.

### How to recognize a sinner?

Sinners will use bare Python without _type hints_ (which we'll discuss as a solution in the next section) or in the worst instance no facilities for type checking. To make it clearer:

#### Bad solution

The exact example we used originally is a prime example of the worst solution possible:

```python
def add_two_ints(x, y):
    return x + y
```

#### Slightly better solution

A slightly improved variant would actually check the types of arguments at runtime:

```python
def add_two_ints(x, y):
    if type(x) is not int and type(y) is not int:
        raise ValueError(f"This function accepts only integers as parameters! Called with {x} and {y}")
    return x + y
```

However when writing code in any modern editor (e.g. VSCode with Pylance Server or JetBrains PyCharm), the language analyzer will not catch any bad invocations as you write your code. You have to _run it_ to see where it fails and that's suboptimal in terms of development speed and it tends to get very frustrating.

If you place the following somewhere else in your code, perhaps in a different module where you import your brand new `add_two_ints` function:

```python
add_two_ints(2, "lol")
```

Your editor will not tell you that you're using the wrong arguments _until you run the script_.

### How to repent?

There is one extremely important feature that has been added in Python 3.5 and solves the aforementioned problem: **type hints**. The advantage of using type hints over bare runtime checking is that you can catch type mismatch issues _before_ you run your code. First you would have to refactor the function slightly:

```python
def add_two_ints(x: int, y: int) -> int:
    if type(x) is not int and type(y) is not int:
        raise ValueError(f"This function accepts only integers as parameters! Called with {x} and {y}")
    return x + y
```

This gives you the following benefits:

- `add_two_ints(x: int, y: int) -> int` describes the entire signature of the function. Most analysis services like the Python Language Server in VSCode will be able to suggest you what type the input parameters are _while you're coding_.
- The aforementioned Language Server will also display a red squiggle under each parameter that is of an unexpected type, hence it will notify you of mistakes like `add_two_ints(2, "lol")` _while you're coding_.
- You can force every contributor to use type hints where they're required by using static type checkers like [pyright](https://github.com/microsoft/pyright) by running this in your code acceptance pipelines.

Important question: **does this absolve me from runtime parameter checking**? Well, it doesn't prevent anyone from still conjuring deamons like `add_two_ints(2, "lol")` but at least it will give them a hint if they themselves use something that comes at least close to what VSCode+Pylance can provide.

In the end my recommendations would be:

> 👉 Use type hints aggressively. Invest ample time into learning about type aliases, hints for generics, etc. There is a lot of resources out there but if you want a fairly condensed overview, throw in a comment and I'll share my own reference sheet. Good news: it's so easy and intuitive that it will enter your muscle memory within a few days.

> 👉 Use VSCode with the Pylance Python Language Server. It understands type hints and tells you right away when you're attempting something you shouldn't be doing. Or really just use any other IDE or editor that understands type hints.

> 👉 If you want to be absolutely certain that whoever uses your code doesn't pass a wrong parameter, use runtime type checking and throw _informative_ errors to let the user understand where the error came from.

> 👀 Trust me when I say this: you wouldn't believe how many bugs having static type information is able to catch. When you're typing for hours on end you will get tired. You will overlook things. You will get distracted. If you really want high-quality code that will be easier to maintain, use every possibility to be your own adversary and try to catch your own mistakes.

While it's lately become a controversial topic to exactly quantify how much more catching a bug in production than in development costs, there have been some ridiculous examples of [bugs costing companies hundreds of millions of dollars](https://smartbear.com/blog/software-bug-cost/). Pareto principle definitely applies here, putting too many safeguards into your code acceptance pipeline may actually decrease productivity if you go overboard. Type hints however gave me personally the biggest bang for the buck when it comes to code quality assurance, that's why I am so bullish on them.
