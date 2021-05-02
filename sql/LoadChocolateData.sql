-- Please place the appropriate csv files in a directory that you can load data from.
-- Also rewrite the LOAD DATA INFILE lines to your directory/files.
LOAD DATA INFILE 'C:/Users/john/Desktop/126 DBMS Project/ChocolateData/chocolateRating.csv'
INTO TABLE chocolate_ratings
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/john/Desktop/126 DBMS Project/ChocolateData/company.csv'
INTO TABLE company
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/john/Desktop/126 DBMS Project/ChocolateData/ingredients.csv'
INTO TABLE ingredients
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Users/john/Desktop/126 DBMS Project/ChocolateData/flavors.csv'
INTO TABLE flavors
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;