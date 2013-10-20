/* MySQL WarmUp
 * @author Anthony Su
 */

USE TEST;

-- Sanity Check : start with an emtpy Actors table
DROP TABLE IF EXISTS Actors;

/* 1.
 * We have included a comma-separated data file at $EBAY_DATA/actors.csv inside VM. 
 * Create a table called Actors in the TEST database (since this is just a warm-up project, we will be using TEST, not CS144). The Actors table should have the following schema:
 * Actors(Name:VARCHAR(40), Movie:VARCHAR(80), Year:INTEGER, Role:VARCHAR(40))
 */
 
CREATE TABLE Actors(
   Name VARCHAR(40),
   Movie VARCHAR(80),
   Year INT,
   Role VARCHAR(40) 
);

/* 2.
 * Load the actors.csv file into the Actors table. 
 * Make sure that the double quotes enclosing some of the attributes in the data file 
 * are removed when they are loaded.
 */
 LOAD DATA LOCAL INFILE '~/ebay-data/actors.csv' INTO TABLE Actors
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';
 
/* 3.
 * Retrieve some loaded data from the Actors table. 
 * In particular, write a query that returns the answer to this question: 
 * "Give me the names of all the actors in the movie 'Die Another Day'.
 */
 SELECT Name FROM Actors
 WHERE Movie = 'Die Another Day';
	
/* 4.
 * Once you are done, drop the Actors table from MySQL,
 * so that it will not stay in the database for later parts of our project.
 */
 DROP TABLE IF EXISTS Actors;
