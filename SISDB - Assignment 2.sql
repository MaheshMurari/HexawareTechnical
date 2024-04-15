/*Task-1*/
Create table Students(
student_id int Primary Key,
first_name varchar(20),
last_name varchar(30),
date_of_birth date,
email varchar(20),
phone_number varchar(10))

alter table teacher alter column email varchar(30)

Create table Teacher(
teacher_id int Primary Key,
first_name varchar(20),
last_name varchar(30),
email varchar(20))

Create table Courses(
course_id int Primary Key,
course_name varchar(20),
credits int,
teacher_id int references Teacher(teacher_id))

Create table Payments(
payment_id int Primary Key,
student_id int references Students(student_id),
amount int,
payment_date date)

Create table Enrollments(
enrollment_id int Primary Key,
student_id int references Students(student_id),
course_id int references Courses(course_id),
enrollment_date date)

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Aarav', 'Patel', '2000-05-15', 'aarav.patel@exe.com', '9876543210'),
(2, 'Ananya', 'Sharma', '2001-08-20', 'ananya.@exe.com', '8765432109'),
(3, 'Arjun', 'Gupta', '1999-12-10', 'arjun.gupta@exe.com', '7654321098'),
(4, 'Aisha', 'Khan', '2002-03-25', 'aisha.khan@exe.com', '6543210987'),
(5, 'Aditi', 'Yadav', '2000-06-18', 'aditi.yadav@exe.com', '5432109876'),
(6, 'Aryan', 'Singh', '2001-02-08', 'aryan.singh@exe.com', '4321098765'),
(7, 'Anjali', 'Verma', '1998-09-30', 'anjali.verma@exe.com', '3210987654'),
(8, 'Amit', 'Reddy', '2003-01-12', 'amit.reddy@exe.com', '2109876543'),
(9, 'Akash', 'Joshi', '2000-07-28', 'akash.joshi@exe.com', '1098765432'),
(10, 'Aditya', 'Shah', '1999-04-05', 'aditya.shah@exe.com', '9876543210');

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Dr.Vishal', 'Sharma', 'vishal.s@exe.com'),
(2, 'Prof.Nandini', 'Patil', 'nandini.p@exe.com'),
(3, 'Dr.Vivek', 'Singh', 'vivek.singh@exe.com'),
(4, 'Prof.Neha', 'Kumar', 'neha.kumar@exe.com'),
(5, 'Dr.Ravi', 'Gupta', 'ravi.gupta@exe.com'),
(6, 'Prof.Priya', 'Shah', 'priya.shah@exe.com'),
(7, 'Dr.Rahul', 'Verma', 'rahul.verma@exe.com'),
(8, 'Prof.Sneha', 'Malhotra', 'sneha.m@exe.com'),
(9, 'Dr.Aditya', 'Jain', 'aditya.jain@exe.com'),
(10, 'Prof.Tanvi', 'Reddy', 'tanvi.reddy@exe.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Computer Science', 4, 1),
(2, 'History', 3, 2),
(3, 'Computer Science', 5, 1),
(4, 'Literature', 3, 4),
(5, 'Physics', 4, 5),
(6, 'Chemistry', 4, 6),
(7, 'Biology', 4, 7),
(8, 'Economics', 3, 8),
(9, 'Geography', 3, 9),
(10, 'Political Science', 3, 10);

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 5000, '2024-04-01'),
(2, 2, 6000, '2024-04-02'),
(3, 3, 5500, '2024-04-03'),
(4, 4, 5200, '2024-04-04'),
(5, 5, 4800, '2024-04-05'),
(6, 6, 5300, '2024-04-06'),
(7, 7, 5800, '2024-04-07'),
(8, 8, 5700, '2024-04-08'),
(9, 9, 5100, '2024-04-09'),
(10, 10, 5400, '2024-04-10');
delete from payments where student_id=10;
INSERT INTO Payments VALUES(11, 3, 10000, '2024-4-10') 
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-04-01'),
(2, 2, 2, '2024-04-02'),
(3, 3, 3, '2024-04-03'),
(4, 4, 4, '2024-04-04'),
(5, 5, 5, '2024-04-05'),
(6, 6, 6, '2024-04-06'),
(7, 7, 7, '2024-04-07'),
(8, 8, 8, '2024-04-08'),
(9, 9, 9, '2024-04-09'),
(10, 10, 10, '2024-04-10');
delete from Enrollments where student_id=10;

/*Task-2*/
/*1*/
insert into Students values('12','john','doe','1995-08-15','john.doe@example.com','1234567890')
/*2*/
INSERT INTO Enrollments VALUES (11, 4, 10, '2024-04-10');

/*3*/
UPDATE Teacher SET email = 'vishal.s@email.com'
WHERE teacher_id = 1;

/*4*/
DELETE FROM Enrollments WHERE student_id = 1 AND course_id = 1;

/*5*/
UPDATE Courses SET teacher_id = 2 WHERE course_id = 10;

/*6*/
DELETE FROM Teacher WHERE teacher_id = 1;
DELETE FROM Enrollments WHERE student_id = 1;
DELETE FROM courses WHERE course_id= 1;

ALTER TABLE Enrollments
DROP CONSTRAINT FK_Studentid; 
ALTER TABLE Enrollments
ADD CONSTRAINT FK_Studentid 
FOREIGN KEY (student_id) REFERENCES Students(student_id)
ON DELETE CASCADE;

/*7*/
UPDATE Payments SET amount = 15000
WHERE payment_id = 3;

SELECT * from Enrollments;

/*Task-3*/

/*1*/
SELECT s.first_name,s.last_name,SUM(p.amount) AS total
FROM Payments p
JOIN Students s ON s.student_id=p.student_id
where s.student_id =3
group by s.first_name,s.last_name

/*2*/
SELECT c.course_id,c.course_name,count(e.student_id) as totalenroll
FROM Courses c
JOIN Enrollments e ON e.course_id=c.course_id
group by c.course_id,c.course_name

/*3*/
SELECT s.student_id,s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

/*4*/
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

/*5*/
SELECT t.first_name,t.last_name,c.course_name
from Teacher t
JOIN Courses c ON c.teacher_id=t.teacher_id

/*6*/
SELECT s.first_name, s.last_name,c.course_name,e.enrollment_date
from Students s
JOIN Enrollments e ON e.student_id=s.student_id
JOIN Courses c ON c.course_id=e.course_id

/*7*/
Select s.first_name,s.last_name from Students s
LEFT JOIN Payments p on s.student_id=p.student_id
where amount IS NULL

/*8*/
select c.course_name from Courses c
LEFT JOIN Enrollments e ON c.course_id=e.course_id
where enrollment_date is null

/*9*/
SELECT e.student_id,count(DISTINCT e.course_id) as noof_enrollments
FROM Enrollments e
JOIN Enrollments e1 ON e1.student_id=e.student_id
GROUP BY e.student_id
HAVING count(DISTINCT e.course_id)>1

/*10*/
SELECT t.first_name,t.last_name,c.course_name
from Teacher t
LEFT JOIN Courses c ON c.teacher_id=t.teacher_id
where c.course_id IS NULL

/*Task-4*/

/*1*/
select course_id, avg(enrollmentcount) as avgenrollment
from (select course_id, count(student_id) as enrollmentcount
from enrollments 
group by course_id) 
as totalenrollment
group by course_id

/*2*/
select student_id, amount from payments
where amount=(select max(amount) from payments)

/*3*/
select course_id,count(student_id) as totalStudents
from Enrollments
group by course_id 
having count(student_id)=(select max(stu_count) 
from (select course_id,count(student_id)
as stu_count
from Enrollments
group by course_id)
as innerq)

/*4*/
select teacher_id, sum(payment) as totpayments
from(select c.teacher_id, p.amount as payment
from courses c
join enrollments e on c.course_id = e.course_id
join payments p on e.student_id = p.student_id)
as payments
group by teacher_id

/*5*/
select student_id 
from enrollments
group by student_id
having count(distinct course_id)=(
select count(distinct course_id) 
from courses)

/*6*/
select first_name
from teacher
where teacher_id not in(
select distinct teacher_id 
from courses)

/*7*/
select avg(age) as AvgAge 
from(select DATEDIFF(year,date_of_birth,getdate()) 
	as age from students)
as age_of_students

/*8*/
select course_name from courses
where course_id not in (
select distinct course_id
from enrollments)

/*9*/
select e.student_id,sum(amount) as totalpayment
from payments p
join enrollments e on p.student_id = e.student_id
group by e.student_id

/*10*/
select s.student_id, payment_count.totalpayment
from students s
join (select p.student_id, count(p.payment_id) as totalpayment
from payments p
group by p.student_id
having count(p.payment_id) > 1
)as payment_count 
on s.student_id = payment_count.student_id

/*11*/
select s.student_id,s.first_name, sum(p.amount) as totalpayment
from students s
join payments p on s.student_id = p.student_id
group by s.student_id, s.first_name

/*12*/
select c.course_name, count(e.student_id) as totalstudents
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_name

/*13*/
select s.first_name, avg(p.amount) as avgpayment
from students s
join payments p on s.student_id = p.student_id
group by s.first_name
