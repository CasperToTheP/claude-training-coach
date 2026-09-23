# Upstream attribution

This project is designed to install and combine functionality from these projects:

## Coach Claudio
- Repository: https://github.com/Escoto/Coach-Claudio
- Upstream license: GNU General Public License v3.0
- Functionality used: Claude Code coaching persona/workflow, onboarding, weekly planning, session review, weekly review, knowledge-builder/research-finder, knowledge base and templates.

## Claude Running Race Coach
- Repository: https://github.com/ColinEberhardt/claude-running-coach
- Upstream license: MIT
- Functionality used: running-coach, race training-plan, Strava sync, training dashboard, pace calculator, interval calculator and reference material.

`setup.ps1` / `setup.sh` clone the complete upstream repositories into `vendor/` and copy the relevant skill/knowledge directories into the active project.

The exact upstream commit SHAs are written to `UPSTREAM-VERSIONS.txt` when setup runs.

If this populated project is redistributed, retain the upstream license texts and attribution and follow the applicable license terms, including GPL-3.0 obligations for incorporated Coach Claudio material.
