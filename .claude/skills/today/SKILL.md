---
name: today
description: Decide what training makes sense today by combining the current plan, recent executed load, recovery trends, and athlete feedback. Use for "what should I do today?", readiness checks, or whether to proceed with/modify today's planned session.
---

# Today's Training Decision

## Objective

Give one concrete recommendation for today using the current plan plus measured recovery/training context. Do not redesign the entire week unless the athlete asks.

## Read first

- `.claude/memory/athlete-profile.md`
- `athlete_plan/week_plan.md` if it exists
- `athlete_plan/weekly_log.md` if it exists
- recent entries in `strength-log/` if strength fatigue is relevant

If `training-plan.md` exists, consult it when today's session is a race-specific running workout.

## Fetch data

Use the Data Source Protocol in `CLAUDE.md`.

Fetch:
- last night's sleep
- current HRV and short trend (prefer 7 days; use longer baseline if provider exposes it)
- resting HR and trend
- readiness/recovery score if available
- last 7 days of training, with emphasis on the previous 48 hours
- today's planned session

Do not compare proprietary readiness scores between different providers.

## Subjective data

Use existing athlete comments if available. Ask a brief question only when it could change the decision, especially for:
- pain
- unusual soreness
- illness
- very poor sleep not reflected in data
- uncertain RPE from the previous hard workout

## Classify

Choose one:

- **GREEN — proceed:** no meaningful fatigue/injury signal. Execute planned session.
- **AMBER — modify:** moderate fatigue or conflicting signals. Preserve the session purpose with reduced volume/intensity or a specific substitution.
- **RED — recover:** strong fatigue/illness/pain signal or multiple abnormal recovery markers. Replace with a concrete recovery option or rest.

Do not classify based on one isolated metric alone unless it is an explicit safety/pain signal.

## Output

1. **Decision:** GREEN / AMBER / RED
2. **Today:** exact session prescription
3. **Why:** 3–5 data points, including recovery + recent load
4. **Adjustment trigger:** what would cause the athlete to shorten/stop/change during the session
5. **Afterwards:** one short note on what to log (RPE, pain, interval execution, etc.)

Keep it compact.
