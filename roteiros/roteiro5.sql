--ARIEL ROQUE INACIO LUZ--
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
    --QUESTAO 6--
SELECT
    proj AS num_projeto,
    MIN(qtd) AS qtd_empregados
FROM
    (
        SELECT
            pno AS proj,
            COUNT(essn) AS qtd
        FROM
            works_on
        GROUP BY
            pno
    ) as qtds;
--QUESTAO 7--
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
--QUESTAO 9-- !!
SELECT
    w.pno AS proj_num,
    p.pname AS proj_nome,
    AVG(e.salary) AS media_sal
FROM
    works_on as w,
    employee as e,
    project as p
WHERE
    e.ssn = w.essn
    AND w.pno = p.pnumber
GROUP BY
    pno;
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
    LEFT JOIN works_on AS w on e.ssn = w.essn
GROUP BY
    e.ssn
ORDER BY
    COUNT(w.essn);
--QUESTAO 12--
    --QUESTAO 13--
    --QUESTAO 14--
    --QUESTAO 15--
    --QUESTAO 16--