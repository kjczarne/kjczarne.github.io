---
title: "The Most Important Piece of Advice"
date: 2021-12-18T01:59:20+01:00
showToc: true
categories:
  - productivity
tags:
  - work-advice
---

If were to read only one post from this blog and ignore all the others, here is a piece of advice that I would like to give to everyone who wants to vastly improve their career.

> 👉 The most priceless thing that will help you excel in anything you do is your brain. The second most priceless thing is **your second brain**.

What I mean by that?

If you are able to build a robust reference system with a very short lookup time for any possible piece of information, you will excel at everything you do. The point of being great at your job is not being able to cram everything into your brain and recite formulas or code snippets from memory. If you're able to do this, congratulations you absolutely beautiful savant human being - reach out in comments and please teach me how can I become more like you. If you're average like me, having your little personal Wikipedia would probably help, wouldn't it?

I've found that Pareto principle definitely applies here and although people out there have created tons of contents about _evergreen notes_, _personal knowledgebases_, _zettelkasten_ and _second brains_, you should start with something simple that has the potential to scale in the future but also be prepared to move your notes elsewhere if your initial choice proves stale for you. Finding the right system _for you_ is always _your_ responsibility and involves _you_ experimenting with different tools before you decide to commit.

## What I use

![Obsidian](/post_img/knowledgebase.png)

I use [Obsidian](https://obsidian.md/) because:

- Ctrl+O brings up a quick-switcher where I can right away see last 10 notes I've recently opened.
- Ctrl+P brings up a command pallete that lets me quickly e.g. change from light mode to dark mode when the sun sets.
- It stores your files as plain Markdown files and you own all your data.
- You can sync it with their sync service, iCloud Drive, Google Drive, NextCloud, etc.
- They have a phenomenal iOS application.
- They have an open plugin system where anybody can develop a community plugin uses elements of the application.
- I can link and backlink my notes.
- I can view my notes in a graph view, which lets me discover unexpected connections between concepts.
- I can create [Mermaid.JS graphs](https://mermaid-js.github.io/mermaid/#/) directly within the Markdown files, they just rended automatically.

In essence Obsidian gives me:

- Speed -> switching between notes is a matter of split-seconds, search is blazingly fast, I never have to search for commands in ridiculous menus like in OneNote
- Portability -> not only can I view my notes pretty much on any device but I can also process each note as a plaintext file which means that _if_ I need any automation, it's a matter of writing a basic Python script perhaps using the `mistune` Markdown parser.
- Extensibility -> the plugin system means that I can make the experience as complex or as simple as I need. I use among others:
  - Quick switcher plugin
  - Command pallette plugin
  - Templates plugin
  - Slides plugin
  - Graph plugin
  - Spaced repetition plugin
- Privacy -> I get to decide where I store my notes and how I split them up into different vaults.
- New learning opportunities -> the Spaced Repetition plugin in Obsidian is phenomenal for learning languages with way less useless complexity that comes with [Anki](https://apps.ankiweb.net/) flashcards.

### How to take notes

There are just a handful of rules that I use to make this content aggregation effective:

- Write big summaries on general topics -> I like to keep e.g. notes on syntax basics for programming languages in a single note that has headings organized into a hierarchy:

  ![Outline hierarchy](/post_img/kb-hierarchy.png)

- Write very small, atomic notes on narrower topics -> for example, an article about C++ pointers gets its own page. Whatever feels like a conceptually distinct thing, lands in a different, shorter, more digestible note. Those smaller notes can be then linked together:

  ![Outline hierarchy](/post_img/kb-links.png)

- Link between notes aggressively but be smart -> you should use `[[wikilinks]]` as much as possible but be smart about it. Obsidian finds unlinked mentions of a particular note which lets you scour through mentions that haven't yet been linked. Decide consciously which of these mentions deserve a link:

  ![Outline hierarchy](/post_img/kb-unlinked-mentions.png)

- Treat it like a garden -> your notes should predominantly serve _you_ in the first place. But treating them like ancient scrolls in an old library will not bring you much value. Revise your notes frequently, iterate on different versions, weed out outdated and useless things from your knowledgebase, add and remove content as you see fit. The more you interact with your notes the more value you'll be able to extract out of them. And they will be _alive_ for longer.

  > 👀 If version control is something you're looking for, my suggestion is to learn Git and look nowhere else. I personally **do not** use any version control system for my knowledgebase. That's because I only care about the state of my knowledge at a single point in time, which is _now_. I treat my notes not as an end product that needs to have traceable history but as a staging environment that can never be treated as _complete_ and I frankly never needed to roll back changes in my knowledgebase, like I usually do in the codebases I work with. So, do with version control as you please and as you see fit for your own purpose.

That's it. That's my 20% of effort that gives me 80% of the desired result, which is being able to get to any meaningful sliver of information within fractions of a second and finding links between pieces of related information.

## Alternatives

If Obsidian is perfect for you, **stop reading this post now**. If you looked at Obsidian and still feel like you need something different, then read on. I did my fair share of experimentation with different solutions, I will also list those that I haven't tried as well.

As with pretty much everything on this blog, what follows is an **opinion** piece and you will find that for some of the products I tried I am pretty opinionated. Treat it as just _one person's perspective_ and feel free to make your own about the tools I mention if you feel they would work for your particular use case.

### What I tried and can recommend

#### Notion

[Notion](https://www.notion.so/) is very similar to Obsidian with the following differences:

- Your notes are kept in the Notion database on a server somewhere. You don't have direct access to the files.
- Notion has way more team-oriented features.
- Notion has unparalleled support for tabular data, much more advanced than Obsidian.
- Notion has a reasonably large user base and good technical support team.

##### When should you choose Notion

- You need to work with a lot of tabular data.
- You have little patience for managing files in directories.
- You find Obsidian's interface less intuitive or if you're not so good with computers.
- You want to share knowledge for a project with a team and manage tasks in the first place.

##### Why I stopped using Notion

I loved the _everything is a page_ and a heavy reliance on tabular databases since it made looking through e.g. tool collections much easier than in Obsidian. But I found search and quick-switch capabilities to be much more important for me. Both tools support these.

But I stopped using Notion because I had little control over the data directly. The representation even after exporting the data isn't exactly 100% Markdown which is a very portable format for content creation and distribution and I wanted to absolutely use it over anything else. Their API rollout was also underwhelming which means I couldn't find integrations with other applications that were meaningful to me and developing those integrations myself just wasn't an option when I realized how convoluted their data model must be.

Another issue with Notion is the fact that technically although you own the data, they seem to be unencrypted and Notion employees can actually read your content. I would never feel comfortable placing any sensitive data into my Notion knowledgebase.

One feature that sold me on Obsidian over Notion in the end was the ability to display knowledge graphs in Obsidian. Knowledge is non-linear and surprisingly software giants that trade in knowledge management systems (e.g. Notion, Atlassian) seem to ignore this fact as if it was nothing. Working with knowledge as a graph forced me to make my notes more atomic and easier to link together which closely corresponds to the way knowledge is stored in a human brain (at least to the extent we know now).

#### Foam

Foam is a Visual Studio Code extension that enables you to view knowledge graphs and create wiki-links.

- You get bi-directional links and a graph view very similar to what you get with Obsidian.
- You can use VSCode for notes which makes a lot of sense if you're using it already for software development.
- However Foam is pretty simplistic and doesn't go anywhere beyond that. Still in the context of the Pareto principle this might prove to be way more than enough.
- And the best part: it's entirely open-source and free forever.

### What I tried and would not recommend

#### Microsoft OneNote

It is fairly good as notetaking software and I used it my entire high-school and 3 years of university before software like Notion or Obsidian started appearing on the market. The biggest issues with OneNote for me:

- Open page concept -> initially I liked the fact that I can click anywhere on the page and arrange content into text-box-like blocks as I please. But for the same reason my notes would always lack consistent structure and one would usually have to scroll over the width and height of the page at the same time to make sense of those huge clumps of information.
- Abysmal experience while printing pages or exporting to PDF -> I very rarely had to print anything but when I wanted to export my notes to a PDF and share it with other students the output would always be garbled. This issue as far as I know has never been fixed and is related to the fact that it's nearly impossible to represent this open-page format in finitely sized PDF pages.
- Subpar support for macOS -> I waited years to get the ability to create custom tags in OneNote on a Mac. This is not ok.
- No Markdown support -> Ctrl+B for bold, Ctrl+I for italics, etc. But then Ctrl+1 for Heading 1, Ctrl+2 for Heading 2... This is perhaps very nitpicky but hitting `##` twice to get the Heading 2 at least doesn't ask me to travel from 1 to 2. My finger automatically lands on the same key when I want to create headings and it's just so much better for muscle memory. It's a shame OneNote doesn't support Markdown.
- No backlinks -> you get one-way wiki-links. That's it.
- Clunky interface -> typical Microsoft, i.e. expand a ribbon, click a button, select an option from the menu, click ok... In Obsidian things like these usually cost two keystrokes.
- Poor search -> I found the search and quick-switch experience to be vastly subpar to Notion or Obsidian. It's perhaps more about interface than indexing but it just always hampered me from being fast enough.

> 👀 Overall, MS OneNote is a really good notetaking tool but a quite poor choice for full-fledged knowledgebase software.

#### Evernote

Evernote is one of those riches to rags stories. Back in the days of Evernote with an endless tape and just unparalleled search, tagging and sorting experience it was the closest to _organized_ I have ever been. From my perspective Evernote devolved and became outrageously expensive very quickly.

- Extremely expensive for meager set of features -> I pay 50 euros for the Obsidian commercial license (because I wanted to use it at work, otherwise it's free). For a year of Evernote's _Personal_ plan I'd have to shell out about 80 euros.
- Tries to be everything -> Evernote tries to be your main productivity platform and a notetaking application which makes it good at none of those things. It sports task lists, calendars, reminders, OCR search (admittedly this one is top-notch) and a web clipper. Well but here's the deal, dear Evernote. For tasks and reminders I use MS ToDo, for calendars I use iOS Calendar app or MS Outlook, OCR search is something I maybe used twice in the history of using Evernote itself and I stopped clipping websites in 2012. Links are much more efficient in my humble opinion.
- Performance issues -> last time I used Evernote it was slow, borderline unusable. Since it's a commercial product this probably has been fixed up until now but just be aware that it might not be the snappiest experience.
- Yet another proprietary format -> you won't find Markdown here either.

#### Atlassian Confluence

Oh my goodness, where do I start. I cannot believe that this tool is regarded as _the_ professional knowledgebase software for teams. All my experiences with Confluence up until now have been quite unpleasant and the rigidness of the Atlassian stack leaves a lot to be desired.

- Want a plugin? Sure, give me $10000! -> Confluence has a plugin system. Sadly most of the really useful plugins are outrageously expensive because plugin developers have noticed that there's a lot of money to make. Confluence's philosophy is far from open-source and free stuff.
- Want Markdown? How about _Confluence Wiki Markup_? -> Confluence does not use Markdown. Instead they have their own custom markup language that literally no other tool uses. So now instead of learning one markup language, you need to learn two.
- Expensive -> $5.50 per user per month. It comes out to about 60 euros per year per user. Arguably, Obsidian commercial license is in the ballpark of 50 euros per computer which is close. Confluence is ok as a basic Wiki software for teams but for what it actually gives you it's a ripoff.

I often jokingly call this disappointing tool _Confusence_.

### What I haven't tried but might work for you

- [Basecamp](https://basecamp.com/) -> project management software akin to a combination of Atlassian Confluence and Jira
- [Roam Research](https://roamresearch.com/) -> non-linear notetaking tool with a cult following. Also, quite expensive.
- [Zenkit Hypernotes](https://zenkit.com/en/hypernotes/) -> extremely aesthetically pleasing and looks like it's packed with the right number of features but has a hard cap on the limit of notes for almost all of the plans (both free and paid)
- [Fibery](https://fibery.io/build) -> similar to Notion but with more generative approach to building your own workspace
- [Anytype](https://anytype.io/) -> I actually tried it but not enough to formulate a strong opinion about it. It looks similar to Notion but with much more extensible object model, content synchronization using a distributed filesystem (IPFS) and a very reasonable approach to privacy issues. The team also promises that Anytype will always be free and open-source which is absolutely awesome. I tried the early alpha for a short while but it wasn't stable enough to switch to but you should definitely keep an eye on it. Once it's released it might steal a huge chunk of market from tools like Notion.

If you have any other suggestions to try out or if you have other perspectives on the tools I mentioned in the article, feel free to throw in a comment.
