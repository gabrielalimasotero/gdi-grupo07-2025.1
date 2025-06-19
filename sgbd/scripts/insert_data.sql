
-- Povoamento da Tabela Endereco
INSERT INTO Endereco (cep, rua, numero) VALUES ('01001-000', 'Rua da Consolação', 100);
INSERT INTO Endereco (cep, rua, numero) VALUES ('04547-000', 'Av. Presidente Juscelino Kubitschek', 1200);
INSERT INTO Endereco (cep, rua, numero) VALUES ('20000-000', 'Rua Augusta', 500);

-- Povoamento da Tabela Funcionario
-- O primeiro funcionário é o gerente principal (cpf_gerente = NULL)
INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('João Silva', 'joao.silva@empresa.com', '11122233344', '01001-000', 'Gerente Geral', 7500.00, 'ativo', TO_DATE('2020-01-15', 'YYYY-MM-DD'), NULL);

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Maria Oliveira', 'maria.oliveira@empresa.com', '55566677788', '04547-000', 'Vendedor', 3000.00, 'ativo', TO_DATE('2021-03-10', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Pedro Santos', 'pedro.santos@empresa.com', '99988877766', '01001-000', 'Caixa', 2500.00, 'inativo', TO_DATE('2022-07-20', 'YYYY-MM-DD'), '11122233344');

-- Povoamento da Tabela Cliente
INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Ana Souza', '12345678901', 'ana.souza@email.com', 2);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Bruno Costa', '09876543210', 'bruno.costa@email.com', 0);

-- Povoamento da Tabela Quadrinhos
INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (101, 'Aventuras do Capitão', 'Aventura', 25.50, 150, 'Mensal', 'Volume 1');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (102, 'Mistérios da Cidade', 'Mistério', 30.00, 80, 'Semanal', 'Edição Especial');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (103, 'Heróis do Amanhã', 'Super-herói', 45.90, 200, 'Bimestral', 'Série Limitada');

-- Povoamento da Tabela Evento
INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '11122233344', 'Lançamento HQ Nova', TO_DATE('2024-08-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lançamento', '3 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '55566677788', 'Sessão de Autógrafos', TO_DATE('2024-09-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Encontro', '2 horas');

-- Povoamento da Tabela VendeProduto
INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (1, 101, '12345678901', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (2, 102, '12345678901', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (3, 103, '09876543210', '99988877766');

-- Povoamento da Tabela Desconto
INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (1, 10.00, 'DESCONTO10');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (3, 5.00, 'PROMO5');

-- Povoamento da Tabela Lote
INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1001, 15.00, 500, TO_DATE('2024-06-25', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1002, 20.00, 300, TO_DATE('2024-07-01', 'YYYY-MM-DD'));

-- Povoamento da Tabela Fornecedor
INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('12345678901234', 'Editora Alfa', '11987654321');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('98765432109876', 'Distribuidora Beta', '21998765432');

-- Povoamento da Tabela Inscreve
INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (1, '12345678901');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (2, '09876543210');

-- Povoamento da Tabela Fornece
INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1001, 101, '12345678901234');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1002, 103, '98765432109876');

-- Povoamento da Tabela TelefoneCliente
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('12345678901', '11912345678');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('12345678901', '1123456789');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('09876543210', '21998765432');

-- Povoamento da Tabela TelefoneFuncionario
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('11122233344', '11987654321');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('55566677788', '11998765432');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('55566677788', '1133445566');
