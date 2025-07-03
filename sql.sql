-- ===============================
-- CRIAÇÃO DAS TABELAS
-- ===============================

-- Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    forn_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cnpj TEXT,
    telefone TEXT,
    email TEXT,
    endereco TEXT,
    contato_nome TEXT,
    contato_cargo TEXT
);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos (
    prod_id INTEGER PRIMARY KEY AUTOINCREMENT,
   	id_fornecedor INTEGER,
    nome TEXT NOT NULL,
    prod_descricao TTEXT NOT NULL,
    prod_categoria TEXT,
    quantidade_em_estoque INTEGER DEFAULT 0,
    preco_compra REAL,
    preco_venda REAL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_forn)
);

-- Tabela de Compras
CREATE TABLE IF NOT EXISTS compras (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fornecedor TEXT,
    data_compra DATE,
    valor_total REAL,
    metodo_pagamento TEXT
);

-- Itens de Compra
CREATE TABLE IF NOT EXISTS itens_compra (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    compra_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    preco_unitario REAL,
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Vendas
CREATE TABLE IF NOT EXISTS vendas (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
  	cliente_id INTEGER NOT NULL,
  	id_fornecedor INTEGER,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    metodo_pagamento TEXT,
  	FOREIGN KEY (cliente_id) REFERENCES clientes(cli_id),
  	FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_forn)
);

-- Itens de Venda
CREATE TABLE IF NOT EXISTS itens_venda (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    preco_unitario REAL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Empenhos
CREATE TABLE IF NOT EXISTS empenhos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT,
    data_empenho DATE,
    status TEXT
);

-- Tabela de Inventário
CREATE TABLE IF NOT EXISTS inventario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produto_id INTEGER,
    quantidade_atual INTEGER,
    data_atuaSELECT * FROM demo;lizacao DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Pagamentos (Caixa)
CREATE TABLE IF NOT EXISTS pagamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_pagamento DATE,
    tipo TEXT,
    valor REAL,
    descricao TEXT
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    cli_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    email TEXT,
    endereco TEXT
);

-- Tabela de Telefones (Clientes e Fornecedores)
CREATE TABLE IF NOT EXISTS telefones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pessoa_id INTEGER,
    tipo TEXT CHECK(tipo IN ('cliente', 'fornecedor')),
    numero TEXT
);

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cargo TEXT,
    salario REAL,
    data_admissao DATE
);

-- Tabela de Endereços (mais detalhada)
CREATE TABLE IF NOT EXISTS enderecos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
-- Tabela de Usuários do Sistema
    pessoa_id INTEGER,
    tipo TEXT CHECK(tipo IN ('cliente', 'fornecedor')),
    logradouro TEXT,
    numero TEXT,
    bairro TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT
);

-- Tabela de Usuários do Sistema
CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    email TEXT UNIQUE,
    senha TEXT,
    tipo TEXT CHECK(tipo IN ('admin', 'funcionario'))
);
-- Tabela de Usuários do Sistema

-- Tabela de Notas Fiscais
CREATE TABLE IF NOT EXISTS notas_fiscais (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    compra_id INTEGER,
    numero_nota TEXT,
    valor REAL,
    data_emissao DATE,
    FOREIGN KEY (compra_id) REFERENCES compras(id)
);

-- ===============================
-- DADOS DE EXEMPLO (INSERTs)
-- ===============================

-- Fornecedores
INSERT INTO fornecedores (nome, cnpj, telefone, email, endereco, contato_nome, contato_cargo) VALUES
('Fornecedor A', '12.345.678/0001-99', '11999998888', 'contato@forna.com', 'Rua Alpha, 123', 'João', 'Representante'),
('Fornecedor B', '98.765.432/0001-11', '11888887777', 'contato@fornb.com', 'Rua Beta, 456', 'Maria', 'Gerente');

-- Produtos
INSERT INTO produtos (nome, descricao, categoria, unidade_medida, quantidade_em_estoque, preco_compra, preco_venda, fornecedor_id) VALUES
('Chocolate', 'Sorvete de chocolate', 'Sorvete', 'litro', 50, 2.00, 5.00, 1),
('Morango', 'Sorvete de morango', 'Sorvete', 'litro', 40, 2.50, 5.50, 1),
('Baunilha', 'Sorvete de baunilha', 'Sorvete', 'litro', 60, 1.80, 4.80, 2);

-- Compras
INSERT INTO compras (fornecedor, data_compra, valor_total, metodo_pagamento) VALUES
('Fornecedor A', '2024-10-01', 150.00, 'Dinheiro'),
('Fornecedor B', '2024-10-02', 200.00, 'Cartão');

-- Itens de Compra
INSERT INTO itens_compra (compra_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 20, 2.00),
(1, 2, 15, 2.50),
(2, 3, 30, 1.80);

-- Vendas
INSERT INTO vendas (data_venda, valor_total, metodo_pagamento) VALUES
('2024-10-04', 25.00, 'Dinheiro'),
('2024-10-05', 30.00, 'Cartão');

-- Itens de Venda
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.00),
(1, 3, 1, 4.80),
(2, 2, 3, 5.50);

-- Inventário
INSERT INTO inventario (produto_id, quantidade_atual, data_atualizacao) VALUES
(1, 28, '2024-10-04'),
(2, 25, '2024-10-04'),
(3, 55, '2024-10-04');

-- Empenhos
INSERT INTO empenhos (descricao, data_empenho, status) VALUES
('Reserva para evento', '2024-10-05', 'pendente'),
('Pedido interno', '2024-10-06', 'concluído');REAL

-- Pagamentos
INSERT INTO pagamentos (data_pagamento, tipo, valor, descricao) VALUES
('2024-10-01', 'entrada', 150.00, 'Venda de sorvetes'),
('2024-10-02', 'saída', 200.00, 'Compra de ingredientes');

-- ===============================
-- CONSULTAS ÚTEIS
-- ===============================

-- Produtos com fornecedores
SELECT p.nome, p.preco_venda, p.quantidade_em_estoque, f.nome AS fornecedor
FROM produtos p
JOIN fornecedores f ON p.fornecedor_id = f.id;

-- Total de produtos por fornecedor
SELECT f.nome AS fornecedor, COUNT(p.id) AS total_produtos
FROM fornecedores f
LEFT JOIN produtos p ON p.fornecedor_id = f.id
GROUP BY f.nome;

-- Produtos mais caros que a média
SELECT nome, preco_venda FROM produtos
WHERE preco_venda > (SELECT AVG(preco_venda) FROM produtos);

-- Total de vendas por dia
SELECT data_venda, SUM(valor_total) AS total_vendas
FROM vendas
GROUP BY data_venda;

-- Quantidade vendida por produto
SELECT p.nome, SUM(iv.quantidade) AS total_vendido
FROM itens_venda iv
JOIN produtos p ON p.id = iv.produto_id
GROUP BY p.nome;

-- Produtos em estoque baixo (menos de 20)
SELECT nome, quantidade_em_estoque FROM produtos
WHERE quantidade_em_estoque < 20;

-- Total de compras por fornecedor
SELECT fornecedor, SUM(valor_total) AS total_gasto
FROM compras
GROUP BY fornecedor;

-- Lucro estimado por produto
SELECT nome, (preco_venda - preco_compra) * quantidade_em_estoque AS lucro_estimado
FROM produtos;

-- Funcionários por cargo
SELECT cargo, COUNT(*) AS total
FROM funcionarios
GROUP BY cargo;
