-- 1. Point to the right database
USE publishing_roi_audit;

-- 2. Create the temporary virtual table (The CTE)
WITH LastTouchMapping AS (
    SELECT 
        s.submission_id,
        s.apc_gbp as revenue,
        i.channel,
        ROW_NUMBER() OVER(
            PARTITION BY s.submission_id 
            ORDER BY i.interaction_date DESC
        ) as touch_rank
    FROM submissions s
    JOIN interactions i ON s.author_id = i.author_id
    WHERE s.status = 'Published'
      AND i.interaction_date < s.submission_date
)

-- 3. Calculate the ROAS
SELECT 
    ms.channel,
    ms.total_channel_budget as total_spend,
    COALESCE(SUM(lt.revenue), 0) as attributed_revenue,
    
    -- Math: Revenue / True Budget
    ROUND(COALESCE(SUM(lt.revenue), 0) / ms.total_channel_budget, 2) as roas,
    
    -- Math: True Budget / Number of Papers
    ROUND(ms.total_channel_budget / NULLIF(COUNT(lt.submission_id), 0), 2) as cpa_gbp

FROM (
    -- Get the true, single budget total for each channel
    SELECT channel, SUM(campaign_budget_gbp) as total_channel_budget
    FROM marketing_spend
    GROUP BY channel
) ms

LEFT JOIN (
    -- Bring in the winning clicks
    SELECT * FROM LastTouchMapping WHERE touch_rank = 1
) lt ON ms.channel = lt.channel

-- Lock the budget in place so it doesn't multiply
GROUP BY ms.channel, ms.total_channel_budget
ORDER BY roas DESC;