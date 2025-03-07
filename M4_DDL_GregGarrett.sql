/*
* Name: Module 4 Homework
* Author: Greg Garrett
* Date: 11/8/24
* Description: Creates the tables for a school database to store student, course, and registration information.
* Instructions: Click the execute as script button to create and load tables
* Changes:
*/

CREATE TABLE [Degree]
(
	[Degree_Id] INTEGER NOT NULL, 												
	[Degree_Name] VARCHAR (100) NOT NULL,										-- e.g., 'Business Analytics', 'Biology', 'English'
	[Degree_Level] CHAR (3),													-- e.g., 'A = Associates, BA = Bachelor of Arts, MS = Master of Science, PhD = Doctorate, etc'
	[Department_Id] INTEGER,
	CONSTRAINT [PK_Degree_Id] PRIMARY KEY ([Degree_Id]),
	FOREIGN KEY ([Department_Id]) REFERENCES [Department] ([Department_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Department]
(
	[Department_Id] INTEGER NOT NULL,
	[Department_Name] VARCHAR (50) NOT NULL,									-- e.g., 'Computer Science'
	[Phone_Number] VARCHAR (15),												-- e.g., '(555) 123-4567'
	CONSTRAINT [PK_Department_Id] PRIMARY KEY ([Department_Id])
);

CREATE TABLE [Teacher]
(
	[Teacher_Id] INTEGER NOT NULL,
	[Teacher_First_Name] VARCHAR (30) NOT NULL,
	[Teacher_Last_Name] VARCHAR (30) NOT NULL,
	[Email] VARCHAR (30),
	[Phone_Number] VARCHAR (15),												-- e.g., '(555) 123-4567'
	[Department_Id] INTEGER,
	CONSTRAINT [PK_Teacher_Id] PRIMARY KEY ([Teacher_Id]),
	FOREIGN KEY ([Department_Id]) REFERENCES [Department] ([Department_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Course]
(
	[Course_Id] INTEGER NOT NULL,												
	[Course_Title] VARCHAR (100) NOT NULL,										-- e.g., 'Introduction to Programming'
	[Number_Credits] REAL NOT NULL,												-- e.g., 3 credits, 0.5 credits
	[Description] VARCHAR(255),
	[Phone_Number] VARCHAR (15),
	[Department_Id] INTEGER NOT NULL,
	[Teacher_Id] INTEGER,
	[Classroom_Id] INTEGER,
	CONSTRAINT [PK_Course_Id] PRIMARY KEY ([Course_Id]),
	FOREIGN KEY ([Department_Id]) REFERENCES [Department] ([Department_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Teacher_Id]) REFERENCES [Teacher] ([Teacher_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Classroom_Id]) REFERENCES [Classroom_Location] ([Classroom_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Classroom_Location]
(
	[Classroom_Id] INTEGER NOT NULL,											-- Primary Key is composed of the building number and room number (5 digit, first 2 digits represent the building and last 3 indicate classroom)
	[Building_Name] VARCHAR (50) NOT NULL,										-- e.g., 'Science Hall'
	[Classroom_Number] VARCHAR (10),											-- e.g., '101'
	[Capacity] INTEGER,
	[Style] CHAR (15),															-- e.g., 'Campus', 'Online', 'Both'
	[Building_Number] INTEGER,
	CONSTRAINT [PK_Classroom_Id] PRIMARY KEY ([Classroom_Id])
);

CREATE TABLE [Semester]
(
	[Semester_Id] INTEGER NOT NULL,												-- e.g., '202401'  2024 year, 01 = spring, 02 = summer, 03 = fall, 04 = winter
	[Term_Availability] VARCHAR (10) NOT NULL,
	[Year] INTEGER NOT NULL,
	CONSTRAINT [PK_Semester_Id] PRIMARY KEY ([Semester_Id])
);

CREATE TABLE [Registration]
(
	[Registration_Id] INTEGER NOT NULL,
	[Student_Id] INTEGER NOT NULL,
	[Semester_Id] INTEGER NOT NULL,
	[Course_Id] INTEGER NOT NULL,
	[Letter_Grade] CHAR (2) NOT NULL,											-- e.g., 'A', 'B+' etc
	[Numeric_Grade] REAL,														-- e.g., 3.3 for GPA
	CONSTRAINT [PK_Registration_Id] PRIMARY KEY ([Registration_Id]),
	FOREIGN KEY ([Student_Id]) REFERENCES [Student] ([Student_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Semester_Id]) REFERENCES [Semester] ([Semester_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Course_Id]) REFERENCES [Course] ([Course_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Student]
(
	[Student_Id] INTEGER NOT NULL,
	[First_Name] VARCHAR (30) NOT NULL,
	[Last_Name] VARCHAR (30) NOT NULL,
	[Email] VARCHAR (30),
	[Phone_Number] VARCHAR (15),
	CONSTRAINT [PK_Student_Id] PRIMARY KEY ([Student_Id])
);

CREATE TABLE [Billing]
(
	[Billing_Id] INTEGER NOT NULL,
	[Student_Id] INTEGER NOT NULL,
	[Amount] REAL NOT NULL,														-- e.g., 5000.50
	[Due_Date] DATE,															-- e.g., '2024-05-01'
	[Paid_Date] DATE,
	[Status] VARCHAR (15),														-- e.g., 'Paid', 'Pending'
	CONSTRAINT [PK_Billing_Id] PRIMARY KEY ([Billing_Id]),
	FOREIGN KEY ([Student_Id]) REFERENCES [Student] ([Student_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Student_Degree]
(
	[Student_Degree_Id] INTEGER NOT NULL,
	[Degree_ID] INTEGER NOT NULL,
	[Student_Id] INTEGER NOT NULL,
	[Enrollment_Date] DATE NOT NULL,
	[Graduation_Date] DATE,
	CONSTRAINT [PK_Student_Degree_Id] PRIMARY KEY ([Student_Degree_Id]),
	FOREIGN KEY ([Degree_Id]) REFERENCES [Degree] ([Degree_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Student_Id]) REFERENCES [Student] ([Student_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX [IFK_degree_department] ON [Degree] ([Department_Id]);
CREATE INDEX [IFK_teacher_department] ON [Teacher] ([Department_Id]);
CREATE INDEX [IFK_course_department] ON [Course] ([Department_Id]);
CREATE INDEX [IFK_course_teacher] ON [Course] ([Teacher_Id]);
CREATE INDEX [IFK_course_classroom] ON [Course] ([Classroom_Id]);
CREATE INDEX [IFK_registration_student] ON [Registration] ([Student_Id]);
CREATE INDEX [IFK_registration_semester] ON [Registration] ([Semester_Id]);
CREATE INDEX [IFK_registration_course] ON [Registration] ([Course_Id]);
CREATE INDEX [IFK_student_degree_degree] ON [Student_Degree] ([Degree_Id]);
CREATE INDEX [IFK_student_degree_student] ON [Student_Degree] ([Student_Id]);
CREATE INDEX [IFK_registration_student_semester] ON [Registration] ([Student_Id], [Semester_Id]);
CREATE INDEX [IFK_billing_student_id] ON [Billing] ([Student_Id]);
CREATE INDEX [IFK_billing_status] ON [Billing] ([Status]);
CREATE INDEX [IFK_billing_student_status] ON [Billing] ([Student_Id], [Status]);
