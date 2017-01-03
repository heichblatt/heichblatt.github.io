---
layout: post
title: My Computing Rules 2017
description: "TODO"
category: personal
tags:
- tech
- comment
- howto
---
{% include JB/setup %}
# My Computing Rules 2017

These aren't dogmas, there are exceptions to each of these rules.

## Lightweight.

Choose the tool with the least assumptions about the correct solution.

Whatever the purpose, the tool should be as lightweight as possible, by which I do not necessarily mean the smallest system resource footprint. This does not necessarily mean that everything has to be a CLI tool, yet mostly it comes down to that. I like the UNIX way of speaking to machines instead of reacting to visual metaphors, so as [Stephenson argued](http://www.cryptonomicon.com/beginning.html), the command line leaves me the most flexibility, especially the composability (TODO: korrektes Wort?) of UNIX command line tools.

Also, stay away from software that calls itself opinionated. More often than not this means that the author has decided on the correct path to a solution for your problem. 

## Automated

Use version-controlled config management for all your system configuration. That includes your laptop, your Vim config and your shell aliases.

This speeds up bootstrapping new systems and gives you an easy way to keep your work environment on several machines in sync.

## Encryption

Encrypt as much of your everyday life as possible.

Full disk encryption is integrated into most Linux installers nowadays and the overhead is minimal. HTTPS Everywhere (TODO: Link) makes your browser use HTTPS wherever possible. Use GPG wherever.
