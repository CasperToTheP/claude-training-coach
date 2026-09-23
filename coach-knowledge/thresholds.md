---
title: Training Thresholds & Guardrails
tags: [thresholds, guardrails, reference]
aliases: [hard-thresholds, training-limits, guardrails]
description: Single source of truth for all numerical thresholds used in coaching decisions
---

# Training Thresholds & Guardrails

All numerical thresholds used by Coach Claudio for programming, recovery, and safety decisions. This is the canonical source — other knowledge files link here rather than duplicating values.

## Load Progression

| Rule | Value | Context |
|------|-------|---------|
| Max weekly volume increase | +10% | Duration or distance over previous week |
| Mesocycle structure (standard) | 3:1 | 3 weeks build, 1 week deload |
| Mesocycle structure (advanced) | 4:1 | 4 weeks build, 1 week deload |
| Deload volume reduction | 40-50% | Reduce volume, maintain intensity |
| Post-deload resumption | Last full week | Resume at volume of last full training week, not the deload week |

## Intensity Distribution

| Rule | Value | Context |
|------|-------|---------|
| Polarized split (endurance) | 80/20 | 80% below VT1/Z2, 20% above VT2/threshold |
| Middle zone (tempo/Z3) | Sparingly | Used with specific purpose only |
| RPE working sets (build) | 7-8 | Strength training build phase |
| RPE working sets (peak/test) | 9-10 | Reserved for testing or peaking only |
| Hypertrophy volume | 10-20 sets/muscle/week | Per muscle group |
| Strength rep range | 3-6 reps | Heavier loads, more rest |

## Recovery & Readiness

| Rule | Value | Action |
|------|-------|--------|
| Readiness < 40 | Rest | Mandatory easy or rest. No exceptions. |
| Readiness 40-60 | Reduce | Reduce intensity by one zone. Shorten if needed. |
| Readiness 60-80 | Execute | Proceed as planned. |
| Readiness > 80 | Key session | Good window for hard work. Don't waste on easy work. |
| Sleep minimum | 7 hours | Below this, adaptation is compromised. |
| Sleep flag | < 6 hours | Affects next 48h of training quality. |
| Consecutive poor nights | 2+ | Warrant load reduction regardless of other metrics. |
| Resting HR elevation | +5 bpm | Above baseline for 2+ days = deload signal. |
| HRV decline | 3 consecutive low | Single low = noise. Three consecutive = signal. |

## Workload Ratio (ACWR)

| Range | Zone | Action |
|-------|------|--------|
| < 0.8 | Undertrained | Detraining risk |
| 0.8 - 1.3 | Optimal | Target training zone |
| 1.3 - 1.5 | Caution | Acceptable only for planned overreach |
| > 1.5 | Danger | Reduce load immediately |

## Session Spacing

| Rule | Value |
|------|-------|
| Between threshold/VO2max sessions | Minimum 48 hours |
| High-intensity endurance + heavy strength | Minimum 6 hours, ideally 24 |
| New movements or surfaces | Introduce at 50% expected volume, progress over 2-3 weeks |
| Post-race/spike recovery window | Elevated injury risk for 7-14 days |

## Nutrition

| Rule | Value | Context |
|------|-------|---------|
| Protein target | 1.6-2.2 g/kg/day | All athletes |
| Carbs during activity (>90 min) | 60-90 g/hour | Build from 40 g/hr, gut is trainable |
| Hydration during activity | 400-800 mL/hour | Depends on heat, humidity, sweat rate |
| Max weight loss rate | 0.5 kg/week | Base phase only, with adequate protein |
| Weight cut timing | Never during peak/taper | Set weight target during onboarding |

## Session Analysis

| Rule | Value | Context |
|------|-------|---------|
| Cardiac drift flag | > 5% | HR rising at constant effort = fatigue/heat/dehydration |
| Max HR deviation flag | > 5 bpm | Above expected for session type |
| Plan deviation flag | > 10% duration | Or wrong intensity zone, skipped key intervals |

## Recovery Time Estimates

| Session Type | Recovery Window |
|-------------|----------------|
| Easy/recovery | 12-24 hours |
| Moderate/tempo | 24-36 hours |
| Hard/threshold/VO2max | 36-48 hours |
| Race or maximal effort | 48-72+ hours |

See also: [[periodization]], [[recovery-monitoring]], [[intensity-zones]], [[injury-prevention]], [[nutrition]]
