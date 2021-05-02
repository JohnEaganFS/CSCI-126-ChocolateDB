CREATE DATABASE chocolatedb;
USE chocolatedb;

CREATE TABLE chocolate_ratings (
	ID int,
    rating_year int,
    origin_country varchar(100),
    cocoa_percentage int,
    rating decimal(3,2),
	PRIMARY KEY (ID)
);

CREATE TABLE company (
	chocolateID int,
    company_name varchar(100),
    location varchar(100),
    FOREIGN KEY (chocolateID)
    REFERENCES chocolate_ratings(ID)
    ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE ingredients (
	chocolateID int,
    cocoa_beans bool,
    cocoa_butter bool,
    vanilla bool,
    lecithin bool,
    salt bool,
    sugar bool,
    sweetener bool,
    FOREIGN KEY (chocolateID)
    REFERENCES chocolate_ratings(ID)
    ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE flavors (
	chocolateID int,
    flavor1 varchar(100),
    flavor2 varchar(100),
    flavor3 varchar(100),
    flavor4 varchar(100),
    FOREIGN KEY (chocolateID)
    REFERENCES chocolate_ratings(ID)
    ON UPDATE cascade ON DELETE cascade
);

-- For testing or if you need to reset the tables (can also just delete the schema)
-- DROP TABLE company;
-- DROP TABLE ingredients;
-- DROP TABLE flavors;
-- DROP TABLE chocolate_ratings;