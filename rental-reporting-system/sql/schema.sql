-- Schema definitions for reporting project

-- Detailed table: stores each rental transaction
CREATE TABLE rental_detailed_report (
	rental_id INT PRIMARY KEY,
	rental_date TIMESTAMP NOT NULL,
	title VARCHAR(225) NOT NULL,
	category VARCHAR(50) NOT NULL,
	amount NUMERIC(10,2) NOT NULL
);

-- Summary table: aggregates total rentals and revenue per category
CREATE TABLE rental_summary_report (
	category VARCHAR(50) PRIMARY KEY,
	total_rentals INT NOT NULL,
	total_revenue NUMERIC(12,2) NOT NULL
);
