--Question 1
--List the following details of each employee:
--employee number, last name, first name, gender, and salary.
SELECT "Employees".emp_no,
	"Employees".last_name,
	"Employees".first_name,
	"Employees".gender,
	"Salaries".salary
FROM "Employees"
INNER JOIN "Salaries" ON
"Salaries".emp_no = "Employees".emp_no;

--Question 2
--List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM "Employees"
WHERE hire_date LIKE '1986%';

--Question 3
--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT "Department".dept_no,
	"Department".dept_name,
	"Department_Manager".emp_no,
	"Department_Manager".from_date,
	"Department_Manager".to_date,
	"Employees".first_name,
	"Employees".last_name
FROM "Department"
INNER JOIN "Department_Manager" ON
"Department_Manager".dept_no = "Department".dept_no
INNER JOIN "Employees" ON
"Employees".emp_no = "Department_Manager".emp_no;

--Question 4
--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
Create VIEW q_4 AS
SELECT "Employees".emp_no,
	"Employees".last_name,
	"Employees".first_name,
	"Department".dept_name
FROM "Employees"
INNER JOIN "Department_Employee" ON
"Department_Employee".emp_no = "Employees".emp_no
INNER JOIN "Department" ON
"Department_Employee".dept_no = "Department".dept_no;

--Question 5
--List all employees whose first name is "Hercules"
--and last names begin with "B."
SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--Question 6
--List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
SELECT * 
FROM q_4
WHERE dept_name = 'Sales';

--Question 7
--List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT *
FROM q_4
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--Question 8
--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "name COUNT"
FROM "Employees"
GROUP BY last_name
ORDER BY "name COUNT" DESC;

--BONUS


--Epilogue
SELECT * FROM "Employees"
WHERE emp_no = '499942'