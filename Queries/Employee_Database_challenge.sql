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

-- Use Dictinct with OrderBy to remove duplicate rows
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


