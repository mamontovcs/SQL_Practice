Create database University

use University

Create table FACULTY (
FacNo int,
[Name] char(20),
Building char(5)
)

Create table DEPARTMENT (
DepNo int ,
FacNo int ,
[Name] varchar(50),
Head varchar(50),
Building decimal(2),
Fund decimal(7,2) ,
)

Create table TEACHER  (
TchNo int ,
DepNo int ,
[Name] varchar(50),
Post varchar(20),
Tel char(7),
Hiredate Date
)

Create table SGROUP   (
GrpNo  int ,
DepNo int ,
Course  char(1),
Num  char(3),
Quantity  decimal(2),
Curator  int
)

Create table [SUBJECT]    (
SbjNo   int ,
[Name]  varchar(50)
)


Create table ROOM     (
RomNo  int ,
Num  decimal(4),
Seats decimal(3)
)

Create table LECTURE (
TchNo   int ,
GrpNo  int,
SbjNo int,
RomNo int,
[Type] varchar(25),
[Day] char(10),
[Week] decimal(1)
)

ALTER TABLE FACULTY  
ALTER COLUMN [Name] VARCHAR(20)

ALTER TABLE FACULTY
ADD Dean VARCHAR(50)

ALTER TABLE FACULTY  
ADD Fund  decimal(7,2)

ALTER TABLE DEPARTMENT   
ALTER COLUMN Building char(5)

ALTER TABLE TEACHER 
ADD Salary decimal(6,2)

ALTER TABLE TEACHER   
ADD Commission decimal(6,2)

ALTER TABLE SGROUP   
ALTER COLUMN Course decimal(1)

ALTER TABLE SGROUP   
ALTER COLUMN Num  decimal(3)

ALTER TABLE SGROUP   
ADD Rating decimal(3)

ALTER TABLE ROOM    
ADD [Floor]  decimal(2)

ALTER TABLE ROOM    
ADD Building  char(5)

ALTER TABLE LECTURE    
ADD Lesson  decimal(1)

ALTER TABLE LECTURE    
ALTER COLUMN [Day]  char(3)
