SELECT funnel_stage, COUNT(*) AS prospect_count
FROM prospects
GROUP BY funnel_stage
ORDER BY CASE funnel_stage
    WHEN 'Inquiry' THEN 1
    WHEN 'Engaged' THEN 2
    WHEN 'Applied' THEN 3
    WHEN 'Admitted' THEN 4
    WHEN 'Enrolled' THEN 5
    ELSE 6
END;