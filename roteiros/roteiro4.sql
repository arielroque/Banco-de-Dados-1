--Roteiro 4--
-- Ariel Roque UFCG -- 

--QUESTÃO 1--
SELECT
    *
FROM
    department;

--QUESTÃO 2--
SELECT
    *
FROM
    dependent;

--QUESTÃO 3--
SELECT
    *
FROM
    dept_locations;

--QUESTÃO 4--
SELECT
    *
FROM
    employee;

--QUESTÃO 5--
SELECT
    *
FROM
    project;

--QUESTÃO 6--
SELECT
    *
FROM
    works_on;

--QUESTÃO 7--
SELECT
    fname lname
FROM
    employee
WHERE
    sex = 'M';

--QUESTÃO 8--
SELECT
    fname
FROM
    employee
WHERE
    sex = 'M'
    AND superssn IS null;

--QUESTÃO 9--
SELECT
    e.fname,
    s.fname
FROM
    employee AS e,
    employee AS s
WHERE
    e.superssn IS NOT NULL
    AND e.superssn = s.ssn;

--QUESTÃO 10--
SELECT
    e.fname
FROM
    employee AS e,
    employee AS s
WHERE
    s.fname = 'Franklin'
    AND s.ssn = e.superssn;

--QUESTÃO 11--
SELECT
    d.dname,
    l.dlocation
FROM
    department AS d,
    dept_locations AS l
WHERE
    d.dnumber = l.dnumber;

--QUESTÃO 12--
SELECT
    d.dname,
    l.dlocation
FROM
    department AS d,
    dept_locations as l
WHERE
    d.dnumber = l.dnumber
    AND l.dlocation LIKE 'S%';

--QUESTÃO 13--
SELECT
    e.fname,
    d.dependent_name
FROM
    employee AS e,
    dependent AS d
WHERE
    e.ssn IS NOT NULL
    AND e.ssn = d.essn;

--QUESTÃO 14--
SELECT
    (fname || ' ' || minit || ' ' || lname) AS full_name,
    salary
FROM
    employee
WHERE
    salary > 50000;

--QUESTÃO 15--
SELECT
    pname,
    dname
FROM
    project,
    department
WHERE
    dnum = dnumber;

-- QUESTÃO 16--
SELECT
    pname,
    fname
FROM
    project,
    employee,
    department
WHERE
    dnum = dnumber
    AND mgrssn = ssn
    AND pnumber > 30;

-- QUESTÃO 17--
SELECT
    p.pname,
    e.fname
FROM
    project AS p,
    employee AS e,
    works_on AS w
WHERE
    p.pnumber = w.pno
    AND w.essn = e.ssn;

-- QUESTÃO 18--
SELECT
    e.fname,
    d.dependent_name,
    d.relationship
FROM
    employee AS e,
    project AS p,
    works_on AS w,
    dependent as d
WHERE
    e.ssn = w.essn
    AND p.pnumber = w.pno
    AND p.pnumber = 91
    AND d.essn = e.ssn;