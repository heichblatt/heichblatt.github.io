---
title: "My Computing Rules 2013"
date: 2013-04-26
draft: false
tags:
  - comment
  - tech
---
## Convention over configuration

Sure, you can use [`zsh`](http://www.zsh.org/) and enjoy all the little nifty features but you could also just get used to the defaults of [`bash`](https://www.gnu.org/software/bash/manual/bashref.html) and be sure that wherever you login, you already know the environment. You can customize your tiling window manager until it looks like the Matrix just coredumped, but if you get accustomed to XFCE's defaults, you can get to work minutes after installation. Customization leads to fiddling.

For example, after using a highly customized [`awesome`](http://awesome.naquadah.org/) for several years, I switched to using Debian and switched to KDE. I can get a new computer up and running in less than half an hour and without any prior configuration, all my machines work and "feel" the same way. YMMV. I'm not a deskmodder, I'm an admin. Nevertheless, I like to have my complete set of software and I have a [Makefile for that](https://github.com/heichblatt/default-environment-fedora/blob/master/Makefile).

## Use existing technologies

[`duply`](http://duply.net/) for example is a complete backup solution built on top of `rsync`, `gpg`, `tar` and `gzip`. All of those programs have been around for years. Use existing building blocks to reach higher while profiting from the proven stability of those blocks.

## Open source because it's transparent

Someone more intelligent than me once said that you can learn a lot about a thing when you watch it fall apart. When a software solution is failing (and it will), I want to be able to look inside and find out why. Apart from social aspects of the open source movement, technical transparency is my selling point when it comes to chosing platforms or products.

## [Keep it simple](https://en.wikipedia.org/wiki/KISS_principle)

Bash scripts, correct use of version control and the occasional Makefile can solve more problems than you'd expect. Make it complex when it has to, not a second earlier.

## Encrypt ALL the data

I use full disk encryption on all my devices. Do you know the sore feeling when your device gets stolen/lost and you wish you could at least delete the photos on it? I don't.

## Command line over GUI

Neal Stephenson's [In the Beginning, was the Command Line](http://www.cryptonomicon.com/beginning.html) was a real eye opener for me in that it provided a reasonable theory of CLI vs GUI, "oral history" vs product (Stephenson). Thomas Scoville's [The Elements Of Style: UNIX As Literature](http://theody.net/elements.html) complemented this thought for me:

> Suddenly the overrepresentation of polyglots, liberal-arts types, and
> voracious readers in the UNIX community didn't seem so mysterious, and
> pointed the way to a deeper issue: in a world increasingly dominated
> by image culture (TV, movies, .jpg files), UNIX remains rooted in the
> culture of the word.
