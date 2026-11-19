# DS5110-Final-Project-Activity
Boston Airbnb Listing Activity Prediction — Fall 2026
## Question

Our project aims to predict which publicly observed Airbnb listings in Boston will disappear or become dormant by the next quarterly snapshot. Our target population consists of Boston listings observed in the June 15, 2026 baseline snapshot. We will construct a binary disappearance outcome by comparing the `id` column in `listings.csv.gz` between the June 15 and September 19, 2026 snapshots. Listings present in the baseline but absent from the later snapshot will be labeled as gone. Dormancy will be evaluated separately once a reproducible definition is established. Potential predictors include listing characteristics, host information, availability patterns, and historical review activity. We plan to use logistic regression with time-based validation. One important limitation is that a missing listing does not necessarily indicate permanent closure, since Inside Airbnb collects publicly visible data through web scraping.

## Data

- Source: [Inside Airbnb](https://insideairbnb.com/get-the-data/), Boston snapshots of 2026-06-15 and 2026-09-19, licensed under CC BY 4.0.
- Run `make data` to download the snapshot files into `data/raw/` and verify them against `MANIFEST.sha256`.
- Details are in the data card: [data/README.md](data/README.md).

## Team

Roles — Proposal to Data Audit (Nov 16–23, 2026)

| Team member | Role | Responsibilities |
|---|---|---|
| Yanhui Yang (YYHcoding) | Model Lead | Research question, outcome definition, and data limitations |
| Christoph Dittrich | Delivery Lead | Repository setup, Makefile, dependencies, and reproducibility |
| Niranjan | Data Lead | Data Card, snapshot documentation, provenance, and data quality |

Contributions — Milestone 1: Proposal

- Yanhui Yang: Drafted the Activity Track research question and proposed outcome definition; reviewed the Data Card. [PR #3](https://github.com/YYHcoding/DS5110-Final-Project-Activity/pull/3)
- Niranjan: Prepared the Data Card covering sources, snapshots, licensing, files, limitations, and checksums; tested `make data` from a fresh clone and reviewed the repository skeleton. [PR #1](https://github.com/YYHcoding/DS5110-Final-Project-Activity/pull/1)
- Christoph Dittrich: Set up the repository skeleton, the Makefile with `make data`, pinned requirements, `.gitignore`, `MANIFEST.sha256`, and the data release. [PR #5](https://github.com/YYHcoding/DS5110-Final-Project-Activity/pull/5)

## AI use

- Niranjan: the data card content is my own work. I used Claude (Anthropic) as an assistant for three specific tasks: wording one line of the data card (the data dictionary reference), running the fresh-clone `make data` test, and first drafts of my review comments and of this README update. I read, corrected, and approved each one before it was committed or posted.
- Christoph: I used Claude to help me brainstorm what an ideal file structure could look like for the repository. I also used Claude to help me correct a few minor errors that I encountered when writing the makefile. Finally, I used Claude to help guide me through generating MANIFEST.sha256. I read and verified everything that Claude helped me with.
- Yanhui: I used ChatGPT (OpenAI) to help organize and refine the Activity Track research question, clarify the outcome definitions and data limitations, and improve the wording and structure of my project documentation. I also used it to better understand the project requirements and GitHub collaboration workflow. I reviewed and revised the AI-assisted content before submitting my contributions and remain responsible for the final work.
