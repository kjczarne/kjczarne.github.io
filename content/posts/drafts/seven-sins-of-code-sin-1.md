---
title: "Seven Sins of Code - Sin 1"
date: 2021-12-17T23:22:57+01:00
showToc: true
draft: true
tags:
  - seven-sins-of-code
---

## Sin number 1: Picking the wrong language

Some languages are inherently verbose and require a lot of boilerplate to achieve anything. The biggest offenders I personally worked with so far would have to be **C\#** and **C++**. Some languages like C\#'s sister-language **F\#** or Googles **Go** language have language grammars so minimal and concisely expressive that the costs of codebase maintenance get severely reduced if you invest into implementing your codebase in these languages.

However, maintenance costs are just the tip of the iceberg...

### Whence the temptation?

There is a strong tendency in Software Development towards quick iteration over a minimal prototype until you have something tangible that can be used by a customer. This is often a result of overreliance on [Agile](https://en.wikipedia.org/wiki/Agile_software_development). Agile is quite awesome for many kinds of customer-experience-driven projects but isn't a panacea.

### Why is this a sin?

Early decisions in a project's lifetime will create some level of lock-in, that's why it's particularly important to qualify the tools you're going to use in a way that ensures the requirements are fulfilled. That's why (in my opinion) taking ample time to evaluate the landscape of possible choices at least at the beginning of a project should be regarded good practice and managers should learn to not breathe the developers down their necks when foundation is laid. Well, perhaps if you're creating an API or a microservice that could be replaced within a week or two with a completely re-written implementation then it's a no-brainer and your careful evaluation should be thrown out the window. But if you're creating the basis of your buisiness with the software components that you're about to prepare, then requirements management and risk management are definitely very much in the picture.

A proper analysis should address at least the following issues:

- [ ] Component split of the application
  - [ ] Can we split front-end elements from back-end elements?
  - [ ] Can we use a faster language for bottleneck elements?
  - [ ] Can

### How to recognize a sinner?

A person who is excited about trying new things is **not** a sinner. That's precisely what belongs in the evaluation/design phase of a project -> trying out various solutions in the most minimal feature fulfillment models to see what works and what doesn't.

Frankly, everybody at some point in their career will commit this sin. At least once per every change in the accompanying domain. If you're switching from automotive to healthcare-related projects you are bound to select the wrong language or the wrong tools for the job at least once. In my humble opinion it's just inevitable.

### How to repent?

This might sound cliché, but you simply need to pay attention and identify this mistake when it happens. You will often have to pay the price of either sticking with the wrong language for the job or re-implementing the entirity or at least a part of it in a completely different language.

And that's ok, you should make room for such mistakes but try to not make them again in the future.
