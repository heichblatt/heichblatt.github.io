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

Mission is the hardest pattern to get right. You hand over a task definition and success criteria, and a trusted agent colleague works autonomously — checking back at decision points, not at every step.

Most people understand Mission in theory. The difficulty is operational: how do you actually structure delegation so the agent knows what it's working on, when it's done, and when to stop and ask?

[Paperclip](https://paperclip.ing) is an open-source platform for running teams of AI agents. It treats orchestration as org design: agents have roles, reporting lines, and job descriptions; work flows through a ticket system; budgets are enforced per agent; and you — the board — approve hires, override strategy, and stay in control. Its core model maps almost exactly onto what Mission delegation requires.

## What Mission requires

Mission delegation has three prerequisites:

1. **The agent knows what it's working on and why.** Not just the task — the context behind it. Why this, why now, what success looks like.

2. **There's a clear way to declare done.** The agent needs to know when to stop, not just what to do.

3. **There are defined escalation points.** The agent works autonomously except at specific decision gates — it doesn't interrupt constantly, but it also doesn't silently go off the rails.

Paperclip makes all three explicit by default.

## Scope and context: issues tied to goals

In Paperclip, every task is an issue. But an issue isn't just a to-do item — it's connected to a project, which connects to a goal, which connects to the company mission. Context flows upward through the hierarchy automatically.

When an agent wakes up to work on an issue, it has the task description, the parent goal, and the company mission all available. It doesn't need to be reminded what it's doing or why. That's the "task definition" half of Mission delegation, handled structurally rather than by prompting.

## Declaring done: status transitions

Agents in Paperclip communicate through status. When work is complete, the agent marks the issue `done` with a comment explaining what was done. When it can't proceed, it marks itself `blocked` with a specific blocker and who needs to act.

This is the success-criteria half of Mission. The agent doesn't just stop talking — it signals state. The human reviews outcomes, not progress. That's the distinction between supervising and delegating.

## Escalation points: approvals and in-review

When an agent reaches a decision that exceeds its authority — a spend approval, a strategy call, a hire — it creates an approval request or moves the issue to `in_review` and reassigns it up the chain. Work pauses. The board decides. Then the agent continues.

This is what the *structuring-collaboration* post called "checking back at decision points." Paperclip operationalizes it: escalation isn't an ad-hoc interruption, it's a typed event with a defined recipient and a clear question.

## Bounded autonomy: heartbeats and budgets

Agents run on a schedule — they wake, check work, act, and exit. They don't run continuously. Each agent has a monthly budget; when it's exhausted, the agent stops automatically. The board can pause or terminate any agent at any time.

This is the trust architecture Mission requires. High autonomy between check-ins, hard stops at defined limits, full override capability for the board.

## Why this is Mission, not Workshop

Workshop collaboration happens within a session. You and the agent are both present, working through a problem together — context exists only while you're in the conversation.

Paperclip is explicitly designed for when you're not there. Agents run on a schedule called a heartbeat: they wake up, check the ticket system, do work, post an update, and exit. No persistent session. No human in the loop unless a decision gate is hit. The context isn't held in memory — it lives in the issue, the project, the goal, and the comment thread. It's there when the agent wakes up an hour later, or a day later, or after a reboot.

That's the structural difference. Workshop requires your presence. Mission requires your trust — and a system that makes the work legible after the fact. Paperclip is built around legibility: every action is logged, every status change is explained, every decision is traceable. You can walk away and come back to a full audit trail of what happened and why.

## The upshot

Mission delegation fails when the answer to any of these questions is unclear: *What is the agent working on? How does it know when it's done? When does it escalate?*

Paperclip makes all three answerable by default — through structured issues, status semantics, and the approval flow. You don't configure Mission mode. You just use the system as designed.

That's what "agentic onboarding done right" looks like at the infrastructure level.

Thanks to Jakob for the tip.

---

*This post was written in collaboration with Claude, implementing the Mission pattern described above.*
