# Programmatic SEO — Cowork Prompt

Copy and paste this into Claude Cowork. Replace the `[bracketed fields]` with your details.

---

```
Help me plan a programmatic SEO project that ships pages at scale.

## What I'm targeting
Pattern (pick one):
[ ] Location — "[service] in [city]"
[ ] Use case — "[tool] for [use case]"
[ ] Integration — "[tool A] + [tool B]"
[ ] Comparison — "[A] vs [B]"
[ ] Alternative — "[competitor] alternatives"
[ ] Directory — "[category] directory"
[ ] Calculator — "[X] calculator for [Y]"
[ ] Template — "[template type] for [use case]"

## Target audience
Who searches for this: [Persona / use case]
What they want when they search: [Intent — comparing, evaluating, buying, learning]

## Data source
What data will power the pages: [Source — public DB, my customers, scraped, hybrid]
How many variations: [Estimate]
Refresh cadence: [Daily / weekly / monthly]

## My business goal
What action a visitor should take: [Signup / contact / book / list /click]

## What I need
1. Demand validation framework (which variations have real volume)
2. Page template spec (URL, title, meta, H1, sections, schema, CTA)
3. Sitemap + internal linking strategy
4. Quality gates that determine which pages get indexed
5. Phased rollout plan (pilot → scale → maintain)
6. Measurement plan
7. 3 sample pages rendered with sample data

## Rules
- One pattern per project. No hybrids.
- Quality gates before indexing. Thin pages get noindex.
- 100 useful pages > 10,000 doorways.
- Schema markup must match what the page actually is.
- Prune aggressively — pages with no impressions after 90 days get cut.
- Respect data sources' ToS.
```
