<p align="center">
  <img src="assets/banner.svg" alt="Taylor & Francis — Marketing ROI Audit"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11-3776AB?style=flat&logo=python&logoColor=white"/>
  &nbsp;
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white"/>
  &nbsp;
  <img src="https://img.shields.io/badge/Power%20BI-Desktop-F2C811?style=flat&logo=powerbi&logoColor=black"/>
  &nbsp;
  <img src="https://img.shields.io/badge/Status-Complete-2E7D32?style=flat"/>
</p>

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Business Context and Problem Statement](#business-context-and-problem-statement)
3. [Data Overview](#data-overview)
4. [Project Architecture](#project-architecture)
5. [Tools and Technologies](#tools-and-technologies)
6. [Methods](#methods)
7. [Key Insights](#key-insights)
8. [Results and Conclusion](#results-and-conclusion)
9. [Dashboard and Report Preview](#dashboard-and-report-preview)
10. [How to Run the Project](#how-to-run-the-project)
11. [Author](#author)

---

## Project Overview

An end-to-end marketing ROI audit for Taylor & Francis, a publishing firm.
The project covers the full analytical pipeline - ETL, EDA, and customer
segmentation in Python, attribution modelling in SQL, and an interactive
business intelligence report in Power BI.

## Business Context and Problem Statement

Taylor & Francis invested across various marketing channels and campaigns to attract
academic authors and drive article submissions. This project audits that investment
to answer:

- Which marketing channels are generating positive ROI and which are loss-making?
- How much revenue can be attributed to each channel and campaign?
- Which author segments are the most commercially valuable?
- Are there distinct behavioural segments among authors?
- Which subject areas drive the highest submission volume and revenue?
- Which journals have the highest and lowest article acceptance rates?

## Data Overview

- 4 core tables: `authors`, `submissions`, `interactions`, `marketing_spend`
- 1 derived MySQL view: `submissions_attributed` - last-touch attribution output

## Project Architecture

ETL & EDA (Python) → K-Means Clustering & Data Export (Python) → Schema Design,
Ingestion & Attribution Modelling (MySQL) → Data Modelling and Visualization (Power BI)

## Tools and Technologies

- **Python** - Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn
- **MySQL** - Schema design, data ingestion, JOINs, CTEs, window functions, views
- **Power BI** - Data modelling, DAX, interactive visualisations

## Methods

- **Exploratory Data Analysis** - distribution analysis, missing value treatment,
  engagement trend investigation across author segments
- **ETL Pipeline** - data extraction, cleaning, transformation and loading into
  MySQL for downstream analysis
- **K-Means Clustering** - unsupervised segmentation of corporate authors into 3
  behavioural archetypes based on email and webinar engagement patterns
- **Last-Touch Attribution** - SQL-based attribution model assigning each
  published article's APC revenue to the channel of the author's most recent
  pre-submission marketing interaction
- **Star Schema Modelling** - relational data model built in Power BI with fact
  and dimension tables connected via active and inactive relationships
- **DAX Measures** - 23 custom measures across 6 categories covering revenue,
  channel attribution, funnel metrics and campaign performance

