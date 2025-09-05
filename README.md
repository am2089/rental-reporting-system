
# Rental Reporting System (PostgreSQL)

A database project demonstrating PostgreSQL functions, triggers, and stored procedures** to generate detailed and summary reports of rental revenue.  

---

## Features
- User-defined function to calculate rental length in days  
- Trigger & trigger function to keep summary data updated automatically  
- Stored procedure to refresh both detailed and summary reports  
- Test queries to validate results  

---

## File Structure
sql/
01_schema.sql # Tables
02_functions.sql # Functions
03_triggers.sql # Triggers
04_procedures.sql # Stored procedure
05_test_queries.sql # Test queries

---

## How to Run
1. Run files `00 → 05` in order using `psql` or pgAdmin.  
2. Check results with the test queries.  

---

## Example Output
category | total_rentals | total_revenue
-----------+---------------+---------------
Action | 5432 | 27,114.54
Comedy | 5120 | 24,608.20
Drama | 4981 | 23,940.75

---

## Tech
- PostgreSQL 13+  
- pgAdmin / psql  
