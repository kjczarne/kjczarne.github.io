---
title: "Forget New Year's Resolutions, do this instead"
date: 2022-01-05T16:53:35+01:00
showToc: true
tags:
  - life-advice
  - planning
categories:
  - life
  - productivity
---

A while ago I had a brainwave when reading about the Agile Software Development best practices. I've recently found this idea somewhere in my todo lists and decided to finally give it a try, especially given the fact that my new year's resolutions never worked for me.

> 👉 The idea: forget new year's resolutions, write user stories for your life instead.

Before I go in-depth on why I think you should write something akin to user stories for your life plans, since it's barely the beginning of January 2022 let's look at why new year's resolutions are not the way to go (at least in my opinion).

## New year's resolutions

The long-running tradition of new year's resolutions is somewhat legendary for its ineffectiveness. I mean, really, how many people do you know that really did stick with their resolutions in the long run? I've had my fair share of these, e.g. cutting out most forms of sugar from my diet. It never works. And I have a few ideas why it doesn't.

### They're too general

These resolutions tend to be quite general in their form. How many times have you had resolutions like:

- I will spend more time with my family next year.
- I will finally open up a business next year.
- I will lose a few pounds next year.

None of these statements provide a good motivation for why the resolution might be important and for whom. It also ignores the aspect of you playing different fiddle in many different bands. You might be both a mother and a surgeon. You might be both an airline pilot and a son to a cancer patient. Different roles you have to assume in various contexts require you to alter your behavior and your priorities.

### They're scoped for the duration of an entire year

Notice that each of the examples I mentioned say about _next year_. None of those statements say when exactly is the resolution going to be fulfilled. In January you succumb to the illusion of having _plenty of time_ so you just keep telling yourself: _next week I will stop eating sweets_, _next week I will schedule a family get-together_ or _after all it can be in 2 or 3 weeks, I've got plenty of time now_.

This is the exact same problem each software developer must fight against every time a sprint starts. The conventionally short duration of a sprint means that a developer needs to aggressively prioritize, split up large tasks and schedule them in the _now_ and avoid succumbing to the illusion that _there's plenty of time at the beginning of a sprint_. Some teams go to extremes and enforce very short sprints, e.g. of 2-3 days but if you're uncertain 1-2 weeks is usually a good middle-ground.

> 👀 By coming up with a new year's resolution for the duration of the entire year, you're essentially creating _a one-year sprint_ for yourself and you will usually end up wasting a lot of time when the sprint is too long.

### They're not really actionable

Let's take a closer look at the very cliché _I will go on a diet next year and lose weight_. Sit and think for a moment what that statement says about the actionability of the process. How exactly are you going to accomplish losing weight? What will the diet entail? What will be the allowed amount of saturated fatty acids and sugars in your diet? Will you exercise? If so, how often and for how long?

If you really want to commit to change writing _I will go on a diet next year and lose weight_ in huge red capital letters on the wall over your bed will be of little value if you don't have an actionable plan. You have to determine what resources (time, money, effort, tools, etc.) you will need to succeed in accomplishing the entire goal but the goal is massive and you will quickly get confused without proper progress tracking and task planning.

The same happens in software. Rookie developers will often say _I want to create an app that finds me the best boba tea deals in the area_ and jump head-first into the project, realizing 2 weeks later that the task is beyond their means because there are just so many things to take care of: will the front-end be prepared in a Web Framework like React.JS or vanilla HTML/CSS/JS, will the backend service be deployed on AWS or Azure, how should the service be monetized, where do you source the data, and so on and so forth...

> 👀 It is often more than okay to take way more time as long as you can accomplish something of value, something that _just works_ but isn't necessarily very pretty or easy to use. Same thing goes for the challenges in life. It's often okay to take 2, 3, even 10 years to get into shape. But it's not okay to slack off and put things off because the time you initially estimate for a large challenge will almost always be greater than you think. What you should do is split up huge tasks into tiny ones and put in the appropriate effort into planning and analysis. It's better to spend time analyzing and planning than going a completely false route and then having to start from scratch.

> 👀 Some authors like Grant Cardone in his _The 10X Rule_ take this to extremes and claim you should aim for 10x more and expect that the resources you will need will almost always end up exceeding estimations. I found that while aiming for 10x more might make me less than motivated and more overwhelmed than anything, the part where the time and resources to achieve baseline results can often overrun to 5x or 10x the initial estimations in time and costs holds generally true if you have little data to perform bona fide calculations. These estimations get more on-point the more experience you gain in resource allocation and the more data you have available. Sadly, I cannot recommend Cardone's book as it can be summarized with one sentence and I don't want my friends to lose money and time.

## A word about Agile

So at the very beginning of the article I've mentioned Agile and before we move on to the gist of the article I need to explain away a few things. My approach to Agile is the same as to any other tool: you should use it when you need it. Agile happens to be one of those tools that most software projects and most companies should prefer.

> 👀 Agile Development in a short and overly simplistic summary could be described as introducing changes and new features into a software project at a very quick pace. Many summarize it as _move fast and break things_, others say it's all about decreasing the time it takes for the actual user to see the product in its minimal form and empower the users to guide the prioritization of feature requests and bug fix requests.

As such, Agile is a great approach when one would expect high variablity of requests coming from the end customer or really any stakeholder.

> 👉 The rule would then be: unless your product's stakeholders are not expected to change their mind frequently or unless you're working following a strict immutable specification document, you should probably be using the Agile methodology.

## User stories

So Agile makes use of these so-called _user-stories_ profusely to represent requirements that various stakeholders have for your project. They usually have a form that represents the role of the stakeholder, the request and the rationalization of such a request. A much loved and well tested template for a user story looks kind of like this:

> 🤔 As a ... I want ... because ...

That's really it! Although the name _story_ might imply something lengthy and winding, a _user story_ should generally be expressed with a single sentence.

### The art to user stories

Writing good user stories and knowing how to handle them is crucial. The first few stories for a project should be fairly general and should describe the intended functionality for the project in question. It sounds simple enough but to me, the crucial part is always knowing how to split them up into smaller stories that are manageable within a _sprint_ which is usually a one- to two-week period with a clear end goal. I always liked to have user stories split up in such a way that one story fits exactly with the time you have in a sprint. So if your sprint is 2 weeks, each person should take on exactly one user story and finish it before the time elapses.

### How they address the problems of resolutions

I've written that new year's resolutions are:

- too general
- scoped for a time-frame that's simply too long (entire year)
- not actionable

If you master the writing of user stories you can basically solve those problems right away:

- user stories are concrete -> they require you to put yourself or somebody else into the role of a stakeholder and they force you to rationalize your choices
- user stories can be split up where one story fits one sprint -> this forces you to think in terms of days not months or years
- user stories can be acted upon -> a well written story will outline exactly what needs to be done to accomplish a partial goal

## User stories for your life

So what I am going to do now is outline the few general stories that I've written for myself for 2022 and I will describe how I am going to handle them in the coming months. A year later I will provide an update as to whether things worked out better than with new year's resolutions (of which I haven't succeeded in accomplishing even a single one).

### Step 1: writing down the top-level stories

For privacy reasons the stories that I paste here will sound a bit general, feel free to make yours as concrete as possible. I place them here both to give you an example of what they might look like and for some degree of personal accountability.

- _As a son I want to spend more time with my mother because she needs all the help she can get to support the elderly family members that she takes care of_.
- _As a boyfriend I want to spend more time with my Significant Other because we both want a healthy stable future that we can plan together and I have to do my due dilligence_.
- _As a brother/cousin I want to help my siblings/cousins with their studies because their success in life increases the chances of a better and healthier life for our entire family_.
- _As a developer I want to learn advanced concepts in C++ programming from my shortlist so I can better support the development efforts for my employer_.
- _As a developer I want to create at least one high-performance concurrent application in Rust so that my understanding of parallel and concurrent computing improves to a point where it becomes effortless_.
- _As a prospective business owner I want to educate myself on the basics of accounting, German tax law, people management and resource management to successfully create and lead a small business that will sustain myself and my family in the future_.
- _As a sugar addict I will slowly phase out sweets and excessive fruit from my diet by reducing the consumption by 5-10% in mass every week because I want to enjoy a longer, better-quality life and excess carbohydrates exacerbate my familial risk of type 2 diabetes_.
- _As a person struggling with procrastination I will fully commit to the timeboxing technique, aggressive time tracking and task batching because I need to reduce context switching and maximize the amount of things I can get done to be able to accomplish at least 80% of what I originally intended_.

> ❗ Pay attention to who the stakeholder for your story is. If the story involves other people consider asking them what _they_ feel is important and what _they_ would want. If you're creating a tool for a user, the user needs to drive its development. If you're creating a plan for spending time with your loved ones, ask them when, where and how they would want to spend time with you.

### Step 2: when in doubt, split it

Many of the stories you'll come up with will end up being not very actionable in the beginning. That's when splitting them up might help. For example let's take: _As a son I want to spend more time with my mother because she needs all the help she can get to support the elderly family members that she takes care of_. How exactly will I accomplish this? For context, I live in Germany while almost my entire family lives in Poland. I can split the story up fairly easily, I just drop the _role_ part because it stays the same in case of each sub-story:

- _I want to visit home at least once in two months or optimally once per month because it is not really possible for my family to visit me_.
- _I want to allocate more time for a phone call at least once in 3 days because the more often I speak to my mum, the better she will feel_.
- _I want to reduce the time of a single phone call because the longer we speak the less concrete the conversation gets and we lose time that could be allocated to other urgent tasks instead_.

The same procedure can be applied to nearly any story and in the end this generates a **tree** of tasks that you can easily put somewhere in your To-Do app, set deadlines for each and then work at it whenever you allocated time for it.

### Step 3: prioritize and measure progress

Your time is sadly finite and you need to treat it like you treat savings. To allocate time intelligently, you need to know the priority of each of the stories. The easiest way is to sort them in order of increasing or decreasing priority.

> 👉 Remember: \\(important \ne urgent\\). Use [The Eisenhower Method](https://en.wikipedia.org/wiki/Time_management#The_Eisenhower_Method) to delegate urgent but unimportant tasks. You should at all times act upon whatever is urgent _and_ important at the same time.

For me, the most important _meta-story_ is _As a person struggling with procrastination I will fully commit to the timeboxing technique, aggressive time tracking and task batching because I need to reduce context switching and maximize the amount of things I can get done to be able to accomplish at least 80% of what I originally intended_. It basically says that I want to accomplish at least 80% of these challenges I've set up. That means that out of 8 stories that I've presented I should finish 6.5. So I should be pretty satisfied next year if out of those 8 stories, 6 have succeeded.

> 👀 You cannot evaluate what you can't measure. Even if your measure of success is arbitrary (like mine), it's better than having no ways to measure your success at all.

Because I might end up moving accross the ocean later in 2022, my further priorities are spending time with my girlfriend and my family and helping out my siblings in setting themselves up for a success in the future. It will hurt less if I don't manage to start a company before leaving Germany because I know that this could still be done upon my return, while interpersonal relationships often cannot be repaired.

> 👉 In your prioritization practices, I would recommend not to blindly dive into _more work_ but to make sure that your loved ones are not left out. While it might not _feel_ productive, it's extremely important for everybody's mental health to take good care of your interpersonal relationships. Humans are animals that require other humans to function well.

### Step 4: schedule

When you have your tree of stories in hand and the associated tasks naturally written out, you can proceed to scheduling. It's best to allocate a day or two, sit down with a cup of good coffee and make a good long-term plan that allocates each individual bite-size sub-story or sub-sub-story or even sub-sub-sub-story to a sliver of your time in the year. Make sure you keep the accountability time-frames short, i.e. try to not spend more than 2 weeks on a single task. If that's the case, it should probably be split up into even smaller sub-tasks.

This is common practice in many strains of Agile. A story should fit into a sprint and you should have something to show at the end of it.

### Step 5: maintain discipline

Probably the hardest part is actually keeping it up and staying motivated. For that, sadly, I still don't have a silver bullet. I recognize that each and every one of us will occasionally suffer periods of _feeling low_ or downright anguish that disables one from conquering challenges altogether. My way of staying motivated is the thought of my own death and what will be left behind. I want to depart life knowing that I did as much as possible to make the lives of other people better and established some form of legacy that is tangibly useful to others. These things originally drove me towards a career in software development and are now pushing me in the direction of a degree in engineering as well as towards spending more time with the people I love. I am somewhat at peace, knowing that I will never really be able to strike a balance between the two, there is just no simple way of finding an optimum. But the thought of how I want to be remembered when I'm gone makes me strive towards trying things, making things and making things work.

I think everyone should attempt to find a motivating factor behind each thing one wants to accomplish. That's why the _because_ part of the user stories is so important in my opinion. It outlines the motivation behind the story and if the motivation simply isn't strong enough you will end up not following through.

Other ways that you may try to stay motivated:

- find an accountability partner -> find someone to whom you will report your progress as if you were talking to a manager, make sure this is a person that knows you well and knows when to push you and when to have mercy over you
- use a tool like [Habitica](https://habitica.com/static/home) -> if you like games, you might find that forming new habits or fulfilling tasks as if it were a game might be helpful; I used Habitica for a while before switching to a simple To-Do + Calendar system
- give yourself a financial penalty when you don't accomplish an important task -> services like [Beeminder](https://www.beeminder.com/) can charge you real dollars if you don't fulfill your goals; I haven't tried it personally but I think it's a cool concept for people who like to constantly have an axe hanging over their necks.

### Step 6: be Agile

Quicker iteration on particular tasks will give you more and more ideas as to where you want to take yourself and your loved ones as the time progresses.

> 👉 This means you should **never treat stories as something set in stone** and you should make them **react to change**.

When a massive opportunity comes your way sometime in 2022 and it completely changes your plans, take a few minutes and revise the plan, alter the stories accordingly and work to the new plan. After all, this is the core philosophy of Agile.

> ❗ But should you allow yourself to give up on an important goal just because you feel like slacking off or just because you're scared? Address your lack of energy, address your fear, don't be scared to leverage therapy if you need to, but above all make sure you don't just ignore your goals. Change them and tweak them, throw them out if you really need to or have no time, but be self-aware and try to always acheive your top priorities at a reasonable cost. **Health should be always your top priority**, because when your mind and body are broken, nothing else can be accomplished.

## Final words

So, now you have an idea of what I think is vastly better than new year's resolutions. I hope you'll hop along for a ride with me and see for yourself how many more things you were able to get done after committing to this approach.

I wish you all the best in 2022, may all your stories come to fruition and make sure to subscribe to the newsletter to get a follow-up to this article in 2023.
