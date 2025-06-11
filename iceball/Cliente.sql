CREATE TABLE IF NOT EXISTS cliente (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
  	cpf VARCHAR(14) NOT NULL UNIQUE,
    tel VARCHAR(15),
  	email VARCHAR(100),
  	data_nascimento TEXT,
  	endereco TEXT
  );
  
  INSERT INTO cliente (nome, cpf, tel, email, data_nascimento, endereco)
  VALUES (
    'Anna Clara',
    '120.123.456-19',
    '(45) 99999-999',
    'annaclaralemossilva@gmail.com',
    '10/08/2008',
    'Foz do Iguaçu - PR'
   );
   
   SELECT * FROM cliente;
   