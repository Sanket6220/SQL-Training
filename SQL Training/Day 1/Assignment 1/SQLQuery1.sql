create database CompanyDB

create table DEPT
(
  DEPTNO int primary key,
  DName varchar(20),
  LOC varchar(30)
  )

 insert into DEPT values(10,'Accounting','New York'),(20,'Research','Dallas'),(30,'Sales','Chicago'),
(40,'Operations','Boston')

select * from DEPT

create table EMP
(
  EMPNO int primary key,
  EName varchar(20),
  JOB varchar(30),
  MGRID int,
  HIREDATE varchar,
  SALARY int,
  COMM int,
  DEPTNO int references DEPT(DEPTNO)
  )

  select *from EMP

  insert into EMP values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',160,300,30),
						(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),(7566,'JONES','MANAGER',7839,'28-SEP-81',2975,null,20),
						(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,null,30),
						(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,null,10),(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,null,20),
						(7839,'KING','PRESIDENT',null,'17-NOV-81',5000,null,10),(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30),
						(7876,'ADAMS','CLERK',7788,'23-MAY-87',1500,null,20),(7900,'JAMES','CLERK',7698,'03-DEC-81',950,null,30),
						(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,null,20),(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,null,10)
