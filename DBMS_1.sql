CREATE DATABASE Project;
--create db cmd
USE Project;
CREATE TABLE Author(A_ID int(5) NOT NULL,First_name varchar(15)NOT NULL,Last_name varchar(20),
Published_date DATE,Country VARCHAR(20),PRIMARY KEY (A_ID),Title varchar(25) UNIQUE);
--create table struct cmd using keyword-not null,unique,primary key
INSERT INTO Author VALUES(12345,'Nehal','Ghewade',22-04-09,'India','Percy Jackson');
--insert cmd  
SELECT*FROM Author WHERE First_name LIKE'ri%';
--like for string matching
SELECT DISTINCT first_name from Author;
--distnct for unique val 
SELECT*FROM Author WHERE First_name LIKE'%ri%';

SELECT* FROM Author ORDER BY First_name DESC;
--order by desceding
CREATE TABLE Author_2(A_ID int(5) NOT NULL,First_name varchar(15)NOT NULL,Last_name varchar(20),
Published_date DATE,Country VARCHAR(20),PRIMARY KEY (A_ID),
Title varchar(25) UNIQUE DEFAULT"unknown",AUTO_INCREMENT A_ID);
UPDATE Author SET first_name="nehal" WHERE A_ID=1;
--update
DELETE FROM Author WHERE last_name="ghewade";
--for delting record
DROP TABLE AUTHOR;
--drop
ALTER TABLE Author ADD dob DATE,nick_name varchar(20);
--alter-add
ALTER TABLE Author MODIFY First_name varchar(20);
SELECT*FROM Author INNER JOIN Author_2 USING country;
--inner join
SELECT *FROM Author WHERE country IN(SELECT country FROM Author);
--in
SELECT country FROM Author UNION SELECT country FROM Author_2;
--union
SELECT Published_date FROM Author WHERE Published_date BETWEEN 22-08-01 AND 22-01-01;
--between
