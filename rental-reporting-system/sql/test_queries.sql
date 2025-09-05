-- Test queries and validation steps for reporting project

-- Validate rental_length_days function
SELECT
    r.rental_id,  
    r.rental_date,
    r.return_date,
    rental_length_days(r.rental_date, r.return_date) AS rental_length_days
FROM rental r
LIMIT 5;

-- Preview raw detailed data before inserting into report tables
SELECT
    r.rental_id,
    r.rental_date,
    f.title,
    c.name AS category,
    p.amount
FROM rental r
JOIN payment p        ON r.rental_id    = p.rental_id
JOIN inventory i      ON r.inventory_id = i.inventory_id
JOIN film f           ON i.film_id      = f.film_id
JOIN film_category fc ON f.film_id      = fc.film_id
JOIN category c       ON fc.category_id = c.category_id
LIMIT 5;

-- Test trigger by inserting a demo record
INSERT INTO rental_detailed_report (rental_id, rental_date, title, category, amount)
VALUES (999999, NOW(), 'Demo Film', 'Action', 4.99);

-- Rebuild both reports using stored procedure
CALL refresh_reports();

-- Inspect results in both tables
SELECT * FROM rental_detailed_report LIMIT 5;
SELECT * FROM rental_summary_report ORDER BY total_revenue DESC LIMIT 5;