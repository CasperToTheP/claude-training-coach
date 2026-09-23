---
name: multisport-dashboard
description: Generate a self-contained HTML dashboard for mixed running, cycling, strength and recovery data. Use when the athlete wants a broad progress dashboard rather than the running-only upstream training-dashboard.
---

# Multi-Sport Training Dashboard

## Objective

Generate `multisport-dashboard.html` using the athlete's current plan, completed training, recovery trends and strength progression.

## Data

Read:
- `.claude/memory/athlete-profile.md`
- `training-plan.md` if present
- `athlete_plan/week_plan.md` if present
- `athlete_plan/weekly_log_ledger.md` if present
- `training-log/`
- `strength-log/`
- `coaching-log/` if useful

Fetch fresh MCP data if the latest files do not cover the current period.

## Metrics

Where available, include:

### Running
- weekly km
- duration
- key-session completion
- easy/quality distribution
- pace/HR trend
- race-specific progress

### Cycling
- weekly duration/km
- power/FTP-related metrics when measured
- intensity distribution
- indoor/outdoor split

### Strength
- sessions/week
- working-set count
- key-lift load/reps trends
- RIR/RPE trends

### Recovery
- sleep trend
- HRV trend
- resting HR trend
- recovery/readiness trend
- explicitly name the source provider

### Plan execution
- planned vs completed sessions
- missed/modified/unplanned sessions
- current training phase
- upcoming key sessions/events

## HTML requirements

Create a single self-contained HTML file:
`multisport-dashboard.html`

Use plain HTML/CSS and minimal vanilla JavaScript only when useful.
Do not depend on a build system.
Make it responsive.
Use accessible labels and tables.
Do not embed credentials or raw authentication data.

## Interpretation

Avoid a single opaque "coach score". Show the underlying metrics and concise coaching commentary.

Use provider-specific recovery scores only in their own context. Do not normalize two proprietary readiness scores into a fake shared scale.

## Output

After writing the file, give a short summary of:
- biggest positive trend
- biggest caution
- next key training focus
- path to the dashboard
