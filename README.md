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

This project delivers a complete, end-to-end marketing ROI audit for Taylor & Francis,
a leading academic publisher. Built as a data analytics capstone, it covers the full
analytical pipeline — from synthetic data generation and exploratory analysis in Python,
through relational database design and attribution modelling in MySQL, to an interactive
multi-page business intelligence report in Power BI.

The central business question driving the project is: **which marketing channels and
campaigns are actually generating return, and which are destroying value?** To answer
this, a last-touch attribution model was implemented in SQL — assigning each published
article's APC revenue to the marketing channel that last engaged the author before
submission. The results were striking: Email marketing delivered a 28.57x ROAS on
£50,000 spend, while Social Ads lost money at 0.53x ROAS despite consuming £400,000 —
62% of the total marketing budget.

Beyond channel performance, the project segments corporate authors using K-Means
clustering to identify behavioural archetypes, analyses submission outcomes across
journals, and surfaces revenue concentration by institution type and author segment —
giving Taylor & Francis a complete picture of both their marketing efficiency and their
audience landscape.
