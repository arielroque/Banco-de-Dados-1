CREATE TABLE farmacia(
    id SERIAL,
    nome VARCHAR(30) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    estado VARCHAR(40) NOT NULL,
    gerente INTEGER NOT NULL,
    tipo VARCHAR(7) NOT NULL,
    UNIQUE(gerente),
    PRIMARY KEY (id),
    FOREIGN KEY(gerente) REFERENCES funcionario,
    CHECK (tipo = 'F' OR tipo = 'S') -- Filial | Sede--
);

CREATE TYPE funcao AS ENUM('F','V','E','C','A');

CREATE TABLE funcionario(
    cpf VARCHAR(11),
    nome VARCHAR(40) NOT NULL,
    funcao FUNCAO NOT NULL,
    farmacia INTEGER,
    isGerente BOOLEAN,
    PRIMARY KEY(cpf)
);

CREATE TABLE medicamento(
    id SERIAL,
    nome VARCHAR(40) NOT NULL,
    validade DATE NOT NULL,
    PRIMARY KEY(id),
);

CREATE TABLE venda(
    id SERIAL
);

CREATE TABLE entrega(

);

CREATE TABLE cliente(
  
);

CREATE TYPE tipoEndereco as ENUM ('R','T','O') --Residencia| Trabalho | Ouro --

CREATE TABLE endereco(
    id SERIAL,
    cliente VARCHAR(11),
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    estado VARCHAR(40) NOT NULL,
    tipo TIPOENDERECO NOT NU[],
    PRIMARY KEY(id),
    FOREIGN KEY (cliente) REFERENCES cliente(cpf)

)

