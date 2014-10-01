  \copyright             show PostgreSQL usage and distribution terms
  \g [FILE] or ;         execute query (and send results to file or |pipe)
  \gset [PREFIX]         execute query and store results in psql variables
  \h [NAME]              help on syntax of SQL commands, * for all commands
  \q                     quit psql
  \watch [SEC]           execute query every SEC seconds

Query Buffer
  \e [FILE] [LINE]       edit the query buffer (or file) with external editor
  \ef [FUNCNAME [LINE]]  edit function definition with external editor
  \p                     show the contents of the query buffer
  \r                     reset (clear) the query buffer
  \s [FILE]              display history or save it to file
  \w FILE                write query buffer to file

Input/Output
  \copy ...              perform SQL COPY with data stream to the client host
  \echo [STRING]         write string to standard output
  \i FILE                execute commands from file
  \ir FILE               as \i, but relative to location of current script
  \o [FILE]              send all query results to file or |pipe
  \qecho [STRING]        write string to query output stream (see \o)

Informational
  (options: S = show system objects, + = additional detail)
  \d[S+]                 list tables, views, and sequences
  \d[S+]  NAME           describe table, view, sequence, or index
  \da[S]  [PATTERN]      list aggregates
  \db[+]  [PATTERN]      list tablespaces
  \dc[S+] [PATTERN]      list conversions
  \dC[+]  [PATTERN]      list casts
  \dd[S]  [PATTERN]      show object descriptions not displayed elsewhere
  \ddp    [PATTERN]      list default privileges
  \dD[S+] [PATTERN]      list domains
  \det[+] [PATTERN]      list foreign tables
  \des[+] [PATTERN]      list foreign servers
  \deu[+] [PATTERN]      list user mappings
  \dew[+] [PATTERN]      list foreign-data wrappers
  \df[antw][S+] [PATRN]  list [only agg/normal/trigger/window] functions
  \dF[+]  [PATTERN]      list text search configurations
  \dFd[+] [PATTERN]      list text search dictionaries
  \dFp[+] [PATTERN]      list text search parsers
  \dFt[+] [PATTERN]      list text search templates
  \dg[+]  [PATTERN]      list roles
  \di[S+] [PATTERN]      list indexes
  \dl                    list large objects, same as \lo_list
  \dL[S+] [PATTERN]      list procedural languages
  \dm[S+] [PATTERN]      list materialized views
  \dn[S+] [PATTERN]      list schemas
  \do[S]  [PATTERN]      list operators
  \dO[S+] [PATTERN]      list collations
  \dp     [PATTERN]      list table, view, and sequence access privileges
  \drds [PATRN1 [PATRN2]] list per-database role settings
  \ds[S+] [PATTERN]      list sequences

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                         NOTES FROM PSQL DOCUMENTATION
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/*

Each table is a named collection of rows. 

Each row of a given table has the same set of named columns, and each column is of a specific data type. 
Whereas columns have a fixed order in each row, it is important to remember that SQL does not guarantee 
the order of the rows within the table in any way (although they can be explicitly sorted for display).

Tables are grouped into databases, and a collection of databases managed by a single PostgreSQL server 
instance constitutes a database cluster.

SQL is case insensitive about key words and identifiers, except when identifiers are double-quoted 
to preserve the case (not done above).


where this code: 
—————————————————————————————————————————————————
CREATE TABLE weather (
    city            varchar(80),
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
);
—————————————————————————————————————————————————

varchar(80) specifies a data type that can store arbitrary character strings up to 80 characters in length. 
int is the normal integer type. 
real is a type for storing single precision floating-point numbers. 
date should be self-explanatory. 

(Yes, the column of type date is also named date. This might be convenient or confusing — you choose.)


Delete a table by typing in:
—————————————————————————————————————————————————
DROP TABLE tablename; --where table name is the name of your table
—————————————————————————————————————————————————


Populating tables with rows: --based on the CREATE TABLE weather(); command above
—————————————————————————————————————————————————
INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
—————————————————————————————————————————————————
Note that all data types use rather obvious input formats. 
Constants that are not simple numeric values usually must be surrounded by single quotes ('), 
as in the example. The date type is actually quite flexible in what it accepts, 
but for this tutorial we will stick to the unambiguous format shown here.


explicitly list the columns in your table: 
—————————————————————————————————————————————————
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
    VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');


List columns in a different order if you wish or even omit some columns
—————————————————————————————————————————————————
INSERT INTO weather (date, city, temp_hi, temp_lo)
    VALUES ('1994-11-29', 'Hayward', 54, 37);


±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

MANY DEVELOPERS CONSIDER EXPLICITLY LISTING THE COLUMNS BETTER STYLE THAN RELYING ON THE ORDER IMPLICITLY.

±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


You could also have used COPY to load large amounts of data from flat-text files. 
This is usually faster because the COPY command is optimized for this application 
while allowing less flexibility than INSERT. An example would be:

COPY weather FROM '/home/user/weather.txt';

where the file name for the source file must be available on the machine running 
the backend process, not the client, since the backend process reads the file directly. 
You can read more about the COPY command in COPY.


Notice how the AS clause is used to relabel the output column. (The AS clause is optional.)

*/

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



SELECT * FROM weather;

     city      | temp_lo | temp_hi | prcp |    date    
---------------+---------+---------+------+------------
 San Francisco |      46 |      50 | 0.25 | 1994-11-27
 San Francisco |      43 |      57 |    0 | 1994-11-29
 Hayward       |      37 |      54 |      | 1994-11-29
(3 rows)




-- You can write expressions, not just simple column references, in the select list.
SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM weather;

     city      | temp_avg |    date    
---------------+----------+------------
 San Francisco |       48 | 1994-11-27
 San Francisco |       50 | 1994-11-29
 Hayward       |       45 | 1994-11-29
(3 rows)
-- Notice how the AS clause is used to relabel the output column. (The AS clause is optional.)

/*
A query can be "qualified" by adding a WHERE clause that specifies which rows are wanted. 
The WHERE clause contains a Boolean (truth value) expression, and only rows for which the 
Boolean expression is true are returned. The usual Boolean operators (AND, OR, and NOT) 
are allowed in the qualification. For example, the following retrieves the weather of 
San Francisco on rainy days:
*/

WHERE city = 'San Francisco' AND prcp > 0.0;
     city      | temp_lo | temp_hi | prcp |    date    
---------------+---------+---------+------+------------
 San Francisco |      46 |      50 | 0.25 | 1994-11-27
(1 row)


-- select in sorted order
SELECT * FROM weather
    ORDER BY city;

     city      | temp_lo | temp_hi | prcp |    date    
---------------+---------+---------+------+------------
 Hayward       |      37 |      54 |      | 1994-11-29
 San Francisco |      46 |      50 | 0.25 | 1994-11-27
 San Francisco |      43 |      57 |    0 | 1994-11-29
(3 rows)


-- Request duplicate rows be removed from query
SELECT DISTINCT city
FROM weather;
     city      
---------------
 Hayward
 San Francisco
(2 rows)


/*
While SELECT * is useful for off-the-cuff queries, it is widely considered bad style 
in production code, since adding a column to the table would change the results.

In some database systems, including older versions of PostgreSQL, the 
implementation of DISTINCT automatically orders the rows and so ORDER BY is unnecessary. 
But this is not required by the SQL standard, and current PostgreSQL does not 
guarantee that DISTINCT causes the rows to be ordered.


*/

































































