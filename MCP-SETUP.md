# MCP setup notes

The coaching project does not require a specific vendor. Its `CLAUDE.md` detects fitness MCP tools by capability/name and defines source priority and de-duplication.

## Recommended architecture

```text
Recovery ring (Oura / Ultrahuman) ─┐
                                   ├─> Claude Code coach
Garmin / activity source ──────────┤
                                   │
Strava (optional detail/fallback) ─┘
```

The objective is not to put every source into one blended score. Each provider should remain the source of truth for the data it measures best.

## Garmin

If you use a local Garmin Connect MCP server, register it with Claude Code according to that server's own README. Do not store the Garmin password in this project or commit it to Git.

Coach Claudio's upstream README demonstrates the general pattern:

```text
claude mcp add <name> [environment configuration] -- <server command>
```

Use the exact command/configuration documented by the MCP server you choose.

## Strava

If your Claude client offers an official Strava connector, prefer that. Otherwise the upstream `strava-sync` skill expects Strava MCP tools.

The full original `strava-sync` skill is installed from the upstream repository and preserved unchanged.

## Oura / Ultrahuman / other recovery source

Connect the MCP server according to its own documentation. No custom naming is required: the project's data-source protocol searches for tools whose names clearly contain the provider/capability.

Once connected, test with:

```text
What recovery data sources can you see? List the tools you can use, but do not fetch data yet.
```

Then:

```text
Fetch my last 7 days of sleep, HRV and resting heart rate and tell me which provider supplied each field.
```

## Test de-duplication

If both Garmin and Strava are connected:

```text
Fetch my activities from yesterday from every available source. Identify duplicates and show me the canonical activity you would count in training load.
```

You should see a Garmin/Strava copy treated as one workout.

## Credentials

Never place passwords, API tokens or cookies in:
- `CLAUDE.md`
- athlete profile
- any committed `.json` example
- training logs

Use the MCP server/client's supported environment variable, OAuth, secure storage or connector flow.
