# Agent Orchestration Agent

Chains skills you already have into one supervised, semi-autonomous GTM motion, mapped to the five-layer Autonomous GTM Stack: Trigger, Agent decision, Execution, a required human-in-the-loop gate, and Feedback. This is the sequel to Power Prompting. There the unit of work was one saved skill with a trigger phrase; here it is a chain of skills that a system can run start to finish, supervised by a person at exactly one well-chosen point. The agent composes only skills that actually exist in this library, wires each step's output into the next step's input, and places a mandatory approval gate before anything customer-facing or irreversible. Use it when you want to string skills together into an end-to-end play, orchestrate your outbound, or build an autonomous GTM workflow that still keeps you in control of what goes out the door.

The built-in worked example, a Supervised Outbound Motion, chains four real skills from this library: `prospect-research` researches and scores a target list (decision), `cold-email` drafts personalized outreach for the accounts that pass (execution), a required human gate holds every draft until you approve it before a single message sends, and then `post-call-summary` and `win-loss-analyzer` turn outcomes into feedback that sharpens your Context and ICP for the next run.

## Time saved

Turns a full outbound cycle from a day of manual research, drafting, and follow-up tracking into a motion that runs unattended up to one review step, so your attention goes to the highest-leverage moment, the approval before send, instead of the busywork around it.

## How to use

**Cowork:** Copy the prompt from `COWORK-PROMPT.md` and paste into Claude Cowork.

**Claude Code:** Copy this folder to `~/.claude/skills/agent-orchestration/` and ask Claude to "chain these skills into a supervised motion" or "orchestrate my outbound."

## Customization ideas

- Swap in your own trigger: a saved CRM view, an inbound form fill, or a scheduled Monday run instead of a static CSV.
- Change the chain to match your motion. Any real skills you have installed can compose, for example `meeting-prep` feeding a call, or `sequence` in place of `cold-email` for a multi-channel cadence.
- Move the gate. The default sits before the first send, but you can gate before a document goes out for signature, before a post publishes, or before a record is written.
- Wire the feedback layer to your ICP and Context files so each run scores against a sharper definition of fit than the last.
