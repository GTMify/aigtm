# Agent Orchestration Cowork Prompt

Copy and paste this into Claude Cowork. Replace the `[bracketed fields]` with your details.

---

```
Help me chain the GTM skills I already have into one supervised motion I can run start to finish, with a human approval step before anything reaches a customer. Map the motion to the five-layer Autonomous GTM Stack.

## What starts the motion (Trigger)
[What kicks this off and what the first step receives, e.g. "a CSV of 25 target accounts with company name and domain", "an inbound form fill", "a CRM stage change", "a Monday morning schedule"]

## What I'm trying to accomplish
[The outcome in one or two sentences, e.g. "run first-touch outbound across a target list without doing the research and drafting by hand"]

## Skills I have installed
[List the skills you can chain, e.g. prospect-research, cold-email, sequence, post-call-summary, win-loss-analyzer, meeting-prep. Only list ones you actually have.]

## Where I want the human gate
[The point where you want to review before anything sends, posts, or goes out. If unsure, say "wherever the first irreversible customer-facing action is" and I'll place it for you.]

## What I need
1. **The chain:** an ordered list of steps, each labeled with its stack layer (Trigger, Agent decision, Execution, Human gate, Feedback) and the real skill it uses. Each step's output feeds the next.
2. **The gate:** called out on its own line, before the first irreversible or customer-facing action, with what I review and what happens on approval versus rejection.
3. **The feedback loop:** what the motion captures on the way out and where it gets written back so the next run is sharper.
4. **Handoffs:** the exact artifact that moves from each step to the next.
5. **What still needs me** beyond the gate, if anything.

## Rules
- Only chain skills I actually listed as installed. Do not invent or assume a skill I do not have. If a step has no matching skill, say so and offer the closest real one or a manual step.
- The human gate is mandatory and goes before the first action that sends, posts, submits, or otherwise cannot be undone. Never design a motion that acts on a customer without my approval upstream.
- The motion drafts and prepares on its own; I decide. Keep that division clear.
- Keep handoff artifacts plain and inspectable so I can read and edit them at the gate.
- Do not add API keys, tokens, endpoints, or hostnames. Use whatever the installed skills already read on my machine.
```
