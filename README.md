# MDCRIS to Postgres
MDCRIS is the Maryland Campaign Reporting Information System, main website here: https://campaignfinance.maryland.gov/

This site provides an public interface allowing to search campaign committees in MD and campaign contributions data, among other things. The functionality is straightforward and fairly convenient, but users are limited to the search features provided. For a more complete (and scriptable!) range of search functionality, users may like to have this data provided through a PostgreSQL database. This repository provides instructions and scripts to acquire the MDCRIS dataset and build such a database.

## Get data from MDCRIS:

Committees info can be acquired from: https://campaignfinance.maryland.gov/Public/ViewCommittees
* Requires to use at least one search criteria to generate a result set, but you can get the whole list by using Jan 1, 1975 - [some future date] as the Registered Date Range in the MISC section.
* Exporting to CSV will download a file called `CommitteesInfo.csv`

Contributions info can be acquired from: https://campaignfinance.maryland.gov/Public/ViewReceipts
* Attempting to export the entire result set (5549011 rows) to CSV will cause an "Internal server error", so the download should be split into two:
* To get the first half choose 01/01/1975 - 12/31/2014 in the Financial Information section. Export it to CSV, naming it `ContributionsList1.csv`
* To get the second half choose 01/01/2015 as the Start Date in the Financial Information section and leave the End Date blank. Export it to CSV, naming it `ContributionsList2.csv`

You should now have 3 CSV files:
* `CommitteesInfo.csv`
* `ContributionsList1.csv`
* `ContributionsList2.csv`

These should all be placed into some directory `<DIR>`.

## Create and fill the database:

`psql -vscriptdir="<DIR>" -f "build_db.sql"`

Make sure to run with a user `<USER>` that has appropriate permissions.

If successful, you should see output like:

   CREATE DATABASE
   You are now connected to database "mdcris" as user "<USER>".
   CREATE TABLE 
   COPY 2982919 
   COPY 2566092 
   ALTER TABLE 
   CREATE TABLE
   COPY 13379
   ALTER TABLE

The dataset should now be available in database `mdcris`.
