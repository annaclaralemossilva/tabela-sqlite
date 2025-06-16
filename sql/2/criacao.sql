CREATE TABLE cliente (
    id_cli INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_cli VARCHAR(100) NOT NULL,
  	cpf_cli VARCHAR(14) NOT NULL UNIQUE,
    tel_cli VARCHAR(15),
  	email_cli VARCHAR(100),
  	dtnasc_cli TEXT,
  	endereco_cli TEXT
);

CREATE TABLE forn (
    id_forn INTEGER PRIMARY KEY AUTOINCREMENT,
    empresa VARCHAR(100) NOT NULL,
  	tipo_forn varchar(30)
);

CREATE TABLE funci (
    id_funci INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_funci VARCHAR(100) NOT NULL,
  	função VARCHAR(50) NOT NULL,
  	cpf_funci VARCHAR(14) NOT NULL UNIQUE,
  	rg_funci VARCHAR(12) NOT NULL UNIQUE,
    tel_funci VARCHAR(15),
  	email_funci VARCHAR(100),
  	dtnasci_funci TEXT,
  	dtcontr_funci TEXT,
  	endereco_funci TEXT
);

CREATE TABLE movimento (
    id_movi INTEGER PRIMARY KEY AUTOINCREMENT,
  	tipo_movi VARCHAR(100) NOT NULL,
  	categoria_movi VARCHAR(100) NOT NULL,
  	data_movimento TEXT,
  	valor_movi VARCHAR(10),
   	nome_funci VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto (
  	id_prod INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_prod VARCHAR(100) NOT NULL,
  	data_entrada TEXT,
 	data_fabricacao TEXT,
  	data_validade TEXT,
  	quantidade_prod INTEGER,
  	valor_prod VARCHAR(10),
 	nome_forn VARCHAR(100) NOT NULL
  );