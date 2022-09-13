--NAME: Nehal Ghewade
--Roll NO: COTC21

***THIS QUERIES WILL ALSO RUN IN MYSQL***

--MariaDB [(none)]>show databases;
MariaDB [(none)]>create database lab;
MariaDB [(none)]>use lab;
MariaDB [lab]> create table emp (empno int(3),ename varchar(20),job varchar(20),deptno int(3),sal int(5));
Query OK, 0 rows affected (0.02 sec)

MariaDB [lab]> create table dept (deptno int(3),dname varchar(20),loc varchar(20));
Query OK, 0 rows affected (0.06 sec)

MariaDB [lab]> alter table emp modify empno int(3) primary key;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [lab]> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | int(3)      | NO   | PRI | NULL    |       |
| ename  | varchar(20) | YES  |     | NULL    |       |
| job    | varchar(20) | YES  |     | NULL    |       |
| deptno | int(3)      | YES  |     | NULL    |       |
| sal    | int(5)      | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.04 sec)

MariaDB [lab]> insert into emp values(1,'Mathi','AP',1,10000),(2,'Arjun','ASP',2,12000),(3,'Gunjan','ASP',2,20000),(4,'Karthik','AP',1,15000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [lab]> insert into dept values(1,'Acounting','New York'),(2,'Research','Dallas'),(30,'Sales','Chicago'),(40,'Operations','Boston');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [lab]> select * from emp;
+-------+---------+------+--------+-------+
| empno | ename   | job  | deptno | sal   |
+-------+---------+------+--------+-------+
|     1 | Mathi   | AP   |      1 | 10000 |
|     2 | Arjun   | ASP  |      2 | 12000 |
|     3 | Gunjan  | ASP  |      2 | 20000 |
|     4 | Karthik | AP   |      1 | 15000 |
+-------+---------+------+--------+-------+
4 rows in set (0.00 sec)

MariaDB [lab]> select * from dept;
+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|      1 | Acounting  | New York |
|      2 | Research   | Dallas   |
|     30 | Sales      | Chicago  |
|     40 | Operations | Boston   |
+--------+------------+----------+
4 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------
Query 1: Display all employee names and salary whose salary is greater than minimum salary of the company and job title starts with ‘A’.

MariaDB [lab]> select ename,sal from emp where sal>(select min(sal) from emp) and job like 'A%';
+---------+-------+
| ename   | sal   |
+---------+-------+
| Arjun   | 12000 |
| Gunjan  | 20000 |
| Karthik | 15000 |
+---------+-------+
3 rows in set (0.02 sec)


Query 2:Issue a query to find all the employees who work in the same job as Arjun.

MariaDB [lab]> select ename from emp where job=(select job from emp where ename='Arjun');
+--------+
| ename  |
+--------+
| Arjun  |
| Gunjan |
+--------+
2 rows in set (0.00 sec)

Query 3:Issue a query to display information about employees who earn more than any employee in dept 1.

MariaDB [lab]> select * from emp where sal>(select max(sal) from emp where deptno=1);
+-------+--------+------+--------+-------+
| empno | ename  | job  | deptno | sal   |
+-------+--------+------+--------+-------+
|     3 | Gunjan | ASP  |      2 | 20000 |
+-------+--------+------+--------+-------+
1 row in set (0.00 sec)

Query 4: Display the employee details, departments that the departments are same in both the emp and dept.

MariaDB [lab]> select * from emp,dept where emp.deptno=dept.deptno;
+-------+---------+------+--------+-------+--------+-----------+----------+
| empno | ename   | job  | deptno | sal   | deptno | dname     | loc      |
+-------+---------+------+--------+-------+--------+-----------+----------+
|     1 | Mathi   | AP   |      1 | 10000 |      1 | Acounting | New York |
|     4 | Karthik | AP   |      1 | 15000 |      1 | Acounting | New York |
|     2 | Arjun   | ASP  |      2 | 12000 |      2 | Research  | Dallas   |
|     3 | Gunjan  | ASP  |      2 | 20000 |      2 | Research  | Dallas   |
+-------+---------+------+--------+-------+--------+-----------+----------+
4 rows in set (0.00 sec)


Query 5::  Display the employee details, departments that the departments are not same in both the emp and dept.

MariaDB [lab]> select * from emp,dept where emp.deptno!=dept.deptno;
+-------+---------+------+--------+-------+--------+------------+----------+
| empno | ename   | job  | deptno | sal   | deptno | dname      | loc      |
+-------+---------+------+--------+-------+--------+------------+----------+
|     2 | Arjun   | ASP  |      2 | 12000 |      1 | Acounting  | New York |
|     3 | Gunjan  | ASP  |      2 | 20000 |      1 | Acounting  | New York |
|     1 | Mathi   | AP   |      1 | 10000 |      2 | Research   | Dallas   |
|     4 | Karthik | AP   |      1 | 15000 |      2 | Research   | Dallas   |
|     1 | Mathi   | AP   |      1 | 10000 |     30 | Sales      | Chicago  |
|     2 | Arjun   | ASP  |      2 | 12000 |     30 | Sales      | Chicago  |
|     3 | Gunjan  | ASP  |      2 | 20000 |     30 | Sales      | Chicago  |
|     4 | Karthik | AP   |      1 | 15000 |     30 | Sales      | Chicago  |
|     1 | Mathi   | AP   |      1 | 10000 |     40 | Operations | Boston   |
|     2 | Arjun   | ASP  |      2 | 12000 |     40 | Operations | Boston   |
|     3 | Gunjan  | ASP  |      2 | 20000 |     40 | Operations | Boston   |
|     4 | Karthik | AP   |      1 | 15000 |     40 | Operations | Boston   |
+-------+---------+------+--------+-------+--------+------------+----------+
12 rows in set (0.00 sec)

MariaDB [lab]> create table stud1 (regno int(3),name varchar(20),mark1 int(3),mark2 int(3),result varchar(10));
Query OK, 0 rows affected (0.00 sec)

MariaDB [lab]> create table stud2(name varchar(20),gra varchar(1));
Query OK, 0 rows affected (0.00 sec)

MariaDB [lab]> insert into stud1 values(101,'john',89,80,'pass');
Query OK, 1 row affected (0.00 sec)

MariaDB [lab]> insert into stud1 values(102,'raja',70,80,'pass');
Query OK, 1 row affected (0.00 sec)

MariaDB [lab]> insert into stud1 values(104,'sam',90,95,'pass');
Query OK, 1 row affected (0.00 sec)


MariaDB [lab]> insert into stud2 values('john','a'),('sam','a'),('sharin','c');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

-------------------------------------------------------------------------------------------------------------------------------------------
***JOINS***:

***INNER JOIN***:

MariaDB [lab]> select * from stud1;
+-------+------+-------+-------+--------+
| regno | name | mark1 | mark2 | result |
+-------+------+-------+-------+--------+
|   101 | john |    89 |    80 | pass   |
|   102 | raja |    70 |    80 | pass   |
|   104 | sam  |    90 |    95 | pass   |
+-------+------+-------+-------+--------+
3 rows in set (0.00 sec)

MariaDB [lab]> select * from stud2;
+--------+------+
| name   | gra  |
+--------+------+
| john   | a    |
| sam    | a    |
| sharin | c    |
+--------+------+
3 rows in set (0.00 sec)


MariaDB [lab]> select * from  stud1 inner join stud2 on stud1.name=stud2.name;
+-------+------+-------+-------+--------+------+------+
| regno | name | mark1 | mark2 | result | name | gra  |
+-------+------+-------+-------+--------+------+------+
|   101 | john |    89 |    80 | pass   | john | a    |
|   104 | sam  |    90 |    95 | pass   | sam  | a    |
+-------+------+-------+-------+--------+------+------+

-------------------------------------------------------------------------------------------------------------------------------------------

***Left outer join and Right outer join***:

MariaDB [lab]> select * from  stud1 left join stud2 on stud1.name=stud2.name;
+-------+------+-------+-------+--------+------+------+
| regno | name | mark1 | mark2 | result | name | gra  |
+-------+------+-------+-------+--------+------+------+
|   101 | john |    89 |    80 | pass   | john | a    |
|   104 | sam  |    90 |    95 | pass   | sam  | a    |
|   102 | raja |    70 |    80 | pass   | NULL | NULL |
+-------+------+-------+-------+--------+------+------+
3 rows in set (0.00 sec)

MariaDB [lab]> select * from  stud1 right join stud2 on stud1.name=stud2.name;
+-------+------+-------+-------+--------+--------+------+
| regno | name | mark1 | mark2 | result | name   | gra  |
+-------+------+-------+-------+--------+--------+------+
|   101 | john |    89 |    80 | pass   | john   | a    |
|   104 | sam  |    90 |    95 | pass   | sam    | a    |
|  NULL | NULL |  NULL |  NULL | NULL   | sharin | c    |
+-------+------+-------+-------+--------+--------+------+
3 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------

***Full outer join***:

MariaDB [lab]> select * from  stud1 left join stud2 on stud1.name=stud2.name union select * from  stud1 right join stud2 on stud1.name=stud2.name;
+-------+------+-------+-------+--------+--------+------+
| regno | name | mark1 | mark2 | result | name   | gra  |
+-------+------+-------+-------+--------+--------+------+
|   101 | john |    89 |    80 | pass   | john   | a    |
|   104 | sam  |    90 |    95 | pass   | sam    | a    |
|   102 | raja |    70 |    80 | pass   | NULL   | NULL |
|  NULL | NULL |  NULL |  NULL | NULL   | sharin | c    |
+-------+------+-------+-------+--------+--------+------+
4 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------

***Natural join***:

MariaDB [lab]> select * from stud1 join stud2 using(name);
+------+-------+-------+-------+--------+------+
| name | regno | mark1 | mark2 | result | gra  |select * from stud1 natural join stud2;
+------+-------+-------+-------+--------+------+
| john |   101 |    89 |    80 | pass   | a    |
| sam  |   104 |    90 |    95 | pass   | a    |
+------+-------+-------+-------+--------+------+
2 rows in set (0.00 sec)

MariaDB [lab]> select * from stud1 natural join stud2;
+------+-------+-------+-------+--------+------+
| name | regno | mark1 | mark2 | result | gra  |
+------+-------+-------+-------+--------+------+
| john |   101 |    89 |    80 | pass   | a    |
| sam  |   104 |    90 |    95 | pass   | a    |
+------+-------+-------+-------+--------+------+
2 rows in set (0.00 sec)
