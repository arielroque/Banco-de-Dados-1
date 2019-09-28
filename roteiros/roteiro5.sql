-- Roteiro 5
--Ariel Roque UFCG--

--QUESTAO 1--
SELECT
    COUNT(*)
FROM
    employee
WHERE
    sex = 'F';

--QUESTAO 2--
SELECT
    AVG(salary)
FROM
    employee
WHERE
    sex = 'M'
    AND address LIKE '%TX';

--QUESTAO 3--
SELECT
    s.ssn AS ssn_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    LEFT JOIN employee AS s ON e.superssn = s.ssn
GROUP BY
    ssn_supervisor
ORDER BY
    qtd_supervisionados;

--QUESTAO 4--
SELECT
    s.fname AS nome_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    INNER JOIN employee AS s ON s.ssn = e.superssn
GROUP BY
    s.fname
ORDER BY
    COUNT(*);

--QUESTAO 5--
SELECT
    s.fname AS nome_supervisor,
    COUNT(*) AS qtd_supervisionados
FROM
    employee AS e
    LEFT JOIN employee AS s ON s.ssn = e.superssn
GROUP BY
    s.fname
ORDER BY
    COUNT(*);

--QUESTAO 6--
SELECT
    MIN(qtd) AS qtd_empregados
FROM
    (
        SELECT
            COUNT(essn) AS qtd
        FROM
            works_on
        GROUP BY
            pno
    ) as qtds;

--QUESTAO 7--
SELECT
    pno AS proj,
    COUNT(essn) AS qtd
FROM
    works_on
GROUP BY
    pno
HAVING
    COUNT(essn) = (
        SELECT
            MIN(qtd) AS qtd_empregados
        FROM
            (
                SELECT
                    COUNT(essn) AS qtd
                FROM
                    works_on
                GROUP BY
                    pno
            ) as qtds
    );

--QUESTAO 8--
SELECT
    w.pno AS num_proj,
    AVG(e.salary)
FROM
    works_on as w,
    employee as e
WHERE
    e.ssn = w.essn
GROUP BY
    pno;

--QUESTAO 9--
SELECT
    p.pnumber AS proj_num,
    p.pname AS proj_nome,
    AVG(e.salary) AS media_sal
FROM
    project as p
    JOIN works_on AS w ON w.pno = p.pnumber
    JOIN employee AS e ON e.ssn = w.essn

GROUP BY
    proj_num
ORDER BY media_sal

--QUESTAO 10--
SELECT
    distinct e.fname,
    e.salary
FROM
    works_on AS w,
    employee AS e
WHERE
    e.ssn NOT IN (
        SELECT
            w.essn
        FROM
            works_on AS w
        WHERE
            w.pno = 92
    )
    AND e.salary > (
        SELECT
            MAX(salary)
        FROM
            works_on AS w,
            employee AS e
        WHERE
            w.essn = e.ssn
            AND w.pno = 92
    );

--QUESTAO 11--
SELECT
    e.ssn,
    COUNT(w.essn) AS qtd_proj
FROM
    employee as e
    LEFT JOIN works_on AS w ON e.ssn = w.essn
GROUP BY
    e.ssn
ORDER BY
    COUNT(w.essn);

--QUESTAO 12--
SELECT
    w.pno AS num_proj,
    COUNT(e.ssn) AS qtd_func
FROM
    employee AS e
    LEFT JOIN works_on AS W ON e.ssn = w.essn
GROUP BY
    pno
HAVING
    COUNT(e.ssn) < 5
ORDER BY
    qtd_func;

--QUESTAO 13--
SELECT
    DISTINCT e.fname
FROM
    employee AS e,
    dependent AS d,
    (
        SELECT
            w.essn AS ssn
        FROM
            works_on AS w
        WHERE
            w.pno IN (
                SELECT
                    p.pnumber AS pno
                FROM
                    project AS p
                WHERE
                    p.plocation = 'Sugarland'
            )
    ) AS sugarland_employees
where
    e.ssn = sugarland_employees.ssn
    AND e.ssn = d.essn;

--QUESTAO 14--
SELECT
    d.dname
FROM
    department AS d
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            project AS p
        WHERE
            p.dnum = d.dnumber
    );