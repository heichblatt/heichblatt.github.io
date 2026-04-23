---
title: "Structuring Collaboration: AI Adoption as Agentic Onboarding"
date: 2026-04-23
draft: false
tags:
  - tech
  - comment
  - ai
---

You're leading a medium-sized tech organization -- 200-500 people across development, operations, analytics, and professional services. Your organization has decided to adopt AI capabilities strategically, not in a panic.

I think we need to reframe this: [AI adoption is agentic colleague onboarding.](https://garden.hanneseichblatt.de/AI-Human-Collaboration) You're integrating a new kind of colleague into the way your teams work. The real question isn't "which AI tools should we buy?" but "how do we adapt our [collaboration practices](https://garden.hanneseichblatt.de/AI-Human-Collaboration) to work with them?"

Without structure, you get chaos. Some teams collaborate with agents daily while others don't know where to start. Seniors experiment with ambitious patterns while juniors haven't figured out how to ask for help. What you need is a shared model for how you work with agent colleagues, a roadmap for how teams adapt, and clarity on each role's part in the onboarding.

## The Four Collaboration Patterns: A Shared Language

Start with a shared vocabulary. In "[Four Modes of AI Collaboration](/posts/2026-04-12-four-modes-of-ai-collaboration/)," I outlined four patterns. They're not a ladder of sophistication -- they're different ways of working together. For organizational adoption, they double as maturity levels: both team and agent grow into deeper patterns over time.

**The four patterns are:**

1. **Lookup** - You ask an agent colleague a specific question with full context. They provide information or complete a well-defined task. Each interaction stands alone. Think: "How do I implement OAuth?" or "Generate a test for this function."

2. **Workshop** - You and an agent colleague work on a problem together within a session. Context persists while you're collaborating, but isn't carried over afterward. Good for coding together, drafting documents, exploring ideas. Think: "Let's build this feature together" or "Help me think through this proposal."

3. **Companion** - An agent colleague builds understanding across sessions. They learn your patterns, preferences, how you work. You develop a working relationship. Think: a colleague who knows your codebase, your communication style, your current projects.

4. **Mission** - You hand over a task definition and success criteria. A trusted agent colleague works autonomously, checking back at decision points. You manage by intent, not by directing steps. Think: "Refactor this module and report back when you have options for me to review."

Bringing agent colleagues into your organization builds both **organizational capability** (tools, workflows, infrastructure) and **individual skill** (can people collaborate effectively?). Most teams start with Lookup, develop Workshop, and eventually form Companion relationships. Some roles never need Mission; others want it immediately.

## Onboarding Pathways: How Different Teams Integrate Agent Colleagues

Different parts of your organization will onboard agent colleagues at different paces and around different patterns:

| Function | Onboarding | Integration | Maturity |
|----------|------------|-------------|----------|
| **Dev + Ops** | Lookup (code snippets, debugging) | Workshop (pair programming, architecture review) | Companion (agent learns codebase, refactoring automation) |
| **Data + Analytics** | Lookup (SQL queries, formula help) | Workshop (exploratory analysis, dashboard building) | Companion (automated insights, anomaly detection) |
| **Consulting** | Lookup (client research, proposal templates) | Workshop (proposal development, case analysis) | Mission (autonomous research projects with checkpoints) |

**Why Dev + Ops integrates fastest:** Developers touch code every day, and agents excel at code tasks. The friction is lowest. Over time, an agent that understands your architecture becomes a force multiplier.

**Why Analytics is close behind:** Analysts deal with structured data and well-defined questions. The progression mirrors Dev + Ops.

**Why Consulting takes a different path:** Consultants work with clients and nuance. The real value comes when an agent can autonomously dig into a problem and surface options to evaluate. This requires trust, so onboarding is slower -- but the endpoint (Mission-level delegation) is more powerful.

### An Ops Example

**Onboarding: Lookup Mode**
- Junior ops engineer: "How do I write a CloudFormation template for this RDS instance?" Agent provides a template. They modify and deploy.
- Mid-level ops engineer: "What's causing this latency spike?" Agent analyzes logs, suggests hypotheses.
- Senior ops engineer: "I need to audit our SSL certificate chain." Agent writes the audit script.

**Integration: Workshop Mode**
- Junior ops engineer: Collaborates with an agent on writing an automation script. Learns patterns and approaches by working alongside it.
- Mid-level ops engineer: Works with an agent colleague to design a monitoring dashboard. Back-and-forth conversation to get it right.
- Senior ops engineer: Uses an agent to explore a system redesign. Brainstorming and scenario testing together.

**Maturity: Companion Mode**
- Junior ops engineer: The agent knows their common tasks, suggests improvements, catches mistakes in their scripts.
- Mid-level ops engineer: The agent understands their team's infrastructure, proactively suggests optimizations, becomes a second opinion.
- Senior ops engineer: The agent becomes a research partner, understanding their architectural preferences and helping evaluate trade-offs.

## How Career Levels Enable Adoption

Human colleagues don't just progress through patterns themselves -- they maintain the shared infrastructure (instructions, configs, standards) that every new agent colleague inherits.

| Level | Personal Progression | Enablement Role |
|-------|---------------------|-----------------|
| **Junior** | Lookup → Workshop | Use shared agent configurations, report and fix bugs. Test standards in real work, feed back improvements. |
| **Mid-level** | Lookup/Workshop → Companion | Restructure and curate the collection of agent instructions. See patterns, spot redundancy, improve clarity. |
| **Senior** | Workshop → Companion + Mission | Validate approaches and mentor others through transitions. Pattern-setters ensuring practices are sound before becoming standards. |
| **Tech Lead** | Workshop → Mission | Align shared standards with other systems and regulations. Ensure configurations don't conflict with security, compliance, or ops. |
| **Architect** | Mission | Design infrastructure to share, version, and evolve instructions. Think about how the organization scales without chaos. |

This shared collection *is* the onboarding. It typically starts as copied team docs, then gets streamlined and collaboratively curated intra-team. When a new agent colleague joins, they inherit the team's accumulated patterns and ways of working. The same holds for new human colleagues: a working baseline of how this team collaborates with agents. Each career level keeps the collection current.

## Where to Go From Here

If you're an organization onboarding agent colleagues:

- **Start with your most ready function.** Dev + Ops typically integrates fastest; get a success there, then expand.
- **Make the collaboration patterns visible.** Help people understand that Lookup isn't "not collaborating effectively" -- it's how you work with any colleague on a quick question.
- **Invest in the transitions.** Moving between patterns takes practice. Moving to Companion requires building institutional knowledge your agent colleagues can inherit.
- **Treat shared agent instructions as living docs.** They are your team's working norms. Curate them deliberately. They're how new colleagues -- human and agent -- get up to speed.

If you're an individual working with agent colleagues:

- **Understand how you currently collaborate.** Which pattern are you in? Comfortable there, or ready to try something new?
- **Recognize that each pattern has value.** You won't always want Mission. Sometimes you need Lookup; sometimes Workshop. The skill is knowing when to use which.
- **Push the boundaries of what's possible in your role.** If you're a mid-level analyst watching architects give agents Mission-level assignments, that might be your path. Design your learning around getting there.

Your adoption success depends on the structure your organization provides for employees and agents to collaborate most effectively. Clear collaboration patterns. Appropriate expectations by career level. Shared standards that evolve together. Not ad-hoc, not panicked. Intentional.

For deeper thinking on the collaboration patterns themselves, see my "[Four Modes of AI Collaboration](/posts/2026-04-12-four-modes-of-ai-collaboration/)" post. For a knowledge garden on this topic, check out my [AI Engagement Patterns](https://garden.hanneseichblatt.de/AI-Engagement-Patterns) notes.

## Further Reading

- [ctx: "The FermAI Paradox"](https://ctx.rs/blog/the-fermai-paradox) — An Agentic Development Environment must replace traditional IDEs to enable teams to effectively supervise multiple agents at scale.

- [Martin Fowler: "Reduce Friction with AI: Encoding Team Standards"](https://martinfowler.com/articles/reduce-friction-ai/encoding-team-standards.html) — Teams should encode their working norms into versioned, executable instructions rather than relying on tacit senior knowledge.

- [Product Talk: "Give Claude Code a Memory"](https://www.producttalk.org/give-claude-code-a-memory/) — Persistent memory systems transform AI from generic tool to trusted advisor by maintaining business context across sessions.

- [Maggie Appleton: "Zero-Alignment"](https://maggieappleton.com/zero-alignment/) — Teams need collaborative alignment tools where agents work alongside humans in shared planning spaces, not solo coding agents with retrospective review.

- [InfraLovers: "AI-gestützte Wissensarbeit"](https://www.infralovers.com/blog/2026-02-14-ai-gestuetzte-wissensarbeit-schreibprozess/) — Effective AI integration requires rebuilding workflows around agent capabilities; the tool enables change only if you reshape how work flows.

- [Carl Franzen (VentureBeat): "Karpathy shares 'LLM Knowledge Base' architecture that bypasses RAG"](https://venturebeat.com/data/karpathy-shares-llm-knowledge-base-architecture-that-bypasses-rag-with-an) — LLMs maintain evolving markdown libraries as persistent, self-healing institutional memory—an AI librarian that compiles, interlocks, and validates knowledge across sessions and agents.

- [Sebastian Raschka: "Components of a Coding Agent"](https://magazine.sebastianraschka.com/p/components-of-a-coding-agent) — Harness design (live context, caching, structured tools, bounded subagents) determines real-world agent performance more than model selection alone.

Once again thanks to Jakob for helping me think.

---

*This post was written in collaboration with Claude, implementing the Workshop pattern described above.*
