INSERT INTO FACULTY VALUES
(1,'informatics',NULL,5,573988.00),
(2,'economy',NULL,3,NULL),
(3,'linguistics',NULL,4,NULL)

INSERT INTO DEPARTMENT  VALUES
(1,1,'SE',NULL,5,20378.00),
(2,1,'CAD',NULL,5,21000.00),
(3,1,'DBMS',NULL,4,22000.00),
(4,2,'Accounts',NULL,3,NULL)

INSERT INTO TEACHER   VALUES
(1,1,'Andrew','���������','2281319','01.02.2001',1250,80,NULL),
(2,1,'John','���������','2281550 ','01.07.2001',1400,150,1),
(3,2,'Bill','�������������',NULL,'17.11.2002',1240,80,1),
(4,2,'Albert','���������',NULL,'11.11.2001',1260,100,4)

INSERT INTO SGROUP  VALUES
(1,1,1,101,33,4,20),
(2,1,1,102,35,3,22),
(3,3,2,205,20,1,15),
(4,3,3,305,25,NULL,40),
(5,3,4,405,25,2,37)

INSERT INTO [SUBJECT] VALUES
(1,'pascal'),
(2,'C'),
(3,'OS'),
(4,'inernet'),
(5,'dbms')

INSERT INTO ROOM  VALUES
(1,101,20,1,5),
(2,316,150,3,5),
(3,201,150,2,2),
(4,202,30,2,5)

INSERT INTO LECTURE   VALUES
(1,1,1,1,'������','���',1,1),
(1,2,2,1,'������������','���',1,2),
(2,3,3,1,'������','���',1,3),
(2,4,4,2,'��������','���',1,3),
(4,4,5,2,'��������','���',2,4),
(4,4,5,3,'�������','���',2,1)

INSERT INTO FACULTY VALUES
(4,'�� �ϲ',NULL,6,1000000.00)

INSERT INTO DEPARTMENT  VALUES
(5,4,'������� ������� ����������� ������������',NULL,6,21000.00)

INSERT INTO TEACHER   VALUES
(5,5,'�������� ����� ��������','���������','444444','01.02.2010',2000,80,NULL),
(6,5,'�������� ������ �������������','������','66666','01.02.2009',1900,50,5),
(7,5,'������������ ��� ���������','�������������','55555','01.02.2001',1900,50,6),
(8,5,'���������� ��� �������','�������������','7777','01.02.2010',1800,80,7)

Update FACULTY
SET DeanFK = 5
WHERE FacPK = 4

Update DEPARTMENT
SET HeadFK = 6
WHERE DepPK = 5

INSERT INTO SGROUP  VALUES
(6,5,3,320,28,NULL,80)

INSERT INTO [SUBJECT] VALUES
(6,'Documents'),
(7,'SQL'),
(8,'Visualization'),
(9,'Artificial Intelligence'),
(10,'Software Design')


INSERT INTO ROOM  VALUES
(5,6200,180,2,6),
(6,6201,150,2,6),
(7,6313,30,3,6),
(8,6311,30,3,6)

INSERT INTO LECTURE   VALUES
(7,6,6,5,'������','���',1,1),
(8,6,6,8,'������������','���',1,2)

INSERT INTO TEACHER   VALUES
(9,1,'Bob','���������','2281319','01.02.2001',1250,80,NULL)

Update FACULTY 
SET DeanFK = 9 , Fund =  340067.00 
WHERE [Name] = 'economy'


INSERT INTO TEACHER   VALUES
(10,1,'Frank','���������','2281319','01.02.2001',1100,80,9)

Update DEPARTMENT  
SET Building = 3, HeadFK = 10
WHERE DepPK = 3


Update TEACHER  
SET Commission = (Salary / 100 ) * 25
WHERE Post = '���������'

Update SGROUP   
SET Rating = 0
WHERE Course = 1 


Update SUBJECT    
SET [Name] = 'html'
WHERE [Name] = 'internet'