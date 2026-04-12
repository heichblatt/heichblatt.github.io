---
title: "Four Ways to Work With AI"
date: 2026-04-12
draft: false
tags:
    - tech
    - comment
---

Most people use AI the same way: type a question, read the answer. That's one of four distinct modes — and conflating them is why AI-assisted work so often disappoints.

## The Four Modes

I've been developing [a taxonomy](https://garden.hanneseichblatt.de/AI-Engagement-Patterns) based on how much context the agent keeps and how much you specify up front:

| Mode | Context | You give the agent |
|------|---------|-------------------|
| **Lookup** | None | A fully specified question |
| **Workshop** | Ephemeral session | A goal |
| **Companion** | Persistent | A working relationship |
| **Mission** | Autonomous | A task definition |

These aren't a hierarchy. Lookup is right for one-off questions; Mission for autonomous execution. Using the wrong mode for the job — Workshop for a quick factual question, Lookup for a complex refactoring — is what produces the frustration.

## Abstraction is the Variable

What shifts across the modes is the level of abstraction you bring. In Lookup you specify everything. In Mission you share an idea and the agent figures out the rest. Karpathy put it well: in the LLM era, you share the idea and [the agent customises and builds for your specific needs](https://garden.hanneseichblatt.de/Abstraction-and-Autonomy-in-Human-AI-Collaboration). The bottleneck in Mission mode isn't model capability — it's the quality of your task definition.

## Infrastructure Follows

Each mode has different cost, latency, and capability requirements. [Daniel Miessler's advice](https://danielmiessler.com/blog/inference-costs-are-not-sustainable): start planning your multi-model, local-model, cheaper-model strategy for your harness. A router that dispatches to local Ollama for Lookup and premium remote models for Mission is the natural architecture. More on this in my [Personal AI Infrastructure](https://garden.hanneseichblatt.de/Personal-AI-Infrastructure) note.

This is a new ops problem.

## What Changes Over Time

The modes aren't fixed. Agents that accumulate persistent memory — Karpathy's [append-and-review](https://karpathy.bearblog.dev/the-append-and-review-note/) concept applied to agent context, explored in my [Agentic Self-Improvement](https://garden.hanneseichblatt.de/Agentic-Self-Improvement) notes — become more capable at Companion and Mission work over time.

The infrastructure you build now determines which modes you can operate in. The modes you can support are the modes you will use.
