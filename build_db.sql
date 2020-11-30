\cd :scriptdir;

CREATE DATABASE mdcris_test;

\c mdcris_test;


/*
Receiving Committee,
Filing Period,
Contribution Date,
Contributor Name,
Contributor Address,
Contributor Type,
Contribution Type,
Contribution Amount,
Employer Name,
Employer Occupation,
Office,
Fundtype,
*/

CREATE TABLE contributions(
	receiving text,
	filing_period text,
	contribution_date text,
	contributor_name text,
	contributor_address text,
	contributor_type text,
	contribution_type text,
	contribution_amount real,
	employer_name text,
	employer_occupation text,
	office text,
	fund_type text,
	blank text -- CSV provided by MDCRIS has an extra blank column
);

-- `QUOTE E'\b'` sets the quote character to backspace so that
-- double quotes in input are preserved
\copy contributions(receiving,filing_period,contribution_date,contributor_name,contributor_address,contributor_type,contribution_type,contribution_amount,employer_name,employer_occupation,office,fund_type,blank) FROM 'ContributionsList.csv'DELIMITER ',' QUOTE E'\b' CSV HEADER;


ALTER TABLE contributions DROP COLUMN blank;


/*
Committee Type,
CCF ID,
Committee Name,
Committee Status,
Citation Violations,
Election Type,
Registered Date,
Amended Date,
Chairperson Name,
Chairperson Address,
Treasurer Name,
Treasurer Address,
*/


CREATE TABLE committees(
	committee_type text,
	ccf_id text,
	committee_name text,
	committee_status text,
	citation_violations text,
	election_type text,
	registered_date text,
	amended_date text,
	chairperson_name text,
	chairperson_address text,
	treasurer_name text,
	treasure_address text,
	blank text -- CSV provided by MDCRIS has an extra blank column
);

\copy committees(committee_type,ccf_id,committee_name,committee_status,citation_violations,election_type,registered_date,amended_date,chairperson_name,chairperson_address,treasurer_name,treasure_address,blank) FROM 'CommitteesInfo.csv' DELIMITER ',' QUOTE E'\b' CSV HEADER;

ALTER TABLE committees DROP COLUMN blank;
