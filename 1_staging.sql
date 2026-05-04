-- 1_staging.sql
-- Clean and standardize raw campaign data

CREATE OR REPLACE TABLE stg_campaigns AS
SELECT
    campaign_id,
    campaign_objective,
    platform,
    ad_placement,
    device_type,
    creative_format,
    target_audience_age,
    target_audience_gender,
    industry_vertical,
    budget_tier,
    start_date::DATE AS start_date,
    quarter,
    day_of_week,
    impressions,
    clicks,
    conversions,
    ad_spend,
    revenue,
    profit,
    CTR AS ctr,
    CPC AS cpc,
    CPA AS cpa,
    ROAS AS roas,
    conversion_rate,
    bounce_rate,
    quality_score
FROM read_csv_auto('~/Documents/sql_project/tech_advertising_campaigns_dataset.csv')
WHERE impressions > 0
  AND ad_spend > 0;