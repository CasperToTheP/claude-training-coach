---
title: Coach Claudio Knowledge Base
tags: [moc, coaching, training]
aliases: [knowledge-base, training-knowledge]
description: Map of Content for all coaching domain knowledge
---

# Coach Claudio Knowledge Base

## Quick Reference

- [[thresholds]] — All hard numerical guardrails in one place

## Core Training Knowledge

- [[periodization]] — Mesocycles, progressive overload, load management, training-injury paradox, deload programming, session sequencing
- [[intensity-zones]] — Polarized model, RPE scales, cardiac drift, recovery time estimation
- [[recovery-monitoring]] — HRV, readiness bands, sleep, ACWR, deload triggers

## Sport-Specific Programming

- [[sport-adaptations]] — Overview and routing to sport-specific files
  - Endurance: [[endurance-running]] | [[endurance-cycling]] | [[endurance-triathlon]] | [[endurance-swimming]]
  - Strength: [[strength-bodybuilding]] | [[strength-powerlifting]] | [[strength-general]]
  - Hybrid: [[hybrid-concurrent]]

## Safety & Health

- [[injury-prevention]] — Load management, flags, return-to-training, sport-specific patterns
- [[nutrition]] — Fueling, timing, periodized nutrition, event nutrition

## Protocols

- [[threshold-testing]] | [[readiness-assessment]] | [[movement-screening]] | [[body-composition]]

## Research Evidence

Evidence shelf — only consulted when justification is needed. Each topic maps 1:1 to a core knowledge file above.

- [[research/papers/periodization/index|Periodization Research]] — load progression, ACWR, deloads, periodized nutrition (7 papers)

## How This Knowledge Base Works

Skills in `.claude/skills/` reference specific knowledge files when they need domain expertise. The [[thresholds]] file is the single source of truth for all numerical guardrails — other files link to it rather than duplicating values.

| Skill | Core Knowledge | Sport File | Research | Protocols |
|-------|---------------|------------|----------|-----------|
| `/plan-week` | thresholds, periodization, intensity-zones, recovery-monitoring | {athlete's sport} | — | threshold-testing (if no benchmarks) |
| `/review-session` | thresholds, intensity-zones, recovery-monitoring | {athlete's sport} | — | — |
| `/review-week` | thresholds, recovery-monitoring, periodization | — | load-monitoring | — |
| `/onboard` | — | — | — | threshold-testing |
