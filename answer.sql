SELECT
    t.investor_id,
    s.sector_name,
    ROUND(t.no_of_shares * 100.0 / totals.total_shares, 2) AS percentage
FROM investor_transactions t
JOIN (
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
) totals
    ON t.investor_id = totals.investor_id
JOIN sectors s
    ON t.sector_id = s.sector_id
ORDER BY
    t.investor_id,
    t.sector_id;-- ADD YOUR SQL QUERY HERE
