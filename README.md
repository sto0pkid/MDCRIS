# MDCRIS to Postgres
MDCRIS is the Maryland Campaign Reporting Information System, main website here: https://campaignfinance.maryland.gov/

This site provides an public interface allowing to search campaign committees in MD and campaign contributions data, among other things. The functionality is straightforward and fairly convenient, but users are limited to the search features provided. For a more complete (and scriptable!) range of search functionality, users may like to have this data provided through a PostgreSQL database. This repository provides instructions and scripts to acquire the MDCRIS dataset and build such a database.

## Get data from MDCRIS:
Download `CommitteesInfo.csv` and `ContributionsList.csv` from MDCRIS site, to be stored in directory `<DIR>`.

Committees info can be acquired from: https://campaignfinance.maryland.gov/Public/ViewCommittees
* Requires to use at least one search criteria to generate a result set, but you can get the whole list by using Jan 1, 1975 - [some future date] as the Registered Date Range in the MISC section.
* Exporting to CSV will download a file called `CommitteesInfo.csv`

Contributions info can be acquired from: https://campaignfinance.maryland.gov/Public/ViewReceipts
* Requires to use at least one search criteria to generate a result set, but you can get the whole list by using Jan 1, 1975 as the Start Date in the Financial Information section.
* Exporting to CSV will download a file called `ContributionsList.csv`

## Create and fill the database:

`psql -vscriptdir="<DIR>" -f "build_db.sql"`

Make sure to run with a user that has appropriate permissions in the database.
