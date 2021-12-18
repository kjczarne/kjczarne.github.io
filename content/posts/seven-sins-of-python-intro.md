---
title: "Seven Sins of Python - Intro"
date: 2021-12-10T22:28:34+01:00
draft: false
showToc: true
tags:
  - seven-sins-of-python
categories:
  - software-development
---

## Seven Sins of Python - intro

Python is not only the most popular programming language (according to TIOBE as of 2021) but also one of the simplest to work with and easiest to learn. Python is great for a wide range of applications from web development through command line tools to large-scale automation and deep learning projects.

It is far from the snappiest programming languages in terms of performance, however many other languages can be used alongside Python when performance is of essence.

Because it's so easy to do anything in Python, it's also incredibly easy to do things that are at best slight stumbles and at worst critical design mistakes that may make any project unmaintainable and even unstable in the long run. As someone who codes predominantly in Python, I've seen some terrible patterns used in commercial products but I've also had the misfortune of becoming a victim of a few of those myself.

This series describes what I think are the 7 biggest mistakes that could be a part of any application. In my humble opinion, you should avoid these at all cost. As with all cults, this is one prophet's gospel. You might find yourself disagreeing with one or more of these statements, perhaps even all of them. That's ok.

## How to read the series articles

Each section that follows will be split up into clear components:

- Whence the temptation? -> explains why developers tend to use a particular antipattern
- Why is this a sin? -> explains why a particular practice is an antipattern
- How to recognize a sinner? -> provides an example of the antipattern
- How to repent? -> provides a better alternative to the antipattern
