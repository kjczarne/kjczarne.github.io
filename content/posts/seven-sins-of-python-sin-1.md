---
title: "Seven Sins of Python - Sin 1"
date: 2021-12-10T23:28:34+01:00
draft: false
showToc: true
tags:
  - seven-sins-of-python
categories:
  - software-development
---

## Sin number 1: Do not modify `builtins` and `globals`

This is one of the biggest no-nos for me and something that I shot myself in the foot at least twice in my career as a Python dev. I've also seen this used in actual production code that was deployed to some important clients.

### Whence the temptation?

- `builtins` is a collection of objects that are available from within any Python script and are loaded before any script is executed by the interpreter. If you've ever used `int`, `bytes`, `dict`, `list`, etc. then these all come from `builtins`.
- `globals` is a collection of objects that exist in current global scope, so objects accessible to any module at a particular point in time when your script is running.

> 👉 It is tempting to modify the `builtins` to expose a particular custom function or object globally to any running Python script without the need to `import` a module explicitly. Likewise the modification of `globals` can enable such magic as dynamic imports of modules that are a part of the same package without actually using the explicit module names.

### Why is this a sin?

In both cases it makes your code less explicit and modifies global interpreter behavior after `builtins` or `globals` have been modified. The implications of this are:

- Nobody understands your code -> you're using symbols that were sneakily imported at some point but no person using your code will be able to easily tell what module they came from and what they do.
- It often breaks code suggestions -> implicilty imported stuff may not be picked up by language analysis tools that try to determine the validity of statements in your code.
- It creates a potential for name collisions -> if you were to e.g. define your own `map` function and then tried adding it to `builtins` you could inadvertently override a built-in `map` function. Such blunders are extremely hard to debug.

### How to recognize a sinner?

The following example function walks two steps into an `src` submodule and looks for classes that are subclasses of `ImportMe` and `ImportMeToo`. It then adds them to `globals`, which can be used in current scope.

```python
def walking_import():
    from mod import src
    for _, name, _ in pkgutil.walk_packages(src.__path__):
        _temp = importlib.import_module(src.__package__ + '.' + name)
        for _, n, _ in pkgutil.walk_packages(_temp.__path__):
            _temp2 = importlib.import_module(_temp.__package__ + '.' + n)
            for n2, m in inspect.getmembers(_temp2, inspect.isclass):
                if issubclass(m, ImportMe) or issubclass(m, ImportMeToo):
                    globals()[n2] = m
    return globals()
```

This is a real function (though slightly redacted) that I once put into production code. A few weeks later we had to change the import sequence in the entire package back to what it used to be because modifying `globals` made IntelliSense useless and nobody could make sense of the code.

### How to repent?

My advice: never modify `globals` or `builtins`. If you find yourself doing that then probably something is fundamentally wrong with the design of your application. If you're a novice make sure to consult your application design with somebody who has more experience. Prefer explicit imports and as little import magic as possible.

> 👀 Where import magic was usually useful for me was when I wanted to load entire Python scripts as _configuration_ files. Even though I would use `importlib` and `inspect` modules for that, I would never touch `globals` or `builtins`.
