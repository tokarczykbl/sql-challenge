-- Creating departments table with primary key dept_no
CREATE TABLE departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Creating titles table with primary key title_id
CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    PRIMARY KEY (title_id)
);

-- Creating employees table with primary key emp_no and foreign key, emp_title_id, joining to titles table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

-- Creating dept_emp table with composite primary key emp_no+dept_no and two foreign keys: emp_no joining to titles table...dept_no joining to departments table
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no)REFERENCES departments (dept_no)
);

-- Creating dept_manager table with primary key emp_no and foreign key, dept_no, joining to departments table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no INT   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no)REFERENCES departments (dept_no)
);

-- Creating salaries table with primary key emp_no and foreign key emp_no joining to employees table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY	(emp_no) REFERENCES employees (emp_no)
);