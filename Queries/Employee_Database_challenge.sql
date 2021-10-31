--Retrieve the emp_no, first_name, and last_name columns from the Employees table and retrieve the title, from_date, and to_date columns from the Titles table.
SELECT	e.emp_no, 
		e.first_name,
		e.last_name, 
		t.title,
		t.from_date,
		t.to_date
		
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;
	

-- Use Dictinct with Orderby to remove duplicate rows  employee number, first and last name, and title columns from the Retirement Titles table.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


--Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(first_name)
FROM unique_titles;

--First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;


--Mentorship
--Join Employees, Dept_emp, and titles on primary key aka emp_no, add requested columns, filter by dates and asc order using distinct
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title 
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)

WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;


--Count employees in mentorship eligibility.
SELECT COUNT(emp_no), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY count(title) DESC;