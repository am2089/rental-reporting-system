RENTAL REPORTING SYSTEM (POSTGRESQL)

A database project demonstrating the use of PostgreSQL functions, triggers, and stored procedures to generate detailed and summary reports of rental revenue.

This project automates reporting by creating a pipeline:

A detailed table stores each rental transaction.

A summary table aggregates total rentals and revenue by category.

A trigger ensures the summary updates automatically when new rentals are inserted.

A stored procedure refreshes both reports on demand.

FEATURES

User-defined function: calculates rental length in days.

Trigger & trigger function: incrementally update the summary table.

Stored procedure: rebuilds detailed and summary reports.

Test queries: validate correctness and demonstrate outputs.

FILE STRUCTURE
sql/
schema.sql        # Creates detailed and summary tables
functions.sql     # Functions for rental length & summary updates
triggers.sql      # Trigger to update summary table
procedures.sql    # Stored procedure to refresh reports
test_queries.sql  # Validation queries and inserts

HOW TO RUN
USING psql
psql -h localhost -U postgres -d dvdrental -f sql/00_cleanup.sql
psql -h localhost -U postgres -d dvdrental -f sql/01_schema.sql
psql -h localhost -U postgres -d dvdrental -f sql/02_functions.sql
psql -h localhost -U postgres -d dvdrental -f sql/03_triggers.sql
psql -h localhost -U postgres -d dvdrental -f sql/04_procedures.sql
psql -h localhost -U postgres -d dvdrental -f sql/05_test_queries.sql

USING PGADMIN

Open each file in Query Tool and execute in order (00 → 05).

EXAMPLE OUTPUT

Summary Table (Top 5 Categories by Revenue):

 category  | total_rentals | total_revenue
-----------+---------------+---------------
 Action    |          5432 |     27,114.54
 Comedy    |          5120 |     24,608.20
 Drama     |          4981 |     23,940.75
 ...

WHAT I LEARNED

Designing relational reporting tables.

Writing PL/pgSQL functions and attaching them to triggers.

Automating reporting pipelines with stored procedures.

Testing and validating SQL code systematically.

TECH

PostgreSQL 13+

pgAdmin / psql

✨ This project highlights backend database concepts useful in reporting, automation, and data processing pipelines.
