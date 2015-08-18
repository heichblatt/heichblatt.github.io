---
layout: post
title: Crack ZIP Passwords
description: "TODO"
category: personal 
tags: 
- tech
- howto
---
{% include JB/setup %}

I will assume that you are allowed to crack the .zips you will be cracking.

We will use [fcrackzip](http://oldhome.schmorp.de/marc/fcrackzip.html) for this. I could not get the much more known [John The Ripper](http://www.openwall.com/john/) to work reliably in this case.

    wget http://oldhome.schmorp.de/marc/data/fcrackzip-1.0.tar.gz
    tar xf fcrackzip-1.0.tar.gz
    cd fcrackzip-1.0
    ./configure
    make
    sudo make install

Suppose we know that the password ist a five digit PIN consisting only of numbers, [padded with zeros](http://www.theunixschool.com/2012/04/different-ways-to-zero-pad-number-or.html).
We create a wordlist of all possible passwords:

    typeset -Z5 i ; for i in {0..99999} ; do echo $i ; done > /tmp/wordlist

Then we use that wordlist with fcrackzip:

    /usr/local/bin/fcrackzip --use-unzip --dictionary -p /tmp/wordlist ~/my-zip-file.zip
