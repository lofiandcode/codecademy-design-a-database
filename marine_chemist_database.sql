--Create Tables

--Employers of marine chemists
CREATE TABLE employer (
	id integer PRIMARY KEY,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    number varchar(17) NOT NULL,
    email varchar(100)
);

CREATE TABLE marine_chemist (
	cmc_number integer PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    number varchar(17) NOT NULL,
    email varchar(100),
    employer_id integer REFERENCES employer(id)
);

CREATE TABLE project (
    id integer PRIMARY KEY,
    vessel_name varchar(50),
    location varchar(100)
);

CREATE TABLE customer (
    id integer PRIMARY KEY,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    number varchar(17) NOT NULL,
    email varchar(100)
);

--Create cross-reference tables
CREATE TABLE customers_projects (
    customer_id integer REFERENCES customer(id),
    project_id integer REFERENCES project(id),
    PRIMARY KEY (customer_id, project_id)
);

CREATE TABLE marine_chemists_projects (
    cmc_number integer REFERENCES marine_chemist(cmc_number),
    project_id integer REFERENCES project(id),
    PRIMARY KEY (cmc_number, project_id)
);

--Insert Test Data
INSERT INTO employer 
VALUES (
    1,
    'Sound Testing, Inc.',
    '2992 SW Avalon Way, Seattle, WA 98126',
    '206-932-0206',
    'admin@soundtestinginc.com'
);

INSERT INTO marine_chemist
VALUES (
    1,
    'Amy',
    'Liu',
    '206-228-0116',
    'amy.sly@hotmail.com',
    1
);

INSERT INTO marine_chemist
VALUES (
    2,
    'Craig',
    'Trettevik',
    '206-313-6933',
    'ctretvik@alumni.washington.edu',
    1
);

INSERT INTO customer
VALUES (
    1,
    'Vigor Seattle',
    '1801 16th Ave SW, Seattle, WA 98134',
    '206-623-1635',
    'admin@vigor.net'
);

INSERT INTO customer
VALUES (
    2,
    'Pacific Fisherman Shipyard',
    '5351 24th Ave NW, Seattle, WA 98107',
    '206-784-2562',
    'admin@pacificfisherman.com'
);

INSERT INTO project
VALUES (
    1,
    'USS Omaha',
    'Vigor Seattle'
);

INSERT INTO project
VALUES (
    2,
    'M/V Cape Flattery',
    'Pacific Fisherman Shipyard'
);

INSERT INTO project
VALUES (
    3,
    'M/V Kennewick',
    'Vigor Seattle'
);

INSERT INTO customers_projects
VALUES (
    1,
    1
);

INSERT INTO customers_projects
VALUES (
    2,
    2
);

INSERT INTO customers_projects
VALUES (
    1,
    3
);

INSERT INTO marine_chemists_projects
VALUES (
    1,
    3
);

INSERT INTO marine_chemists_projects
VALUES (
    1,
    2
);

INSERT INTO marine_chemists_projects
VALUES (
    2,
    1
);

INSERT INTO marine_chemists_projects
VALUES (
    2,
    3
);