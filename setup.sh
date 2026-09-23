#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR="$ROOT/vendor"
COACH_REPO="$VENDOR/Coach-Claudio"
RUNNING_REPO="$VENDOR/claude-running-coach"

command -v git >/dev/null 2>&1 || { echo "git is required"; exit 1; }
mkdir -p "$VENDOR"

clone_or_update () {
  local url="$1"; local dest="$2"
  if [ -d "$dest/.git" ]; then git -C "$dest" pull --ff-only; else git clone --depth 1 "$url" "$dest"; fi
}
copy_tree () {
  local src="$1"; local dst="$2"
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
}

clone_or_update "https://github.com/Escoto/Coach-Claudio.git" "$COACH_REPO"
clone_or_update "https://github.com/ColinEberhardt/claude-running-coach.git" "$RUNNING_REPO"
copy_tree "$COACH_REPO/.claude/skills" "$ROOT/.claude/skills"
copy_tree "$COACH_REPO/coach-knowledge" "$ROOT/coach-knowledge"
copy_tree "$COACH_REPO/templates" "$ROOT/templates"
copy_tree "$RUNNING_REPO/running-race-coach/skills" "$ROOT/.claude/skills"

mkdir -p "$ROOT/.claude/memory" "$ROOT/athlete_plan" "$ROOT/training-log" "$ROOT/coaching-log" "$ROOT/strength-log" "$ROOT/THIRD_PARTY_LICENSES"
cp "$COACH_REPO/LICENSE" "$ROOT/THIRD_PARTY_LICENSES/Coach-Claudio-GPL-3.0.txt"
cp "$RUNNING_REPO/LICENSE" "$ROOT/THIRD_PARTY_LICENSES/claude-running-coach-MIT.txt"

COACH_SHA="$(git -C "$COACH_REPO" rev-parse HEAD)"
RUNNING_SHA="$(git -C "$RUNNING_REPO" rev-parse HEAD)"
printf 'Coach Claudio commit: %s\nClaude Running Race Coach commit: %s\n' "$COACH_SHA" "$RUNNING_SHA" > "$ROOT/UPSTREAM-VERSIONS.txt"

echo "Setup complete. Next: configure MCP sources, run claude, then /onboard."
