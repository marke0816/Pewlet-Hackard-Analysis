SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
from employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT * from unique_titles;

SELECT COUNT(title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;