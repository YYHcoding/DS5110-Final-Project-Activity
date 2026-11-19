# DS5110-Final-Project-Activity
Boston Airbnb Listing Activity Prediction — Fall 2026
## Question

Our project aims to predict which publicly observed Airbnb listings in Boston will disappear or become dormant by the next quarterly snapshot. Our target population consists of Boston listings present in the earlier snapshot provided for this project. We will construct a binary outcome using listing IDs from `listings.csv.gz` across consecutive snapshots, identifying listings that disappear and applying a documented rule to classify dormancy. Potential predictors include listing characteristics, host information, availability patterns, and historical review activity. We plan to use logistic regression with time-based validation to evaluate predictive performance. One important limitation is that Inside Airbnb collects publicly visible listing data through web scraping. Therefore, a missing listing or a lack of recent reviews does not necessarily mean that a property has stopped operating.

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
