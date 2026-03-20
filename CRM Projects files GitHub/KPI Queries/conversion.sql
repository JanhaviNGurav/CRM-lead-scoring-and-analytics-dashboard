SELECT 
    p.program_name,
    COUNT(pr.prospect_id) AS total_prospects,
    SUM(CASE WHEN pr.application_status = 'Submitted' THEN 1 ELSE 0 END) AS submitted,
    SUM(CASE WHEN pr.application_status = 'Admitted' THEN 1 ELSE 0 END) AS admitted,
    SUM(CASE WHEN pr.application_status = 'Enrolled' THEN 1 ELSE 0 END) AS enrolled,
    ROUND(
        100.0 * SUM(CASE WHEN pr.application_status = 'Enrolled' THEN 1 ELSE 0 END) / COUNT(pr.prospect_id),
        2
    ) AS enrollment_conversion_pct
FROM prospects pr
JOIN programs p ON pr.program_id = p.program_id
GROUP BY p.program_name
ORDER BY enrollment_conversion_pct DESC;