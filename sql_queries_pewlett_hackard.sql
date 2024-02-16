-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT e.first_name,
	e.last_name,
	e.hire_date
FROM employees AS e
WHERE e.hire_date >= '1/1/1986'
AND e.hire_date <= '12/31/1986';

-- Rerunning query with different method for selecting only the single year using "EXTRACT"
SELECT e.first_name,
	e.last_name,
	e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
ON e.emp_no = dm.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON
e.emp_no = de.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT e.first_name,
	e.last_name,
	e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
-- Creaing query with join
SELECT e.emp_no,
	e.first_name,
	e.last_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
de.emp_no = e.emp_no
INNER JOIN departments AS d	ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--Creating the query without join, using subquery
SELECT e.emp_no,
	e.first_name,
	e.last_name
FROM employees AS e
WHERE e.emp_no IN
(
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
de.emp_no = e.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(emp_no) AS "Count Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count Last Name" DESC;