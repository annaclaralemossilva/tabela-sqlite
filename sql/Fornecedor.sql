CREATE TABLE IF NOT EXISTS forn (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
  	tipo varchar(30)
  );
  
  INSERT INTO forn (nome, tipo)
  VALUES (
    'Kibon',
    'Sorvetes'
   );
   
   SELECT * FROM forn;
   