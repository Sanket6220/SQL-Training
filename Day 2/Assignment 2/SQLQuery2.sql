--self join 

select e2.EName , e1.SALARY , e1.EName as ManagerNAME from EMP e1 JOIN EMP e2 on e1.EMPNO = e2.MGRID 


--select e1.EMPNO ,count(e2.EMPNO) as 'No. of Employee' from EMP e1 join EMP e2 on e1.MGRID = e2.EMPNO group by e1.MGRID,e1.EName
select MGRID, count (EMPNO) as 'No. of Employee'  from EMP group by MGRID order by 'No. of Employee' desc

select * from EMP
select * from DEPT

------------------------------------------------------------------------------------
--subquery 
--EX 1 ) 
select EName , SALARY , JOB from EMP where JOB = (select job from EMP where EMPNO = 7521) 
and SALARY > (select SALARY from EMP where EMPNO = 7844)

--EX 2) 
select EName , SALARY , JOB from EMP where 
SALARY = (select min(SALARY) from EMP)

--EX 3) 
select DEPTNO , min(SALARY) as MinimumSALARY from EMP group by DEPTNO 
having min(SALARY)>(select min(SALARY) from EMP where DEPTNO = 20)

--MultiROW operations Subquery (in , any , all)
--EX) 
select EName , JOB , SALARY from EMP where SALARY > all
(select SALARY from EMP where JOB = 'CLERK') and JOB <> 'CLERK'

------------------------------------------------------------------------------------------------------
-- Assignment 2 

--1)
select EName as 'ALL MANAGERS' from EMP where (EMPNO IN (select MGRID from EMP))

--2)
select EName ,SALARY from EMP where SALARY >1000

--3) 
select EName , SALARY from EMP where EName != 'JAMES'

--4)
select EName from EMP where EName LIKE ('S%')

--5)
select EName from EMP where EName LIKE ('%A%')

--6) 
select EName from EMP where EName LIKE ('___l%')

--7) 
select EName, SALARY as 'MONTHLYSALARY', SALARY/31 as 'DAILYSALARY' from EMP where EName like 'JONES'

--8)
select sum(SALARY) as 'Total Monthly SALARY' from EMP 

--9)
select avg(SALARY*12) as 'AVG ANNUAL SALARY' from EMP

--10)
select EName , JOB , SALARY , DEPTNO from EMP where DEPTNO != 30 and JOB != 'SALESMAN'

--11)
select Distinct (EMP.DEPTNO ), DEPT.DName from EMP join DEPT on EMP.DEPTNO = DEPT.DEPTNO

--12) 
select EName as Employee , SALARY as MonthlySALARY from EMP where (DEPTNO = 20 or DEPTNO = 30) and SALARY> 1500

--13)
Select EName , JOB , SALARY from EMP where (JOB = 'MANAGER' or JOB = 'ANALYST') and SALARY != 1000 and SALARY != 3000 and SALARY != 5000 

--14
select EName , SALARY , COMM ,(SALARY+ SALARY * 0.1) as 'SALARY RAISED BY 10%' from EMP where COMM > (SALARY+ SALARY * 0.1)

--15) 
select EName , DEPTNO , MGRID from EMP where EName like '%l%l%' and (DEPTNO = 30 or MGRID = 7782)

--16)
select EName from EMP 

--17) 
select DEPT.DName , EMP.EName from EMP , DEPT where EMP.DEPTNO = DEPT.DEPTNO order by DName asc , EName desc 

--18)
