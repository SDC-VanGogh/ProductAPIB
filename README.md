# ProductsAPI
## To start server
* Click your heels together three times
* npm run start
* npm run database



-------------------------
## Contents
#### Database: Postgres
[X] Create one instance on AWS
[X] Create a Docker Image to launch

#### Server: Express on AWS
[X] Create *at least one instance on AWS


## Process
[X] Create a model and submit for Data
[X] ETL 1.0 Extract, Transform, Load
  * Download relevant CSV files
  * Created tables in PGadmin
[X] ETL 2.0 Created .sql file
  * Used 'COPY' scripts to import csv data
  * Verified the data was recreated running the script
  * Tested simple queries

[X] Setup Server
  * server/index.js: initialized with Express
  * server/routes.js: provides all routes for server
  * server/controller.js: all server methods to call database

[x] Connect to database
  * database/server.js: initiates pool and all methods for queries

[ ] Integrate your server and databases for front end
[ ] Write unit tests
  * Test and confirm connection issues
  * Test server logic
-------------------------

