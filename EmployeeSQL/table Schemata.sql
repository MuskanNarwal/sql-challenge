Create Table Titles(
	Title_id Varchar Primary Key,
	Title varchar(50) NOT NULL
);

CREATE TABLE Employees (
    Emp_no INT PRIMARY KEY,
    Emp_Title_Id Varchar(5) NOT NULL,
    Birth_Date DATE NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Sex CHAR(1)NOT NULL,
    Hire_Date DATE NOT NULL,
    FOREIGN KEY (Emp_Title_Id) REFERENCES Titles(Title_id)
);

Create Table Salaries(
	Emp_no INT PRIMARY KEY NOT NULL,
	Foreign Key (Emp_no) REFERENCES Employees(Emp_no),
	Salary INT NOT NULL
);


Create Table Departments(
	Dept_no VARCHAR(4) Primary Key,
	Dept_Name varchar(50)NOT NULL
);

Create Table Dept_Emp(

	Emp_no int NOT NULL,
	Dept_no VARCHAR NOT NULL,
	PRIMARY KEY (Emp_no, Dept_no),
	Foreign Key (Emp_no) References Employees(Emp_no),
	Foreign Key (Dept_no) References Departments(Dept_no)
);

Create Table Dept_Manager(
	Dept_no VARCHAR(4)NOT NULL, 
	Emp_no int NOT NULL ,
	PRIMARY KEY (Dept_no, Emp_no),
	Foreign Key  (Dept_no) References Departments(Dept_no),
	Foreign Key (Emp_no) References Employees(Emp_no)
);
