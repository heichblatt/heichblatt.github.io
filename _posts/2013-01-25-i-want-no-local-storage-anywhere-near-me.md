---
layout: post
title: "I want no local storage anywhere near me"
tagline: "No disks, no state, my world entirely in the network"
category: personal
tags:
- comment
- tech
---
{% include JB/setup %}
{% include JB/setup %}

I have been pondering the [The Setup](http://usesthis.com/) post about
[Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike). He developed [Plan
9](https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs) which I was
briefly interested in. He has a very interesting and very radical point
of view where his data belong:

> I want no local storage anywhere near me other than maybe caches. No
> disks, no state, my world entirely in the network. Storage needs to be
> backed up and maintained, which should be someone else's problem, one
> I'm happy to pay to have them solve. Also, storage on one machine
> means that machine is different from another machine. (..) The
> terminal, even though it had a nice color screen and mouse and network
> and all that, was just a portal to the real computers in the back.
> When I left work and went home, I could pick up where I left off,
> pretty much. My dream setup would drop the "pretty much" qualification
> from that. (..) As laptops came in, people started carrying computers
> around with them everywhere. The reason was to have the state stored
> on the computer, not the computer itself. You carry around a computer
> so you can access its disk. (..) The world should provide me my
> computing environment and maintain it for me and make it available
> everywhere. If this were done right, my life would become much simpler
> and so could yours.

It has been a while since I have been as torn about an opinion as I am
about this one. On the one hand, I really like to keep my hands on my
data, which is why I deeply mistrust "The Cloud", which, as far as pure
storage is concerned, is simply renting storage from someone else and
maybe using their nifty little synchronization daemon. The vision Pike
proposes (and helped come to life) on the other hand is a completely
networked world where devices expose their inner workings through
uniform interfaces by which he does not mean the comparatively clumsy
APIs of today, but more in the direction of securely exposing your /dev
and /proc to the net.

> This is 2012 and we're still stitching together little microcomputers
> with HTTPS and ssh and calling it revolutionary. I sorely miss the
> unified system view of the world we had at Bell Labs, and the way
> things are going that seems unlikely to come back any time soon.

One question would be how to achieve such uniformity in the first place.
Forget about later introducing it, so how would you have convinced
people to use your rather radical model back then? But that's not the
main point here.

At the very least this is one of those rare instances when a person with
genuinely beautiful ideas puts them together and presents a vision.
Refreshing.
