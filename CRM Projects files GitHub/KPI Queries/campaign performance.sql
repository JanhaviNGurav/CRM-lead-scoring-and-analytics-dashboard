SELECT 
    c.campaign_name,
    c.channel,
    COUNT(cm.comm_id) AS total_communications,
    SUM(cm.opened_flag) AS opens,
    SUM(cm.clicked_flag) AS clicks,
    SUM(cm.replied_flag) AS replies,
    ROUND(100.0 * SUM(cm.opened_flag) / COUNT(cm.comm_id), 2) AS open_rate_pct,
    ROUND(100.0 * SUM(cm.clicked_flag) / COUNT(cm.comm_id), 2) AS click_rate_pct,
    ROUND(100.0 * SUM(cm.replied_flag) / COUNT(cm.comm_id), 2) AS reply_rate_pct
FROM communications cm
JOIN campaigns c ON cm.campaign_id = c.campaign_id
GROUP BY c.campaign_name, c.channel
ORDER BY reply_rate_pct DESC;