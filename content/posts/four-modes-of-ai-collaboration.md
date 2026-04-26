---
title: "Four Modes of AI Collaboration"
date: 2026-04-12
tags:
    - tech
    - comment
    - ai
series:
    - AI Collaboration
---

Most people I know use AI the same way: type a question, get an answer, move on. That works fine. But it's one of four fundamentally different [engagement patterns](https://garden.hanneseichblatt.de/AI-Engagement-Patterns), and treating them as interchangeable is part of why AI-assisted work so often feels like it underdelivers.

## The Four Modes

The patterns are best understood along two axes: how much context the agent keeps, and how much autonomy you give it.

**Lookup** is stateless. You bring a fully specified question; the agent answers it; nothing carries over. It's the right tool for exactly what it sounds like: looking things up. Most people live here.

**Workshop** is an ephemeral session with a shared goal. You and an agent work together toward something, context is alive for the duration, and then it's gone. This is the mode that most coding agents and document editors are built around today.

**Companion** is what happens when you stop discarding context. The collaboration accumulates across sessions; the agent develops a picture of how you work, what you care about, what you've tried before. Something that resembles a working relationship starts to form.

**Mission** is the autonomous end. You hand over a task definition (including what "done" looks like) and the agent executes independently, checking back at decision points. You're managing a process, not driving one.

These aren't a sophistication hierarchy. Using Workshop mode for a one-off question is overkill; using Lookup for a complex refactoring is maddening. The frustration most people feel with AI tools often comes from this mismatch, not from the models themselves.

## Abstraction is the Variable

What changes across the modes is the level of abstraction at which you engage. In Lookup, you do all the specifying: the question has to be self-contained. In Workshop, you specify a goal and leave the path open. In Companion, the accumulated context fills in gaps you no longer need to articulate. In Mission, you're operating at the level of intent.

Karpathy captured this neatly: in the LLM era, [you share the idea and the agent builds it for your specific needs](https://garden.hanneseichblatt.de/Abstraction-and-Autonomy-in-Human-AI-Collaboration). There's less and less point in sharing specific code. The abstraction becomes the deliverable. This is a real shift: the bottleneck in higher modes isn't what the model can do, it's how precisely you can articulate what you want at the right level of vagueness.

## Infrastructure Has to Match

Each mode has a different cost and capability profile, and you can't run all four out of the same setup. [Daniel Miessler's framing](https://danielmiessler.com/blog/inference-costs-are-not-sustainable) is useful here: you need a strategy for routing between models. Cheaper and faster for well-defined tasks, more capable for open-ended ones. The right [infrastructure](https://garden.hanneseichblatt.de/Personal-AI-Infrastructure) is less about having the most powerful model and more about dispatching intelligently. That's an ops problem most people haven't started thinking about yet.

## The Modes Evolve

The four modes aren't fixed buckets. A relationship that starts as Workshop can graduate to Companion as shared context accumulates. Mission becomes viable only once you've built enough trust in how the agent operates.

This is where [agentic self-improvement](https://garden.hanneseichblatt.de/Agentic-Self-Improvement) becomes interesting: agents that actively reflect on past collaboration and refine their own context grow more capable at higher modes over time, not because the underlying model improves, but because the working relationship does. Karpathy's [append-and-review](https://karpathy.bearblog.dev/the-append-and-review-note/) concept is an early sketch of what this looks like in practice.

The infrastructure you build shapes which modes are available to you. And the modes you can reach are the modes you'll use.

---

*This post was written in collaboration with Claude Sonnet, implementing the Workshop pattern described above.*
