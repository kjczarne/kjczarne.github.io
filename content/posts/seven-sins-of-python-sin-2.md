---
title: "Seven Sins of Python - Sin 2"
date: 2021-12-16T23:51:37+01:00
tags:
  - seven-sins-of-python
showToc: true
---

## Sin number 2: too few optimized functions used

This one is pretty common especially for newcomers who have learnt enough about Python to be able to loop over data structures but haven't yet realized how slow Python loops really are.

### Whence the temptation?

If you're fresh to Python, the temptation to create `for` loops everywhere for lists and dictionaries is immense. Consider a fairly simple example, where we loop over 100000 random integers and we apply a simple mathematical operation to each of those integers. The most straightforward solution would be:

```python
for i in random_integers:
    out_list.append(perform_predefined_calculation(i))
```

(assumming here that `perform_predefined_calculation` and `random_integer` exist)

A slightly more _Pythonic_ way to express this would be:

```python
out_list = [perform_predefined_calculation(i) for i in random_integers]
```

### Why is this a sin?

While it might be ok for small data structures, the problem with all kinds of loops in Python is that they're pretty slow in comparison with functional constructs such as `map` or `filter`. Why is that? Python is an interpreted language, so every statement is evaluated at runtime, there is no compilation process. But functions like `map` and `filter` were actually implemented in C (well, at least if you're using the most widespread CPython) and C code can be, well... pretty fast.

The test I've ran showed about 30% performance increase with a simple refactor from a `for` loop to a `list(map(f, x))` idiom.

You can do your own timings on your own and modify the examples as you please in this [Python notebook](https://github.com/kjczarne/kjczarne.github.io/tree/master/content/notebooks/python-sin-2.ipynb).

### How to recognize a sinner?

Our sinners will most likely be individuals less experienced with Python and can be recognized by profilic abuse of loops whenever working with iterable data structures. Every professional will also often use `for` and less often `while`, however performance-critical parts of code where a large amount of data is expected will almost always be brimming with the functional idioms.

### How to repent?

- It's okay to use `for` and `while` but not where you need _fast_ code.
- Learn to use at least `map`, `filter` and `functools.reduce`.
- Refactor code that iderates over large data structures to use the aforementioned functions.

In our particular example, the repentance is easy and gives us code nearly as pretty as the list comprehension used before:

```python
out_list = list(map(perform_predefined_calculation, random_integers))
```

> 👀 `map` applies `perform_predefined_calculation` function to each element of the `random_integers` list. `map` is _lazy_ so it will only run when we iterate over the result at some point. To load the output as a standard Python list, we can simply wrap it into a `list()` call. The output will be thus exactly the same as originally but we'll be able to obtain it much faster.
