---
name: sync-week
description: Fetch and normalize the last 7 days of training plus recovery from all connected fitness MCP sources, de-duplicate overlapping Garmin/Strava activities, and write a reusable weekly data snapshot. Use before weekly review/planning or when asked to sync all training data.
---

# Multi-source Weekly Sync

## Objective

Create a normalized weekly snapshot without double-counting activities that appear in multiple services.

## Window

Default to the previous 7 complete calendar days unless the athlete specifies a Monday-Sunday week.

## Gather

Use every available relevant MCP source described in `CLAUDE.md`.

Training:
- run
- bike
- strength
- other meaningful training

Recovery:
- sleep
- HRV
- resting HR
- readiness/recovery
- temperature deviation when available

## De-duplication

Activities are likely duplicates when sport and start time match closely and duration/distance are substantially the same.

Canonical activity preference:
1. original/source device with richest measured fields
2. Garmin/source platform
3. Strava copy
4. manual record

Do not sum a Garmin activity and its Strava mirror twice.

Keep source provenance for important fields.

## Normalize

Use metric units.

For each activity capture:
- source
- activity ID if available
- date/start
- sport
- duration
- distance
- average/max HR
- pace/speed
- power
- elevation
- important laps/intervals when relevant
- RPE if known

For each recovery day capture:
- source
- sleep duration/score
- HRV
- resting HR
- readiness/recovery
- temperature deviation
- missing fields explicitly marked as unavailable

## Output file

Create:

`training-log/snapshot-YYYY-MM-DD.md`

with:
- date window
- source inventory
- de-duplication notes
- activity table
- discipline totals
- daily recovery table
- missing-data section

If there is a race-plan week number that is unambiguous, you may also update the compatible `training-log/week-N.md`, but do not overwrite richer data without preserving it.

## Boundaries

This skill syncs/normalizes facts. Do not perform the full coaching interpretation; `review-week`, `running-coach`, `plan-week`, and `today` consume the result.
