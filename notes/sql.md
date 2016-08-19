INSERT INTO movies (title, genre, duration) 
VALUES
('Peter Pan', 'Animation', 134);




SQL is a programming language designed to manipulate and manage data stored in
relational databases.

A relational database is a database that organizes information into one or more
tables.
A table is a collection of data organized into rows and columns.
A statement is a string of characters that the database recognizes as a valid
command.

CREATE TABLE creates a new table.
INSERT INTO adds a new row to a table.
SELECT queries data from a table.
UPDATE edits a row in a table.
ALTER TABLE changes an existing table.
DELETE FROM deletes rows from a table.





SELECT is the clause you use every time you want to query information from a
database.

WHERE is a popular command that lets you filter the results of the query based
on conditions that you specify.

LIKE and BETWEEN are special operators that can be used in a WHERE clause

AND and OR are special operators that you can use with WHERE to filter the query
on two or more conditions.

ORDER BY lets you sort the results of the query in either ascending or
descending order.

LIMIT lets you specify the maximum number of rows that the query will return.
This is especially important in large tables that have thousands or even
millions of rows.





Aggregate functions combine multiple rows together to form a single value of
more meaningful information.

COUNT takes the name of a column(s) as an argument and counts the number of rows
where the value(s) is not NULL.

GROUP BY is a clause used with aggregate functions to combine data from one or
more columns.

SUM() takes the column name as an argument and returns the sum of all the values
in that column.

MAX() takes the column name as an argument and returns the largest value in that
column.

MIN() takes the column name as an argument and returns the smallest value in
that column.

AVG() takes a column name as an argument and returns the average value for that
column.

ROUND() takes two arguments, a column name and the number of decimal places to
round the values in that column.







Primary Key is a column that serves a unique identifier for row in the table.
Values in this column must be unique and cannot be NULL.


Foreign Key is a column that contains the primary key to another table in the
database. It is used to identify a particular row in the referenced table.


Joins are used in SQL to combine data from multiple tables.


INNER JOIN will combine rows from different tables if the join condition is
true.


LEFT OUTER JOIN will return every row in the left table, and if the join
condition is not met, NULL values are used to fill in the columns from the right
table.


AS is a keyword in SQL that allows you to rename a column or table in the result
set using an alias.





































--------PRIMARY KEYS----------

A primary key serves as a unique identifier for each row or record in a given table. The primary key is literally an id value for a record. We're going to use this value to connect artists to the albums they have produced.

By specifying that the id column is the PRIMARY KEY, SQL makes sure that:

None of the values in this column are NULL
Each value in this column is unique
A table can not have more than one PRIMARY KEY column.




-------FOREIGN KEYS---------

A foreign key is a column that contains the primary key of another table in the
database. We use foreign keys and primary keys to connect rows in two different
tables. One table's foreign key holds the value of another table's primary key.
Unlike primary keys, foreign keys do not need to be unique and can be NULL.

Here, artist_id is a foreign key in the albums table. We can see that Michael
Jackson has an id of 3 in the artists table. All of the albums by Michael
Jackson also have a 3 in the artist_id column in the albums table.

This is how SQL is linking data between the two tables. The relationship between
the artists table and the albums table is the id value of the artists.





-------INNER JOINS----------
In SQL, joins are used to combine rows from two or more tables. The most common
type of join in SQL is an inner join.

An inner join will combine rows from different tables if the join condition is
true. Let's look at the syntax to see how it works.

Ex:
albums.artist_id = artists.id is the join condition that describes how the two
tables are related to each other. Here, SQL uses the foreign key column
artist_id in the albums table to match it with exactly one row in the artists
table with the same value in the id column. We know it will only match one row
in the artists table because id is the PRIMARY KEY of artists.


--------------LEFT JOINS----------------
Outer joins also combine rows from two or more tables, but unlike inner joins, they do not require the join condition to be met. Instead, every row in the left table is returned in the result set, and if the join condition is not met, then NULL values are used to fill in the columns from the right table.

The left table is simply the first table that appears in the statement. Here, the left table is albums. Likewise, the right table is the second table that appears. Here, artists is the right table.
