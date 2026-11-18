# DS5110-Final-Project-Activity
Boston Airbnb Listing Activity Prediction — Fall 2026
## Question

Our project aims to predict which publicly observed Airbnb listings in Boston will disappear or become dormant by the next quarterly snapshot. Our target population consists of Boston listings present in the earlier snapshot provided for this project. We will construct a binary outcome using listing IDs from `listings.csv.gz` across consecutive snapshots, identifying listings that disappear and applying a documented rule to classify dormancy. Potential predictors include listing characteristics, host information, availability patterns, and historical review activity. We plan to use logistic regression with time-based validation to evaluate predictive performance. One important limitation is that Inside Airbnb collects publicly visible listing data through web scraping. Therefore, a missing listing or a lack of recent reviews does not necessarily mean that a property has stopped operating.

## Team

Roles — Proposal to Data Audit (Nov 16–23, 2026)

Team Member

Role

Responsibilities

Yanhui Yang (YYHcoding)

Model Lead

Research question, outcome definition, and data limitations

Christoph Dittrich

Delivery Lead

Repository setup, Makefile, dependencies, and reproducibility

Niranjan

Data Lead

Data Card, snapshot documentation, provenance, and data quality

Contributions — Milestone 1: Proposal

Yanhui Yang: Drafted the Activity Track research question and proposed outcome definition; reviewed the Data Card. PR #3

Niranjan: Prepared the Data Card covering sources, snapshots, licensing, files, limitations, and checksums. PR #1

Christoph Dittrich: Repository setup and reproducibility work pending. Contribution link to be added after his PR is submitted.
