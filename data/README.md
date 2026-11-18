# Data card

## Source
- Publisher: Inside Airbnb, https://insideairbnb.com/get-the-data/ (Boston section)
- How collected: Inside Airbnb scrapes public Airbnb listing pages about once a quarter.
  It is a scrape, not a random sample: listings that Airbnb hides, removes or never
  shows are not in the files.
- Our copy: `make data` downloads from the Inside Airbnb portal. If a file is no longer
  there, it falls back to the copy attached to our GitHub release.
- Column definitions: Inside Airbnb data dictionary,
  https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/
  It describes listings.csv only (version 4.3, August 2022), so we check it against the
  real columns in each snapshot.

## Snapshots
- Build: 2026-06-15, used to develop the analysis
- Test: 2026-09-19, used to check whether the finding still holds
- Our outcome compares a listing across two snapshots: features come from the earlier
  snapshot and the outcome (gone or dormant) from the next one.

## License
- CC BY 4.0, granted by Inside Airbnb for its compiled dataset. We credit Inside Airbnb
  with a link in README.md and on the site.
- The data was scraped from public Airbnb pages, so the license does not cover the hosts'
  and guests' own text or personal details. We publish only aggregate results, keep host
  names and listing URLs out of the site and slides, and do not scrape Airbnb ourselves.

## Files
| File | Grain | Rows (approx.) | Main use |
|---|---|---|---|
| listings.csv.gz | one row per listing, about 75 columns | a few thousand | features, hosts, outcome (match on `id`) |
| calendar.csv.gz | one row per listing per date | over 1 million | availability, scale |
| reviews.csv.gz | one row per review | tens of thousands | review activity over time, text check |
| neighbourhoods.geojson | one polygon per neighbourhood | about 25 | grouping, optional maps |

## Known limits
- "Gone" does not always mean the host stopped renting. A listing can leave the scrape
  because Airbnb hid it or the scraper missed it, so our outcome partly measures the scrape.
- "Dormant" is our own definition. Not every stay gets a review, so some active
  listings can look dormant.
- Our findings apply only to listings publicly visible in Boston on the snapshot dates,
  not to all short-term rentals in the city.
- Columns can change between snapshots, so we compare column lists before merging.



## Checksums
- `MANIFEST.sha256` is in the repo root, with one SHA-256 line per raw file.
- `make data` verifies it automatically. To check by hand:
  `cd data/raw && shasum -a 256 -c ../../MANIFEST.sha256`
  Every file should print `OK`.
