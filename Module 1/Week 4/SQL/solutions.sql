################################### CHALLENGE 1

use publications;

CREATE TEMPORARY TABLE temp SELECT 
au.au_id, au.au_lname, au.au_fname, ta.title_id
FROM
authors au
RIGHT JOIN 
titleauthor ta ON au.au_id = ta.au_id
ORDER BY
au.au_id;

CREATE TEMPORARY TABLE temp2 SELECT 
temp.au_id, temp.au_lname, temp.au_fname, temp.title_id, t.title, t.pub_id
FROM
titles t
RIGHT JOIN 
temp ON
t.title_id = temp.title_id
ORDER BY
temp.au_id;

CREATE TABLE challenge1 SELECT 
temp2.au_id, temp2.au_lname, temp2.au_fname, temp2.title, p.pub_name
FROM
publishers p
RIGHT JOIN
temp2 ON
temp2.pub_id = p.pub_id
ORDER BY
temp2.au_id;

################################### CHALLENGE 2

SELECT 
c1.au_id, c1.au_lname, c1.au_fname, c1.pub_name, COUNT(c1.pub_name) title_count
FROM
challenge1 c1
GROUP BY 
c1.pub_name, c1.au_id
ORDER BY 
title_count DESC;

################################### CHALLENGE 3

SELECT
temp2.au_id, temp2.au_lname, temp2.au_fname, sum(s.qty) total
FROM
sales s
RIGHT JOIN
temp2 ON
temp2.title_id = s.title_id
GROUP BY 
temp2.title_id
ORDER BY
total DESC
LIMIT 3;

################################### CHALLENGE 4
SELECT
temp2.au_id, temp2.au_lname, temp2.au_fname, sum(s.qty) total 
FROM
sales s
RIGHT JOIN
temp2 ON
temp2.title_id = s.title_id
GROUP BY 
temp2.title_id
ORDER BY
total DESC;
