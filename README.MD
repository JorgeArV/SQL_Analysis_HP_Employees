# SQL Analysis - HP employees dataset

This is a project that involved data engineering and data analysis. I have analized 6 CSV files that comprise information regarding HP employees between 1980s and 1990s. Below, I will describe the different stages of this project: 

#### Data Modeling

* I have inspected the CSVs and sketch out an ERD of the tables.I have included a screenshoot of this ERD in this repository.

#### Data Engineering

* I have created a table schema for each of the six CSV files. I have specified data types, primary keys, foreign keys, and other constraints.

* I have imported each CSV file into the corresponding SQL table.

#### Data Analysis

Once I completed the database, I performed the following analysis:

1. I listed the following details of each employee: employee number, last name, first name, sex, and salary.

2. I listed the first name, last name, and hire date for employees who were hired in 1986.

3. I listed the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. I listed the department of each employee with the following information: employee number, last name, first name, and department name.

5. I listed first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. I listed all employees in the Sales department, including their employee number, last name, first name, and department name.

7. I listed all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, I listed the frequency count of employee last names, i.e., how many employees share each last name.

#### Additional Data Analysis

* I imported the SQL database into Pandas, created a histogram to visualize the most coomn salary ranges for employees, and created a bar chart of average salary by title.

------

Contact: jorge.arriola.villafuerte@gmail.com
