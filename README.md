# Claude Training Coach — combined setup

This project combines the useful parts of two open-source Claude coaching projects while keeping their full upstream repositories locally:

- **Coach Claudio** — https://github.com/Escoto/Coach-Claudio
- **Claude Running Race Coach** — https://github.com/ColinEberhardt/claude-running-coach

The installer clones both full repositories into `vendor/`, copies their Claude Skills into this project's `.claude/skills/`, and copies Coach Claudio's training knowledge base and templates. This means you get the upstream functionality instead of a simplified rewrite.

## What is included after setup

### From Coach Claudio
- `onboard`
- `plan-week`
- `review-session`
- `review-week`
- `knowledge-builder`
- `research-finder`
- full `coach-knowledge/`
- all templates

### From Claude Running Race Coach
- `running-coach`
- `training-plan`
- `strava-sync`
- `training-dashboard`
- pace calculator
- interval calculator
- coaches guide/reference material

### Added in this combined project
- `today` — recovery + recent load + current plan -> recommendation for today
- `sync-week` — combine/de-duplicate training and recovery data from multiple MCPs
- `strength-session` — structured strength logging/review
- `multisport-dashboard` — generic run/bike/strength/recovery dashboard

## Why there are two planning files

The two upstream projects use different concepts, so this project deliberately keeps both:

- `training-plan.md` = **macro race plan** (e.g. 8–20 week 5K/10K/HM/marathon plan)
- `athlete_plan/week_plan.md` = **current week's operational plan**, adjusted for recovery and recent execution

This preserves the Running Race Coach's race-planning functionality while allowing Coach Claudio to adapt each week.

## Windows setup

Open PowerShell in this folder and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\setup.ps1
```

Then open this folder with Claude Code:

```powershell
claude
```

First use:

```text
/onboard
```

After onboarding, useful requests include:

```text
/today
/plan-week
/review-session
/review-week
/training-plan
/running-coach
/training-dashboard
/multisport-dashboard
/strength-session
```

Natural-language requests should also trigger the relevant skills.

## WSL / macOS / Linux setup

```bash
chmod +x setup.sh
./setup.sh
claude
```

## Data sources

The top-level `CLAUDE.md` tells the coach to detect fitness MCP tools automatically. It is designed for combinations such as:

- Garmin MCP: workouts, HR, training load, VO2max, training status, etc.
- Oura or Ultrahuman MCP: sleep, HRV, resting HR, temperature, readiness/recovery
- Strava MCP/connector: activities and activity detail
- manual files/conversation as fallback

See `MCP-SETUP.md`.

## Recommended workflow

### One time
1. Run `setup.ps1` or `setup.sh`.
2. Connect your fitness MCP source(s).
3. Run `/onboard`.
4. If you are targeting a running race, run `/training-plan`.

### Each week
1. `/sync-week`
2. `/review-week`
3. `/plan-week`

### After a key workout
- `/review-session`

### Before deciding what to do today
- `/today`

### Strength
- `/strength-session`

## Updating the upstream projects

Just run `setup.ps1` / `setup.sh` again. It performs a fast-forward pull in both `vendor/` repos and refreshes the copied skills/knowledge. Your custom skills are not overwritten because they use different names.

The installer writes the exact upstream commit SHAs to `UPSTREAM-VERSIONS.txt`.

## Privacy

`.claude/memory/`, athlete logs, generated plans and `vendor/` are gitignored by default. Do not commit credentials or raw health data to a public repository.

## Licensing

Coach Claudio is GPL-3.0; Claude Running Race Coach is MIT. Their full license files are copied into `THIRD_PARTY_LICENSES/` when setup runs. If you redistribute a populated/combined project containing Coach Claudio files, retain the upstream notices and comply with the GPL terms. See `ATTRIBUTION.md`.
