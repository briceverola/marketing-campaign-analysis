-- 3_export.sql
-- Export final tables to CSV for Looker Studio

COPY kpi_by_platform TO '~/Documents/sql_project/exports/kpi_by_platform.csv' (HEADER, DELIMITER ',');
COPY kpi_by_objective TO '~/Documents/sql_project/exports/kpi_by_objective.csv' (HEADER, DELIMITER ',');
COPY kpi_by_device TO '~/Documents/sql_project/exports/kpi_by_device.csv' (HEADER, DELIMITER ',');
COPY kpi_monthly_trend TO '~/Documents/sql_project/exports/kpi_monthly_trend.csv' (HEADER, DELIMITER ',');
COPY kpi_by_budget_tier TO '~/Documents/sql_project/exports/kpi_by_budget_tier.csv' (HEADER, DELIMITER ',');