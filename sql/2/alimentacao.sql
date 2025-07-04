INSERT INTO cliente (nome_cli, cpf_cli, tel_cli, email_cli, dtnasc_cli, endereco_cli)
VALUES (
  	'Anna Clara',
    '120.123.456-19',
    '(45) 99999-999',
    'annaclaralemossilva@gmail.com',
    '2008.10.08',
    'Foz do Iguaçu - PR'
);

INSERT INTO fornecedor (empresa, tipo_forn, cnpj_forn, tel_forn, end_forn)
VALUES (
  	'Kibon',
    'Sorvetes',
  	'00.623.904/0001-73',
    '(45) 9986-9782',
  	'Rua Izidoro Pastorello - Foz do Iguaçu - PR'
);


INSERT INTO funcionario ( id_funci, nome_funci, função, cpf_funci, rg_funci, tel_funci, email_funci, dtnasci_funci, dtcontr_funci, endereco_funci)
VALUES (
  	'Isadora',
    'dona',
    '987.321.781-04',
    '00.000.000-0',
    '(45) 99999-999',
    'isadora@gmail.com',
    '2007.04.12',
    '2025.01.05',
    'Foz do Iguaçu - PR'
);


INSERT INTO movimento (tipo_movi, categoria_movi, data_movimento, valor_movi, nome_funci)
VALUES (
	'Despesa',
    'Reabastecimento de estoque',
    '12/06/2025',
    '-R$45,80',
    'Alessandra'
);


INSERT INTO produto ( nome_prod, data_entrada, data_fabricacao, data_validade, quantidade_prod, valor_prod, nome_forn)
  VALUES (
    'Sorvete napolitano',
    '11/06/2025',
    '3/06/2025',
    '3/06/2026',
    '50',
    'R$20,00',
    'Kibon' 
