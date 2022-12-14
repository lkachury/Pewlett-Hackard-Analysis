# Pewlett-Hackard-Analysis

## Overview 
Pewlett-Hackard is a large company with a rapidly retiring baby boomer employee force and their upcoming retirements will leave thousands of job openings. The company is offering retirement packages for eligible employees and needs to know what positions will need to be filled in the near future. The purpose of this analysis is to use SQL to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. This analysis will help prepare the company's HR team for the “silver tsunami” as many current employees reach retirement age.

## Resources
### Software
- QuickDBD
- Python 3.7.6
- PostgreSQL and pgAdmin 6.8
- Visual Studio Code 1.69
### Data Source
- [Six CSVs](https://github.com/lkachury/Pewlett-Hackard-Analysis/tree/main/Data/Data%20Source%20CSVs) 

## ERD and Schema
The ERD (Entity Relationship Diagram) below was built from the six Source Data CSVs using this [schema](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Queries/schema.sql): 
<br /> ![EmployeeDB](https://user-images.githubusercontent.com/108038989/185003521-737ddff9-d366-40f2-b2dc-716ac5378778.png)

## Results
The full SQL query can be referenced here: <br />
https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_challenge.sql

### Deliverable 1: The Number of Retiring Employees by Title
> Using the ERD as a reference and SQL queries, create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, be sure to exclude those employees who have already left the company.

#### Retirement Titles Table
A Retirement Titles table was created that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955 with the following instructions and query code:
  > 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
  > 2. Retrieve the title, from_date, and to_date columns from the Titles table.
  > 3. Create a new table using the INTO clause.
  > 4. Join both tables on the primary key.
  > 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.

<br /> ![image](https://user-images.githubusercontent.com/108038989/184790961-91d2427b-a9e1-4ab8-bbee-7b660b6bbcde.png)

The Retirement Titles table was exported as [retirement_titles.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/retirement_titles.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/184791268-82ada60b-54f1-4f48-9a32-ed0e313e4fc6.png)

#### Unique Titles
There are duplicate entries for some employees because they have switched titles over the years. The duplicates were removed with the following instructions and query code to keep only the most recent title of each employee:
  > 1. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
  > 2. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
  > 3. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
  > 4. Create a Unique Titles table using the INTO clause.
  > 5. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.

<br /> ![image](https://user-images.githubusercontent.com/108038989/184792430-b8f741ff-4b29-4cd3-8cc5-3abb88836f2b.png)

The Unique Titles table was exported as [unique_titles.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/unique_titles.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/184792559-b9ca5202-b929-4384-9b5c-42158331169d.png)

#### Retiring Titles
The number of employees by their most recent job title who are about to retire were queried by first retrieving the number of titles from the Unique Titles table and then creating a Retiring Titles table to hold the required information with the following instructions and query code: 
  > 1. First, retrieve the number of titles from the Unique Titles table.
  > 2. Then, create a Retiring Titles table to hold the required information.
  > 3. Group the table by title, then sort the count column in descending order.

<br /> ![image](https://user-images.githubusercontent.com/108038989/184793673-e0097e8e-d132-4a6d-8bd0-bfe29a45784e.png)

The Retiring Titles table was exported as [retiring_titles.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/retiring_titles.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/184793621-237db3c3-d0ff-4570-a456-d952e743acaf.png)

### Deliverable 2: The Employees Eligible for the Mentorship Program
> Using the ERD as a reference and SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

#### Mentorship Eligibility
A Mentorship Eligibility table was created for current employees who were born between January 1, 1965 and December 31, 1965 with the following instructions and query code:
  > 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
  > 2. Retrieve the from_date and to_date columns from the Department Employee table.
  > 3. Retrieve the title column from the Titles table.
  > 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
  > 5. Create a new table using the INTO clause.
  > 6. Join the Employees and the Department Employee tables on the primary key.
  > 7. Join the Employees and the Titles tables on the primary key.
  > 8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
  > 9. Order the table by the employee number.

<br /> ![image](https://user-images.githubusercontent.com/108038989/184796485-7e1d9829-fd27-430d-8d99-8ea2473b39ca.png)

The Mentorship Eligibility table was exported as [mentorship_eligibilty.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/mentorship_eligibility.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/184796674-198b8afd-9f6d-42d8-99ea-9c2c0bfb241e.png)

## Summary
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

From the Retiring Titles table in Deliverable 1, the total number of roles retiring is 72,458 with the largest number of retiring employees being Senior Engineer (25,916) and Senior Staff (24,926). An additional query we can ask the database here is to look at the number of retiring employees for each department to determine which departments should be prioritized. 

The department name was first added to a new table for each retiring employee with the following code:
![image](https://user-images.githubusercontent.com/108038989/185016983-2e69bf5c-30cc-449d-a5ad-ffacb5320f5b.png)

This generated a Unique Departments table that was exported as [unique_departments.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/unique_departments.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/185017197-92835bf1-10a3-470c-88b1-ff47afb7b34b.png)

The number of retiring employees for each department was retrieved from this Unique Departments table and a Retiring Departments table was generated with the following code:
<br /> ![image](https://user-images.githubusercontent.com/108038989/185018077-dc467470-9560-4ca0-bff7-42b4c3e1f710.png)

This generated a Retiring Departments table that was exported as [retiring_departments.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/retiring_departments.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/185019171-9b02f15f-45bd-4ae9-beb9-1724aafe3821.png)

From this table, the most heavily impacted departments will be Development with 19,391 retiring employees (26.8% of all retiring employees) and Production with 17,784 retiring employees (24.5% of all retiring employees). 

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
From the Mentorship Eligibility table in Deliverable 2, there are 1,549 retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees. With 72,458 retiring employees, this does not appear to be enough. A potential solution to this is to increase the age range by 5 years in both directions to range from 1960-1970 instead of just 1965 and then to focus on employees with leadership positions (Senior Engineer and Senior Staff) which also happens to be the roles with the highest number of retiring employees:
<br /> ![image](https://user-images.githubusercontent.com/108038989/185026640-001f27c1-94e6-4199-851c-d4dc6324483e.png)

This generated a new Qualified Mentorship Eligibility table that was exported as [qualified_mentors.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20CSVs/qualified_mentors.csv)
<br /> ![image](https://user-images.githubusercontent.com/108038989/185026869-c9b100f4-2045-4f8c-86c6-07f8b8ccb74e.png)

From this list, the new number of retirement-ready employees in the departments increases to 65,583 employees, which is more comparable to the 72,458 retiring employees.
