Create database University2

use University2

Create table FACULTY (
FacPK  int PRIMARY KEY,
[Name] varchar(50) UNIQUE NOT NULL,
DeanFK int,
Building char(2)
CHECK(Building BETWEEN 1 AND 10),
Fund decimal(9,2)
CHECK (Fund > 100000.00)
)

Create table DEPARTMENT  (
DepPK int PRIMARY KEY,
FacFK int,
[Name] varchar(50) UNIQUE NOT NULL,
HeadFK int,
Building char(2)
CHECK(Building BETWEEN 1 AND 10),
Fund decimal(8,2)
CHECK (Fund > 20000.00 AND FUND < 100000.00)
)

Create table TEACHER   (
TchPK int PRIMARY KEY,
DepFK  int,
[Name] varchar(50) UNIQUE NOT NULL,
Post varchar(15)
CHECK(Post = 'ассистент' OR Post = 'преподаватель' OR Post = 'доцент' OR Post = 'профессор'),
Tel char(7),
Hiredate date NOT NULL
Check(Hiredate > '01.01.1950'),
Salary decimal(6,2) NOT NULL
Check(Salary > 1000),
Commission decimal(6,2) default 0
Check (Commission >= 0),
ChiefFK int
)

Create table SGROUP    (
GrpPK int PRIMARY KEY,
DepFK int,
Course decimal(1)
Check(Course >= 1 AND Course <= 6 ),
Num decimal(3) 
CHECK(Num BETWEEN 0 AND 700),
Quantity decimal(2)
CHECK(Quantity BETWEEN 1 AND 50),
Curator int,
Rating decimal(3) default 0
CHECK(Rating BETWEEN 0 AND 100),
)

Create table [SUBJECT] (
SbjPK int PRIMARY KEY,
[Name] varchar(50) UNIQUE NOT NULL
)

Create table ROOM     (
RomPK int PRIMARY KEY,
Num decimal(4) NOT NULL,
Seats decimal(3)
Check(Seats BETWEEN 1 AND 300),
[Floor] decimal(2)
Check([Floor] BETWEEN 1 AND 16),
Building char(5) NOT NULL
CHECK(Building BETWEEN 1 AND 10),
)

Create table LECTURE (
TchFK int,
GrpFK int,
SbjFK int,
RomFK int,
[Type] varchar(15) NOT NULL
Check([Type] = 'лекция' OR [Type] = 'лабораторная' OR [Type] = 'семинар' OR [Type] = 'практика' ),
[Day] char(3)  NOT NULL
Check([Day] = 'пон' OR [Day] = 'втр' OR [Day] = 'срд' OR [Day] = 'чет' OR [Day] = 'пят' OR [Day] = 'суб' OR [Day] = 'вск'),
[Week] decimal(1) NOT NULL
Check([Week] = 1 OR [Week] = 2),
Lesson decimal(1) NOT NULL
Check(Lesson BETWEEN 1 AND 8)

FOREIGN KEY (TchFK) REFERENCES TEACHER(TchPK) ON DELETE SET NULL,
FOREIGN KEY (GrpFK) REFERENCES SGROUP(GrpPK) ON DELETE CASCADE,
FOREIGN KEY (SbjFK) REFERENCES [SUBJECT](SbjPK) ON DELETE CASCADE ,
FOREIGN KEY (RomFK) REFERENCES ROOM(RomPK) ON DELETE SET NULL
)

ALTER TABLE FACULTY 
					ADD CONSTRAINT fk_faculty_dep
					FOREIGN KEY (DeanFK) 
					REFERENCES Teacher(TchPK);



ALTER TABLE DEPARTMENT 
					ADD CONSTRAINT fk_dep_fac
					FOREIGN KEY (FacFK) 
					REFERENCES FACULTY(FacPK);

ALTER TABLE DEPARTMENT 
					ADD CONSTRAINT fk_dep_teach
					FOREIGN KEY (HeadFK ) 
					REFERENCES TEACHER(TchPK);

ALTER TABLE DEPARTMENT  
ADD CONSTRAINT Name_FK_Uniq UNIQUE (FacFK, [Name]);  


ALTER TABLE TEACHER  
					ADD CONSTRAINT fk_teach_dep
					FOREIGN KEY (DepFK) 
					REFERENCES DEPARTMENT(DepPK);

ALTER TABLE TEACHER  
					ADD CONSTRAINT fk_teach_teach
					FOREIGN KEY (ChiefFK ) 
					REFERENCES TEACHER(TchPK );


ALTER TABLE SGROUP   
					ADD CONSTRAINT fk_skgr_dep
					FOREIGN KEY (DepFK) 
					REFERENCES DEPARTMENT(DepPK);

ALTER TABLE SGROUP   
					ADD CONSTRAINT fk_skgr_teach
					FOREIGN KEY (Curator) 
					REFERENCES TEACHER(TchPK);

ALTER TABLE SGROUP  
ADD CONSTRAINT Dep_FK_Num_Uniq UNIQUE (DepFK, Num);  

ALTER TABLE SGROUP  
ADD CONSTRAINT Dep_FK_Curator_Uniq UNIQUE (DepFK, Curator);  

ALTER TABLE ROOM   
ADD CONSTRAINT Num_Building_Uniq UNIQUE (Num, Building);

ALTER TABLE LECTURE    
ADD CONSTRAINT GrpFK_Day_Week_Lesson_Uniq UNIQUE (GrpFK, [Day], [Week], Lesson);

ALTER TABLE LECTURE    
ADD CONSTRAINT TchFK_Day_Week_Lesson_Uniq UNIQUE (TchFK, [Day], [Week], Lesson);


