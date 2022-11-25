SELECT * FROM employees

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees --o
INNER JOIN salaries --i
ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	first_name, 
	last_name, 
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
		
SELECT
  departments.dept_no,
  departments.dept_name,
  dept_manager.emp_no,
  employees.last_name,
  employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	first_name, 
	last_name, 
	sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	a.emp_no, --a=employees, b=dept_emp, c=departments
	a.last_name,
	a.first_name,
	c.dept_name
FROM employees a
JOIN dept_emp b
ON a.emp_no=b.emp_no
JOIN departments c
ON c.dept_no=b.dept_no
WHERE dept_name='Sales';
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	a.emp_no, --a=employees, b=dept_emp, c=departments
	a.last_name,
	a.first_name,
	c.dept_name
FROM employees a
JOIN dept_emp b
ON a.emp_no=b.emp_no
JOIN departments c
ON c.dept_no=b.dept_no
WHERE dept_name='Sales' OR dept_name='Development';

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY last_name DESC;