# Activity Track — Data Audit: Outcome Definitions and Limitations

**Milestone:** 2 — Data Audit  
**Lead:** Yanhui Yang (Model Lead)  
**Target population:** Publicly observed Boston Airbnb listings in the earlier frozen snapshot.

## 1. Outcome Definitions

**Gone:** A listing is classified as `gone = 1` when its listing ID appears in the earlier snapshot but is absent from the subsequent snapshot. Otherwise, `gone = 0`. This measures disappearance from the observed dataset, not confirmed permanent closure.

**Dormant:** Dormancy refers to a listing that remains observable but shows limited evidence of recent activity. A reproducible operational rule must be established before constructing this label. Missing reviews alone are insufficient to establish dormancy.

**Combined outcome:** The proposed prediction target is whether a listing disappears or meets the agreed dormancy criterion in the following snapshot. Until dormancy can be defined and validated, disappearance should be reported separately rather than assuming that the two outcomes are equivalent.

## 2. What This Data Cannot Answer

### 2.1 Disappearance Does Not Prove Business Closure

Inside Airbnb collects publicly available listing information. A listing missing from a later snapshot may have been temporarily hidden, removed, relisted under another ID, or missed during data collection. Therefore, the dataset cannot establish whether a property has permanently stopped operating.

### 2.2 Review Activity Is Not a Direct Measure of Occupancy

A listing with no recent reviews may still receive bookings. Not all guests leave reviews, and review dates do not necessarily match stay dates. Consequently, the absence of recent reviews cannot independently establish that a listing is inactive.

### 2.3 Calendar Availability Does Not Reveal Actual Bookings

An unavailable calendar date may indicate an existing reservation, an owner-imposed block, or another restriction. The calendar therefore cannot reliably distinguish booked nights from unavailable nights or directly measure occupancy.

### 2.4 Snapshot Coverage and Representativeness

The dataset contains publicly observable Airbnb listings captured during specific collection periods. It does not necessarily include all short-term rental properties in Boston. Findings should therefore be limited to the observed listing population and should not automatically be generalized to the entire short-term rental market.

### 2.5 Temporal Data Leakage

Predictors must be available at the earlier snapshot date. Information from the subsequent snapshot, including updated review activity, availability, or listing status, cannot be used as input features for predicting that subsequent outcome.

Special attention is required for `last_review`, because its value may reflect activity after the prediction cutoff if records from different snapshots are mixed.

### 2.6 Prediction Does Not Establish Causation

A logistic regression model may identify associations between listing characteristics and later disappearance or dormancy. It cannot establish that these characteristics cause listings to leave the platform.

## 3. Implications for the Modeling Strategy

- Use listing IDs across snapshots to construct the observed disappearance label.
- Document and validate a separate dormancy rule before combining outcomes.
- Restrict predictive features to information available at the baseline snapshot.
- Use time-based validation rather than a random split that mixes earlier and later information.
- Report performance using precision, recall, and a precision–recall curve, with an explicitly justified decision threshold.
- Interpret model predictions as risks of observed disappearance or operationally defined dormancy, not verified permanent business closure.

## 4. Outstanding Decisions

Before model training, the team must confirm:

1. The exact frozen snapshot dates and available files.
2. The operational dormancy criterion and whether the data support it.
3. The treatment of missing or inconsistent listing IDs.
4. The exact prediction cutoff for every feature.
5. The final combined outcome definition, if a combined outcome is feasible.

These decisions should be documented before the prototype milestone.
