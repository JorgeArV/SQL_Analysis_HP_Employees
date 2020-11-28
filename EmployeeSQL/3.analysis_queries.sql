--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select "EmployeesOnly_Table"."EMP_ID" AS "employee number",
	   "EmployeesOnly_Table"."LAST_NAME" AS "last name",
	   "EmployeesOnly_Table"."FIRST_NAME" AS "first name",
	   "EmployeesOnly_Table"."SEX" AS "sex",
	   "Salaries_Table"."Salary" AS "salary"
from "EmployeesOnly_Table"
join "Salaries_Table"
on "EmployeesOnly_Table"."EMP_ID" = "Salaries_Table"."EMP_ID";

--2.List first name, last name, and hire date for employees who were hired in 1986.
select "FIRST_NAME" AS "first name",
	   "LAST_NAME" AS "last name",
	   "HIRE_DATE" AS "hire date"
from "EmployeesOnly_Table"
where "HIRE_DATE" like '%/1986';

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select "Managers_Table"."DEPT_ID" AS "department number",
	   "Departments_Table"."dept_name" AS "department name",
	   "Managers_Table"."EMP_ID" AS "employee number",
	   "EmployeesOnly_Table"."LAST_NAME" AS "last name",
	   "EmployeesOnly_Table"."FIRST_NAME" AS "first name"
from "Departments_Table"
join "Managers_Table"
on "Managers_Table"."DEPT_ID"= "Departments_Table"."DEPT_ID"
join "EmployeesOnly_Table"
on "Managers_Table"."EMP_ID" = "EmployeesOnly_Table"."EMP_ID";

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select "DepEmployees_Table"."EMP_ID" as "employee number",
	   "EmployeesOnly_Table"."LAST_NAME" AS "last name",
	   "EmployeesOnly_Table"."FIRST_NAME" AS "first name",
	   "Departments_Table"."dept_name" AS "department name"
from "EmployeesOnly_Table"
join "DepEmployees_Table"
on "DepEmployees_Table"."EMP_ID" = "EmployeesOnly_Table"."EMP_ID"
join "Departments_Table"
on "DepEmployees_Table"."DEPT_ID" = "Departments_Table"."DEPT_ID";

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select "FIRST_NAME","LAST_NAME","SEX"
from "EmployeesOnly_Table"
where "FIRST_NAME" like 'Hercules'
AND "LAST_NAME" like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select "EmployeesOnly_Table"."EMP_ID" as "employee number",
	   "EmployeesOnly_Table"."LAST_NAME" AS "last name",
	   "EmployeesOnly_Table"."FIRST_NAME" AS "first name",
	   "Departments_Table"."dept_name" AS "department name"
from "EmployeesOnly_Table"
join "DepEmployees_Table"
on "DepEmployees_Table"."EMP_ID" = "EmployeesOnly_Table"."EMP_ID"
join "Departments_Table"
on "DepEmployees_Table"."DEPT_ID" = "Departments_Table"."DEPT_ID"
WHERE "EmployeesOnly_Table"."EMP_ID" in (
	Select "DepEmployees_Table"."EMP_ID" 
	from "DepEmployees_Table"
	WHERE "DepEmployees_Table"."DEPT_ID" in (
		Select "Departments_Table"."DEPT_ID"
		from "Departments_Table"
		where "Departments_Table"."dept_name" = 'Sales'
))
;

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select "EmployeesOnly_Table"."EMP_ID" as "employee number",
	   "EmployeesOnly_Table"."LAST_NAME" AS "last name",
	   "EmployeesOnly_Table"."FIRST_NAME" AS "first name",
	   "Departments_Table"."dept_name" AS "department name"
from "EmployeesOnly_Table"
join "DepEmployees_Table"
on "DepEmployees_Table"."EMP_ID" = "EmployeesOnly_Table"."EMP_ID"
join "Departments_Table"
on "DepEmployees_Table"."DEPT_ID" = "Departments_Table"."DEPT_ID"
WHERE "EmployeesOnly_Table"."EMP_ID" in (
	Select "DepEmployees_Table"."EMP_ID" 
	from "DepEmployees_Table"
	WHERE "DepEmployees_Table"."DEPT_ID" in (
		Select "Departments_Table"."DEPT_ID"
		from "Departments_Table"
		where "Departments_Table"."dept_name" in ('Sales','Development')
))
;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select "LAST_NAME",
	   count("LAST_NAME")
from "EmployeesOnly_Table"
group by "LAST_NAME"
order by count("LAST_NAME") DESC;
