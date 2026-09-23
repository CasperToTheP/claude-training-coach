param([switch]$NoUpdate)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Vendor = Join-Path $Root "vendor"
$CoachRepo = Join-Path $Vendor "Coach-Claudio"
$RunningRepo = Join-Path $Vendor "claude-running-coach"

function Clone-Or-Update([string]$Url, [string]$Dest) {
    if (Test-Path (Join-Path $Dest ".git")) {
        if (-not $NoUpdate) {
            git -C $Dest pull --ff-only
            if ($LASTEXITCODE -ne 0) { throw "git pull failed for $Dest" }
        }
    } else {
        git clone --depth 1 $Url $Dest
        if ($LASTEXITCODE -ne 0) { throw "git clone failed for $Url" }
    }
}

function Copy-Tree([string]$Source, [string]$Destination) {
    if (-not (Test-Path $Source)) { throw "Missing upstream path: $Source" }
    New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    Copy-Item -Path (Join-Path $Source "*") -Destination $Destination -Recurse -Force
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "git is required" }

New-Item -ItemType Directory -Force -Path $Vendor | Out-Null
Clone-Or-Update "https://github.com/Escoto/Coach-Claudio.git" $CoachRepo
Clone-Or-Update "https://github.com/ColinEberhardt/claude-running-coach.git" $RunningRepo

Copy-Tree (Join-Path $CoachRepo ".claude\skills") (Join-Path $Root ".claude\skills")
Copy-Tree (Join-Path $CoachRepo "coach-knowledge") (Join-Path $Root "coach-knowledge")
Copy-Tree (Join-Path $CoachRepo "templates") (Join-Path $Root "templates")
Copy-Tree (Join-Path $RunningRepo "running-race-coach\skills") (Join-Path $Root ".claude\skills")

@(".claude\memory","athlete_plan","training-log","coaching-log","strength-log","THIRD_PARTY_LICENSES") | ForEach-Object {
    New-Item -ItemType Directory -Force -Path (Join-Path $Root $_) | Out-Null
}

Copy-Item (Join-Path $CoachRepo "LICENSE") (Join-Path $Root "THIRD_PARTY_LICENSES\Coach-Claudio-GPL-3.0.txt") -Force
Copy-Item (Join-Path $RunningRepo "LICENSE") (Join-Path $Root "THIRD_PARTY_LICENSES\claude-running-coach-MIT.txt") -Force

$CoachSha = (git -C $CoachRepo rev-parse HEAD).Trim()
$RunningSha = (git -C $RunningRepo rev-parse HEAD).Trim()

@"
Coach Claudio commit: $CoachSha
Claude Running Race Coach commit: $RunningSha
"@ | Set-Content -Path (Join-Path $Root "UPSTREAM-VERSIONS.txt") -Encoding UTF8

Write-Host "Setup complete." -ForegroundColor Green
Write-Host "Next: configure MCP sources, run 'claude', then /onboard."
