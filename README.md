# Digital Advertising Campaign Performance Analysis

## Project Overview
End-to-end analysis of 10,000 digital advertising campaigns across 6 platforms (Google Ads, Facebook, TikTok, LinkedIn, Instagram, Twitter) using DuckDB, SQL and Looker Studio.

## Objectives
- Identify the most profitable platforms and campaign objectives
- Analyze ROAS and conversion rate trends across devices and budget tiers
- Build an executive dashboard for marketing performance monitoring

## Tools & Stack
- **DuckDB** — local SQL engine for data modeling
- **Python** — pipeline orchestration
- **Looker Studio** — interactive dashboard
- **Google Sheets** — data source connector

## Project Structure
```
├── 1_staging.sql       # Data cleaning and standardization
├── 2_kpi_models.sql    # KPI aggregations by platform, objective, device, budget
├── 3_export.sql        # CSV exports for Looker Studio
└── run_sql.py          # Pipeline runner
```

## Dataset
Source: [Digital Advertising Campaign Performance Dataset](https://www.kaggle.com/datasets/juniornsa/digital-advertising-campaign-performance-dataset) — 10,000 rows, 41 columns, Jan 2024 to Jan 2026.

Download the CSV and place it in the project folder before running.

## How to Run
```bash
pip install duckdb==0.9.2 pandas
python run_sql.py
```

## Dashboard
[View the Looker Studio Dashboard](https://datastudio.google.com/reporting/9e38a23e-1fa4-4cad-b643-7f7e3df6e086)

## Key Findings
- **TikTok** delivers the highest average ROAS (10.85) at the lowest CPC ($1.33)
- **LinkedIn** is the most expensive channel with the lowest ROAS (3.05)
- **Lead Generation** and **Conversions** objectives generate 3x more profit than Brand Awareness
- **Low budget tier** achieves similar ROAS to High tier despite 70% less spend
- Revenue peaked in **November 2024** suggesting seasonal patterns worth investigating
