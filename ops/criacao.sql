-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf VARCHAR(14) TEXT UNIQUE NOT NULL,
  	rg_funci VARCHAR(12) NOT NULL UNIQUE,
    telefone TEXT,
    email TEXT,
    endereco_funci TEXT,
  	data_nascfunc DATE NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2),
    id_funcao INTEGER,
    ativo BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_funcao) REFERENCES funcoes(id_funcao)
);

-- Tabela de Funções
CREATE TABLE IF NOT EXISTS funcoes (
    id_funcao INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_funcao TEXT NOT NULL,
    descricao TEXT
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    telefone TEXT,
    email TEXT,
    endereco TEXT,
    data_cadastro DATE DEFAULT CURRENT_DATE,
    ativo BOOLEAN DEFAULT 1
);

-- Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_empresa TEXT NOT NULL,
    cnpj TEXT UNIQUE NOT NULL,
    contato TEXT,
    telefone TEXT,
    email TEXT,
    endereco TEXT,
    ativo BOOLEAN DEFAULT 1
);

-- Tabela de Categorias de Movimento
CREATE TABLE IF NOT EXISTS categorias_movimento (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria TEXT NOT NULL,
    tipo_movimento TEXT CHECK(tipo_movimento IN ('ENTRADA', 'SAIDA')) NOT NULL,
    descricao TEXT,
  	FOREIGN KEY (id_funcionario) REFERENCES funcionarios(nome)
);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco_venda DECIMAL(10,2) NOT NULL,
    preco_custo DECIMAL(10,2),
    estoque_atual INTEGER DEFAULT 0,
    ativo BOOLEAN DEFAULT 1,
    data_cadastro DATE DEFAULT CURRENT_DATE,
  	data_fabricacao DATE,
  	data_validade DATE,
);

-- Tabela de Movimentos de Estoque
CREATE TABLE IF NOT EXISTS movimentos (
    id_movimento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_produto INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    id_fornecedor INTEGER,
    quantidade INTEGER NOT NULL,
    valor_unitario DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    data_movimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_categoria) REFERENCES categorias_movimento(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

-- Tabela de Caixa
CREATE TABLE IF NOT EXISTS caixa (
    id_caixa INTEGER PRIMARY KEY AUTOINCREMENT,
    id_funcionario INTEGER NOT NULL,
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_fechamento DATETIME,
    valor_inicial DECIMAL(10,2) DEFAULT 0.00,
    valor_final DECIMAL(10,2),
    total_vendas DECIMAL(10,2) DEFAULT 0.00,
    total_entradas DECIMAL(10,2) DEFAULT 0.00,
    total_saidas DECIMAL(10,2) DEFAULT 0.00,
    status TEXT CHECK(status IN ('ABERTO', 'FECHADO')) DEFAULT 'ABERTO',
    observacoes TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- Tabela de Vendas
CREATE TABLE IF NOT EXISTS vendas (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_funcionario INTEGER NOT NULL,
    id_caixa INTEGER NOT NULL,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) DEFAULT 0.00,
    forma_pagamento TEXT,
    status TEXT CHECK(status IN ('CONCLUIDA', 'CANCELADA')) DEFAULT 'CONCLUIDA',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_caixa) REFERENCES caixa(id_caixa)
);

-- Tabela de Itens da Venda
CREATE TABLE IF NOT EXISTS itens_venda (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venda INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
