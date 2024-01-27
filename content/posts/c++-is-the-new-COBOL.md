---
title: "C++ is the new COBOL"
date: 2021-12-21T22:34:07+01:00
showToc: true
tags:
  - programming-languages
categories:
  - software-development
---

C++ is a great language. As much as I hate it I cannot ignore how important it is and how much it brought to the table in it's 36 years of existence. I have tremendous respect for Bjarne Stroustrup for creating the so-called _C with classes_ and I personally think that it's one of the best things that happened in programming language designs around the time when it came to existence.

But C++ is a language that we might slowly see becoming legacy technology. Here's my take on the whole C++ shebang.

> 👀 For context: I started my career as a software developer with JavaScript and Python and then worked with C# for a good few months. I haven't touched C++ until a few months ago simply because I never had a need to. But there are situations in which you will need a much faster language that compiles to native code instead of something that always incurs a massive interpreter overhead. For the past two months I've been learning C++ with the support of expert developers at work. My view may be a bit simplistic and I'd enjoy to start a discussion and hear other views. I made sure it's not my resistance to change that makes me dislike C++ but this article naturally deals with some speculations about the future which we cannot know for certain, hence if you see that I've overlooked something, don't hesitate to point it out.

> 👉 In the examples below I will be using C++17 because that's what I'm using at work. Keep in mind that some of the examples that I describe, e.g. template constraints have been added with the C++20 standard. Why aren't we using C++20? Well, using the latest standard is one of the problems I listed, so read on to learn more.

## The problems with C++

So, let's start with the reasons that I dislike C++. I like to call them _genuine problems_.

### C++ is extremely verbose

Creating production-level code in C++ ofter requires a lot of boilerplate. This is bad because large codebases usually incur higher maintenance costs. On top of that, the syntax of the language doesn't make things better. Take for example the following `template` declaration which roughly corresponds to a very liberal _generic_ type:

```cpp
template <typename T>
void do_something(T i) {
  if constexpr (std::is_integral<uint8_t>(array)) {
    // ...
  } else {
    // ...
  }
}
```

Compare that to a generic function in Rust:

```rust
fn do_something<T: u8>(i: T) -> () {
    // ...
}
```

This relative verbosity is prevalent in nearly all constructs. You quickly get sick of `std::string make_string_repr(std::shared_ptr<MyClass>, std::string str_template)` and you promptly swivel your display from vertical orientation back to landscape (happened to me). In general C++ tends to be way more verbose than languages like Python, though you can learn to make things more concise over time. An expert friend of mine at work once refactored a function I've created from 70 lines down to about 10. And this is a nice seguey into our next talking point...

### It takes years to get proficient in C++

The complexity of the language entails this naturally - you cannot become a good junior developer within a few months. Well, at least if you're average like me, you will make a lot of mistakes especially at the very beginning of your journey. It is an immensely complex language especially for beginners or people comming from higher-level interpreted languages.

### Memory safety is not guaranteed

Another issue/feature of C++ is the fact that the developer has to think about memory management very consciously all the time. For example, the following code compiles:

```cpp
void do_something() {
  int some_int;
  // a lot of code ...
  int* unknown_int_ptr;
  // a lot of code ...
  int* some_int_ptr = &some_int;
}
```

Imagine that between the declaration of the integer and the declaration of the pointer you placed a lot of code and _nowhere_ have you actually assigned a value to the `some_int` variable. This generally results in so-called undefined behavior, which is basically compiler-dependent and not guaranteed by the standard. So `some_int_ptr` when dereferenced will point to `some_int` but we cannot make any guarantees about its value, because it won't make any sense anyway. And **this statement is legal in C++** as it is in C.

Now to the `unknown_int_ptr`. Notice that it has no address assigned so it essentially is a pointer into nothingness. Again this code compiles. Some smarter compilers might point out that this might be a bug but that depends on the way you've set up your build toolchain. If you dereference `unknown_int_ptr` you will actually attempt dereferencing a `nullptr` which is also undefined behavior and in some cases pretty hard to catch!

In Rust, this is explicitly disallowed when using references:

```rust
fn do_something() {
    let some_int: u8;                   // won't compile!
    let unknown_int_ptr: &u8;           // won't compile!
    let some_int_ptr: &u8 = &some_int;  // won't compile!
}
```

> 👀 The reason why C and C++ do allow such silly operations is to give the developers maximum flexibility with their code. As such, it is the sole responsibility of the developer not to make such mistakes. (Un)fortunately developers are born to make mistakes. Rust takes a middle ground. It is **still possible to do unsafe operations in Rust**, albeit they need to be explicitly marked (placed in an `unsafe { }` block).

> 👀 Some of the pointer management problems can be averted by using the so-called _smart pointers_ which have been added in C++17. You can even emulate Rust's ownership move logic with `std::unique_ptr<T>` template. If you're unsure what this all means just disregard this block.

### Using the latest standard might be risky

I didn't experience this personally but I've heard of a commercial project (of which details I cannot disclose) that was implemented in C++17 back when C++17 was a freshly released standard. Long story short, the MSVC Compiler had a bug that caused the developers a lot of headaches before they were able to realize that their code is ok but the compiler is not. You would think that such things are unacceptable but bugs happen in every compiler or interpreter out there. The problem is -> when you're working with a complex language like C++ it's inherently more likely that someone at some point will make a mistake. And that means you have to put lower trust into something as important as the compiler for the language.

### Figuring out build systems is ridiculously complicated

My first look at the CMake-based build system generator toolchain in a large commercial project almost made me want to sign up for a 3 month break from work at a mental asylum. Now listen...

In Python we usually need one or more `setup.cfg` files with a corresponding `setup.py` that loads it, finds the package files and the package is ready to be installed. Python uses the `pip` package manager for this, Node.JS has `npm` or `yarn` package managers, Rust has its absolutely phenomenal `cargo` package manager.

> 🤦‍♂️ **C++ does not have any good package manager whatsoever**.

The closest we have to a _package manager_ in C++ is the Conan package manager. So let's say I want to depend on a few packages in my C++ project. What do I do? **I need to nearly write my own build system** using CMake and use [Conan CMake files](https://github.com/conan-io/cmake-conan/blob/develop/conan.cmake) to even be able to talk to the package manager when invoking `cmake`. CMake actually generates `Makefile` on Linux or Visual Studio Solution files on Windows. Well, not always, depends on how you configure it. Because you could replace `Makefile`-consuming `make` with `ninja` which can also be used as an alternative to MSBuild on Windows, MSBuild being the tool normally responsible for building Solution (`*.sln`) files. Then you have to remember that cached Conan packages can sometimes interfere with fresh builds if certain configuration options like the version of the compiler has changed in between builds, so does the CMake target directory with its `CMakeCacher.txt`... 😣

There's a beautiful German adjective that describes this situation perfectly: [_bescheuert_](https://en.wiktionary.org/wiki/bescheuert).

> 👉 In Rust to obtain packages necessary for a new project, all you need to do is add them to the list of dependencies in `Cargo.toml` and trigger a new project build. That's it. That's what dependency management should look like.

### Compiler error messages can be next to useless

Last but not least, if you've ever compiled C++ code in your life you will know what I mean. The output produced by the compiler (especially MSVC) is usually quite uninformative and it often leads you on a wild goose chase. It happened to me lately that when using `fmt` I wasn't able to find an improper usage of a formatter function because the line number info was hidden somewhere in the middle of an outlandishly long stack trace and my eyes just kept on slipping through it. It's often very hard to debug weird compilation errors particularly where macros and templates are used.

## Ultimately, why so many problems

C++ has so many issues because it's fairly old! Each new standard piled dubious _features_ on top of the existing stuff with regards for maximum backwards-compatibility. Since a path has been taken with many language design choices, it is not really possible to now backtrack on certain decisions. Issues are being fixed and developer experience is being improved, albeit at a much slower pace than for most modern languages.

## Why I think C++ is heading for the Elysian Fields

You might have noticed that all examples I've provided for the _bad stuff_ in C++, I've countered with examples in Rust. So, here's my theory:

> 👉 I think Rust will replace C++ as the main systems development low(er)-level language within the next 20 years.

If the pace of adoption of Rust Programming Language keeps up, we might see Rust being the language that solves some of the issues that C and C++ faced since their conception. Rust is very promising because of:

- An awesome toolchain with the `cargo` package manager with out-of-the-box documentation builder, unit test runner, childishly simple dependency management, etc.
- Full memory safety (unless explicitly turned off when you need to).
- Default immutability -> variables are immutable by default, this way you will e.g. never forget to lock a resource in a thread before using it if it's mutable.
- Clear, concise syntax -> the syntax is clear, easy to read and above all - concise.
- Very informative, precise compiler errors and warnings -> many times the compiler suggested an actual solution to the issue I was facing.
- Speed. It tends to be even faster than C++ in many situations.

Okay but just because I like Rust so much doesn't mean everybody's going to use it. So what indicators do we have at the moment that point to Rust slowly taking the market away from C++? Let's look:

- Rust is now the [second officially supported Linux kernel language](https://www.zdnet.com/article/rust-takes-a-major-step-forward-as-linuxs-second-official-language/).
- Amazon [started sponsoring Rust in 2019 under their AWS brand](https://aws.amazon.com/blogs/opensource/why-aws-loves-rust-and-how-wed-like-to-help/), for example Amazon's Firecracker micro-VM project is [implemented in Rust](https://firecracker-microvm.github.io/).
- Microsoft is [rewriting some of their projects into Rust](https://thenewstack.io/microsoft-rust-is-the-industrys-best-chance-at-safe-systems-programming/).
- [5th most-wanted](https://insights.stackoverflow.com/survey/2020#technology-most-loved-dreaded-and-wanted-languages-wanted) programming language of 2020.
- Named [most loved programming language of 2020](https://insights.stackoverflow.com/survey/2020#technology-most-loved-dreaded-and-wanted-languages-loved).

These are all big deals. Linux is the most used operating system in network servers, AWS the most popular cloud provider in the world, Microsoft owns a huge part of the operating system market as well as a good chunk of cloud computing market with its Azure platform. Hence these are all signals that if the pace is kept up, Rust might very well become a go-to for large-scale projects.

## Does it pay off to learn C++ then?

**BIG FAT YES**. Well, that's a surprise. I go on bashing the language for the entire length of this article and then I drop that bombshell...

Here's the harsh inconvenient truth for people who dislike C++: the number of projects implemented in C and C++ to date and the sheer popularity of the language make it impossible to ignore if you want to do low(er)-level development professionally. If you're a freelancer or a startup owner you might enforce Rust, sure, however most companies will still like to leverage troves of C++ talent that is available currently on the market instead of trying to source Rust developers which are still few and far between, albeit growing in numbers by the day.

All in all, C++ projects tend to create so much technical debt and tend to be so voluminous that it will take years before Rust can make a massive break. But I sincerely believe that it is the first language on the market that has what it takes to start replacing good old C++ or at least challenge its throne rights.
