--Roteiro 2--
-- Ariel Roque UFCG --

CREATE TABLE tarefas(
    id NUMERIC,
    tarefa VARCHAR(50),
    atributo3 VARCHAR(11),
    atributo4 INTEGER,
    atributo5 VARCHAR(1)
);

INSERT INTO tarefas VALUES (2147483647,
'limpa janelas da sala 203','98765432122',1,'F');

INSERT INTO tarefas VALUES(NULL,NULL,NULL,NULL,NULL);

-- nao deve aceitar---
INSERT INTO tarefas VALUES(2147483644,'limpar chao do corredor superior','987654323211',0,'F');
INSERT INTO tarefas VALUES(2147483648,'limpar portas do térrreo','32323232955',4,'A');


ALTER TABLE tarefas ALTER COLUMN id TYPE NUMERIC;

INSERT TABLE tarefas VALUES(214783650,'limpar janelas','32333233288',32769,'A');

ALTER TABLE tarefas ADD CHECK (atributo4 <=32767);

INSERT INTO tarefas VALUES (214747483652,'limpar portas do 2 andar','32323232911',32766,'A');

-- Questao 4 --

DELETE FROM tarefas WHERE id IS NULL OR tarefa IS NULL OR atributo3 IS NULL OR atributo3  IS NULL OR atributo4 IS NULL;

ALTER TABLE tarefas RENAME COLUMN tarefa TO descricao;
ALTER TABLE tarefas RENAME COLUMN  atributo3 TO func_resp_cpf;
ALTER TABLE tarefas RENAME COLUMN  atributo4 TO prioridade;
ALTER TABLE tarefas RENAME COLUMN  atributo5 TO status;

ALTER TABLE tarefas ALTER COLUMN id SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN func_resp_cpf SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN prioridade SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN status SET NOT NULL;

-- Questao 5 -- 

ALTER TABLE tarefas ADD PRIMARY KEY (id);

INSERT INTO tarefas VALUES(2147483653,'limpar portas do 1o andar','32323232911',2,'A');
-- nao deve funcionar --
INSERT INTO tarefas VALUES(2147483653,'limpar portas do 1o andar','32323232911',2,'A');

-- Questao 6 -- 

--a)--
ALTER TABLE tarefas ADD CHECK (LENGTH(func_resp_cpf) = 11);

-- nao deve funcionar --
INSERT INTO tarefas VALUES(2147483654,'limpar portas do 1o andar','3232323291',2,'A');
INSERT INTO tarefas VALUES(2147483655,'limpar portas do 1o andar','323232329132',2,'A');
--b)--

UPDATE tarefas SET status = 'P' WHERE status ='A';
UPDATE tarefas SET status = 'R' WHERE status = 'E';
UPDATE tarefas SET status = 'F' WHERE status = 'C';

ALTER TABLE tarefas ADD CHECK (status = 'P' OR status = 'R' OR status = 'F');

--Questao 7 --
ALTER TABLE tarefas ADD CHECK (prioridade BETWEEN 0 AND 5);

-- Questao 8 --

CREATE TABLE funcionario(
  cpf VARCHAR(11),
  data_nasc VARCHAR(10) NOT NULL,
  nome VARCHAR(40) NOT NULL,
  funcao VARCHAR(11) NOT NULL,
  nivel VARCHAR(1) NOT NULL,
  superior_cpf VARCHAR(11),
  PRIMARY KEY(cpf),
  FOREIGN KEY (superior_cpf) REFERENCES funcionario(cpf)
);
ALTER TABLE funcionario ADD CHECK (nivel = 'J' OR nivel = 'P' OR nivel = 'S');

ALTER TABLE funcionario ADD CHECK ((funcao = 'LIMPEZA' AND superior_cpf IS NOT NULL) OR (funcao = 'SUP_LIMPEZA' AND superior_cpf IS NULL));

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678911','1980-05-07','Pedro da Silva','SUP_LIMPEZA','S',NULL);

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678912','1980-03-08','Jose da Silva','LIMPEZA','J','12345678911');

-- Nao deve funcionar--
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678913','1980-04-09','Joao da Silva','LIMPEZA','J',NULL);    

-- Questao 9 --
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678914','1980-04-09','Gil da Silva','SUP_LIMPEZA','J',NULL);   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678915','1980-04-09','Luan da Silva','LIMPEZA','J','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678916','1980-04-09','Gilberto da Silva','LIMPEZA','J','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678917','1980-04-09','Casarre da Silva','LIMPEZA','J','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678918','1980-04-09','Beltrano da Silva','LIMPEZA','J','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678919','1980-04-09','Sicrano da Silva','SUP_LIMPEZA','J',NULL);   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678920','1980-04-09','Otaviano da Silva','LIMPEZA','J','12345678919');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678921','1980-04-09','Brenner da Silva','LIMPEZA','J','12345678919';   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678922','1980-04-09','Matheus da Silva','LIMPEZA','J','12345678919');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678923','1980-04-09','Bianca da Silva','LIMPEZA','J',NULL);

-- nao deve funcionar

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678924','1980-04-09',NULL,'SUP_LIMPEZA','J',NULL);   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678925','1980-04-09','Luan da Silva',NULL,'A','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678926','1980-04-09','Gilberto da Silva','LIMPEZA','K','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678927',NULL,'Casarre da Silva','LIMPEZA','J','12345678926');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678928','1980-04-09','Beltrano da Silva','LIMPEZA','J',NULL);   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES (NULL,'1980-04-09','Sicrano da Silva','SUP_LIMPEZA','J','12345678914');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678930','1980-04-09','Otaviano da Silva','SUP_LIMPEZA','J','12345678919');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678931','1980-04-09','Brenner da Silva','LIMPEZA','J',NULL;   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678932','1980-04-09','Matheus da Silva',NULL,'J','12345678919');   

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) 
VALUES ('12345678933','1980-04-09','Bianca da Silva','LIMPEZA','J',NULL);

--Questao 10--
ALTER TABLE tarefas
drop constraint FK_funcionario_tarefa;


ALTER TABLE tarefas ADD CONSTRAINT FK_funcionario_tarefa FOREIGN KEY (func_resp_cpf) 
REFERENCES funcionario(cpf) ON DELETE CASCADE;

--Questao 11 --

ALTER TABLE tarefas ALTER COLUMN func_resp_cpf DROP NOT NULL;
ALTER TABLE tarefas ADD CHECK ((status ='E' AND func_resp_cpf IS NOT NULL) OR (status != 'E' 
AND (func_resp_cpf IS NULL OR func_resp_cpf is NOT NULL)));




