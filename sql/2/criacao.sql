CREATE TABLE IF NOT EXISTS cliente (
    id_cli INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_cli VARCHAR(100) NOT NULL,
  	cpf_cli VARCHAR(14) NOT NULL UNIQUE,
    tel_cli VARCHAR(15),
  	email_cli VARCHAR(100),
  	dtnasc_cli DATE,
  	endereco_cli TEXT
);

CREATE TABLE IF NOT EXISTS fornecedor (
    id_forn INTEGER PRIMARY KEY AUTOINCREMENT,
    empresa VARCHAR(100) NOT NULL,
  	tipo_forn varchar(30),
  	cnpj_forn VARCHAR(18),
 	tel_forn VARCHAR(15),
  	end_forn VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS funcionario (
    id_funci INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_funci VARCHAR(100) NOT NULL,
  	função VARCHAR(50) NOT NULL,
  	cpf_funci VARCHAR(14) NOT NULL UNIQUE,
  	rg_funci VARCHAR(12) NOT NULL UNIQUE,
    tel_funci VARCHAR(15),
  	email_funci VARCHAR(100),
  	dtnasci_funci DATE,
  	dtcontr_funci DATE,
  	endereco_funci TEXT
);

CREATE TABLE IF NOT EXISTS movimento (
    id_movi INTEGER PRIMARY KEY AUTOINCREMENT,
  	tipo_movi VARCHAR(100) NOT NULL,
  	categoria_movi VARCHAR(100) NOT NULL,
  	data_movimento DATE,
  	valor_movi VARCHAR(10),
   	nome_funci VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto (
  	id_prod INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_prod VARCHAR(100) NOT NULL,
  	data_entrada DATE,
 	data_fabricacao DATE,
  	data_validade DATE,
  	quantidade_prod INTEGER,
  	valor_prod VARCHAR(10),
 	nome_forn VARCHAR(100) NOT NULL
  );
  
CREATE TABLE IF NOT EXISTS categoria (
  );
  
CREATE TABLE IF NOT EXISTS caixa(
  	id_caixa INTEGER PRIMARY KEY AUTOINCREMENT,
  	FOREIGN KEY (id_prod) REFERENCES produto(id_prod),
  );
  

