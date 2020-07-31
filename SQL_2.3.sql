use University2

select t.Name from FACULTY, DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and  FACULTY.Name = 'компьютерные системы' and t.Post ='профессор'
union
select TEACHER.Name from TEACHER , DEPARTMENT where TEACHER.DepFK = DEPARTMENT.DepPK and DEPARTMENT.Name ='Кафедра інженерії програмного забезпечення' and TEACHER.Post ='доцент'

select distinct t.Name  from FACULTY, DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and DEPARTMENT.HeadFK = t.TchPK
INTERSECT 
select TEACHER.Name from FACULTY ,TEACHER , DEPARTMENT , TEACHER t1  where TEACHER.DepFK = DEPARTMENT.DepPK and  FACULTY.FacPK = DEPARTMENT.FacFK and t1.TchPK = TEACHER.ChiefFK

select distinct t.Name  from LECTURE , DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and t.TchPK = LECTURE.TchFK and (LECTURE.Day = 'пон' or LECTURE.Day = 'втр') and LECTURE.Type = 'лекция'
except
select distinct t.Name  from LECTURE , DEPARTMENT, TEACHER t where t.DepFK = DEPARTMENT.DepPK and t.TchPK = LECTURE.TchFK and LECTURE.Day = 'срд' and LECTURE.Day = 'срд' and LECTURE.Type = 'лекция'
