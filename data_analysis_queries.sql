--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
       employees.last_name,
       employees.first_name,
       employees.sex,
       salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE DATE_PART ('year', hire_date) = 1986
ORDER BY hire_date;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,
       dept.dept_name,
       dm.emp_no,
       em.last_name,
       em.first_name
FROM dept_manager as dm
INNER JOIN employees as em ON
dm.emp_no = em.emp_no
INNER JOIN departments as dept ON
dm.dept_no = dept.dept_no
ORDER BY dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT em.emp_no,
       em.last_name,
       em.first_name,
       dept.dept_name
FROM employees as em
INNER JOIN dept_employee as depte ON
depte.emp_no = em.emp_no
INNER JOIN departments as dept ON
dept.dept_no = depte.dept_no
ORDER BY dept_name;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT em.first_name,
       em.last_name,
       em.sex
FROM employees as em
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
ORDER BY first_name;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT em.emp_no,
       em.last_name,
       em.first_name,
       dept.dept_name
FROM employees as em
INNER JOIN dept_employee as depte ON
depte.emp_no = em.emp_no
INNER JOIN departments as dept ON
dept.dept_no = depte.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no,
       em.last_name,
       em.first_name,
       dept.dept_name
FROM employees as em
INNER JOIN dept_employee as depte ON
depte.emp_no = em.emp_no
INNER JOIN departments as dept ON
dept.dept_no = depte.dept_no
WHERE dept_name in ('Sales', 'Development' )
ORDER BY emp_no;

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;