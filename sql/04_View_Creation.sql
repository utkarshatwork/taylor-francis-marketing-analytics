-- 04_View_Creation
-- Purpose: Productionise last-touch attribution logic as views for Power BI

USE publishing_roi_audit;

-- ============================================================
-- VIEW 1: submissions_attributed
-- One row per published submission with its last-touch channel and campaign assigned via 2 attribution logic
-- ============================================================
CREATE OR REPLACE VIEW submissions_attributed AS
WITH LastTouchMapping AS (
    SELECT 
        s.submission_id,
        s.author_id,
        s.submission_date,
        s.journal_name,
        s.subject_area,
        s.status,
        s.apc_gbp,
        i.channel          AS last_touch_channel,
        i.campaign_id      AS last_touch_campaign,
        ROW_NUMBER() OVER(
            PARTITION BY s.submission_id
            ORDER BY 
                i.interaction_date DESC,
                CASE i.interaction_type
                    WHEN 'Conversion Touch' THEN 1
                    WHEN 'Registration'     THEN 2
                    WHEN 'Click'            THEN 3
                    WHEN 'Open'             THEN 4
                END ASC
        ) AS touch_rank
    FROM submissions s
    JOIN interactions i 
        ON s.author_id = i.author_id
        AND i.interaction_date < s.submission_date
    WHERE s.status = 'Published'
)
SELECT
    submission_id,
    author_id,
    submission_date,
    journal_name,
    subject_area,
    status,
    apc_gbp,
    last_touch_channel,
    last_touch_campaign
FROM LastTouchMapping
WHERE touch_rank = 1;


-- ============================================================
-- VIEW 2: channel_roas_summary
-- Channel-level ROAS and CPA for Power BI KPI cards
-- ============================================================
CREATE OR REPLACE VIEW channel_roas_summary AS
SELECT
    ms.channel,
    ms.total_channel_budget                                    AS total_spend,
    COALESCE(SUM(sa.apc_gbp), 0)                              AS attributed_revenue,
    ROUND(COALESCE(SUM(sa.apc_gbp), 0) 
          / ms.total_channel_budget, 2)                        AS roas,
    ROUND(ms.total_channel_budget 
          / NULLIF(COUNT(sa.submission_id), 0), 2)             AS cpa_gbp,
    COUNT(sa.submission_id)                                    AS attributed_conversions
FROM (
    SELECT channel, SUM(campaign_budget_gbp) AS total_channel_budget
    FROM marketing_spend
    GROUP BY channel
) ms
LEFT JOIN submissions_attributed sa 
    ON ms.channel = sa.last_touch_channel
GROUP BY ms.channel, ms.total_channel_budget
ORDER BY roas DESC;
