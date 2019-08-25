-- Roteiro 1--
-- Ariel Roque  UFCG --

CREATE TABLE automovel(
    chassi VARCHAR(17),
    placa  VARCHAR(7),
    marca  VARCHAR(30),
    modelo VARCHAR(40),
    ano INTEGER
);

CREATE TABLE segurado(
    id SERIAL,
    automovel VARCHAR(50),
    cpfContratante VARCHAR(17),
    telefone VARCHAR(12)
);

CREATE TABLE perito(
    cpf VARCHAR(14),
    nome VARCHAR(50),
    telefone VARCHAR(12),
    dataNasc DATE
);

CREATE TABLE oficina(
    cnpj VARCHAR(14),
    nomeFantasia VARCHAR(50),
    endereco VARCHAR(250),
    cidade VARCHAR(20),
    estado VARCHAR(30),
    telefone VARCHAR(12)
);

CREATE TABLE seguro(
    id Serial,
    dataInicio DATE,
    dateFim DATE,
    segurado INTEGER,
    valor NUMERIC
);

CREATE TABLE sinistro(
    id Serial,
    evento VARCHAR(500),
    dataEvento TIMESTAMP,
    segurado INTEGER
);

CREATE TABLE pericia(
    id Serial,
    perito VARCHAR(14),
    sinistro INTEGER,
    laudo VARCHAR(500)
);

CREATE TABLE reparo(
    id SERIAL,
    seguro INTEGER,
    descricao VARCHAR(200),
    custo NUMERIC
);

-- Definindo chaves primárias -- 

ALTER TABLE automovel ADD PRIMARY KEY (chassi);
ALTER TABLE segurado ADD PRIMARY Key (id);
AlTER TABLE perito ADD PRIMARY KEY (cpf);
AlTER TABLE oficina ADD PRIMARY KEY (cnpj);
ALTER TABLE seguro ADD PRIMARY KEY (id);
ALTER TABLE sinistro ADD PRIMARY KEY(id);
ALTER TABLE pericia ADD PRIMARY KEY (id);
ALTER TABLE reparo ADD PRIMARY KEY (id);

-- Definindo chaves estrangeiras --

ALTER TABLE segurado ADD CONSTRAINT FK_automovel_segurado FOREIGN KEY (automovel)
REFERENCES automovel(chassi);

ALTER TABLE seguro ADD CONSTRAINT FK_segurado_seguro FOREIGN KEY (segurado)
REFERENCES segurado(id);

ALTER TABLE sinistro ADD CONSTRAINT FK_segurado_sinistro FOREIGN KEY(segurado)
REFERENCES segurado(id);

ALTER TABLE pericia ADD CONSTRAINT FK_perito_pericia FOREIGN KEY(perito)
REFERENCES perito(cpf);

ALTER TABLE pericia ADD CONSTRAINT FK_sinistro_pericia FOREIGN KEY(sinistro)
REFERENCES sinistro(id);

ALTER TABLE reparo ADD CONSTRAINT FK_seguro_reparo FOREIGN KEY(seguro)
REFERENCES seguro(id);

-- Definindo atributos como NOT NULL

ALTER TABLE automovel ALTER COLUMN marca SET NOT NULL;
ALTER TABLE automovel ALTER COLUMN modelo SET NOT NULL;
ALTER TABLE automovel ALTER COLUMN ano SET NOT NULL;

ALTER TABLE segurado ALTER COLUMN automovel SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN cpfContratante SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN telefone SET NOT NULL;

ALTER TABLE perito ALTER COLUMN nome SET NOT NULL;
ALTER TABLE perito ALTER COLUMN telefone SET NOT NULL;

ALTER TABLE oficina ALTER COLUMN nomeFantasia SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN endereco SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN estado SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN cidade SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN telefone SET NOT NULL;

ALTER TABLE seguro ALTER COLUMN dataInicio SET NOT NULL;
ALTER TABLE seguro ALTER COLUMN dateFim SET NOT NULL;
ALTER TABLE seguro ALTER COLUMN segurado SET NOT NULL;
ALTER TABLE seguro ALTER COLUMN valor SET NOT NULL;

ALTER TABLE sinistro ALTER COLUMN evento SET NOT NULL;
ALTER TABLE sinistro ALTER COLUMN dataEvento SET NOT NULL;
ALTER TABLE sinistro ALTER COLUMN segurado SET NOT NULL;

ALTER TABLE pericia ALTER COLUMN perito SET NOT NULL;
ALTER TABLE pericia ALTER COLUMN sinistro SET NOT NULL;
ALTER TABLE pericia ALTER COLUMN laudo SET NOT NULL;

AlTER TABLE reparo ALTER COLUMN  seguro SET NOT NULL;
ALTER TABLE reparo ALTER COLUMN  custo SET NOT NULL;

-- Criando as tabelas incorporando as definições inseridas no ALTER TABLE --

CREATE TABLE automovel(
    chassi VARCHAR(17),
    placa  VARCHAR(7) NOT NULL,
    marca  VARCHAR(30) NOT NULL,
    modelo VARCHAR(40) NOT NULL,
    ano INTEGER NOT NULL,
    PRIMARY KEY(chassi)
);

CREATE TABLE segurado(
    id SERIAL,
    automovel VARCHAR(50) NOT NULL,
    cpfContratante VARCHAR(17) NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN key(automovel) REFERENCES automovel(chassi)
);

CREATE TABLE perito(
    cpf VARCHAR(14),
    nome VARCHAR(50) NOT NULL ,
    telefone VARCHAR(12) NOT NULL,
    dataNasc DATE NOT NULL,
    PRIMARY KEY(cpf)
);

CREATE TABLE oficina(
    cnpj VARCHAR(14),
    nomeFantasia VARCHAR(50) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    PRIMARY KEY(cnpj)
);

CREATE TABLE seguro(
    id Serial
    dataInicio DATE NOT NULL ,
    dateFim DATE NOT NULL,
    segurado INTEGER NOT NULL,
    valor NUMERIC NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(segurado) REFERENCES segurado(id)
);

CREATE TABLE sinistro(
    id Serial
    evento VARCHAR(500) NOT NULL,
    dataEvento TIMESTAMP NOT NULL,
    segurado INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(segurado) REFERENCES segurado(id)
);

CREATE TABLE pericia(
    id Serial,
    perito VARCHAR(14) NOT NULL,
    sinistro INTEGER NOT NULL,
    laudo VARCHAR(500) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(sinistro) REFERENCES sinistro(id),
    FOREIGN KEY(perito) REFERENCES perito(cpf)
    
);

CREATE TABLE reparo(
    id SERIAL,
    seguro INTEGER NOT NULL ,
    descricao VARCHAR(200),
    custo NUMERIC NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(seguro) REFERENCES seguro(id)
);



















