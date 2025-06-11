CREATE TABLE IF NOT EXISTS produto (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
  	data_entrada TEXT,
 	data_fabricacao TEXT,
  	data_validade TEXT,
  	quantidade INTEGER,
  	valor VARCHAR(10),
 	fornecedor VARCHAR(100) NOT NULL
  );
  
  INSERT INTO produto ( nome, data_entrada, data_fabricacao, data_validade, quantidade, valor, fornecedor)
  VALUES (
    'Sorvete napolitano',
    '11/06/2025',
    '3/06/2025',
    '3/06/2026',
    '50',
    'R$20,00',
    'Kibon'
   );
   
   SELECT * FROM produto;
   