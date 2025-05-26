-- 1. Database Setup

CREATE TABLE student_table (
    Student_id INTEGER primary key ,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

-- 2. Data Entry

INSERT INTO student_table VALUES
(1, 'Aarav Patel', 'Engineering', 'aarav.patel@email.com', 9876543210, '15 Gandhi Road, Mumbai, Maharashtra', '2000-05-15', 'Male', 'Computer Science', 3.8, 'A'),
(2, 'Priya Sharma', 'Science', 'priya.s@email.com', 8765432109, '27 Nehru Street, Delhi', '2001-03-22', 'Female', 'Biology', 3.5, 'B'),
(3, 'Arjun Gupta', 'Business', 'arjun.g@email.com', 7654321098, '8 MG Road, Bangalore, Karnataka', '2000-11-30', 'Male', 'Finance', 3.9, 'A'),
(4, 'Ananya Singh', 'Arts', 'ananya.s@email.com', 6543210987, '42 Tagore Lane, Kolkata, West Bengal', '2001-07-18', 'Female', 'Fine Arts', 3.6, 'B'),
(5, 'Rahul Verma', 'Engineering', 'rahul.v@email.com', 9876543211, '3 Shivaji Nagar, Pune, Maharashtra', '2000-09-25', 'Male', 'Mechanical', 3.7, 'B'),
(6, 'Neha Reddy', 'Science', 'neha.r@email.com', 8765432110, '19 Anna Salai, Chennai, Tamil Nadu', '2001-01-12', 'Female', 'Chemistry', 4.0, 'A'),
(7, 'Vikram Malhotra', 'Business', 'vikram.m@email.com', 7654321099, '56 Civil Lines, Jaipur, Rajasthan', '2000-06-28', 'Male', 'Marketing', 3.2, 'C'),
(8, 'Ishita Joshi', 'Arts', 'ishita.j@email.com', 6543210988, '11 Jubilee Hills, Hyderabad, Telangana', '2001-04-05', 'Female', 'Music', 3.8, 'A'),
(9, 'Aditya Kumar', 'Engineering', 'aditya.k@email.com', 9876543212, '7 Gomti Nagar, Lucknow, Uttar Pradesh', '2000-12-15', 'Male', 'Electrical', 3.4, 'B'),
(10, 'Kavya Mehra', 'Science', 'kavya.m@email.com', 8765432111, '23 Bandra West, Mumbai, Maharashtra', '2001-08-20', 'Female', 'Physics', 3.9, 'A');


-- 3. Student Information Retrieval

select * from student_table
	order by grade desc;

-- 4. Query for Male Students:

select * from student_table 
where gender = 'Male';


-- 5. Query for Students with GPA less than 5.0

select *
from (select stu_name, gpa from student_table where gpa <= 5.0 order by gpa  )  ;

-- 6. Update Student Email and Grade
update student_table 
set email_id = 'updated_neha.r@email.com', Grade = '3.7'  
	where stu_name = 'Neha Reddy';

select *
from student_table
	where stu_name = 'Neha Reddy';

-- 7. Query for Students with Grade "B"
select *
from (select stu_name, grade from student_table where grade = 'B' order by gpa  )  ;

-- 8. Grouping and Calculation

select  department, gender, round(avg(gpa),2) as average_gpa
	from student_table 
	group by (gender,department)
	;

-- 9. Table Renaming
alter table student_table
rename to student_info; 

-- 10. Retrieve Student with Highest GPA
select * 
from student_info 
 where gpa = (select max(gpa) as highest_gpa from student_info);

-- end -- 