---
title: "Paperclip: The Mission Pattern in Practice"
date: 2026-04-25
draft: false
tags:
    - tech
    - comment
    - ai
---
*This post builds on [Structuring Collaboration](https://hanneseichblatt.de/posts/structuring-collaboration/), which defined four AI collaboration modes: Lookup, Workshop, Companion, and Mission.*

---

Mission is the hardest pattern to get right. You hand over a task and success criteria, and a trusted agent colleague works autonomously — checking back at decision points, not at every step.

The difficulty isn't conceptual. It's operational: how do you structure delegation so the agent knows what it's working on, when it's done, and when to stop and ask?

[Paperclip](https://paperclip.ing) is an open-source platform for orchestrating teams of AI agents. It treats coordination as org design: roles, reporting lines, a ticket system, per-agent budgets, and board-level control. Its model maps directly onto what Mission delegation requires.

## What Mission requires

Three things:

1. **The agent knows what it's working on and why.** Not just the task — the goal behind it.
2. **There's a clear way to declare done.** The agent needs to know when to stop, not just what to do.
3. **There are defined escalation points.** Autonomous work except at specific decision gates — not constant interruptions, but not silent derailment either.

Paperclip makes all three explicit by default.

## Scope and context: issues tied to goals

Every issue in Paperclip connects upward — to a project, a goal, the company mission. When an agent wakes up, it has that full chain available. Context is structural, not something you re-prompt each session.

## Declaring done: status transitions

Agents communicate through status. Done means `done`, with a comment explaining what was completed. Can't proceed means `blocked`, with a specific blocker and who needs to act. The human reviews outcomes — not progress.

## Escalation points: approvals and in-review

When a decision exceeds the agent's authority, it opens an approval request or moves the issue to `in_review` and reassigns it up the chain. Work pauses. The board decides. Then the agent continues. Escalation is a typed event with a defined recipient — not an ad-hoc interruption.

## Bounded autonomy: heartbeats and budgets

Agents run on a heartbeat: wake, check work, act, exit. They don't run continuously. Each agent has a monthly budget; when it's exhausted, the agent stops. The board can pause or terminate any agent at any time.

This is the trust architecture Mission requires: high autonomy between check-ins, hard stops at defined limits, full override for the board.

## Why this is Mission, not Workshop

Workshop requires your presence. You're in the session — context lives in the conversation and disappears when you leave.

Paperclip is designed for when you're not there. No persistent session; context lives in the issue, the goal, the comment thread. It's there when the agent wakes up an hour later, after a reboot, after a weekend. Every action is logged, every status change is explained, every decision is traceable. You can step away and come back to a full audit trail.

Workshop requires presence. Mission requires trust — and a system that makes work legible while you're away.

## The upshot

Mission delegation fails when three questions don't have clear answers: *What is the agent working on? How does it know when it's done? When does it escalate?*

Paperclip answers all three by default. You don't configure Mission mode. You just use the system as designed.

Thanks to Jakob for the tip.

---

*This post was written in collaboration with Claude, implementing the Mission pattern described above.*
