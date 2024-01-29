-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR
);

--Import departments.csv
-- Show departments table
SELECT * FROM departments;



-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR
);

--Import titles.csv
-- Show titles table
SELECT * FROM titles;



-- Create employees table as it contains the most primary keys
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5),
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--Inport employees.csv
-- Show employees table
SELECT * FROM employees;



-- Create dept_emp table with primary key as composite key
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4),
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);

-- Import dept_emp.csv
-- Show dept_emp table
SELECT * FROM dept_emp;



--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Import dept_manager.csv
-- Show dept_manager table
SELECT * FROM dept_manager;



-- Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no,salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Import salaries.csv
-- Show salaries table
SELECT * FROM salaries;