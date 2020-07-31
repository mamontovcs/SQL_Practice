use University2;

Select t1.Name as 'Преподаватель' , t1.Post as 'Должность' ,(t1.Commission + t1.Salary) as 'ЗП' , t3.Name as 'Декан' from FACULTY f1, DEPARTMENT d1 , TEACHER t1 , TEACHER t3
where d1.DepPK = f1.FacPK and t1.DepFK = d1.DepPK and d1.Name = 'Кафедра інженерії програмного забезпечення'
and (t1.Commission + t1.Salary) > 
(Select (t2.Commission + t2.Salary) from DEPARTMENT as d2 , TEACHER as t2
where d2.DepPK = t2.DepFK and t2.Name = 'Виталий' and d2.Name = 'Кафедра інженерії програмного забезпечення')
and d1.HeadFK = t3.TchPK 

Select f1.Name from FACULTY f1, DEPARTMENT d1 , TEACHER t1
where f1.FacPK = d1.FacFK and t1.DepFK = d1.DepPK 
Group by f1.Name
Having
count(t1.TchPK) > ( Select count(t2.TchPK) from FACULTY f1, DEPARTMENT d1 , TEACHER t2
where d1.FacFK = f1.FacPK and t2.DepFK = d1.DepPK and t2.Post= 'профессор' Having
count(t2.TchPK) < 20)


Select distinct f1.Name , t2.Name from FACULTY f1, DEPARTMENT d1 , TEACHER t1 , TEACHER t2
where f1.FacPK = d1.FacFK and t1.DepFK = d1.DepPK and EXISTS(Select t.TchPK from FACULTY f, DEPARTMENT d , TEACHER t
where f.FacPK = d.FacFK and t.DepFK = d.DepPK and t.Post = 'профессор') and
d1.HeadFK = t2.TchPK

Select distinct f1.Name  from FACULTY f1, DEPARTMENT d1
where f1.Fund > 
ALL(Select d.Fund from FACULTY f, DEPARTMENT d where
d.FacFK = f.FacPK and f.Name = 'ФК КПІ')

Select distinct t1.Name , s1.Num , s1.Course, count(l.Lesson) as 'Количество занятий' from FACULTY f1, DEPARTMENT d1 , TEACHER t1 , SGROUP s1 , LECTURE l
where f1.FacPK = d1.FacFK and t1.DepFK = d1.DepPK and s1.DepFK = d1.DepPK and s1.Num = 320 and s1.Course = 3 and l.TchFK = t1.TchPK
Group by t1.Name , s1.Num , s1.Course
Having count(l.Lesson) > (Select count(l2.Lesson) from FACULTY f2, DEPARTMENT d2 , TEACHER t2 , SGROUP s2 , LECTURE l2
where f2.FacPK = d2.FacFK and t2.DepFK = d2.DepPK and s2.DepFK = d2.DepPK and l2.TchFK = t2.TchPK and s2.Course = 3 and s2.Num = 320 and t2.Name = 'Bob')

select sub.AvgSub
from (select avg(s.SbjPK) as AvgSub
from faculty f, department d, SUBJECT s , TEACHER t , LECTURE l
where f.FacPK=d.FacFK and d.DepPK= t.DepFK and l.TchFK = t.TchPK) sub;

Select distinct FACULTY.Name ,
(select count(DEPARTMENT.DepPK) 
from DEPARTMENT 
where DEPARTMENT.FacFK = FACULTY.FacPK) as CountDep  ,
(select sum (SGROUP.Quantity) from SGROUP , DEPARTMENT
where SGROUP.DepFK = DEPARTMENT.DepPK and SGROUP.Course = 3 and FACULTY.FacPK = DEPARTMENT.FacFK) as KEK
from FACULTY 

