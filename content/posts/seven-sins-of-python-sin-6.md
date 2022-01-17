---
title: "Seven Sins of Python - Sin 6"
date: 2022-01-17T20:16:32+01:00
showToc: true
categories:
  - software-development
tags:
  - seven-sins-of-python
---

## Sin number 6: Packaging not done right

Packaging Python projects properly can be truly a pain in the neck. However learning how to properly set up a package is extremely valuable because adherence to standards means more people can use your package efficiently.

> 👉 The biggest sin of all things package-related is storing Python projects as simple collections of directories.

### Whence the temptation?

Python is a simple scripting lanugage so the natural tendency newcomers have is to simply create folders with a bunch of scripts and then run those folders one by one. They tend to skip thinking about how `pip install` is able to seemingly magically conjure foreign code out of nothingness and when they start reading on it, they claim it's too much work to set it up properly.

I used to be one of those people when I started out with Python. Today, I tend to freak out massively if I see Python projects that are not set up as any formal package and have some strange custom installation patterns.

### Why is this a sin?

This is predominantly sin of hubris and laziness combined, we all succumb to these sometimes. Hubris, because people often think they can come up with simpler and better packaging solutions than the entire community of Python developers combined. Laziness, because often instead of reading up on the standards, they take the path of the least resistance which often ends in extremely poor scalability.

Not to mention the confusion other Python developers familiar with the existing toolchains will experience when looking at a codebase with a bespoke packaging solution.

### How to recognize a sinner?

The most common symptoms are easy to spot:

- No `setup.py` at the Python project root
- Inability to `pip install` the package
- Strange instructions on how to set up and use the project (which often boil down to _run `main.py`_ or something akin)
- Profuse usage of quasi-anti-patterns like `sys.path.append`

### How to repent?

Your only way to redemption is to structure your Python package properly, i.e. you need to learn a bit about what they are and how to make them. It is actually quite simple and I'll attempt to explain it in an easy-to-understand form.

A Python package is a collection of modules defined in `*.py` files structured in such a way that lets `pip` package manager to install this collection and be globally used in any other script that uses a particular Python intepreter.

> 👀 Modules are Python files and directories of Python files that contain a special `__init__.py` file that makes it possible to `import` them. Packages are just collections of modules.

There are a few important peculiarities about Python packages:

- A Python package is not equivalent to a single Git repo -> a Git repo can contain multiple Python packages at once
- A Python package must contain an `__init__.py` file in each directory to be treated as a package
- A Python pacakge must have a `setup.py` file at the root of the repository, it might contain an explicit map to Python package directory names or it might use the `find_packages()` function which automatically looks for packages in subdirectories

Packages are described in detail in [Python documentation](https://docs.python.org/3/tutorial/modules.html#packages).

#### Package structure

If your package has a structure:

```plaintext
X  
|  
|-> Y  
|-> Z  
|-> setup.py  
```

... the `Y` and `Z` will be treated as packages, **not** `X`. If you want `X` as a package the conventional pattern is to do:

```plaintext
X  
|  
|-> X  
|   |-> Y  
|   |-> Z  
|  
|-> setup.py
```

> ⚠ Git Repo != Python Package. A single Git repo according to Python standards could contain multiple Python packages.

#### Name conflicts resulting from improper structure

Suppose you have designed two packages that look like this:

```plaintext
X  
|  
|-> Y  
|-> Z  
|-> setup.py  
```

```plaintext
W  
|  
|-> Y  
|-> Z  
|-> setup.py  
```

The way Python installs packages is by running `setup.py` and in `setup.py` you've usually got a `find_packages()` function call. If it finds any existing package named `Y` it will uninstall it and install the one that you just told it to install. So e.g. if you do `pip install X` you would actually be adding two packages named `Y` and `Z` to the list of installed packages. If you were to then do `pip install W` you would get a name conflict because `Y` and `Z` refer to sth that came from `X` and `pip` would resolve the conflict by removing what was previously installed and installing the new thing.

##### Please don't use plain folders

If you were to say _let's not use a Python package, just use folders_. What will happen then is in every script you will have to modify the import lookup path for Python to be able to find the modules you're trying to import. So if I want to get e.g. `X/Y/modules/somescript.py` from a file that is located in `Z` I would need to do:

```python
import sys, os  
sys.path.append(os.path.join(os.path.dirname(__file__), "..", "Y"))  
sys.path.append(os.path.join(os.path.dirname(__file__), "..", "Y", "modules"))  
  
from Y.modules import somescript
```

Instead of doing just:

```python
from Y.modules import somescript
```

> 👀 That's because Python uses the `sys.path` list of directories to look up `*.py` files and load modules from. By default `sys.path` contains the current working directory but not the subdirectories, so you would have to add each subdirectory to the `sys.path` list were you not to use a standard Python package.

> 🙏 So please do yourself a favor and follow the standards outlined in PEP documents to not run into such strange problems. Many open-source tools doing stuff with Python packages may downright assume this structure and if you don't follow the standard you risk on missing out on goodies as well as making the project way less maintainable.

#### The `__init__.py`

For the `find_packages()` function idiomatically used in `setup.py` to automatically detect all the Python files belonging to a particular package, you need to add at least an empty `__init__.py` file at each directory level.

> 👀 `__init__.py` is used as the module definition file and is the first file to be executed when you're importing a directory-level module into any other Python script. It can be left empty or it can contain some initialization logic depending on how you want to set up your package.

So the proper structure for a package `X` with two directory-level modules `Y` and `Z` would normally look like this:

```plaintext
X  
|  
|-> X  
|   |-> Y
|   |   |-> __init__.py
|   |
|   |-> Z
|   |   |-> __init__.py
|   |
|   |-> __init__.py
|
|-> setup.py
```

#### `setup.py` and `setup.cfg`

My recommendation is to use a minimal `setup.py` and a second declarative configuration file named `setup.cfg` since it's always easier to read a declarative file than a custom Python script. So if you can, stay with `setup.py` as close to this as possible:

```python
from setuptools import setup

if __name__ == "__main__":

setup()
```

Whereas your `setup.cfg` should be the file describing your package through-and-through. Here is an example from [mkcommit](https://github.com/kjczarne/mkcommit/):

```ini
[metadata]
name = mkcommit
author = Krzysztof J. Czarnecki
author_email = kjczarne@gmail.com
version = attr: mkcommit.__version__
url = https://github.com/kjczarne/mkcommit
description = Dead-simple tool for enforcing clean commit messages.
long_description = file: README.md
long_description_content_type = text/markdown
keywords = git, commit, style, templates
license = MIT
classifiers =
    License :: OSI Approved :: MIT License
    Programming Language :: Python :: 3
    Programming Language :: Python :: 3.7

[options]
zip_safe = False
include_package_data = True
packages = find:
python_requires = >=3.6
install_requires =
    InquirerPy
    pyperclip
    prettyprinter
    pyyaml
    requests

[options.entry_points]
console_scripts =
    mkcommit = mkcommit.main:main

[options.extras_require]
dev = 
    pdoc
    flake8
    twine
    setuptools
    autopep8
    nox

[flake8]
exclude = 
    .git,
    __pycache__,
    build,
    dist,
    .tox,
    .nox,
    .pytest_cache
max_complexity = 12
max_line_length = 100
ignore =
    E731
    E116
    E114
    E221
    E241
```

Skipping the obvious stuff like `author` or `url` that points to the repo, there are a few entries that deserve an explanation:

- `version` -> you could always store a version tag here as a literal but what I like to do is to use `attr: project_name.__version__` directive. In the `__init__.py` that is at the root of my Python package I place a `__version__ = "0.0.1"` variable which I can later use from within the modules to e.g. decide what API version to use.

    > 👀 The `attr:` part is a directive that will try to find a particular attribute (variable) in a Python module.

- `long_description` -> I usually use `file: README.md`, which is a directive that opens a `README.md` file at the root of the repo and will use the contents as a long description. This is exactly what you see when you inspect Python packages on [PyPi](https://pypi.org).
- `long_description_content_type` -> default format used by `setuptools` is RST. I prefer Markdown in most cases, so I set `text/markdown`. Otherwise you should prepare your `README.rst` file but it doesn't look nearly as good as the Markdown variant on GitHub or GitLab.
- `license` -> if you're planning to upload the package to `pypi.org` for everybody to use, this should be a valid open-source license name.
- `classifiers` -> this is used by registries like `pypi.org` to categorize the package. Nobody ever remembers them, everybody copies them from [PyPi](https://pypi.org/classifiers/). The `License` and `Programming Language` classifiers are the minimum required by PyPi.
- `zip_safe` -> believe it or not but Python packages can be installed in a compressed (ZIP) format that makes them a bit smaller in size and usually makes them run a tiny bit faster. Turning this on is however not recommended in larger projects since not all resources can be used in a compressed form.
- `include_package_data` -> when set to true you can specify patterns in a `MANIFEST.in` file at the root of your repo (or wherever `setup.py` is) to include non-Python files along with the package. By default Python packages only consist of the Python source code files so if you need other files for the package to correctly operate and create the `MANIFEST.in`. For example:

    ```plaintext
    include project\spec.yaml
    include project/spec.yaml
    include project\spec.schema.json
    include project/spec.schema.json
    recursive-include project/pdoc *.*
    recursive-include project\pdoc *.*
    ```

    > 👀 If the file pattern didn't match, the file will simply not be included. But because Windows and \*NIX systems have a different path separator, you will likely need to duplicate the includes if you're building the project on more than one platform.
- `packages` -> if you follow the standard package structure that I outlined, you will always use `find:` directive here. This is equivalent to calling `find_packages()` in `setup.py` and it makes `setuptools` discover the packages without having to list them explicitly.
- `python_requires` -> minimum required version of Python for the project to work.
- `install_requires` -> a list of `pip` packages that your package uses and depends on.
- `console_scripts` -> a list of commands that will automatically be exposed when `pip` installs your package. For example `mkcommit = mkcommit.main:main` maps an `mkcommit` command that you can run in the shell to the function `main` in the module `mkcommit.main`. This corresponds to executing your `def main()` from `main.py` that's located in `mkcommit` folder in your repo. Take a look at [mkcommit's code](https://github.com/kjczarne/mkcommit) if this sounds confusing and track it. You'll realize it makes sense.
- `dev` -> these are tools that are necessary for the package only during development but not when a 3rd party wants to use your package. For example `nox` is used to automate package testing and deployment but the end user should never want to touch `nox` and the package itself works perfectly without it installed.
- `flake8` section -> this is the configuration I use for my linter of choice, which is `flake8`. The linter is used to force yourself and other people to maintain good standardized code style.

### Building your package

When you want to create a package and share it with others the easiest thing to do is:

```bash
python -m setup bdist_wheel
# or
python -m build
```

If you run it in the same directory where your `setup.py` lives, your package should be zipped into a `*.whl` file.

> 👀 You can unzip `*.whl` files just as if they were normal `*.zip` folders.

You can now send the file to somebody and tell them to install it:

```bash
pip install <name>.whl
```

That's it. `setuptools` might make it a pain for developers but it makes things so much simpler for the users. After all, developers should manage complexity, not the end users.

### Deploying your package

If you want to deploy your package to a registry, an internal company registry or `pypi.org`, you should use `twine`. For PyPi it's quite simple:

```bash
pip install twine                # install twine
twine upload -r testpypi dist/*  # test if the upload works
twine upload dist/*              # upload your package
```

You can learn way more from the [documentation](https://twine.readthedocs.io/en/latest/).

> ⚠ Beware: a package once uploaded to PyPi can never be removed. All packages and their versions are immutable so make sure you don't make mistakes here. If you exposed some credentials this way, change them immediately!

### Final words

So yeah, it might be a bit dense but with the minimal amount of information outlined in this article you should be able to hit the ground running with Python packages. I will leave you with a thought: I've seen large commercial projects set up as folders of scripts where stringing any two parts together was an incredibly painful mess. You shouldn't wish the same happens to your project if you want it to enter production. The patterns that were set up so far were long years in development and involved a lot of discussions and compromises. There are newer, more convenient systems like [Poetry](https://python-poetry.org/) but until they take the industry by storm, sticking to the standards is your best chance for success, particularly because most Python developers are already familiar with them, which makes working in teams and open-source communities nicer. If you want to use Poetry, fine, but don't ignore its older brother. That's simply not an option (yet).
