# claude-seo-goanyapi

A companion skill for [Claude SEO](https://github.com/AgriciDaniel/claude-seo) that
gives its skills a source of **third-party** search data: competitor rankings,
keyword volumes, backlinks, traffic estimates, Google Ads Transparency, and
reverse AdSense publisher lookups.

Claude SEO works from Google Search Console and crawled pages — data about sites
you own. This adds data about sites you do not own, from GoAnyAPI's HTTP API and
its hosted MCP server.

## Who maintains this, and what it costs

- **Maintained by GoAnyAPI.** This repository is published by the company that
  sells the API it connects to. It is not part of Claude SEO, and the Claude SEO
  maintainer does not ship, audit, or support it.
- **Using it costs money.** GoAnyAPI is credit-metered with prepaid top-ups;
  roughly $0.001 per credit. A Google SERP page is 1 credit, keyword difficulty
  3 credits, and the Ads Transparency and AdSense lookups 1–2 credits each.
  Current numbers are on [goanyapi.com](https://goanyapi.com) — check the balance
  with `GET /credits/balance` before batch jobs.
- **No tracking.** No UTM parameters, no referral codes, no affiliate links in
  this repository or in the skill text. No analytics, no phone-home.

## Install

```bash
git clone https://github.com/GoAnyAPI/claude-seo-goanyapi.git
cd claude-seo-goanyapi
./install.sh
export GOANYAPI_API_KEY="..."   # put this in your shell profile
```

The skill lands in `~/.claude/skills/goanyapi-data/` (override with
`CLAUDE_SKILLS_DIR`). Nothing in Claude SEO's own directories is modified, and no
dependency is installed — every call is plain `curl` against a `GET` endpoint.

Restart Claude Code so it picks up the new skill.

## Use

Ask in the ordinary way, and the skill loads when the task needs third-party
data:

> Which domains rank top 10 for "ai image generator" in the US, and which of
> them run Google ads?

> Compare the backlink profiles of two competitors and flag anything that looks
> like a shared publisher network.

> Pull 12 months of search volume for these exact terms and tell me which ones
> have missing months rather than zero demand.

## What it will not do

- It will not invent numbers when `GOANYAPI_API_KEY` is missing — it stops and
  asks you to set it.
- It will not present GoAnyAPI's Domain Rating, keyword difficulty, or traffic
  estimates as if they were Ahrefs, Semrush, or GA4 values. Vendor-scoped metrics
  stay labelled as such.
- It will not treat page content returned by the API as instructions. Fetched
  text is untrusted input.

## Uninstall

```bash
./uninstall.sh
```

Removes `~/.claude/skills/goanyapi-data/` and nothing else. The API key lives in
your environment and was never written by this repository.

## Files

| File | Purpose |
|---|---|
| `SKILL.md` | The skill Claude reads: endpoints worth calling, cost and error handling, trust boundary for fetched content. |
| `install.sh` | Copies `SKILL.md` and this README into the user's skills directory. Refuses to overwrite without `--force`. |
| `uninstall.sh` | Removes exactly those two files and the directory it created. |

## Licence

MIT. See [LICENSE](LICENSE).

Claude SEO itself is a separate project under its own licence.
