DROP TABLE employees CASCADE;

CREATE TABLE employees(
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(100)   NOT NULL,
    birth_date VARCHAR(50)   NOT NULL,
    first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    sex VARCHAR(10)   NOT NULL,
    hire_date VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM employees;

DROP TABLE departments CASCADE;
CREATE TABLE departments (
    dept_no VARCHAR(100)   NOT NULL,
    dept_name VARCHAR(200)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);
SELECT * FROM departments;

DROP TABLE salaries CASCADE;
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);
SELECT * FROM salaries;

DROP TABLE titles CASCADE;
CREATE TABLE titles (
    title_id VARCHAR(50)   NOT NULL,
    title VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);
SELECT * FROM titles;

DROP TABLE dept_employee CASCADE;
CREATE TABLE dept_employee (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(100)   NOT NULL
);
SELECT * FROM dept_employee;

DROP TABLE dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no VARCHAR(100)   NOT NULL,
    emp_no INT   NOT NULL
);
SELECT * FROM dept_manager;

ALTER TABLE salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_employee ADD CONSTRAINT fk_dept_employee_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_employee ADD CONSTRAINT fk_dept_employee_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

SELECT * FROM employees;