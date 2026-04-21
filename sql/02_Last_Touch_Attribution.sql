WITH LastTouchMapping AS (
    SELECT 
        s.submission_id,
        s.apc_gbp as revenue,
        i.channel,
        i.campaign_id,
        
        -- Sorting: Ranking the clicks chronologically
        ROW_NUMBER() OVER(
            PARTITION BY s.submission_id 
            ORDER BY i.interaction_date DESC,
            CASE i.interaction_type 
                 WHEN 'Conversion Touch' THEN 1
                 WHEN 'Registration'     THEN 2
                 WHEN 'Click'            THEN 3
                 WHEN 'Open'             THEN 4
             END ASC
        ) as touch_rank
        
    FROM submissions s
    JOIN interactions i ON s.author_id = i.author_id
    
    -- Filter 1: We only care about papers that actually generated revenue
    WHERE s.status = 'Published'
    
      -- Filter 2: The marketing click MUST have happened BEFORE the paper was submitted
      AND i.interaction_date < s.submission_date
)
-- To show the results
SELECT * FROM LastTouchMapping WHERE touch_rank = 1;