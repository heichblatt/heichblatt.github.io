---
layout: post
title: "Solaris is Dead"
description: ""
category: personal
tags:
- tech
- comment
---
{% include JB/setup %}
# Solaris is Dead

Most of you probably have heard by now that [Oracle](https://en.wikipedia.org/wiki/Oracle_Corporation) has silently EOLed [Solaris](https://en.wikipedia.org/wiki/Solaris_(operating_system)), one of the older commercial Unices.

The first definitive sign was [a tweet](https://twitter.com/webmink/status/904081073256243201) by [Simon Phipps](https://en.wikipedia.org/wiki/Simon_Phipps_(programmer)) on September 2:

> For those unaware, Oracle laid off ~ all Solaris tech staff yesterday in a classic silent EOL of the product.

Soon after, TheLayoff.com, a portal for recently or soon to be laid off employees, [started noticing](https://www.thelayoff.com/oracle) an [influx of now ex-Oraclers](https://twitter.com/TheLayoff/status/903323829199671299). Some of them reported having been notified by UPS of impending packages while others reported receiving the first actual termination notices. The packages’ arrival seem to have been planned for [Labor Day](https://en.wikipedia.org/wiki/Labor_Day) which I find particulary egregious.

The Register [reported on August 31](https://www.theregister.co.uk/2017/08/31/oracle_stops_prolonging_inevitable_layoffs/):

> Oracle finally decides to stop prolonging the inevitable, begins hardware layoffs Pink slips are en route, say staff

Later, even [Alan Coopersmith](https://blogs.oracle.com/author/alan-coopersmith), at that time Technical Lead for the Solaris 11.4 release, [tweeted ominously](https://twitter.com/alanc/status/903802951470157825):

> Sunset in Santa Clara.

The Santa Clara office was home to the Solaris and SPARC teams. [Local news](http://www.mercurynews.com/2017/09/05/oracle-slashes-more-than-900-santa-clara-jobs-more-worldwide/) picked up the story as well.

Drew Fisher, [Senior Software Engineer for the Solaris Install Team](https://www.linkedin.com/in/drew-fisher-38309711), also [confirmed](https://twitter.com/drewfisher314/status/903804762373537793) the bad news:

> For real. Oracle RIF’d most of Solaris (and others) today.

RIF stands for [Reduction in Force](https://en.wikipedia.org/wiki/Layoff) and the Wikipedia page redirects to the entry for layoff.

One of the most in-depth articles in the direct aftermath surely was [Bryan Cantrill’s](https://en.wikipedia.org/wiki/Bryan_Cantrill) [The sudden death and eternal life of Solaris](http://dtrace.org/blogs/bmc/2017/09/04/the-sudden-death-and-eternal-life-of-solaris/)

> Solaris may not have been truly born until it was made open source, and — certainly to me, anyway — it died the moment it was again made proprietary. But in that shorter life, Solaris achieved the singular: immortality for its revolutionary technologies. So while we can mourn the loss of the proprietary embodiment of Solaris (and we can certainly lament the coarse way in which its technologists were treated!), we can rejoice in the eternal life of its technologies — in illumos and beyond!

I recommend this article in particular due to his long commitment to Solaris, having written DTrace and several top positions in the field, mostly close to Solaris-related technologies, especially after becoming Vice President of Engineering and later CTO at [Joyent](https://en.wikipedia.org/wiki/Joyent), the home of [SmartOS](https://en.wikipedia.org/wiki/SmartOS), one of Solaris’ open source children.

Again, Oracle’s awful handling of the situation shows through:

> In particular, that employees who had given their careers to the company were told of their termination via a pre-recorded call — “robo-RIF’d” in the words of one employee — is both despicable and cowardly.

Some sources specifically pointed to the connection between Solaris and the SPARC teams which had historically always been closely connected. [Isaac Rabinovitch](http://www.informit.com/authors/author_bio.aspx?ISBN=9780321334206), a former technical writer at Sun, [tweeted](https://twitter.com/isaac32767/status/904163673886793729):

> It’s interesting that people are viewing the Oracle move as a software EOL. I guess most people don’t even know what SPARC is, much less 1/ how closely Solaris is tied to it. Yeah, yeah, Solaris runs on x86 too. I know this all too well, having worked in the x86 division at 2/ Sun until just before the Oracle takeover. But x86 Solaris was never a serious thing. If you worked for Sun, you had to pretend it was, 3/ but nobody except a few marketing folks believed it. So, Oracle admitting (about a decade late) that SPARC has no future means Solaris 4/ has no future. I get that a lot of people think highly of the SPARC/Solaris stack, but I can’t mourn it. That’s because the people at Sun 5/ who worshiped this tech destroyed the company trying to preserve it. And with it a lot of good tech I was proud to be associated with. 6/6

Adrian Cockcroft, [formerly Distinguished Engineer at Sun](http://www.allthingsdistributed.com/2016/10/welcoming-adrian-cockcroft-to-tthe-aws-team.html) and author of [several books in the field](https://www.amazon.com/Adrian-Cockcroft/e/B000APJAKG/ref=dp_byline_cont_book_1), including [“Sun Performance and Tuning: Sparc & Solaris”](https://www.amazon.com/Sun-Performance-Tuning-Sparc-Solaris/dp/0131496425/) posted [“Open letter to my Sun friends at Oracle (updated from 2010 post)”](https://medium.com/@adrianco/open-letter-to-my-sun-friends-at-oracle-updated-from-2010-post-1f8b2bcba693) on August 31.

> That is what I meant when I tweeted that Illumos is as irrelevant as Solaris, and it is legacy computing. I don’t mean Solaris will go away, I’m sure it will be the basis of a profitable business for a long time, but the interesting things are happening elsewhere, specifically in public cloud and “infrastructure as code”.

Meshed Insights, a technology blog, [published a list](https://meshedinsights.com/2017/09/03/oracle-finally-killed-sun/) of other products acquired and run into the ground by Oracle and provided good strategic insight:

> Instead of understanding the real failures at Sun – taking too long to open source Solaris and attempting a marketing-led approach in 2000-2002 instead of Sun’s traditional engineering-led approach – Ellison blamed the man who was landed with the task of rescuing whatever he could from the smouldering ruins left by McNealy, Zander, Tolliver and their clan and their complacent failure. Ellison never understood the pioneering approach Schwartz was taking, instead sneering at blogging and calling all the work-in-progress “science projects” while dismantling the partner channels and alienating the open source community.

Hacker News inevitably got note of the events and [started a thread](https://news.ycombinator.com/item?id=15160149), collecting opinions and fond memories.

[Brendan Gregg](https://en.wikipedia.org/wiki/Brendan_Gregg), also an ex-Sun and ex-Joyent employee and currently Senior Performance Architect at Netflix, is probably best known for his work in systems performance (and [these diagrams](http://www.brendangregg.com/linuxperf.html)). He published [“Solaris to Linux Migration 2017”](http://www.brendangregg.com/blog/2017-09-05/solaris-to-linux-2017.html), a guide for migrating existing systems to equivalent technologies.

> Many people have contacted me recently about switching from Solaris (or illumos) to Linux, especially since most of the Solaris kernel team were let go this year (including my former colleagues, I’m sorry to hear).

Fortune.com published an [article focussing on the economic aspects](http://fortune.com/2017/09/05/oracle-layoffs-hardware-solaris/):

> Oracle has laid off what appears to be a significant number of employees working on its hardware and Solaris operating system efforts, according to anonymous posts on TheLayoff.com, the gist of which were confirmed to Fortune by former Oracle employees.

Heise, one of the major IT-related publications in Germany had [an article](https://www.heise.de/ix/meldung/Oracle-feuert-SPARC-und-Solaris-Entwickler-3820643.html) and [an editorial](https://www.heise.de/ix/meldung/Kommentar-zum-Solaris-Ende-Ein-roter-Elefant-im-IT-Laden-3824375.html) on the topic. Even Fefe [noticed](https://blog.fefe.de/?ts=a7551208) and mentioned [John Fowler’s exit a month earlier](https://www.theregister.co.uk/2017/08/02/oracle_john_fowler_bails/). Fowler had been the head of Solaris development at Oracle.

Oracle originally [wanted to present its plans for Solaris 11.next](https://www.theregister.co.uk/2017/09/08/oracle_pushes_solaris11_plans_out/), the coming rolling-release model for Solaris post-11.3, at its [OpenWorld 2017](https://www.oracle.com/openworld/index.html) conference. However, their session catalog contains [no talk about the topic but several about moving Solaris workloads into Oracle Cloud](https://events.rainfocus.com/catalog/oracle/oow17/catalogoow17?showEnrolled=false&search.itinfrastructure=1502206130220004NQxi) and general cloud adoption.

In the words of [Michael Büker on Twitter](https://twitter.com/emtiu/status/807117424957030400):

> We had joy, we had fun
> We ran Unix on a Sun,
> But the source and the song
> Of Solaris have all gone
