 -- Determine retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a new table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Confirm the new table was created
SELECt * FROM retirement_info

-- Joining departments and dept_manager tables with Inner Join
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables with Left Join
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Use Aliases for Code Readability
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Confirm new table
SELECT * FROM current_emp

-- Employee count by department number using GROUP BY
SELECT COUNT(ce.emp_no), 
	de.dept_no
INTO dept_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
-- Confirm new table
SELECT * FROM dept_count

-- List 1 Employee Information: A list of employees containing their unique employee number, their last name, first name, gender, salary, and to_date
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');
-- Confirm the table
SELECT * FROM emp_info

-- List 2 Management: A list of managers for each department, including the department number, name, and the manager's employee number, last name, first name, and the starting and ending employment dates
SELECT dm.dept_no, 
	d.dept_name, 
	dm.emp_no, ce.last_name, 
	ce.first_name, 
	dm.from_date, 
	dm.to_date
INTO manager_info
FROM dept_manager as dm
INNER JOIN departments as d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp as ce
ON (dm.emp_no = ce.emp_no);
-- Confirm the table
SELECT * FROM manager_info

-- List 3 Department Retirees: An updated current_emp list that includes everything it currently has, but also the employee's departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);
-- Confirm the table
SELECT * FROM dept_info

-- Tailored List: Sales department info
SELECT *
INTO sales_info
FROM dept_info 
WHERE dept_name = 'Sales';
-- Confirm the table
SELECT * FROM sales_info

-- Tailored List: Sales and Development departments info
SELECT *
INTO sales_and_dev_info
FROM dept_info 
WHERE dept_name IN ('Sales','Development');
-- Confirm the table
SELECT * FROM sales_and_dev_info