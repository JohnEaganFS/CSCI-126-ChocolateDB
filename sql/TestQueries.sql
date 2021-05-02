 -- insert a new chocolate bar into the db atomically
START TRANSACTION;
	INSERT INTO chocolate_ratings (ID, rating_year, origin_country, cocoa_percentage, rating)
	select count(*), 2021, "Ghana", 70, 3.5 from chocolate_ratings as numOfRatings;
    
	INSERT INTO company (chocolateID, company_name, location)
	select count(*) - 1, "Ghirardelli", "U.S.A" from chocolate_ratings as numOfRatings;
    
    INSERT INTO ingredients (chocolateID, cocoa_beans, cocoa_butter, vanilla, lecithin, salt, sugar, sweetener)
	select count(*) - 1, 1, 0, 1, 0, 1, 0, 1 from chocolate_ratings as numOfRatings;
    
    INSERT INTO flavors (chocolateID, flavor1, flavor2, flavor3)
	select count(*) - 1, "Sweet", "Hearty", "Roasty" from chocolate_ratings as numOfRatings;
COMMIT;
select * from chocolate_ratings where id > 2200;
select * from company where chocolateID > 2200;
select * from ingredients where chocolateID > 2200;
select * from flavors where chocolateID > 2200;

-- update a chocolate bar's cocoa percentage and rating
UPDATE chocolate_ratings 
SET cocoa_percentage = 50, rating = 2.0 where ID = 2224;
select * from chocolate_ratings where id = 2224;

-- find the number of chocolate bars rated >= 3.5 grouped by the company
select company_name, count(*) as ">= 3.5 Ratings" from chocolate_ratings, company where chocolate_ratings.id = company.chocolateid and rating >= 3.5 group by company_name;

-- let's limit this to only companies who have more than 10 bars rated this highly and sort by desc
-- this gives an good idea of which companies have good chocolate bars
select company_name, threeFive as ">= 3.5 Ratings" from 
(select company_name, count(*) as threeFive from chocolate_ratings, company where chocolate_ratings.id = company.chocolateid and rating >= 3.5 group by company_name) as threeFiveRatings
 where threeFive > 10 order by threeFive desc;

-- what if the big companies just make a lot of bars and hope many get lucky
-- let's limit this to companies who produce at least 70% of their bars at this rating
select threeFiveRatings.company_name, threeFive as ">= 3.5 Ratings", total as "Total Chocolate Bars", (threeFive / total) * 100 as "Good Chocolate Percentage" from 
(select company_name, count(*) as threeFive from chocolate_ratings, company where chocolate_ratings.id = company.chocolateid and rating >= 3.5 group by company_name) as threeFiveRatings,
(select company_name, count(*) as total from chocolate_ratings, company where chocolate_ratings.id = company.chocolateid group by company_name) as totalRatings
 where threeFiveRatings.company_name = totalRatings.company_name and threeFive > 10 and threeFive >= (total * 0.7) group by company_name order by threeFive desc;
 
 -- find where most of the companies get their chocolate from
 select origin_country, count(*) as "Number of Companies Sourcing From This Country" from chocolate_ratings, company
 where id = chocolateID group by origin_country order by count(*) desc;