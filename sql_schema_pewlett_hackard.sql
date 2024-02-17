CREATE TABLE departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no INT   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

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

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no)REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY	(emp_no) REFERENCES employees (emp_no)
);