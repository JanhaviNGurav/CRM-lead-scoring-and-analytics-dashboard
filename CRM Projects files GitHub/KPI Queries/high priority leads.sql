SELECT 
    prospect_id,
    first_name || ' ' || last_name AS prospect_name,
    country,
    source_channel,
    funnel_stage,
    application_status,
    lead_score
FROM prospects
ORDER BY lead_score DESC
LIMIT 20;