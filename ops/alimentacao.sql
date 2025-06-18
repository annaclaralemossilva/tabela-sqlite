-- Inserindo Funções
INSERT INTO funcoes (nome_funcao, descricao)
VALUES 
    ('Gerente', 'Responsável geral pela sorveteria'),
    ('Vendedor', 'Atendimento ao cliente e vendas'),
    ('Estoquista', 'Controle de estoque e produtos'),
    ('Caixa', 'Operação do caixa');

-- Inserindo Funcionários
INSERT INTO funcionarios (nome, cpf, rg_funci, telefone, email, data_nascfunc, data_admissao, salario, id_funcao)
VALUES 
    ('Maria Santos','12.345.678-9', '123.456.789-00', '(41) 99999-1111', 'maria@sorveteria.com','2024-01-15', '2024-01-15', 3500.00, 1),
    ('João Silva', '09.045.678-5', '987.654.321-00', '(41) 99999-2222', 'joao@sorveteria.com', '2024-01-15','2024-02-01', 2200.00, 2),
    ('Ana Costa', '44.346.678-8', '456.789.123-00', '(41) 99999-3333', 'ana@sorveteria.com', '2024-01-15','2024-02-15', 2000.00, 3),
    ('Pedro Oliveira', '27.385.678-0', '789.123.456-00', '(41) 99999-4444', 'pedro@sorveteria.com','2024-01-15', '2024-03-01', 1800.00, 4);

-- Inserindo Clientes
INSERT INTO clientes (nome, cpf, telefone, email, data_nascimento)
VALUES 
    ('Carlos Pereira', '111.222.333-44', '(41) 88888-1111', 'carlos@email.com', '1985-05-20'),
    ('Fernanda Lima', '222.333.444-55', '(41) 88888-2222', 'fernanda@email.com', '1992-08-10'),
    ('Roberto Alves', '333.444.555-66', '(41) 88888-3333', 'roberto@email.com', '1978-12-03');

-- Inserindo Fornecedores
INSERT INTO fornecedores (nome_empresa, cnpj, contato, telefone, email)
VALUES 
    ('Laticínios Curitiba Ltda', '12.345.678/0001-90', 'José Fornecedor', '(41) 3333-1111', 'vendas@laticinios.com'),
    ('Frutas Frescas S.A.', '98.765.432/0001-10', 'Maria Vendas', '(41) 3333-2222', 'contato@frutasfrescas.com'),
    ('Embalagens Paraná', '11.222.333/0001-44', 'Carlos Comercial', '(41) 3333-3333', 'vendas@embalagens.com');

-- Inserindo Categorias de Movimento
INSERT INTO categorias_movimento (nome_categoria, tipo_movimento, descricao)
VALUES 
    ('Compra de Matéria Prima', 'ENTRADA', 'Entrada de ingredientes para produção'),
    ('Produção', 'ENTRADA', 'Produtos fabricados internamente'),
    ('Venda', 'SAIDA', 'Saída por venda ao cliente'),
    ('Perda', 'SAIDA', 'Produtos perdidos ou vencidos'),
    ('Devolução', 'ENTRADA', 'Produtos devolvidos por clientes'),
    ('Transferência', 'SAIDA', 'Transferência entre lojas');

-- Inserindo Produtos
INSERT INTO produtos (nome, descricao, preco_venda, preco_custo, estoque_atual, estoque_minimo, unidade_medida)
VALUES 
    ('Sorvete Chocolate 1L', 'Sorvete sabor chocolate cremoso', 15.90, 8.50, 50, 10, 'UN'),
    ('Sorvete Morango 1L', 'Sorvete sabor morango com pedaços da fruta', 16.90, 9.00, 45, 10, 'UN'),
    ('Sorvete Baunilha 1L', 'Sorvete sabor baunilha tradicional', 14.90, 8.00, 60, 15, 'UN'),
    ('Picolé Frutas Vermelhas', 'Picolé de frutas vermelhas', 4.50, 2.00, 200, 50, 'UN'),
    ('Açaí 500ml', 'Açaí natural batido', 12.00, 6.00, 30, 10, 'UN'),
    ('Casquinha', 'Casquinha para sorvete', 1.50, 0.50, 500, 100, 'UN');

-- Inserindo Movimentos de Entrada
INSERT INTO movimentos (id_produto, id_funcionario, id_categoria, id_fornecedor, quantidade, valor_unitario, valor_total, observacoes)
VALUES 
    (1, 3, 1, 1, 100, 8.50, 850.00, 'Compra inicial de estoque'),
    (2, 3, 1, 1, 80, 9.00, 720.00, 'Compra inicial de estoque'),
    (3, 3, 1, 1, 120, 8.00, 960.00, 'Compra inicial de estoque'),
    (4, 3, 1, 2, 500, 2.00, 1000.00, 'Compra de picolés'),
    (5, 3, 1, 2, 50, 6.00, 300.00, 'Compra de açaí'),
    (6, 3, 1, 3, 1000, 0.50, 500.00, 'Compra de casquinhas');
