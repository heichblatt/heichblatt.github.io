---
title: "Four Ways to Work With AI"
date: 2026-04-12
draft: false
tags:
    - tech
    - comment
---

Most people I talk to use AI the same way: they type a question, read the answer, and move on. It's a better search engine. Occasionally a smarter autocomplete. That is a perfectly legitimate use, but it conflates four fundamentally different modes of working with AI into one — and the conflation has consequences, both for what you get out of AI and for how you build the infrastructure to support it.

I've been thinking about a taxonomy of AI engagement patterns, and after a few weeks of refining it I think four categories cover most of what people actually do.

## The Four Modes

**Lookup** is the mode everyone knows. You ask a one-off question; the agent answers. No context is kept between exchanges. The interaction surface is a messenger-style chat window — stateless, frictionless, and exactly suited for things like "what does this regex mean" or "summarise this paragraph". You bring the full specification; the agent brings the answer.

**Workshop** is an ephemeral collaborative session. User and agent work together toward a defined goal — say, a coding session, a document draft, or a debugging run. Context is shared within the session and discarded when it ends. The right tool here is a web UI paired with a coding agent and a git repository: enough structure to be productive, light enough that you don't carry the weight of everything you've ever done together. You bring a goal; the agent helps you reach it.

**Companion** is what happens when you stop discarding context. The collaboration is persistent — it accumulates across sessions, building a shared understanding of how you work, what matters to you, what you've already tried. Infrastructure here starts to resemble a long-lived project: an ongoing agent configuration, a git-backed knowledge store, probably some form of memory layer. You bring a working relationship; the agent brings continuity.

**Mission** is the autonomous end. You hand the agent a task definition — including what "done" looks like — and it works independently, asking for human approval at key decision points. The interaction surface is closer to a project management tool than a chat window: GitHub issues, pull requests, a Kanban board. You bring an abstract goal; the agent brings a completed result.

These four modes are not a hierarchy of sophistication. They are appropriate to different types of work. Using Workshop mode for a quick factual question is wasteful. Using Lookup mode for a complex refactoring task is maddening. The failure to distinguish them is why a lot of AI-assisted work feels simultaneously overhyped and underdelivering.

## Abstraction as the Variable

What changes across the four modes is not really the capability of the model. It is the level of abstraction at which you engage with it.

In Lookup, you specify everything. The question must be self-contained. The agent's latitude is narrow: it fills in what you already know you need. In Workshop, you specify a goal and leave the path open. In Companion, you specify less and less over time as the shared context fills in the gaps. In Mission, you specify an idea and the agent figures out everything else — the implementation, the tooling, the sequence of steps.

Andrej Karpathy put a version of this neatly in a recent note: in the LLM era, you share the *idea*, and the other person's agent customises and builds it for your specific needs. The abstraction is the deliverable. You stop writing code and start writing intent.

This is a non-trivial shift. It means that the bottleneck in Companion and Mission mode is not model capability but the quality of your task definition. Vague intent produces vague results. But the right kind of structured vagueness — clear about the goal, open about the path — gives agents room to optimise for your specific context rather than the imagined average case.

## Infrastructure Follows the Mode

Each mode has a different cost and latency profile, and a different requirement for model capability. Lookup is cheap and fast; a small local model usually suffices. Workshop needs something more capable but still latency-sensitive. Companion and Mission, running over longer horizons with larger context windows, can tolerate more latency and justify higher cost per token.

The natural architecture for someone running all four modes is a router: a harness that enriches user input with context, then dispatches to an appropriate backend based on the engagement pattern. Local Ollama instances for Lookup-class work; a mid-tier hosted model for Workshop; a premium remote model for complex Companion and Mission tasks. Daniel Miesler put this concisely: start planning your multi-model, local-model, cheaper-model strategy for your harness.

This is, effectively, an ops problem. Setting up personal AI infrastructure — understanding your usage patterns, choosing your backends, tuning your routing logic — is becoming a prerequisite for serious AI use in the same way that understanding package management became a prerequisite for serious software development. You can get far without it, but you will hit a ceiling.

The ceiling is not about the models. It is about the infrastructure you bring to them.

## What Comes Next

The most interesting direction from here is Companion and Mission mode becoming more capable through time, not just through better models. Agents that maintain persistent memory and refine it in the background — Claude Code's approach to memory management reportedly involves a three-layer design with background rewriting — accumulate context that makes future interactions more effective. Karpathy's AI Librarian concept takes this further: a knowledge-base-in-context that an agent actively curates, distills, and queries.

The implication is that the modes are not fixed categories. They evolve with use. A relationship that starts in Workshop mode — ephemeral, task-scoped — can graduate to Companion mode as shared context accumulates and trust is established. Mission mode becomes viable only after enough Companion-mode collaboration to know that the agent's defaults roughly match your intentions.

The infrastructure you build now determines which modes you can operate in. If you only have a stateless chat window, you only have Lookup. The modes you can support are the modes you will use.

That is probably the thing worth getting right before the models get any better.
