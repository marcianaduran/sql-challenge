-- DATA ANALYSIS
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.emp_no, m.dept_no, d.dept_name, e.first_name, e.last_name
FROM dept_manager m
LEFT JOIN departments d
ON (m.dept_no = d.dept_no)
LEFT JOIN employees e
ON (e.emp_no = m.emp_no);

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, d.dept_name, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
LEFT JOIN departments d
ON (de.dept_no = d.dept_no);

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
LEFT JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, d.dept_name, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
LEFT JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(e.last_name) AS "counts"
FROM employees e
GROUP BY e.last_name
ORDER BY "counts" DESC;
