Create database CourseWork

use CourseWork

Create table COMPANY (
CompanyPK int PRIMARY KEY,
CompanyName varchar(30) UNIQUE NOT NULL,
CompanyID int UNIQUE NOT NULL
)

Create table DEPARTMENT (
DepPK int PRIMARY KEY,
DepName varchar(30) NOT NULL,
CompFK int foreign key references Company(CompanyPK) NOT NULL
)

Create table PROJECT (
ProjectPK int PRIMARY KEY, 
ProjectName varchar(30) NOT NULL,
DepFK int foreign key references DEPARTMENT(DepPK) NOT NULL
)

Create table EMPLOYEE (
EmpPK int PRIMARY KEY, 
EmpName varchar(30) NOT NULL,
EmpSurname varchar(30) NOT NULL,
EmpPatronymic varchar(30) NOT NULL,
EmpPhoneNumber varchar(30) UNIQUE NOT NULL,
EmpAddress varchar(30) UNIQUE NOT NULL,
ProjectFK int foreign key references PROJECT(ProjectPK) NOT NULL,
ChiefFK int foreign key references EMPLOYEE(EmpPK),
EmpBirthday date ,
EmpID int UNIQUE NOT NULL
)

Create table POST (
PostPK int PRIMARY KEY, 
PostName varchar(30) UNIQUE NOT NULL,
EmpFK int foreign key references EMPLOYEE(EmpPK) NOT NULL,
)

Create table DOCTYPE (
DocTypePK int PRIMARY KEY, 
DocTypeName varchar(30) UNIQUE NOT NULL,
)

Create table DOCUMENT (
DocPK int PRIMARY KEY, 
DocID int UNIQUE,
DocName varchar(30) NOT NULL,
DocTypeFK int foreign key references DOCTYPE(DocTypePK) NOT NULL,
CreatorFK int foreign key references EMPLOYEE(EmpPK) NOT NULL,
PerformerFK int foreign key references EMPLOYEE(EmpPK) NOT NULL,
CreateDate date
)

Create table TASK(
TaskPK int PRIMARY KEY, 
TaskName varchar(30) NOT NULL,
DocFK int foreign key references DOCUMENT(DocPK) NOT NULL,
TaskStatus varchar(15) NOT NULL
Check(TaskStatus = 'To Do' OR TaskStatus = 'In progress' OR TaskStatus = 'Done' ),
TaskID int UNIQUE NOT NULL
)

Select e.EmpName as 'Имя' , e.EmpSurname as 'Фамилия' , e.EmpPatronymic as 'Отчество' , e.EmpPhoneNumber as 'Номер телефона' ,
e.EmpAddress as 'Адрес' , e.EmpBirthday as 'Дата рождения', p.ProjectName as 'Название проекта' from EMPLOYEE as e , PROJECT as p
Where e.ProjectFK = p.ProjectPK and p.ProjectName = 'DXC'

Select e.EmpName as 'Имя' , e.EmpSurname as 'Фамилия'  from EMPLOYEE as e , DOCUMENT as d
Where d.PerformerFK = e.EmpPK
group by e.EmpName ,  e.EmpSurname
having count(d.DocID) > 1

Select p.ProjectName as 'Назва проекту' from PROJECT p , EMPLOYEE e
where e.ProjectFK =p.ProjectPK 
group by p.ProjectName
having count(e.EmpID) > 10

SELECT count(e.EmpID) FROM PROJECT pr , POST p , EMPLOYEE e
where e.ProjectFK = pr.ProjectPK and e.PostFK = 2

Select d.DocName , dt.DocTypeName from DOCUMENT d , DOCTYPE dt
where d.DocTypeFK = dt.DocTypePK and dt.DocTypeName ='Наказ'

Select d.DocName from DOCUMENT d ,PROJECT p , EMPLOYEE e
where d.PerformerFK = e.EmpPK and e.ProjectFK = p.ProjectPK and p.ProjectName = 'DXC'

