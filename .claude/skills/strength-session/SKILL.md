---
name: strength-session
description: Log and review a strength workout using exercises, sets, reps, load and RIR/RPE, then assess progression and interaction with running/cycling. Use for strength logging, reviewing a gym session, or planning progression of existing strength exercises.
---

# Strength Session

## Objective

Create a useful strength record for future coaching. Wearable calorie estimates are not the primary metric.

## Capture

For each exercise:
- exercise name
- variation
- load in kg
- sets and reps
- RIR or RPE
- rest period if relevant
- pain/limitation if present

Also capture:
- session duration
- session RPE (1–10)
- whether it was lower/upper/full body
- proximity to key run/bike sessions

If the athlete only provides partial information, use what is available rather than inventing values.

## Analyze

Assess:
- total work sets by movement/muscle group
- progression versus recent entries for the same exercise
- whether load/reps/RIR support the intended goal
- signs of excessive fatigue
- likely interference with imminent key run/bike work
- pain flags

For simple progression, prefer adding reps within the target range before load unless the current program specifies another method.

## Save

Write:
`strength-log/YYYY-MM-DD.md`

Include:
- session table
- short analysis
- suggested next exposure for each key lift
- any run/bike interaction note

## Integration

`plan-week`, `today`, and `review-week` should consider recent `strength-log/` sessions when leg fatigue or training load is relevant.
