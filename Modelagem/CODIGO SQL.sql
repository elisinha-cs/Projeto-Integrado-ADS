CREATE DATABASE JessicaSilvaOdontologia;

USE JessicaSilvaOdontologia;

CREATE TABLE paciente (
	id int (11) NOT NULL auto_increment,
    nome_paciente varchar (100) NOT NULL,
    cpf_paciente char (11) NOT NULL UNIQUE,
    nasc_paciente date NOT NULL,
    tel_paciente varchar (20),
    PRIMARY KEY (id)
);

CREATE TABLE consulta (
	id int (11) NOT NULL auto_increment,
    id_paciente int (11),
    data_consulta timestamp NOT NULL,
    situacao_consulta enum ('NAO ATENDIDO', 'COMPARECEU', 'REAGENDOU', 'FALTOU') NOT NULL DEFAULT 'NAO ATENDIDO',
    PRIMARY KEY (id),
	FOREIGN KEY (id_paciente) REFERENCES paciente (id)
);

CREATE TABLE convenio (
	id int (11) NOT NULL auto_increment,
	nome_convenio varchar (40) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE TABLE procedimento (
	id int (11) NOT NULL auto_increment,
	nome_procedimento varchar (50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tratamento (
	id int (11) NOT NULL auto_increment,
	id_paciente int (11) NOT NULL,
	id_convenio int (11) NOT NULL,
	id_procedimento int (11) NOT NULL,
	inicio_tratamento date NOT NULL,
	fim_tratamento date,
	PRIMARY KEY (id),
	FOREIGN KEY (id_paciente) REFERENCES paciente (id),
	FOREIGN KEY (id_convenio) REFERENCES convenio (id),
	FOREIGN KEY (id_procedimento) REFERENCES procedimento (id)
);

CREATE TABLE caixa (
	id int (11) NOT NULL auto_increment,
	data_abertura timestamp NOT NULL,
	data_fechamento timestamp,
	PRIMARY KEY (id)
);

CREATE TABLE receita (
	id int (11) NOT NULL auto_increment,
	id_tratamento int (11),
	id_caixa int (11) NOT NULL,
	valor_receita decimal (10, 2) NOT NULL,
	data_receita timestamp NOT NULL DEFAULT NOW(),
	metodo_pag varchar (30) NOT NULL,
	categoria_receita varchar (50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_tratamento) REFERENCES tratamento (id),
	FOREIGN KEY (id_caixa) REFERENCES caixa (id)
);

CREATE TABLE despesa (
	id int (11) NOT NULL auto_increment,
	id_caixa int (11) NOT NULL,
	valor_despesa decimal (10, 2) NOT NULL,
	data_despesa timestamp NOT NULL DEFAULT NOW(),
	categoria_despesa varchar (50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_caixa) REFERENCES caixa (id)
);

