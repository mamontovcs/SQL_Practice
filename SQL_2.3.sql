use University2

select t.Name from FACULTY, DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and  FACULTY.Name = '������������ �������' and t.Post ='���������'
union
select TEACHER.Name from TEACHER , DEPARTMENT where TEACHER.DepFK = DEPARTMENT.DepPK and DEPARTMENT.Name ='������� ������� ����������� ������������' and TEACHER.Post ='������'

select distinct t.Name  from FACULTY, DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and DEPARTMENT.HeadFK = t.TchPK
INTERSECT 
select TEACHER.Name from FACULTY ,TEACHER , DEPARTMENT , TEACHER t1  where TEACHER.DepFK = DEPARTMENT.DepPK and  FACULTY.FacPK = DEPARTMENT.FacFK and t1.TchPK = TEACHER.ChiefFK

select distinct t.Name  from LECTURE , DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and t.TchPK = LECTURE.TchFK and (LECTURE.Day = '���' or LECTURE.Day = '���') and LECTURE.Type = '������'
except
select distinct t.Name  from LECTURE , DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and t.TchPK = LECTURE.TchFK and LECTURE.Day = '���' and LECTURE.Day = '���' and LECTURE.Type = '������'
