/* ************
* SchoolTranscript_Data.sql
*Dan Gilleland
************ */
USE SchoolTranscript
GO

INSERT INTO Students(GivenName, Surname, DateOfBirth) -- notice no Enrolled column
VALUES ('DAN', 'Gilleland', '19720514 10:34:09 PM')

SELECT * FROM Students