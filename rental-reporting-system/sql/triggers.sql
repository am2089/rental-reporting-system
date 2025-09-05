-- Trigger definitions for reporting project

-- Trigger: rental_summary_trigger
-- Fires after a new rental is inserted into the detailed report table,
-- updating the rental_summary_report automatically
CREATE TRIGGER rental_summary_trigger
AFTER INSERT ON rental_detailed_report
FOR EACH ROW
EXECUTE FUNCTION update_summary();