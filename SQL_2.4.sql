use University2

Create view DEP_FND as 
select *
from DEPARTMENT
where DEPARTMENT.Fund Between 20000 and 25000

select * 
from DEP_FND
where DEP_FND.Building Between 1 and 4

Select * from DEP_FND
where DEP_FND.Fund = 21000

Select * from DEP_FND
where DEP_FND.Fund = 22000

drop view DEP_FND;