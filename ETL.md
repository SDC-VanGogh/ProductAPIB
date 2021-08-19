# ETL PRODUCTS API

## PROVIDED DATA
* cart.csv
* features.csv
* photos.csv
* products.csv
* related.csv
* review.csv
* skus.csv
* styles.csv

### ETL PROCESS
1. Complete the schema for Postgres.
2. Create tables in Postgres pgAdmin (just for familiarity with Postgres, will use schema.sql file later)
3. Initial upload of provided data.
4. Whiteboard current data structure and modifications that need to be made
5. Transform the data to match schema
    5. Add foreign keys to connect parent tables
    5. Now shift gears and ensure we can do the same thing in a schema.sql file (instead of pgAdmin) so others can recreate our DB from the repo.
6. Create schema.sql file and test importing one CSV file. Do not add all CSV files to repo..duh. 
7. Verify and clean data to ensure no duplicates
8. Re-load the data.