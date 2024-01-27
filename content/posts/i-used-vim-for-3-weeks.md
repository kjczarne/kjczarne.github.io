---
title: "I used Vim for 3 weeks. Here's how it went"
date: 2022-07-04T23:15:34+02:00
showToc: true
tags:
  - software-development
  - work-advice
  - tools-for-developers
  - heres-how-it-went
categories:
  - software-development
  - productivity
---

I have recently had a few days off from work due to festivities in Germany and I used some of my spare time to finally investigate the Vim editor.

For those who do not know Vim is a text editor, which was developed by Bram Moolenaar and released for the first time in 1991. So it's not that old yet. But if you consider the fact that this is an improved version of Billy Joy's `vi` editor which was originally developed in 1976 for the UNIX operating system, things start to get interesting as you realize for how long it's been around and you've lived merrily without ever trying it.

## Vim for laymen

If you've never used Vim, the first time you open it, the only question you have is _how do I exit this thing that just hijacked my terminal_ (it's `:wq` for _write and quit_ and `:q!` for _quit and discard changes_).

Most people, including myself barely 3 weeks ago, scratch their heads at apparent masochists that try to use Vim as of 2022, when there are such amazing editors like VSCode out there. And yes, VSCode can do everything that Vim can and probably more but because of the multimodal editing capabilities, Vim tends to be much faster with... everything.

### Multimodal editing

Vim does not behave like a normal editor. Yeah there is a cursor but when you start Vim it starts in _Normal_ mode, which is basically optimal for text manipulation without the need to depart too far from the home-row keys. In normal mode, when you type, the characters are actually bound to certain commands and you will see no input appearing. Until you hit `i`.

`i` sets Vim to _Insert_ mode, which is basically letting you type text. This is what you know from conventional editors, where there's a cursor, you type and text appears. When you press `<esc>` you go back to the Normal mode.

There's also `v` that sets Vim to _Visual_ mode. This mode resembles selecting with a mouse or with a `Shift` key, however it doesn't require you to hold any modifier key down and you can clearly see what you're selecting as you do it.

#### Why is this cool

The fact that most text manipulation happens in Normal mode is a paradise for developers. Consider an example:

```python
def blah():
print("this is not indented correctly")
```

In a typical editor you would go to the second line and likely press `Tab` to insert a proper indent. In VSCode you could use e.g. `Ctrl+G`, then specify the line number, e.g. 2 and then hit `Ctrl+]` to indent the content to the right. That's 3 separate steps.

In Vim's Normal mode this is: `>2gg`. Super-fast.

What if I had more lines to indent?

```python
def blah():
print("this is not indented correctly")
print("this is not indented correctly")
print("this is not indented correctly")
```

In VSCode I would generally go to the first problematic line with `Ctrl+G`, then use the arrow keys and `Shift` to select the two lines below and finally hit `Ctrl+]`.

In Vim's Normal mode this is: `2gg3>>` (go to line 2 with `gg` command and then indent 3 lines with `>>`).

> 👉 Vim is blazingly fast for text traversal and modification. This is especially useful for software developers but also applies to any profession that requires a lot of text typing.

## Vim vs. Emacs

Let's go back for a moment to the discussion about editors in general.

There's a holy war going on between Vim and another editor with a rich history called Emacs. The feud reportedly is older than the Internet itself.

Have I used Emacs? No. Am I planning to use Emacs? Also no. At least at the moment I am biased towards Vim because of it's multimodal editing style and it's sheer speed.

Also the availability plays a factor: Vim is installed by default on most Linux distros that I've used and works exactly the same way everywhere if you stick to vanilla Vim as much as possible. Since I often have to work with a number of different machines, having the versatility to connect e.g. via SSH and jump into Vim without having to install anything is golden.

## Vim vs. VSCode

So have I uninstalled VSCode and am I now just typing up everything in a little terminal window? No. And I am not going to leave VSCode behind.

> 👉 I love VSCode and I will keep on using it almost the same way I've been using it so far. But I've now installed the Vim emulation plugin in VSCode and I can enjoy the best of both worlds. I recommend it to everyone.

## Vim bindings everywhere

The cool part about Vim is that the bindings seem to be quite simple to port or at least emulate in many different editors. Since Vim at it's core is basically a buffer view of a file which reacts to commands, you will find that a lot of applications that are at least somewhat developer-oriented do have Vim bindings in their offer.

> 🤯 I was mindblown by the fact that [Obsidian](https://obsidian.md) which is my Knowledgebase Tool of choice supports Vim bindings. It's incredible that I can use the exact same tricks for notetaking.

## Vim just scales well

Vim really scales. If you're worried that there's something Vim won't be able to do, you probably should stop worrying. Well, it probably won't play music and let you respond to emails like Emacs does but if you are less of a tinkerer and more of a doer, you probably wouldn't care.

As a total newbie I would just learn the very basics, starting with the navigation, copy-pasting, etc. A few examples:

- `h j k l` act like arrow keys in Normal mode -> convenient, because you don't need to reach the arrows to navigate
- `zz` centers the current line in view, `zt` sends it to the top `zb` to the bottom
- `^` moves the cursor to the beginning of the line while `$` to the end (like RegEx)
- `yy` copies the current line, `dd` cuts the current line, `p` is for pasting after the cursor position while `P` is for pasting before the cursor position
- `i` sets the insert mode, `I` sends the cursor to the beginning of the line and sets insert mode
- `a` sets the insert mode after the cursor position, `A` sends the cursor to the end of the line and sets insert mode

Then I would learn about registers which kind of behave like clipboards. You can cut, yank (copy) to them and paste text from them. For example:

- `"+y` copies to the system clipboard (`+` register)
- `"ay` copies to the `a` register
- `"ap` pastes from the `a` register

When you realize that you can chain those commands and add integer modifiers to apply the action to multiple text objects at once, it's where the fun really begins. For example:

- `"+5yy` copies 5 consecutive lines to the system clipboard
- `3k` moves cursor 3 lines down
- `v3w` selects 3 consecutive words

Then you start working with text objects more efficiently and you discover some cool recipes to solve typical problems with text editing in software development:

- `>i{` indents whatever is inside curly braces
- `ya{` copies enclosing curly braces with all the content
- `ciw''<esc>P` wraps a word in quotes

Finally you realize you can speed stuff up tremendously by recording macros, for example that last command from before could be recorded as a macro. For example `qq` will start recording to the register `q`. Then you can run the command as specified and press `q` at the end to stop recording. Press `@q` to use the macro anytime you want to quote something.

> 🤯 On top of that Vim supports scirpting in `vimscript` language and if you use a more modern distribution of Vim, like NeoVim, you can technically write plugins in any language to supercharge Vim if you really need to.

## Conclusions

I will be keeping Vim around for longer. I have already gotten much faster and my fingers do not need to do as much work as before to get things done. I do however fall-back onto VSCode's default editor when I struggle to do some more advanced stuff, e.g. progressive selection of a searched pattern for which I haven't found a terriffic equivalent in Vim. I am also not investing much time into customizing and spicying up my Vim experience, since I want to train my brain to replicate at least some of the most common command chains on the fly, whenever I need them. When in doubt I usually look up stuff in my notes.

Vim is hard. It has a very steep learning curve but if you're already professionally developing software, you will likely understand its value if you give it an honest try over at least few days. If you care about overall speed, this is definitely a long-term investment for you to commit to, because some things might not come natural with how Vim works. I still think the commands in most cases follow some nice mnemonics and I often find talking to myself in terms of those mnemonics when I want to get something more complex done using Vim commands.

But above all, remember. It does not matter what editor you're using and what plugins you're in need of, as long as you train the awareness of what you really need to get your job done quickly and efficiently. If tools like Vim significantly speed you up, use them. If every time you use them you find yourself wondering how to do something nicely for 30 min straight, then you're missing the point. The moment you realize you don't know how to do something with Vim, use a different editor even if for a few minutes - don't let a tool block you from being a performant developer.
