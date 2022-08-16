# Pewlett-Hackard-Analysis

## Overview 
The purpose of this analysis is to use SQL to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program given that many current employees are reaching retirement age.


## Results
There is a bulleted list with four major points from the two analysis deliverables.

### Deliverable 1: The Number of Retiring Employees by Title
Using the ERD previously created as a reference and SQL queries, create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, be sure to exclude those employees who have already left the company.

First, a Retirement Titles table was created that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955 with the following code:  
![image](https://user-images.githubusercontent.com/108038989/184790961-91d2427b-a9e1-4ab8-bbee-7b660b6bbcde.png)

The Retirement Titles table was exported as retirement_titles.csv and can be found here: 
(https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)
![image](https://user-images.githubusercontent.com/108038989/184791268-82ada60b-54f1-4f48-9a32-ed0e313e4fc6.png)

There are duplicate entries for some employees because they have switched titles over the years. The duplicates were removed with the following code and kept only the most recent title of each employee:
![image](https://user-images.githubusercontent.com/108038989/184792430-b8f741ff-4b29-4cd3-8cc5-3abb88836f2b.png)

The Unique Titles table was exported as unique_titles.csv and can be found here:
https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv
![image](https://user-images.githubusercontent.com/108038989/184792559-b9ca5202-b929-4384-9b5c-42158331169d.png)

Another query was used to retrieve the the number of employees by their most recent job title who are about to retire. First, retrieve the number of titles from the Unique Titles table. Then, create a Retiring Titles table to hold the required information. Group the table by title, then sort the count column in descending order.
Code: 
![image](https://user-images.githubusercontent.com/108038989/184793673-e0097e8e-d132-4a6d-8bd0-bfe29a45784e.png)

The Retiring Titles table was exported as retiring_titles.csv and can be found here:
https://github.com/lkachury/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv
![image](https://user-images.githubusercontent.com/108038989/184793621-237db3c3-d0ff-4570-a456-d952e743acaf.png)

### Deliverable 2: The Employees Eligible for the Mentorship Program
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.


## Summary
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The summary addresses the two questions and contains two additional queries or tables that may provide more insight
