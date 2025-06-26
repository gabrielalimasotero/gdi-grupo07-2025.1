-- Povoamento da Tabela Endereco
INSERT INTO Endereco (cep, rua, numero) VALUES ('01001-000', 'Rua da Consolação', 100);
INSERT INTO Endereco (cep, rua, numero) VALUES ('04547-000', 'Av. Presidente Juscelino Kubitschek', 1200);
INSERT INTO Endereco (cep, rua, numero) VALUES ('20000-000', 'Rua Augusta', 500);
INSERT INTO Endereco (cep, rua, numero) VALUES ('05001-000', 'Rua Turiassu', 150);
INSERT INTO Endereco (cep, rua, numero) VALUES ('03000-000', 'Av. Celso Garcia', 300);
INSERT INTO Endereco (cep, rua, numero) VALUES ('70000-000', 'Praça dos 3 Poderes', 1);
INSERT INTO Endereco (cep, rua, numero) VALUES ('90000-000', 'Rua da Praia', 800);
INSERT INTO Endereco (cep, rua, numero) VALUES ('60000-000', 'Av. Beira Mar', 250);
INSERT INTO Endereco (cep, rua, numero) VALUES ('50000-000', 'Rua da Aurora', 75);
INSERT INTO Endereco (cep, rua, numero) VALUES ('40000-000', 'Av. Sete de Setembro', 600);

-- Povoamento da Tabela Funcionario
-- O primeiro funcionário pode ser o gerente principal (cpf_gerente = NULL)
INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('João Silva', 'joao.silva@empresa.com', '11122233344', '01001-000', 'Gerente Geral', 7500.00, 'ativo', TO_DATE('2020-01-15', 'YYYY-MM-DD'), NULL);

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Maria Oliveira', 'maria.oliveira@empresa.com', '55566677788', '04547-000', 'Vendedor', 3000.00, 'ativo', TO_DATE('2021-03-10', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Pedro Santos', 'pedro.santos@empresa.com', '99988877766', '01001-000', 'Caixa', 2500.00, 'inativo', TO_DATE('2022-07-20', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Mariana Lima', 'mariana.lima@empresa.com', '12345678901', '05001-000', 'Gerente de Vendas', 5000.00, 'ativo', TO_DATE('2019-05-20', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Carlos Ferreira', 'carlos.ferreira@empresa.com', '23456789012', '03000-000', 'Estoquista', 2000.00, 'ativo', TO_DATE('2023-01-01', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Fernanda Costa', 'fernanda.costa@empresa.com', '34567890123', '70000-000', 'Analista Financeiro', 4500.00, 'ativo', TO_DATE('2020-11-11', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Ricardo Alves', 'ricardo.alves@empresa.com', '45678901234', '90000-000', 'Recepcionista', 2200.00, 'ativo', TO_DATE('2022-03-25', 'YYYY-MM-DD'), '55566677788');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Patrícia Gomes', 'patricia.gomes@empresa.com', '56789012345', '60000-000', 'Marketing', 3800.00, 'ativo', TO_DATE('2021-08-05', 'YYYY-MM-DD'), '11122233344');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Gustavo Melo', 'gustavo.melo@empresa.com', '67890123456', '50000-000', 'Limpeza', 1800.00, 'ativo', TO_DATE('2023-06-01', 'YYYY-MM-DD'), '99988877766');

INSERT INTO Funcionario (nome, email, cpf_funcionario, cep, cargo, salario, ativo, data_admissao, cpf_gerente)
VALUES ('Luciana Souza', 'luciana.souza@empresa.com', '78901234567', '40000-000', 'Atendente', 2800.00, 'ativo', TO_DATE('2022-09-15', 'YYYY-MM-DD'), '55566677788');


-- Povoamento da Tabela Cliente
INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Ana Souza', '12345678901', 'ana.souza@email.com', 2);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Bruno Costa', '09876543210', 'bruno.costa@email.com', 0);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Carla Dias', '11111111111', 'carla.dias@email.com', 1);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Diego Rocha', '22222222222', 'diego.rocha@email.com', 3);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Elisa Fernandes', '33333333333', 'elisa.fernandes@email.com', 0);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Felipe Martins', '44444444444', 'felipe.martins@email.com', 5);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Gabriela Santos', '55555555555', 'gabriela.santos@email.com', 1);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Hugo Nogueira', '66666666666', 'hugo.nogueira@email.com', 0);

INSERT INTO Cliente (nome, cpf_cliente, email, num_eventos_participados)
VALUES ('Isabela Pires', '77777777777', 'isabela.pires@email.com', 4);



-- Povoamento da Tabela Quadrinhos
INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (101, 'Aventuras do Capitão', 'Aventura', 25.50, 150, 'Mensal', 'Volume 1');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (102, 'Mistérios da Cidade', 'Mistério', 30.00, 80, 'Semanal', 'Edição Especial');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (103, 'Heróis do Amanhã', 'Super-herói', 45.90, 200, 'Bimestral', 'Série Limitada');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (104, 'Fantasia Élfica', 'Fantasia', 35.00, 120, 'Mensal', 'Livro 1');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (105, 'Cyberpunk Futuro', 'Ficção Científica', 40.00, 90, 'Trimestral', 'Volume Único');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (106, 'O Reino Perdido', 'Aventura', 28.00, 180, 'Semestral', 'Parte 1');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (107, 'Contos de Terror', 'Terror', 22.00, 70, 'Anual', 'Coletânea');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (108, 'A Saga dos Dragões', 'Fantasia', 55.00, 100, 'Bimestral', 'Episódio 3');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (109, 'Detetive Sombra', 'Mistério', 32.50, 110, 'Mensal', 'Caso 5');

INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
VALUES (110, 'A Ascensão dos Mutantes', 'Super-herói', 50.00, 130, 'Quinzenal', 'Capítulo Final');


-- Povoamento da Tabela Evento
INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '11122233344', 'Lançamento HQ Nova', TO_DATE('2024-08-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lançamento', '3 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '55566677788', 'Sessão de Autógrafos', TO_DATE('2024-09-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Encontro', '2 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '11122233344', 'Concurso de Cosplay', TO_DATE('2024-10-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Competição', '6 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '55566677788', 'Leitura de Mangá', TO_DATE('2024-11-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Leitura', '1.5 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '99988877766', 'Oficina de Desenho', TO_DATE('2024-12-12 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Oficina', '4 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '11122233344', 'Noite de Jogos de Tabuleiro', TO_DATE('2025-01-25 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Entretenimento', '5 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '55566677788', 'Sessão de RPG', TO_DATE('2025-02-14 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Encontro', '3 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '11122233344', 'Exposição de Arte Geek', TO_DATE('2025-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exposição', '8 horas');

INSERT INTO Evento (id, organizador, nome_evento, data_evento, tipo_evento, duracao)
VALUES (seq_evento.NEXTVAL, '99988877766', 'Bazar de Quadrinhos Usados', TO_DATE('2025-04-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Venda', '7 horas');


-- Povoamento da Tabela VendeProduto
INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (1, 101, '12345678901', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (2, 102, '12345678901', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (3, 103, '09876543210', '99988877766');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (4, 101, '11111111111', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (5, 104, '22222222222', '99988877766');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (6, 105, '33333333333', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (7, 102, '44444444444', '99988877766');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (8, 106, '55555555555', '55566677788');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (9, 107, '66666666666', '99988877766');

INSERT INTO VendeProduto (id, id_quadrinho, cpf_cliente, cpf_funcionario)
VALUES (10, 108, '77777777777', '55566677788');


-- Povoamento da Tabela Desconto
INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (1, 10.00, 'DESCONTO10');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (3, 5.00, 'PROMO5');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (4, 15.00, 'NATAL15');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (5, 7.50, 'VERAO7');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (6, 20.00, 'BLACKFRIDAY20');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (7, 3.00, 'CLIENTEVIP');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (8, 12.00, 'ANIVERSARIO');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (9, 8.00, 'LEALDADE');

INSERT INTO Desconto (id_venda, valor, cupom)
VALUES (10, 25.00, 'MEGAOFERTA');


-- Povoamento da Tabela Lote
INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1001, 15.00, 500, TO_DATE('2024-06-25', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1002, 20.00, 300, TO_DATE('2024-07-01', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1003, 12.00, 700, TO_DATE('2024-07-15', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1004, 25.00, 250, TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1005, 18.00, 400, TO_DATE('2024-08-10', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1006, 30.00, 150, TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1007, 10.00, 600, TO_DATE('2024-09-15', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1008, 22.00, 350, TO_DATE('2024-10-01', 'YYYY-MM-DD'));

INSERT INTO Lote (id, valor_unitario, quantidade, data_de_entrega)
VALUES (1009, 14.50, 450, TO_DATE('2024-10-10', 'YYYY-MM-DD'));


-- Povoamento da Tabela Fornecedor
INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('12345678901234', 'Editora Alfa', '11987654321');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('98765432109876', 'Distribuidora Beta', '21998765432');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('00112233445566', 'Gráfica Gama', '31912345678');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('11223344556677', 'Atacadista Delta', '41923456789');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('22334455667788', 'Indústria Epsilon', '51934567890');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('33445566778899', 'Comics Zetta', '61945678901');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('44556677889900', 'Livros Theta', '71956789012');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('55667788990011', 'Papelaria Iota', '81967890123');

INSERT INTO Fornecedor (cnpj, nome, telefone)
VALUES ('66778899001122', 'Distribuidora Kappa', '91978901234');


-- Povoamento da Tabela Inscreve
INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (1, '12345678901');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (2, '09876543210');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (3, '11111111111');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (1, '22222222222');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (4, '33333333333');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (5, '44444444444');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (2, '55555555555');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (6, '66666666666');

INSERT INTO Inscreve (id_evento, cpf_cliente)
VALUES (7, '77777777777');


-- Povoamento da Tabela Fornece
INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1001, 101, '12345678901234');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1002, 103, '98765432109876');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1003, 104, '00112233445566');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1004, 105, '11223344556677');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1005, 106, '22334455667788');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1006, 107, '33445566778899');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1007, 108, '44556677889900');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1008, 109, '55667788990011');

INSERT INTO Fornece (id_lote, id_quadrinho, cnpj_fornecedor)
VALUES (1009, 110, '66778899001122');


-- Povoamento da Tabela TelefoneCliente
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('12345678901', '11912345678');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('12345678901', '1123456789');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('09876543210', '21998765432');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('11111111111', '11911112222');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('22222222222', '31933334444');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('33333333333', '41955556666');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('44444444444', '51977778888');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('55555555555', '61999990000');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('66666666666', '71900001111');
INSERT INTO TelefoneCliente (cpf_cliente, telefone) VALUES ('77777777777', '81922223333');


-- Povoamento da Tabela TelefoneFuncionario
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('11122233344', '11987654321');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('55566677788', '11998765432');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('55566677788', '1133445566');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('12345678901', '11900009999');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('23456789012', '31911112222');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('34567890123', '41933334444');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('45678901234', '51955556666');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('56789012345', '61977778888');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('67890123456', '71999990000');
INSERT INTO TelefoneFuncionario (cpf_funcionario, telefone) VALUES ('78901234567', '81900001111');
