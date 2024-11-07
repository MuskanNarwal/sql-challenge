--List the employee number, last name, first name, sex, and salary of each employee.

Select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
From employees as e
Inner Join salaries as s On
s.emp_no=e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM Employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.dept_no, 
    d.dept_name, 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    dept_manager AS dm
JOIN 
    departments AS d ON dm.dept_no = d.dept_no
JOIN 
    employees AS e ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select 
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.first_name,
	e.last_name
From 
	departments as d
Join
	dept_emp as de on de.dept_no=d.dept_no
Join
	employees as e on de.emp_no=e.emp_no;
	
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name,last_name,sex 
from employees
where
first_name='Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees AS e
WHERE 
    e.emp_no IN (
        SELECT de.emp_no
        FROM dept_emp AS de
        JOIN departments AS d ON de.dept_no = d.dept_no
        WHERE d.dept_name = 'Sales'
    );
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees AS e
JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
JOIN 
    departments AS d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
    COUNT(*) AS frequency_count
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency_count DESC;




