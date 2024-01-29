-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	s.salary
FROM employees AS emp
INNER JOIN salaries AS s ON
	emp.emp_no = s.emp_no;



-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE RIGHT(hire_date,4) = '1986';



-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;



-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	dept_emp.dept_no,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;



-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE 
	first_name = 'Hercules'
	AND
	SUBSTRING (last_name, 1, 1) = 'B';
	
	
	
-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	emp_no,
	last_name,
	first_name
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	);



-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Sales employees
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	)
--filter out for employees that are in multiple departmenmts to show only sales row
AND departments.dept_name = 'Sales'

UNION

--Development employees
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Development'
		)
	)
--filter out for employees that are in multiple departmenmts to show only development row
AND departments.dept_name = 'Development';



--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	employees.last_name,
	COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;