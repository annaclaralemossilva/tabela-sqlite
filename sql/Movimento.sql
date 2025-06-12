CREATE TABLE IF NOT EXISTS movimento (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,
  	tipo VARCHAR(100) NOT NULL,
  	categoria VARCHAR(100) NOT NULL,
  	data_movimento TEXT,
  	valor VARCHAR(10),
   	responsavel VARCHAR(100) NOT NULL
  );
  
  INSERT INTO movimento ( tipo, categoria, data_movimento, valor, responsavel )
  VALUES (
    'Despesa',
    'Reabastecimento de estoque',
    '12/06/2025',
    '-R$45,80',
    'Alessandra'
   );
   
   SELECT * FROM movimento;
   