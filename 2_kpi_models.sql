-- 2_kpi_models.sql
-- KPI aggregations for dashboard

-- Performance by platform
CREATE OR REPLACE TABLE kpi_by_platform AS
SELECT
    platform,
    COUNT(campaign_id)                          AS total_campaigns,
    SUM(impressions)                            AS total_impressions,
    SUM(clicks)                                 AS total_clicks,
    SUM(conversions)                            AS total_conversions,
    ROUND(SUM(ad_spend), 2)                     AS total_spend,
    ROUND(SUM(revenue), 2)                      AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(AVG(ctr), 3)                          AS avg_ctr,
    ROUND(AVG(cpc), 2)                          AS avg_cpc,
    ROUND(AVG(cpa), 2)                          AS avg_cpa,
    ROUND(AVG(roas), 2)                         AS avg_roas,
    ROUND(AVG(conversion_rate), 3)              AS avg_conversion_rate
FROM stg_campaigns
GROUP BY platform
ORDER BY total_revenue DESC;

-- Performance by campaign objective
CREATE OR REPLACE TABLE kpi_by_objective AS
SELECT
    campaign_objective,
    COUNT(campaign_id)                          AS total_campaigns,
    SUM(impressions)                            AS total_impressions,
    SUM(clicks)                                 AS total_clicks,
    SUM(conversions)                            AS total_conversions,
    ROUND(SUM(ad_spend), 2)                     AS total_spend,
    ROUND(SUM(revenue), 2)                      AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(AVG(ctr), 3)                          AS avg_ctr,
    ROUND(AVG(roas), 2)                         AS avg_roas,
    ROUND(AVG(conversion_rate), 3)              AS avg_conversion_rate
FROM stg_campaigns
GROUP BY campaign_objective
ORDER BY total_revenue DESC;

-- Performance by device type
CREATE OR REPLACE TABLE kpi_by_device AS
SELECT
    device_type,
    COUNT(campaign_id)                          AS total_campaigns,
    ROUND(SUM(ad_spend), 2)                     AS total_spend,
    ROUND(SUM(revenue), 2)                      AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(AVG(ctr), 3)                          AS avg_ctr,
    ROUND(AVG(roas), 2)                         AS avg_roas,
    ROUND(AVG(conversion_rate), 3)              AS avg_conversion_rate
FROM stg_campaigns
GROUP BY device_type
ORDER BY total_revenue DESC;

-- Monthly performance trend
CREATE OR REPLACE TABLE kpi_monthly_trend AS
SELECT
    DATE_TRUNC('month', start_date)             AS month,
    COUNT(campaign_id)                          AS total_campaigns,
    SUM(impressions)                            AS total_impressions,
    SUM(clicks)                                 AS total_clicks,
    SUM(conversions)                            AS total_conversions,
    ROUND(SUM(ad_spend), 2)                     AS total_spend,
    ROUND(SUM(revenue), 2)                      AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(AVG(roas), 2)                         AS avg_roas,
    ROUND(AVG(ctr), 3)                          AS avg_ctr
FROM stg_campaigns
GROUP BY DATE_TRUNC('month', start_date)
ORDER BY month;

-- Performance by budget tier
CREATE OR REPLACE TABLE kpi_by_budget_tier AS
SELECT
    budget_tier,
    COUNT(campaign_id)                          AS total_campaigns,
    ROUND(SUM(ad_spend), 2)                     AS total_spend,
    ROUND(SUM(revenue), 2)                      AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(AVG(roas), 2)                         AS avg_roas,
    ROUND(AVG(conversion_rate), 3)              AS avg_conversion_rate
FROM stg_campaigns
GROUP BY budget_tier
ORDER BY avg_roas DESC;