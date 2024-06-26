--------------------------------------------- CREATING TABLES OF ENTITIES ------------------------------------------------------------

CREATE TABLE SIGN_IN
(
    USERNAME VARCHAR(50) PRIMARY KEY,
    PW VARCHAR(20),
    USER_ROLE VARCHAR(20),
    OFFICE_NAME VARCHAR(50),
    FOREIGN KEY (OFFICE_NAME) REFERENCES academic_office(office_name),
    S_ROLL_NO VARCHAR(50),
    FOREIGN KEY (S_ROLL_NO) REFERENCES students(s_roll_no),
    F_ID VARCHAR(50),
    FOREIGN KEY (F_ID) REFERENCES faculty(f_id)
);

-- Add check constraint to ensure that at least one of the foreign key columns has a non-null value
ALTER TABLE SIGN_IN ADD CONSTRAINT CK_SIGN_IN CHECK (
    (OFFICE_NAME IS NOT NULL AND S_ROLL_NO IS NULL AND F_ID IS NULL)
    OR (OFFICE_NAME IS NULL AND S_ROLL_NO IS NOT NULL AND F_ID IS NULL)
    OR (OFFICE_NAME IS NULL AND S_ROLL_NO IS NULL AND F_ID IS NOT NULL)
);


INSERT INTO SIGN_IN (USERNAME, PW, USER_ROLE, OFFICE_NAME, S_ROLL_NO, F_ID)VALUES 
('20I3456', 'password123', 'student', NULL, '20I3456', NULL),
('CS Office', 'password123', 'academic_office', 'CS Office', NULL, NULL);




CREATE TABLE DEPARTMENT
						(
							DEP_ID INT PRIMARY KEY,
							DEP_NAME VARCHAR(50),
							DEP_EMAIL VARCHAR(50),
							DEP_PHONE VARCHAR(51),

						);

INSERT INTO DEPARTMENT (DEP_ID, DEP_NAME, DEP_EMAIL, DEP_PHONE) VALUES
(1, 'Computer Science', 'cs@university.com', '123-456-7890'),
(2, 'Electrical Engineering', 'ee@university.com', '987-654-3210'),
(3, 'Mechanical Engineering', 'me@university.com', '555-555-5555'),
(4, 'Civil Engineering', 'ce@university.com', '111-222-3333'),
(5, 'Business Administration', 'ba@university.com', '444-444-4444');


CREATE TABLE ACADEMIC_OFFICE
                        (
							OFFICE_DEP INT,
                            OFFICE_ID INT,
                            OFFICE_NAME VARCHAR (50) primary key,
						--	primary key (office_id, office_name),
							OFFICE_EMAIL VARCHAR (50),
							OFFICE_PHONE VARCHAR (50),
							FOREIGN KEY (OFFICE_DEP) REFERENCES DEPARTMENT (DEP_ID) 

                        );

INSERT INTO ACADEMIC_OFFICE (OFFICE_DEP, OFFICE_ID, OFFICE_NAME, OFFICE_EMAIL, OFFICE_PHONE) VALUES
(1, 1, 'CS Office', 'csoffice@university.com', '123-456-7890'),
(2, 2, 'EE Office', 'eeoffice@university.com', '987-654-3210'),
(3, 3, 'ME Office', 'meoffice@university.com', '555-555-5555'),
(4, 4, 'CE Office', 'ceoffice@university.com', '111-222-3333'),
(5, 5, 'BA Office', 'baoffice@university.com', '444-444-4444');


CREATE TABLE STUDENTS
					
					(
							S_NAME VARCHAR (50),
							S_ROLL_NO VARCHAR (50) PRIMARY KEY,
							S_DEP INT,
							S_DEGREE VARCHAR (50),
							S_SECTION VARCHAR (50),
							S_BATCH VARCHAR (50),
							S_CAMPUS VARCHAR (50),
							S_DOB VARCHAR (50),
							S_GENDER VARCHAR (50),
							S_CNIC VARCHAR (50),
							S_EMAIL VARCHAR (50),
							S_PHONE VARCHAR (51),
							S_ADDRES VARCHAR (50),
							S_COUNTRY VARCHAR (50),
							S_NATIONALITY VARCHAR (50),
							S_ACADEMIC varchar(50),
							S_CITY VARCHAR (50),
							FOREIGN KEY (S_DEP) REFERENCES DEPARTMENT (DEP_ID),
							FOREIGN KEY (S_ACADEMIC) REFERENCES ACADEMIC_OFFICE(OFFICE_NAME)
					);
INSERT INTO STUDENTS (S_NAME, S_ROLL_NO, S_DEP, S_DEGREE, S_SECTION, S_BATCH, S_CAMPUS, S_DOB, S_GENDER, S_CNIC, S_EMAIL, S_PHONE, S_ADDRES, S_COUNTRY, S_NATIONALITY, S_ACADEMIC, S_CITY) VALUES
('John Doe', '21I2575', 1, 'BS Computer Science', 'A', 'Fall 2021', 'Main Campus', '2003-01-01', 'Male', '1234567890123', 'johndoe@example.com', '123-456-7890', '123 Main St', 'USA', 'American', 'CS Office', 'New York'),
('Jane Smith', '20I3456', 2, 'BS Electrical Engineering', 'B', 'Fall 2020', 'Main Campus', '2002-02-02', 'Female', '2345678901234', 'janesmith@example.com', '234-567-8901', '456 Elm St', 'Canada', 'Canadian','EE OFFICE', 'Toronto'),
('Bob Johnson', '19I5647', 1, 'BS Computer Science', 'A', 'Fall 2019', 'Downtown Campus', '2001-03-03', 'Male', '3456789012345', 'bobjohnson@example.com', '345-678-9012', '789 Oak St', 'USA', 'American', 'ME Office', 'Chicago'),
('Sarah Lee', '21I6798', 3, 'BS Mechanical Engineering', 'C', 'Fall 2021', 'South Campus', '2003-04-04', 'Female', '4567890123456', 'sarahlee@example.com', '456-789-0123', '321 Pine St', 'USA', 'American', 'CE Office', 'Dallas'),
('David Chen', '20I8910', 2, 'BS Computer Science', 'A', 'Fall 2020', 'Main Campus', '2002-05-05', 'Male', '5678901234567', 'davidchen@example.com', '567-890-1234', '654 Birch St', 'USA', 'American', 'BA OFFICE', 'San Francisco');



CREATE TABLE COURSE 
					(
							C_ID VARCHAR (6) PRIMARY KEY,
							COURSE_TYPE VARCHAR(20),
							C_DEP INT,
							C_NAME VARCHAR (20),
							C_CREDIT_HOURS INT,
							C_PRE_REQ VARCHAR (20),
							C_ACADEMIC VARCHAR(50),
							FOREIGN KEY (C_DEP) REFERENCES DEPARTMENT (DEP_ID),
							FOREIGN KEY (C_ACADEMIC) REFERENCES ACADEMIC_OFFICE(OFFICE_NAME)
					);
INSERT INTO COURSE(C_ID, COURSE_TYPE, C_DEP, C_NAME, C_CREDIT_HOURS, C_PRE_REQ, C_ACADEMIC) VALUES
('CS1002', 'CORE' , 1, 'COAL', 3, 'DLD', 'CS OFFICE'),
('ENG101', 'CORE' , 1, 'English Composition', 3, NULL, 'CS OFFICE'),
('MTH202',  'CORE', 1, 'Calculus II', 3, 'MATH201', 'CS OFFICE'),
('ART100',  'CORE', 1, 'Introduction to Art', 1, NULL, 'CS OFFICE'),
('PHY205',  'CORE', 1, 'Electromagnetism', 3, 'PHYS204', 'CS OFFICE'),

('MG1001',  'CORE', 1, 'MANAGMENT', 3, NULL, 'CS OFFICE'),
('CL2005',  'CORE', 1, 'DATABASE', 3, 'DATA STRUCTURES','CS OFFICE'),
('CS2006',  'CORE', 1, 'OPERATING SYSTEM', 3,'DATA STRUCTURES', 'CS OFFICE'),
('CS2005',  'CORE',  1, 'ALGORITHM', 3, 'DATA STRUCTURES', 'CS OFFICE'),
('CS2003',  'CORE', 1, 'PROBABILITY', 3, NULL, 'CS OFFICE'),
('CS2009',  'CORE', 1, 'DATA STRUCTURES', 3, NULL, 'CS OFFICE'),
('CS1009', 'CORE' , 1, 'DLD', 3, NULL, 'CS OFFICE');


CREATE TABLE FACULTY 
					(
							F_ID VARCHAR(50) PRIMARY KEY,
							F_DEP INT,
							F_COURSE VARCHAR (6),
							F_NAME VARCHAR (50),
							F_CNIC VARCHAR (50),
							F_EMAIL VARCHAR (50),
							F_PHONE VARCHAR (50),
							F_ADDRES VARCHAR (50),
							F_COUNTRY VARCHAR (50),
							F_CITY VARCHAR (50),
							F_DOB VARCHAR (50),
							F_NATIONALITY VARCHAR (50),
							FOREIGN KEY (F_DEP) REFERENCES DEPARTMENT (DEP_ID),
							FOREIGN KEY (F_COURSE) REFERENCES COURSE (C_ID)
					);
INSERT INTO FACULTY (F_ID, F_DEP, F_COURSE, F_NAME, F_CNIC, F_EMAIL, F_PHONE, F_ADDRES, F_COUNTRY, F_CITY, F_DOB, F_NATIONALITY) VALUES
('F001', 1, 'CS1002', 'John Smith', '1234567890123', 'john.smith@university.edu', '123-456-7890', '123 Main St', 'USA', 'Anytown', '01/01/1980', 'American'),
('F002', 1, 'ENG101', 'Jane Doe', '2345678901234', 'jane.doe@university.edu', '234-567-8901', '456 Broadway', 'USA', 'Anycity', '02/02/1985', 'American'),
('F003', 1, 'MTH202', 'David Lee', '3456789012345', 'david.lee@university.edu', '345-678-9012', '789 Main St', 'Canada', 'Anyville', '03/03/1975', 'Canadian'),
('F004', 1, 'ART100', 'Samantha Green', '4567890123456', 'samantha.green@university.edu', '456-789-0123', '321 Park Ave', 'UK', 'Anycity', '04/04/1990', 'British'),
('F005', 1, 'PHY205', 'Robert Brown', '5678901234567', 'robert.brown@university.edu', '567-890-1234', '987 Main St', 'USA', 'Anytown', '05/05/1983', 'American');

CREATE TABLE SECTION
					(
							--SEC_ID INT,
							SEC_NAME VARCHAR (20),
							SEC_COURSE VARCHAR(6),
							SEC_DEP INT,
							REG_STUDENTS INT,
							PRIMARY KEY(SEC_NAME, SEC_COURSE),
							FOREIGN KEY (SEC_DEP) REFERENCES DEPARTMENT (DEP_ID),
							FOREIGN KEY (SEC_COURSE) REFERENCES COURSE (C_ID)
					);

INSERT INTO SECTION (SEC_NAME, SEC_COURSE, SEC_DEP, REG_STUDENTS) VALUES
('BSCS-H', 'CS1002', 1, 45),
('BSCS-H', 'ENG101', 1, 46),
('BSCS-H', 'MTH202', 1, 37),
('BSCS-H', 'ART100', 1, 34),
('BSCS-H', 'PHY205', 1, 33),
('BSCS-H', 'MG1001', 1, 47),
('BSCS-H', 'CL2005', 1, 35),
('BSCS-H', 'CS2006', 1, 38),
('BSCS-H', 'CS2005', 1, 40),
('BSCS-H', 'CS2003', 1, 44),

('BSCS-F', 'CS1002', 1, 45), --COMPUTER SCIENEC DEP
('BSCS-F', 'ENG101', 1, 46),
('BSCS-F', 'MTH202', 1, 37),
('BSCS-F', 'ART100', 1, 34),
('BSCS-F', 'PHY205', 1, 33),
('BSCS-F', 'MG1001', 1, 47),
('BSCS-F', 'CL2005', 1, 35),
('BSCS-F', 'CS2006', 1, 38),
('BSCS-F', 'CS2005', 1, 40),
('BSCS-F', 'CS2003', 1, 44);


CREATE TABLE FEEDBACK
					(
							Date varchar(50),
							fname varchar(50),
							lname varchar(50),
							subject varchar(50),
							office varchar(50),
							row1 int,
							row2 int,
							row3 int,
							row4 int,
							comment varchar(MAX) NULL
					);

					select row1, row2, row3, row4, comment from FEEDBACK;

					select* from feedback

/*
CREATE TABLE FEEDBACK
					(
							FB_ID VARCHAR (10) PRIMARY KEY,
							FB_DATE DATE,
							FB_DESCR VARCHAR (50),
							FB_RATE INT,
							FB_STUDENT VARCHAR (7),
							FB_INSTRUCTOR VARCHAR(7),
							FB_COURSE VARCHAR (6),
							FOREIGN KEY (FB_STUDENT) REFERENCES STUDENTS (S_ROLL_NO),
							FOREIGN KEY (FB_COURSE) REFERENCES COURSE (C_ID),
							FOREIGN KEY (FB_INSTRUCTOR) REFERENCES FACULTY (F_ID)
					);
*/
CREATE TABLE EVALUATION
					(
							EV_ID VARCHAR (10) PRIMARY KEY,
							EV_DATE DATE,
							EV_DESCR VARCHAR (50),
							EV_RATE INT,
							EV_STUDENT VARCHAR(7),
							EV_COURSE VARCHAR(6),
							FOREIGN KEY (EV_STUDENT) REFERENCES STUDENTS (S_ROLL_NO),
							FOREIGN KEY (EV_COURSE) REFERENCES COURSE (C_ID)
					);

CREATE TABLE TRANSCRIPT
					(
							TRANS_ID INT,
							STUDENT VARCHAR(50),
							SEMESTER INT,
							SEMESTER_NAME VARCHAR(50),
							CGPA NUMERIC(10,2),
							SGPA NUMERIC(10,2),
							COURSE VARCHAR(6),
							GRADE VARCHAR(5),
							GRADE_POINT NUMERIC(10,2),
							PRIMARY KEY(TRANS_ID, SEMESTER),
							FOREIGN KEY (COURSE) REFERENCES COURSE(C_ID),
							FOREIGN KEY (STUDENT) REFERENCES STUDENTS(S_ROLL_NO)
					);
					
INSERT INTO TRANSCRIPT (TRANS_ID, STUDENT, SEMESTER, SEMESTER_NAME, CGPA, SGPA, COURSE, GRADE, GRADE_POINT) VALUES
(1,'21I2575',1,'FALL 2021',3.64,3.64,'CS1002','A',4.0),
(2,'21I2575',1,'FALL 2021',3.64,3.64,'ENG101','A+',4.0),
(3,'21I2575',1,'FALL 2021',3.64,3.64,'MTH202','A-',3.7),
(4,'21I2575',1,'FALL 2021',3.64,3.64,'ART100','B+',3.3),
(5,'21I2575',1,'FALL 2021',3.64,3.64,'PHY205','B',3.0),


(1,'21I2575', 2,'SPRING 2021', 3.68, 3.72, 'MG1001','A+',4.0),
(2,'21I2575', 2,'SPRING 2021', 3.68, 3.72,'CL2005','A+',4.0),
(4,'21I2575', 2, 'SPRING 2021',3.68, 3.72,'CS2005','B+',3.3),
(3,'21I2575', 2, 'SPRING 2021',3.68, 3.72,'CS2006','A+',4.0),
(5,'21I2575', 2, 'SPRING 2021',3.68, 3.72,'CS2003','B+',3.3);


CREATE TABLE GRADES
					(
							STUDENT_ID VARCHAR(50),
							COURSE_CODE VARCHAR(6),
							GRADE VARCHAR(5),
							PRIMARY KEY(STUDENT_ID, COURSE_CODE),
							FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(S_ROLL_NO),
							FOREIGN KEY (COURSE_CODE) REFERENCES COURSE (C_ID)
					);

INSERT INTO GRADES(STUDENT_ID, COURSE_CODE, GRADE) VALUES
('21I2575','CS1002','A'),
('21I2575','ENG101','A+'),
('21I2575','MTH202','A-'),
('21I2575','ART100','B+'),
('21I2575','PHY205','B'),
('21I2575','MG1001','A+'),
('21I2575','CL2005','A+'),
('21I2575','CS2006','A+'),
('21I2575','CS2005','B+'),
('21I2575','CS2003','B+');

CREATE TABLE ATTENDANCE 
					(
							ATT_ID INT,
							STD_ID VARCHAR(50),
							COURSE_ID VARCHAR(6),
							ATT_STATUS VARCHAR(10),
							INST_ID VARCHAR(50),
							duration_in_hours int,
							
							--DATE_ DATE
							PRIMARY KEY(STD_ID, COURSE_ID, ATT_ID),
							FOREIGN KEY (STD_ID) REFERENCES STUDENTS(S_ROLL_NO),
							FOREIGN KEY (COURSE_ID) REFERENCES COURSE (C_ID),
							FOREIGN KEY (INST_ID) REFERENCES FACULTY(F_ID)

					);


					--DROP TABLE ATTENDANCE;
					select * from ATTENDANCE
					--select att_status from attendance;

INSERT INTO ATTENDANCE (ATT_ID, STD_ID, COURSE_ID, ATT_STATUS, INST_ID, duration_in_hours) VALUES
(1,'21I2575', 'CS1002', null, 'F001', 2),
(2,'21I2575', 'CS1002', null, 'F001', 2),
(3,'21I2575', 'CS1002', null, 'F001', 2),
(4,'21I2575', 'CS1002', null, 'F001', 2),
(5,'21I2575', 'CS1002', null, 'F001', 2),

(1,'21I2575', 'ENG101', NULL, 'F002', 3),
(2,'21I2575', 'ENG101', NULL, 'F002', 3),
(3,'21I2575', 'ENG101', NULL, 'F002', 3),
(4,'21I2575', 'ENG101', NULL, 'F002', 3),
(5,'21I2575', 'ENG101', NULL, 'F002', 3),

(1,'21I2575', 'MTH202', NULL, 'F003', 2),
(2,'21I2575', 'MTH202', NULL, 'F003', 2),
(3,'21I2575', 'MTH202', NULL, 'F003', 2),
(4,'21I2575', 'MTH202', NULL, 'F003', 2),
(5,'21I2575', 'MTH202', NULL, 'F003', 2);


INSERT INTO ATTENDANCE (ATT_ID, STD_ID, COURSE_ID, ATT_STATUS, INST_ID, duration_in_hours) VALUES
(1, '20I3456', 'CS1002', null, 'F001', 2);

INSERT INTO ATTENDANCE (ATT_ID, STD_ID, COURSE_ID, ATT_STATUS, INST_ID, duration_in_hours) VALUES
(1, '21I6798', 'CS1002', null, 'F001', 2);

SELECT distinct STD_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE INST_ID = 'F001' 

SELECT Distinct STD_ID, duration_in_hours, ATT_STATUS
FROM ATTENDANCE
WHERE INST_ID = 'F001' and ATT_ID = 1

SELECT STD_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE INST_ID = 'F001' AND ATT_ID = 1




CREATE TABLE MARKS
					(
							M_ID INT,
						  ID_COURSE VARCHAR(6),
						  STUDENTID VARCHAR(50),
						  QUIZ_MARKS INT,
						  Q_TOTAL INT,
						  ASSIGNMENT_MARKS INT,
						  A_TOTAL INT,
						  LAB_MARKS INT,
						  LM_TOTAL INT,
						  FINALS_MARKS INT,
						  F_TOTAL INT,
						  FAC_ID VARCHAR(50),
						  PRIMARY KEY (ID_COURSE, STUDENTID, M_ID),
						  FOREIGN KEY (ID_COURSE) REFERENCES COURSE(C_ID),
						  FOREIGN KEY (STUDENTID) REFERENCES STUDENTS(S_ROLL_NO),
						  FOREIGN KEY (FAC_ID) REFERENCES FACULTY(F_ID) --BEACUSE INSTRUCTOR MARKS THE GRADES AND SETS THE WEIGHTAGE....
					);
INSERT INTO MARKS (M_ID, ID_COURSE, STUDENTID, QUIZ_MARKS, Q_TOTAL, ASSIGNMENT_MARKS, A_TOTAL, LAB_MARKS, LM_TOTAL, FINALS_MARKS, F_TOTAL, FAC_ID) VALUES
(1,'CS1002', '21I2575', 9, 10, 98, 100, NULL, NULL, 130, 150,'F001'),
(2,'CS1002', '21I2575', 8, 10, 88, 100, NULL, NULL, NULL, NULL,'F001'),
(3,'CS1002', '21I2575', 10, 10,82, 100, NULL, NULL, NULL, NULL,'F001'),
(1,'ENG101', '21I2575', 10, 10,80, 100, NULL, NULL, 120, 150,'F002'),
(2,'ENG101', '21I2575', 9, 10,75, 100, NULL, NULL, NULL, NULL,'F002'),
(3,'ENG101', '21I2575', 8, 10,99, 100, NULL, NULL, NULL, NULL,'F002'),

(1,'MTH202', '21I2575', 8, 10,90, 100, NULL, NULL, 80, 100,'F003'),
(2,'MTH202', '21I2575', 9, 10,70, 100, NULL, NULL, NULL, NULL,'F003'),
(3,'MTH202', '21I2575', 6, 10,60, 100, NULL, NULL, NULL, NULL,'F003');


select Quiz_marks, Assignment_marks, Finals_marks from marks where studentid = '21I2575';

----------------------------------------------------- DROP TABLE COMMAND ------------------------------------------------------------------------------------------------

--DROP TABLE SIGN_IN;
--DROP TABLE DEPARTMENT;
--DROP TABLE FACULTY;
--DROP TABLE STUDENTS;
--DROP TABLE COURSE;
--DROP TABLE SECTION;
--DROP TABLE ATTENDANCE;
--DROP TABLE MARKS;
--DROP TABLE TRANSCRIPT;
--DROP TABLE GRADES;

-------------------------------------------------------- QUERIES --------------------------------------------------------------------------------------------------------

select t.COURSE, c.C_NAME, c.C_CREDIT_HOURS,t.GRADE, T.GRADE_POINT, C.COURSE_TYPE
from TRANSCRIPT t
inner join course c on c.C_ID = t.COURSE
where T.SEMESTER_NAME = 'FALL 2021';


------------------------------------------------------ MANY TO MANY RELATIONS MAPPING ------------------------------------------------------------------------------------

CREATE TABLE ALLOCATES
					(
						Office VARCHAR(50),
						CourseID VARCHAR(6),
						InstructorID VARCHAR(7),
						StartDate DATE,
						EndDate DATE,
						PRIMARY KEY (Office, CourseID, InstructorID),
						FOREIGN KEY (Office) REFERENCES ACADEMIC_OFFICE(Office_NAME),
						FOREIGN KEY (CourseID) REFERENCES COURSE(C_ID),
						FOREIGN KEY (InstructorID) REFERENCES FACULTY(F_ID)
					);

CREATE TABLE ENROLLS --Academic office enrolls students to the courses they want to register
					(
						Office VARCHAR(50),
						CourseID VARCHAR (6),
						StudentID VARCHAR (7),
						ENR_STATUS VARCHAR (10),
						ENROLLED_DATE DATE,
						DROPPED_DATE DATE,
						PRIMARY KEY (Office, CourseID, StudentID),
						FOREIGN KEY (Office) REFERENCES Academic_Office(Office_nAME),
						FOREIGN KEY (CourseID) REFERENCES Course(C_ID),
						FOREIGN KEY (StudentID) REFERENCES Students(S_ROLL_NO)
					);

CREATE TABLE ENROLLED -- students study in enrolled sections a student can has many sections and a section can has many students
					(
					ENR_ID INT,
					StudentID VARCHAR(50),
					SECTION VARCHAR(20),
					ENR_STATUS VARCHAR(10),
					COURSE VARCHAR(6),
					PRIMARY KEY (STUDENTID, SECTION, ENR_ID),
					FOREIGN KEY (StudentID) REFERENCES Students(S_ROLL_NO),
					FOREIGN KEY (SECTION, COURSE) REFERENCES SECTION (SEC_NAME, SEC_COURSE)
					);
					

INSERT INTO ENROLLED ( ENR_ID, StudentID, SECTION, ENR_STATUS, COURSE) VALUES
(1,'21I2575','BSCS-H', NULL, 'CS1002' ),
(2,'21I2575','BSCS-H', NULL, 'ENG101' ),
(3,'21I2575','BSCS-H', NULL, 'MTH202' ),
(4,'21I2575','BSCS-H', NULL, 'ART100' ),
(5,'21I2575','BSCS-H', NULL, 'PHY205' );
SELECT* FROM COURSE;
 
SELECT E.COURSE, E.SECTION, E.ENR_STATUS , C.C_PRE_REQ, C.C_CREDIT_HOURS
FROM ENROLLED E
INNER JOIN COURSE C ON C.C_ID = E.COURSE

SELECT* FROM COURSE 

CREATE TABLE PASS_COURSES
(
					PASS_ID INT,
					STUDENT VARCHAR(50),
					COURSE VARCHAR(6),
					RESULT_STATUS VARCHAR(20),
					PRIMARY KEY(STUDENT,COURSE, PASS_ID),
					FOREIGN KEY (STUDENT) REFERENCES STUDENTS(S_ROLL_NO),
					FOREIGN KEY (COURSE) REFERENCES COURSE (C_ID)
					
);

INSERT INTO PASS_COURSES(PASS_ID, STUDENT, COURSE, RESULT_STATUS) VALUES
(1, '21I2575', 'ART100', 'PASS' ),
(2, '21I2575', 'CS2009', 'PASS' ),
(3, '21I2575', 'ART100', 'PASS' ),
(4, '21I2575', 'CS1009', 'PASS' ),
(5, '21I2575', 'PHY205', 'PASS' ),
(6, '21I2575', 'MTH202', 'PASS' );

UPDATE ENROLLED 
SET ENR_STATUS = 'REGISTERED'
WHERE COURSE IN 
(
  SELECT C_ID 
  FROM COURSE 
  WHERE C_PRE_REQ IN 
  (
    SELECT COURSE 
    FROM PASS_COURSES 
    WHERE RESULT_STATUS = 'PASS' AND STUDENT = ENROLLED.StudentID
  )
);


CREATE TABLE FAC_SEC --FACULTY AND SECTION RELATION MAPPING M:M
					(
						InstructorID VARCHAR(7),
						SectionID INT,
						ROLE_TYPE VARCHAR(20), --EITHER LAB/COURSE INSTRUCTOR
						FOREIGN KEY (InstructorID) REFERENCES FACULTY(F_ID),
						FOREIGN KEY (SECTIONID) REFERENCES SECTION (SEC_ID)
					);


USE master;

DECLARE @table_name VARCHAR(MAX);
DECLARE table_cursor CURSOR FOR
SELECT table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE';

OPEN table_cursor;
FETCH NEXT FROM table_cursor INTO @table_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @constraint_name VARCHAR(MAX);
    DECLARE constraint_cursor CURSOR FOR
    SELECT constraint_name FROM information_schema.table_constraints 
    WHERE table_name = @table_name AND constraint_type = 'FOREIGN KEY';

    OPEN constraint_cursor;
    FETCH NEXT FROM constraint_cursor INTO @constraint_name;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @sql NVARCHAR(MAX);
        SET @sql = 'ALTER TABLE ' + @table_name + ' DROP CONSTRAINT ' + @constraint_name;
        EXEC sp_executesql @sql;
        FETCH NEXT FROM constraint_cursor INTO @constraint_name;
    END

    CLOSE constraint_cursor;
    DEALLOCATE constraint_cursor;

    SET @sql = 'DROP TABLE ' + @table_name;
    EXEC sp_executesql @sql;

    FETCH NEXT FROM table_cursor INTO @table_name;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;


SELECT SEMESTER_NAME, CGPA, SGPA FROM TRANSCRIPT WHERE SEMESTER_NAME = 'Fall 2021'
SELECT SEMESTER_NAME, CGPA, SGPA FROM TRANSCRIPT WHERE SEMESTER_NAME = 'Spring 2021';


SELECT SEMESTER_NAME, CGPA, SGPA FROM TRANSCRIPT WHERE SEMESTER_NAME = 'Fall 2021' AND STUDENT = '21I2575'

SELECT t.COURSE, c.C_NAME, c.C_CREDIT_HOURS, t.GRADE, t.GRADE_POINT, C.COURSE_TYPE
                                                   FROM TRANSCRIPT t
                                                   INNER JOIN COURSE c ON c.C_ID = t.COURSE
                                                   WHERE t.SEMESTER_NAME = 'Fall 2021' and t.STUDENT = '21I2575'

SELECT t.COURSE, c.C_NAME, c.C_CREDIT_HOURS, t.GRADE, t.GRADE_POINT, C.COURSE_TYPE
                                                   FROM TRANSCRIPT t
                                                   INNER JOIN COURSE c ON c.C_ID = t.COURSE
                                                   WHERE t.SEMESTER_NAME = 'Spring 2021' and t.STUDENT = '21I2575'





	SELECT  
    COUNT(CASE ATT_STATUS WHEN 'P' THEN 1 END) * 100 / COUNT(*) AS ATT_PERCENTAGE
	FROM 
    ATTENDANCE
	Where COURSE_ID = 'CS1002';
