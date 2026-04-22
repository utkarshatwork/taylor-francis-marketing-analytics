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
5. [Phase 1 — Python](#phase-1--python)
6. [Phase 2 — SQL](#phase-2--sql)
7. [Phase 3 — Power BI](#phase-3--power-bi)
8. [Key Findings and Business Insights](#key-findings-and-business-insights)
9. [Report Preview](#report-preview)
10. [Repository Structure](#repository-structure)
11. [How to Run the Project](#how-to-run-the-project)
12. [Tech Stack](#tech-stack)
13. [Author](#author)

---

## Project Overview

An end-to-end marketing ROI audit for Taylor & Francis, a publishing firm.
The project covers the full analytical pipeline - ETL, EDA, and customer
segmentation in Python, attribution modelling in SQL, and an interactive
business intelligence report in Power BI.

## Business Context and Problem Statement

Taylor & Francis invested across 4 marketing channels and 20 campaigns to attract
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
- 1 derived MySQL view: `submissions_attributed` — last-touch attribution output
