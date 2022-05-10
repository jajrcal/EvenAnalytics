# Even Analytics

This is a repository on loading data into a Postgresql from parquet files and running analytics on that data.

## Assumptions

1. Spinning up a new DB under one container for the Analytics DB
2. Details in Leads tables are associated with the User, not the loan (i.e. state)
3. Rate Table id is a group of rate table offer ids which are ranked per user

## Install/Setup

1. Download and install Docker [here](https://docs.docker.com/get-docker/)
2. Clone this repository to a local directory

## Running Steps

1. Execute `run.sh` in terminal- This will spin up a database instance with two databases running on it called `Even` and
   `Even_Analytics`. It will also initialize the tables, indexes and keys.
2. Open Jupyter by going to http://localhost:8888/lab/tree/EvenAnalyticsNotebook.ipynb. The password is *password*
3. Press the double play arrows in Jupyter to execute everything/ This will do the following:
    1. Copy the tables from `Even` to `Even_Analytics` database
    2. Create a new redesigned star schema using the original source
    3. Generate some insights by reading from this database

## Arch/Structure

There are 2 containers running in Docker

1. Postgresql DB instance with multiple Databases
2. Spark + Jupyter Notebook

## Possible Next Steps

1. Clean up Jupyter Notebook
2. Complete further analysis
    1. Analysis on Provider
    2. Time difference between first and last click
    3. APR and Fees and monthly payments
    4. Analysis on User demographics
    5. What Users request what
    6. Total amounts requested vs what is offered
    7. Type of Loans
3. Update column types to be accurate - I auto created this while inserting from the Parquet Files
   1. Update Indexes based on what would be queried often
   