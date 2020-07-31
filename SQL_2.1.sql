use University2

Select Count(Name) as '�-�� ���������' from SUBJECT

Select Count(SUBJECT.Name) from FACULTY,DEPARTMENT,SGROUP,SUBJECT
Where
FACULTY.Name = '�� �ϲ' and
FACULTY.FacPK = DEPARTMENT.FacFK and
DEPARTMENT.DepPK = SGROUP.DepFK

Select avg(SGROUP.Quantity) as 'C������ ���������� ���������' from FACULTY,DEPARTMENT,SGROUP,SUBJECT
Where
FACULTY.Name = '�� �ϲ' and
FACULTY.FacPK = DEPARTMENT.FacFK and
DEPARTMENT.DepPK = SGROUP.DepFK


SELECT FACULTY.Name , FACULTY.Fund - SUM(DEPARTMENT.Fund)  FROM FACULTY , DEPARTMENT
where DEPARTMENT.FacFK = FACULTY.FacPK
GROUP BY FACULTY.Name , FACULTY.Fund


SELECT (TEACHER.Salary + TEACHER.Commission) as '��������' , COUNT(TEACHER.TchPK) as '���-�� ��������������'  , 
COUNT(distinct TEACHER.DepFK) as '���-�� ������'  FROM FACULTY , DEPARTMENT , TEACHER , Dekan
where
TEACHER.DepFK = DEPARTMENT.DepPK and
DEPARTMENT.FacFK = FACULTY.FacPK and
FACULTY.FacPK = Dekan.FacFK and
Dekan.Name = '������'
GROUP BY TEACHER.Salary + TEACHER.Commission

Create table Dekan (
DekanPk int Primary Key,
FacFK int Foreign key references Faculty(FacPK),
Name varchar(20)
)


SELECT t.NAME AS 'Name' ,t.Post AS 'Post', COUNT(distinct s.SbjPK) AS '�-�� ���������' FROM LECTURE l , SGROUP g, TEACHER t, SUBJECT s, FACULTY f, DEPARTMENT d
WHERE f.Name = '�� �ϲ' and
f.FacPK = d.FacFK and
t.DepFK = d.DepPK and
l.TchFK = t.TchPK 
GROUP BY T.Name , T.Post ,  S.SbjPK
HAVING COUNT(l.RomFK) < 3 AND COUNT(g.GrpPK) < 4

SELECT distinct t.NAME AS 'Name' ,t.Post AS 'Post', COUNT(distinct s.SbjPK) AS '�-�� ���������' FROM LECTURE l ,Room r, SGROUP g, TEACHER t, SUBJECT s, FACULTY f, DEPARTMENT d
WHERE f.Name = '�� �ϲ' and
f.FacPK = d.FacFK and
t.DepFK = d.DepPK and
l.TchFK = t.TchPK and
r.RomPK = l.RomFK and
g.GrpPk = l.GrpFK 
group by T.Name , T.Post ,  S.SbjPK
HAVING COUNT(l.RomFK) < 3 AND COUNT(l.GrpFK) < 4


SELECT ROOM.Num , DEPARTMENT.Name FROM DEPARTMENT , ROOM , SGROUP , LECTURE
WHERE LECTURE.RomFK = ROOM.RomPK and
SGROUP.GrpPK = LECTURE.RomFK and
SGROUP.Course = 3 and
DEPARTMENT.Building = 6
order by ROOM.Num asc , DEPARTMENT.Name desc