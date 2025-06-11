CREATE TABLE IF NOT EXISTS func (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
  	função VARCHAR(50) NOT NULL,
  	cpf VARCHAR(14) NOT NULL UNIQUE,
  	rg VARCHAR(12) NOT NULL UNIQUE,
    tel VARCHAR(15),
  	email VARCHAR(100),
  	data_nascimento TEXT,
  	data_contrato TEXT,
  	endereco TEXT
  );
  
  INSERT INTO func (nome, funcao, cpf, rg, tel, email , data_nascimento , data_contrato , endereco)
  VALUES (
    'Isadora',
    'dona',
    '987.321.781-04',
    '00.000.000-0',
    '(45) 99999-999',
    'isadora@gmail.com',
    '04/12/2007',
    '10/03/2025',
    'Foz do Iguaçu - PR'
   );
   
   SELECT * FROM func;
   