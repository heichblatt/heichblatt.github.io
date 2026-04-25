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

Mission is the hardest pattern to get right: you hand over a task and success criteria, and the agent works autonomously — checking back at decision points, not at every step.

The difficulty isn't conceptual. It's operational. How do you structure delegation so the agent knows what it's working on, when it's done, and when to stop and ask?

[Paperclip](https://paperclip.ing) is an open-source platform for orchestrating teams of AI agents as an org: roles, reporting lines, a ticket system, per-agent budgets, and board-level control. Its model maps directly onto what Mission delegation requires.

## What Mission requires

Three things:

1. **Scope and context.** The agent needs to know what it's working on and why — not just the task, but the goal behind it.
2. **A way to declare done.** The agent needs to know when to stop, not just what to do.
3. **Defined escalation points.** Autonomous except at specific decision gates — neither interrupting constantly nor going silently off the rails.

Paperclip makes all three explicit by default.

## How Paperclip implements each

**Scope and context** — Every issue in Paperclip connects to a project, which connects to a goal, which connects to the company mission. When an agent wakes up, it has that full chain available. Context is structural, not prompted.

**Declaring done** — Agents communicate through status. Done means done, with a comment explaining what was completed. Blocked means blocked, with a specific blocker and who needs to act. The human reviews outcomes, not progress.

**Escalation** — When a decision exceeds the agent's authority, it opens an approval request or moves the issue to `in_review` and reassigns it up the chain. Work pauses. The board decides. Then the agent continues. Escalation is a typed event with a defined recipient — not an ad-hoc interruption.

## Why this is Mission, not Workshop

Workshop requires your presence. You're in the session, context lives in the conversation, and it disappears when you leave.

Paperclip is built for when you're not there. Agents run on a heartbeat: wake, check work, act, exit. No persistent session. Context lives in the ticket, the goal, the comment thread — it's there an hour later, a day later, after a reboot. Every action is logged. Every status change is explained.

Workshop requires presence. Mission requires trust — and a system that makes the work legible while you're away. That's what Paperclip provides.

Thanks to Jakob for the tip.

---

*This post was written in collaboration with Claude, implementing the Mission pattern described above.*
