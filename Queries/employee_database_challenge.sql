-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

-- Build retirement_title.csv
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE ((e.birth_date >= '1951-01-01') AND (e.birth_date <='1955-12-31'))
ORDER BY e.emp_no ASC;

-- retrieve unique_titles.csv
SELECT DISTINCT ON (emp_no)
    emp_no,
    first_name,
    last_name,
    title
FROM retirement_title AS r
WHERE to_date = '9999-01-01';

-- retrieve retiring_titles.csv
SELECT 
    COUNT(u.title),
	u.title
INTO retiring_titles
FROM unique_titles AS u
GROUP BY u.title
ORDER BY count DESC;

-- mentorship eligibility

SELECT DISTINCT ON (emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE ((de.to_date = '9999-01-01') AND ((birth_date >= '1965-01-01') AND (birth_date <= '1965-12-31')))
ORDER BY emp_no ASC;