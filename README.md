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
The full SQL query can be referenced here: /n
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
Another query was used to retrieve the the number of employees by their most recent job title who are about to retire. First, retrieve the number of titles from the Unique Titles table. Then, create a Retiring Titles table to hold the required information. Group the table by title, then sort the count column in descending order.
Code: 

First, retrieve the number of titles from the Unique Titles table.
Then, create a Retiring Titles table to hold the required information.
Group the table by title, then sort the count column in descending order.

A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.
<br /> ![image](https://user-images.githubusercontent.com/108038989/184793673-e0097e8e-d132-4a6d-8bd0-bfe29a45784e.png)

The Retiring Titles table was exported as [retiring_titles.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv).
<br /> ![image](https://user-images.githubusercontent.com/108038989/184793621-237db3c3-d0ff-4570-a456-d952e743acaf.png)

### Deliverable 2: The Employees Eligible for the Mentorship Program
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

#### Mentorship Eligibility

A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Retrieve the from_date and to_date columns from the Department Employee table.
Retrieve the title column from the Titles table.
Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Create a new table using the INTO clause.
Join the Employees and the Department Employee tables on the primary key.
Join the Employees and the Titles tables on the primary key.
8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
9. Order the table by the employee number.

<br /> ![image](https://user-images.githubusercontent.com/108038989/184796485-7e1d9829-fd27-430d-8d99-8ea2473b39ca.png)

The Mentorship Eligibility table was exported as [mentorship_eligibilty.csv](https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv):
<br /> ![image](https://user-images.githubusercontent.com/108038989/184796674-198b8afd-9f6d-42d8-99ea-9c2c0bfb241e.png)


## Summary
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The summary addresses the two questions and contains two additional queries or tables that may provide more insight
