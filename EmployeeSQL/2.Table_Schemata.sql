- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments_Table" (
    "DEPT_ID" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments_Table" PRIMARY KEY (
        "DEPT_ID"
     )
);

CREATE TABLE "DepEmployees_Table" (
    "EMP_ID" INT   NOT NULL,
    "DEPT_ID" VARCHAR(255)   NOT NULL,
	PRIMARY KEY("EMP_ID","DEPT_ID")
);

CREATE TABLE "Managers_Table" (
    "DEPT_ID" VARCHAR(255)   NOT NULL,
    "EMP_ID" INT   NOT NULL,
	PRIMARY KEY("EMP_ID","DEPT_ID")
);

CREATE TABLE "EmployeesOnly_Table" (
    "EMP_ID" INT   NOT NULL,
    "EMP_TITLE_ID" VARCHAR(255)   NOT NULL,
    "BIRTH_DATE" VARCHAR(255)   NOT NULL,
    "FIRST_NAME" VARCHAR(255)   NOT NULL,
    "LAST_NAME" VARCHAR(255)   NOT NULL,
    "SEX" VARCHAR(255)   NOT NULL,
    "HIRE_DATE" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_EmployeesOnly_Table" PRIMARY KEY (
        "EMP_ID"
     )
);

CREATE TABLE "Salaries_Table" (
    "EMP_ID" INT   NOT NULL,
    "Salary" INT   NOT NULL,
	PRIMARY KEY("EMP_ID","Salary")
);

CREATE TABLE "Titles_Table" (
    "TITLE_ID" VARCHAR(255)   NOT NULL,
    "TITLE" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles_Table" PRIMARY KEY (
        "TITLE_ID"
     )
);

ALTER TABLE "DepEmployees_Table" ADD CONSTRAINT "fk_DepEmployees_Table_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "EmployeesOnly_Table" ("EMP_ID");

ALTER TABLE "DepEmployees_Table" ADD CONSTRAINT "fk_DepEmployees_Table_DEPT_ID" FOREIGN KEY("DEPT_ID")
REFERENCES "Departments_Table" ("DEPT_ID");

ALTER TABLE "Managers_Table" ADD CONSTRAINT "fk_Managers_Table_DEPT_ID" FOREIGN KEY("DEPT_ID")
REFERENCES "Departments_Table" ("DEPT_ID");

ALTER TABLE "Managers_Table" ADD CONSTRAINT "fk_Managers_Table_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "EmployeesOnly_Table" ("EMP_ID");

ALTER TABLE "EmployeesOnly_Table" ADD CONSTRAINT "fk_EmployeesOnly_Table_EMP_TITLE_ID" FOREIGN KEY("EMP_TITLE_ID")
REFERENCES "Titles_Table" ("TITLE_ID");

ALTER TABLE "Salaries_Table" ADD CONSTRAINT "fk_Salaries_Table_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "EmployeesOnly_Table" ("EMP_ID");

