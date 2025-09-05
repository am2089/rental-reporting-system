-- User-defined and trigger functions for reporting project

-- Function: rental_length_days
-- Calculates the number of days between a rental start and end date
CREATE OR REPLACE FUNCTION rental_length_days(start_date TIMESTAMP, end_date TIMESTAMP)
RETURNS INT AS $$
BEGIN
    RETURN EXTRACT(DAY FROM (end_date - start_date));
END;
$$ LANGUAGE plpgsql;

-- Function: update_summary
-- Trigger function that updates the summary table when a new rental is inserted
CREATE OR REPLACE FUNCTION update_summary()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO rental_summary_report(category, total_rentals, total_revenue)
    VALUES(NEW.category, 1, NEW.amount)
    ON CONFLICT(category)
    DO UPDATE SET
        total_rentals = rental_summary_report.total_rentals + 1,
        total_revenue = rental_summary_report.total_revenue + NEW.amount;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;