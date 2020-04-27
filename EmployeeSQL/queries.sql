--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT data_employees.emp_no, data_employees.last_name, data_employees.first_name, data_employees.gender, data_salaries.salary
FROM data_employees
JOIN data_salaries
ON data_employees.emp_no = data_salaries.emp_no
;


--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM data_employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_dept_emp.emp_no, data_employees.last_name, data_employees.first_name, data_departments.dept_name
FROM dept_dept_emp
JOIN data_employees
ON dept_dept_emp.emp_no = data_employees.emp_no
JOIN data_departments
ON dept_dept_emp.dept_no = data_departments.dept_no
;


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM data_employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;



--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_dept_emp.emp_no, data_employees.last_name, data_employees.first_name, data_departments.dept_name
FROM dept_dept_emp
JOIN data_employees
ON dept_dept_emp.emp_no = data_employees.emp_no
JOIN data_departments
ON dept_dept_emp.dept_no = data_departments.dept_no
WHERE data_departments.dept_name = 'Sales'
;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_dept_emp.emp_no, data_employees.last_name, data_employees.first_name, data_departments.dept_name
FROM dept_dept_emp
JOIN data_employees
ON dept_dept_emp.emp_no = data_employees.emp_no
JOIN data_departments
ON dept_dept_emp.dept_no = data_departments.dept_no
WHERE data_departments.dept_name = 'Sales' 
OR data_departments.dept_name = 'Development'
;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM data_employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;