--Name:Nehal Ghewade
--Roll NO: COTC21
--------------------------------------------------------------------------------------------------------------------------------------------
***ASSIG-4***

--create table borrower and fine :

CREATE TABLE borrower (roll_in INTEGER PRIMARY KEY,name varchar(10) NOT NULL,dateofissue date,namebook varchar(20),Status varchar(20));
CREATE TABLE fine (rollno INTEGER,FORIEGN KEY(rollno) references borrower(roll_in),returndate date,amount int);

--inserting values into borrower :

insert into table borrower values(1,'abc','2022-07-01','DBMS','PEN'),(2,'xyz','2022-08-01','OOPS','PEN'),(3,'pqr','2022-08-01','CNS','PEN')
,(4,'LMN','2022-06-01','TOC','PEN');

---stored procedure :

delimiter //
create procedure cal_fine_lib6(in roll int)
BEGIN
     declare fine1 int;
     declare noofdays int ;
     declare issuedate date;
     declare exit handler for SQLEXCEPTION select 'create table definition';
     select dateofissue into issuedate from borrower where rollin=roll;
     select datediff(curdate(),issuedate) into noofdays;
     if noofdays>15 and noofdays<=30 then
        set fine1 = noofdays*5;
        insert into fine values(roll,curdate(),fine1);
     elseif noofdays>30 then
        set fine1 = ((noofdays-30)*50)+15*5;
        insert into fine values(roll,curdate(),fine1);
     else
        insert into fine values(roll,curdate(),0);
     end if;
        update borrower set status='return' where rollin=roll;
END 
//

--call to procedure :
call  procedure cal_fine_lib6(1) $

--------------------------------------------------------------------------------------------------------------------------------------------
***ASSIG-5***

-- create table-stud_marks and result
create table stud_marks(roll_no int primary key,name char(10),total_marks int);
create table result(roll_no int,name char(30),class char(20));

--inserting values in stud_marks :

insert into stud_marks values(101,'xyz',933),(102,'abc',356),(103,'pqr',450),(104,'ert',675),(105,'afr',1300),(106,'xyw',250);

--create procedure :

delimiter//
create procedure proc_grade(in marks int,out class char(10))
BEGIN
  if marks<=1500 and marks>=990 then set class='DIST';
 end if;
 if marks<=989 and marks>=900 then set class='FC';
 end if;
 if marks<=899 and marks>=825 then set class='HSC';
 end if;
 if marks<=824 and marks>=750 then set class='SC';
 end if;
 if marks<=749 and marks>=650 then set class='PC';
 end if;
 if marks<650 then set class='FAIL';
 end if;
END;
//


-- create function find_result :

create function find_result(roll_in int) returns int deterministic
BEGIN
 declare fmarks int;
 declare grade char(10);
 declare stud_name char(10);
 select stud_marks.total_marks,stud_marks.name into fmarks,stud_name from
 stud_marks where stud_marks.roll_no=roll_in;   
 call proc_grade(fmarks,@grade);
 insert into  result values(roll_in,stud_name,@grade);
 return roll_in;
END;
//

