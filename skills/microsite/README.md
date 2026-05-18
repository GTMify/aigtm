# Microsite / Personalized Landing Page Agent

Builds a self-contained single-file HTML landing page for a named target account — inline CSS, no external dependencies, no build step. Designed for ABM and personalized outbound: drop it on Netlify, Vercel, S3, GitHub Pages, or any static host with a personalized URL like `yourdomain.com/for/customer-slug`. Mobile-responsive, accessible, with OG meta tags for link previews, and a strict one-CTA discipline. Refuses generic templates with the customer's name swapped in — every page must reference a specific signal or trigger.

## How to use

**Cowork:** Copy `COWORK-PROMPT.md` into Claude Cowork.

**Claude Code:** Install to `~/.claude/skills/microsite/` and ask Claude to "build a microsite for [customer]."
