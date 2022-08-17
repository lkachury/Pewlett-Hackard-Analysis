-----------------------------------------------------------
-- Deliverable 1: The Number of Retiring Employees by Title
-----------------------------------------------------------

-- Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955
SELECT  e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles		
FROM employees as e
INNER JOIN titles as ti
ON(e.emp_no = ti.emp_no)
WHERE(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
--Confirm table correctly made
SELECT * FROM retirement_titles;

-- Unique Titles table using DictinctOn with OrderBy to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no, 
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;
--Confirm table correctly made
SELECT * FROM unique_titles;

-- Retiring Titles table of number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.title),
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;
--Confirm table correctly made
SELECT * FROM retiring_titles;

-------------------------------------------------------------------
-- Deliverable 2: The Employees Eligible for the Mentorship Program
-------------------------------------------------------------------

-- Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(e.emp_no)
			e.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no=de.emp_no)
INNER JOIN titles as ti
ON(e.emp_no=ti.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
--Confirm table correctly made
SELECT * FROM mentorship_eligibilty;

-------------------------------------------------------------------
-- Deliverable 3: Additional Queries
-------------------------------------------------------------------

-- Unique Departments 
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no, 
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_departments
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;
--Confirm table correctly made
SELECT * FROM unique_departments;

-- Retiring Departments
SELECT COUNT(ud.dept_name),
	ud.dept_name
INTO retiring_departments
FROM unique_departments as ud
GROUP BY ud.dept_name
ORDER BY COUNT DESC;
--Confirm table correctly made
SELECT * FROM retiring_departments;

------------------------------------

-- New Qualified Mentorship Eligibility table 
SELECT DISTINCT ON(e.emp_no)
			e.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			ti.title
INTO qualified_mentors
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no=de.emp_no)
INNER JOIN titles as ti
ON(e.emp_no=ti.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1960-01-01' AND '1970-12-31')
AND ti.title IN('Senior Engineer','Senior Staff')
ORDER BY e.emp_no;
--Confirm table correctly made
SELECT * FROM qualified_mentors;