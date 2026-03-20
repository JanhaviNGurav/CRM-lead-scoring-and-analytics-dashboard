SELECT 
    CASE WHEN ep.attended_flag = 1 THEN 'Attended Event' ELSE 'Did Not Attend' END AS event_group,
    COUNT(DISTINCT pr.prospect_id) AS prospects,
    SUM(CASE WHEN pr.application_status IN ('Submitted','Admitted','Enrolled') THEN 1 ELSE 0 END) AS applied_or_beyond,
    ROUND(
        100.0 * SUM(CASE WHEN pr.application_status IN ('Submitted','Admitted','Enrolled') THEN 1 ELSE 0 END) 
        / COUNT(DISTINCT pr.prospect_id), 2
    ) AS progression_pct
FROM prospects pr
LEFT JOIN event_participation ep ON pr.prospect_id = ep.prospect_id
GROUP BY event_group;