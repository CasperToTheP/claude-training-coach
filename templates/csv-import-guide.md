# CSV Import Guide

Coach Claudio can work with training data in CSV format. Two CSV types are supported: **Activities** (workout sessions) and **Recovery** (daily health metrics). Both are optional — use whichever data you have.

## Activities CSV

One row per training session.

### Required columns
| Column | Format | Example |
|--------|--------|---------|
| `date` | YYYY-MM-DD | 2026-04-07 |
| `type` | free text | bike, run, swim, strength, yoga |
| `duration_min` | number (minutes) | 65 |

### Optional columns
| Column | Format | Example |
|--------|--------|---------|
| `distance_km` | number | 35.2 |
| `avg_hr` | number (bpm) | 138 |
| `max_hr` | number (bpm) | 155 |
| `avg_power` | number (watts) | 165 |
| `avg_pace` | mm:ss /km or /mi | 5:30 |
| `calories` | number | 580 |
| `rpe` | 1-10 | 7 |
| `notes` | free text | "Sweet spot intervals" |

### Example
```csv
date,type,duration_min,distance_km,avg_hr,max_hr,avg_power,notes
2026-04-07,bike,65,35.2,138,155,165,"Sweet spot session"
2026-04-08,run,40,6.5,142,151,,"Easy recovery run"
2026-04-08,strength,35,,,,,Upper body
2026-04-09,swim,45,1.8,128,140,,"Drill + main set"
2026-04-10,rest,0,,,,,,
```

## Recovery CSV

One row per day.

### Required columns
| Column | Format | Example |
|--------|--------|---------|
| `date` | YYYY-MM-DD | 2026-04-07 |

### Optional columns
| Column | Format | Example |
|--------|--------|---------|
| `hrv_ms` | number (milliseconds) | 98 |
| `resting_hr` | number (bpm) | 48 |
| `sleep_hours` | number | 7.5 |
| `sleep_score` | number (0-100) | 82 |
| `readiness` | number (0-100) | 71 |
| `body_battery` | number (0-100) | 65 |
| `stress_avg` | number (0-100) | 32 |
| `weight_kg` | number | 70.2 |
| `notes` | free text | "Poor sleep - work stress" |

### Example
```csv
date,hrv_ms,resting_hr,sleep_hours,sleep_score,readiness,weight_kg,notes
2026-04-07,98,48,7.5,82,71,70.1,
2026-04-08,95,50,6.2,68,55,70.3,"Poor sleep - stress"
2026-04-09,101,47,8.0,85,78,69.8,
```

## Usage Tips

- **Headers are required.** The first row must be column names.
- **Empty cells are fine.** Coach works with whatever data is available.
- **Activity types are flexible.** "bike", "cycling", "indoor ride" all work — the coach interprets them.
- **Dates must be YYYY-MM-DD.** This is the only strict format requirement.
- **Place CSV files** anywhere in the repo. The coach will ask for the file path if it cannot find them automatically.

## Exporting from Common Platforms

### Garmin Connect
1. Go to garmin.com > Activities
2. Use the "Export CSV" option on the activities list
3. Save to this repo directory

### Strava
1. Go to strava.com > Settings > My Account
2. Click "Download or Delete Your Account" > "Request Your Archive"
3. Extract the `activities.csv` file from the downloaded archive

### Apple Health
1. Open the Health app > Profile icon > Export All Health Data
2. Extract the XML, then use a converter tool to produce CSV
3. Alternatively, use an app like "Health Export" to export directly to CSV

### Manual Entry
If you do not use a fitness platform, you can create the CSV manually in any spreadsheet app and export as CSV, or simply describe your sessions to the coach verbally.
