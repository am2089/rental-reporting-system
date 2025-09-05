-- Stored procedures for reporting project

-- Procedure: refresh_reports
-- Clears existing data and rebuilds both the detailed and summary reports
CREATE OR REPLACE PROCEDURE refresh_reports()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Remove old data
    TRUNCATE TABLE rental_summary_report;
    TRUNCATE TABLE rental_detailed_report;

    -- Repopulate the detailed table
    INSERT INTO rental_detailed_report(rental_id, rental_date, title, category, amount)
    SELECT
        r.rental_id,
        r.rental_date,
        f.title,
        c.name AS category,
        SUM(p.amount) AS amount
    FROM rental r
    JOIN payment p        ON r.rental_id    = p.rental_id
    JOIN inventory i      ON r.inventory_id = i.inventory_id
    JOIN film f           ON i.film_id      = f.film_id
    JOIN film_category fc ON f.film_id      = fc.film_id
    JOIN category c       ON fc.category_id = c.category_id
    GROUP BY r.rental_id, r.rental_date, f.title, c.name;
END;
$$;