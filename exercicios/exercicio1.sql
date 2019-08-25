--Exercicio 1 --
--Aluno Ariel Roque --

--Modelagem Aluno x Curso -- 

--Criando tabelas --

CREATE TABLE aluno(
    matricula INTEGER,
    nome VARCHAR(50) NOT NULL,
    dataNasc VARCHAR(8) NOT NULL,
    PRIMARY KEY(matricula)
);

CREATE TABLE curso(
    codigo SERIAL,
    nome VARCHAR(20) NOT NULL,
    cargaHora INTEGER,
    PRIMARY KEY(codigo)
);

--Melhorando relacionamento --
ALTER TABLE aluno ALTER COLUMN dataNasc TYPE DATE USING dataNasc::DATE;
ALTER TABLE aluno ALTER COLUMN matricula TYPE VARCHAR(8);
ALTER TABLE aluno ADD CHECK (LENGTH(matricula) = 8);
ALTER TABLE curso ADD COLUMN descricao VARCHAR(60);
ALTER TABLE curso RENAME COLUMN cargaHora TO cargaHoraria;
ALTER TABLE curso ALTER COLUMN cargaHoraria SET NOT NULL;
ALTER TABLE curso ADD CHECK (cargaHoraria >= 10);

--Populando dados --
INSERT INTO aluno(matricula,nome,dataNasc) VALUES ('12345678','Joao','1999-05-08');
INSERT INTO aluno(matricula,nome,dataNasc) VALUES ('10345671','Carlos','1998-04-10');
INSERT INTO aluno(matricula,nome,dataNasc) VALUES ('12845673','Maria','2002-10-08');
INSERT INTO aluno(matricula,nome,dataNasc) VALUES ('12745675','Pabblo','2007-12-01');
INSERT INTO aluno(matricula,nome,dataNasc) VALUES ('12145678','Hary','1998-01-20');

INSERT INTO curso(nome,cargaHoraria) VALUES ('TCC',12);
INSERT INTO curso(nome,cargaHoraria) VALUES ('Admistracao',20);
INSERT INTO curso(nome,cargaHoraria) VALUES ('WEB',10);

--Atualizando dados --
UPDATE aluno SET nome ='Pablo' WHERE matricula = '12745675';
UPDATE  aluno SET dataNasc = '2007-10-02' WHERE matricula = '12845673';

--Consultando dados --
SELECT * FROM aluno;
SELECT * FROM curso;
SELECT nome FROM aluno WHERE DATE_PART('YEAR',CURRENT_TIMESTAMP) - DATE_PART('YEAR',dataNasc) >= 18;
SELECT nome FROM curso WHERE cargaHoraria BETWEEN 12 AND 20;

