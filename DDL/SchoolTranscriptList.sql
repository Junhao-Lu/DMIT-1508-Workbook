/* ************
* SchoolTranscript_Data.sql
*Dan Gilleland
************ */
USE SchoolTranscript
GO

-- SELECT	- The data/colums to retrieve
-- FROM		- The table(s) to search
-- WHERE	- Filters to apply in the search
-- GROUP BY	- Re-organizing Results into groups  ) Aggregation
-- HAVING	- Filter for grouping
-- ORER BY	- Sorting results

INSERT INTO Students(GivenName, Surname, DateOfBirth) -- notice no Enrolled column
VALUES ('DAN', 'Gilleland', '19720514 10:34:09 PM'),
	   ('Charles', 'Kuhn', '19990806 00:00:00 AM'),
	   ('Walter', 'Robinson', '19830302 00:00:00 AM'),
	   ('Luis', 'Soto', '19770107 00:00:00 AM'),
	   ('Ernest', 'Lynch', '19480605 00:00:00 AM')

SELECT * FROM Students

INSERT INTO Courses(Number, [Name], Credits, [Hours], Cost)
VALUES ('DMIT-1508', 'Database Fundamentals', 3.0, 60, 750),
	   ('CPSC-1012', 'Programming Fundamentals', 3.0, 60, 750),
	   ('DMIT-1720', 'OOP Fundamentals', 4.5, 90, 850),
	   ('DMIT-2210', 'Agile Development', 4.5, 90, 850),
	   ('DMIT-1718', 'Software', 4.5, 90, 850)

SELECT * FROM Courses

/* 
-- The following should fail, because of a check constraint
INSERT INTO Students(GivenName, Surname, DateOfBirth) -- notice no Enrolled column
VALUES ('DAN', 'Gilleland', '19720514 10:34:09 PM')
*/


SELECT Number, [Name], Credits, [Hours]
FROM	Courses
WHERE	[Name] LIKE '%Fundamentals%'

-- Write a query to get the first/last names of all students
-- Whose last name starts with a "G"


SELECT GivenName, Surname, DateOfBirth
FROM	Students
WHERE	GivenName LIKE '%G%' OR Surname LIKE '%G%'

-- Removing all the data from the Students table
DElETE FROM Students
DELETE FROM Courses 