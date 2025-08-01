INSERT INTO tb_endereco VALUES (tp_endereco(1, '01001-000', 'Rua da Consolação', 100));
INSERT INTO tb_endereco VALUES (tp_endereco(2, '04547-000', 'Av. Presidente Juscelino Kubitschek', 1200));
INSERT INTO tb_endereco VALUES (tp_endereco(3, '20000-000', 'Rua Augusta', 500));
INSERT INTO tb_endereco VALUES (tp_endereco(4, '05001-000', 'Rua Turiassu', 150));
INSERT INTO tb_endereco VALUES (tp_endereco(5, '03000-000', 'Av. Celso Garcia', 300));
INSERT INTO tb_endereco VALUES (tp_endereco(6, '70000-000', 'Praça dos 3 Poderes', 1));
INSERT INTO tb_endereco VALUES (tp_endereco(7, '90000-000', 'Rua da Praia', 800));
INSERT INTO tb_endereco VALUES (tp_endereco(8, '60000-000', 'Av. Beira Mar', 250));
INSERT INTO tb_endereco VALUES (tp_endereco(9, '50000-000', 'Rua da Aurora', 75));
INSERT INTO tb_endereco VALUES (tp_endereco(10, '40000-000', 'Av. Sete de Setembro', 600));

INSERT INTO tb_quadrinhos VALUES (101, 'Aventuras do Capitão', 'Aventura', 25.50, 150, 'Mensal', 'Volume 1', TO_DATE('2021-01-10', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (102, 'Mistérios da Cidade', 'Mistério', 30.00, 80, 'Semanal', 'Edição Especial', TO_DATE('2022-03-15', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (103, 'Heróis do Amanhã', 'Super-herói', 45.90, 200, 'Bimestral', 'Série Limitada', TO_DATE('2020-06-20', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (104, 'Fantasia Élfica', 'Fantasia', 35.00, 120, 'Mensal', 'Livro 1', TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (105, 'Cyberpunk Futuro', 'Ficção Científica', 40.00, 90, 'Trimestral', 'Volume Único', TO_DATE('2019-11-11', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (106, 'O Reino Perdido', 'Aventura', 28.00, 180, 'Semestral', 'Parte 1', TO_DATE('2022-08-01', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (107, 'Contos de Terror', 'Terror', 22.00, 70, 'Anual', 'Coletânea', TO_DATE('2023-10-31', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (108, 'A Saga dos Dragões', 'Fantasia', 55.00, 100, 'Bimestral', 'Episódio 3', TO_DATE('2021-05-25', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (109, 'Detetive Sombra', 'Mistério', 32.50, 110, 'Mensal', 'Caso 5', TO_DATE('2022-09-05', 'YYYY-MM-DD'));
INSERT INTO tb_quadrinhos VALUES (110, 'A Ascensão dos Mutantes', 'Super-herói', 50.00, 130, 'Quinzenal', 'Capítulo Final', TO_DATE('2023-07-18', 'YYYY-MM-DD'));

INSERT INTO tb_fornecedor VALUES (tp_fornecedor('12345678901234', 'Editora Alfa', '11987654321'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('98765432109876', 'Distribuidora Beta', '21998765432'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('00112233445566', 'Gráfica Gama', '31912345678'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('11223344556677', 'Atacadista Delta', '41923456789'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('22334455667788', 'Indústria Epsilon', '51934567890'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('33445566778899', 'Comics Zetta', '61945678901'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('44556677889900', 'Livros Theta', '71956789012'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('55667788990011', 'Papelaria Iota', '81967890123'));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('66778899001122', 'Distribuidora Kappa', '91978901234'));

INSERT INTO tb_lote VALUES (tp_lote(1001, 15.00, 500, TO_DATE('2024-06-25', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1002, 20.00, 300, TO_DATE('2024-07-01', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1003, 12.00, 700, TO_DATE('2024-07-15', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1004, 25.00, 250, TO_DATE('2024-08-01', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1005, 18.00, 400, TO_DATE('2024-08-10', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1006, 30.00, 150, TO_DATE('2024-09-01', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1007, 10.00, 600, TO_DATE('2024-09-15', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1008, 22.00, 350, TO_DATE('2024-10-01', 'YYYY-MM-DD')));
INSERT INTO tb_lote VALUES (tp_lote(1009, 14.50, 450, TO_DATE('2024-10-10', 'YYYY-MM-DD')));

INSERT INTO tb_funcionario VALUES ('11122233344', 'João Silva', 'joao.silva@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 1), tp_telefones(tp_telefone('11987654321'), tp_telefone('1122334455')), TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'ativo', NULL);
INSERT INTO tb_funcionario VALUES ('55566677788', 'Maria Oliveira', 'maria.olira@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 2), tp_telefones(tp_telefone('11998765432'), tp_telefone('1133445566')), TO_DATE('2021-03-10', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_funcionario VALUES ('99988877766', 'Pedro Santos', 'pedro.santos@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 1), NULL, TO_DATE('2022-07-20', 'YYYY-MM-DD'), 'inativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_funcionario VALUES ('12345678901', 'Mariana Lima', 'mariana.lima@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 4), tp_telefones(tp_telefone('11900009999')), TO_DATE('2019-05-20', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_funcionario VALUES ('23456789012', 'Carlos Ferreira', 'carlos.ferreira@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 5), tp_telefones(tp_telefone('31911112222')), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '12345678901'));
INSERT INTO tb_funcionario VALUES ('34567890123', 'Fernanda Costa', 'fernanda.costa@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 6), tp_telefones(tp_telefone('41933334444')), TO_DATE('2020-11-11', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_funcionario VALUES ('45678901234', 'Ricardo Alves', 'ricardo.alves@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 7), tp_telefones(tp_telefone('51955556666')), TO_DATE('2022-03-25', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_funcionario VALUES ('56789012345', 'Patrícia Gomes', 'patricia.gomes@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 8), tp_telefones(tp_telefone('61977778888')), TO_DATE('2021-08-05', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_funcionario VALUES ('67890123456', 'Gustavo Melo', 'gustavo.melo@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 9), tp_telefones(tp_telefone('71999990000')), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_funcionario VALUES ('78901234567', 'Luciana Souza', 'luciana.souza@empresa.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 10), tp_telefones(tp_telefone('81900001111')), TO_DATE('2022-09-15', 'YYYY-MM-DD'), 'ativo', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));

INSERT INTO tb_cliente VALUES ('12345678900', 'Ana Souza', 'ana.souza@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 3), tp_telefones(tp_telefone('11912345678'), tp_telefone('1123456789')), 2, tp_hobbies(tp_hobby('Leitura'), tp_hobby('Cinema')));
INSERT INTO tb_cliente VALUES ('09876543210', 'Bruno Costa', 'bruno.costa@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 2), tp_telefones(tp_telefone('21998765432')), 0, tp_hobbies(tp_hobby('Jogos')));
INSERT INTO tb_cliente VALUES ('11111111111', 'Carla Dias', 'carla.dias@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 1), tp_telefones(tp_telefone('11911112222')), 1, NULL);
INSERT INTO tb_cliente VALUES ('22222222222', 'Diego Rocha', 'diego.rocha@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 4), tp_telefones(tp_telefone('31933334444')), 3, tp_hobbies(tp_hobby('Esportes'), tp_hobby('Música')));
INSERT INTO tb_cliente VALUES ('33333333333', 'Elisa Fernandes', 'elisa.fernandes@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 5), tp_telefones(tp_telefone('41955556666')), 0, NULL);
INSERT INTO tb_cliente VALUES ('44444444444', 'Felipe Martins', 'felipe.martins@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 6), tp_telefones(tp_telefone('51977778888')), 5, tp_hobbies(tp_hobby('Viagens')));
INSERT INTO tb_cliente VALUES ('55555555555', 'Gabriela Santos', 'gabriela.santos@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 7), tp_telefones(tp_telefone('61999990000')), 1, tp_hobbies(tp_hobby('Fotografia')));
INSERT INTO tb_cliente VALUES ('66666666666', 'Hugo Nogueira', 'hugo.nogueira@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 8), tp_telefones(tp_telefone('71900001111')), 0, NULL);
INSERT INTO tb_cliente VALUES ('77777777777', 'Isabela Pires', 'isabela.pires@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 9), tp_telefones(tp_telefone('81922223333')), 4, tp_hobbies(tp_hobby('Culinária'), tp_hobby('Dança')));
INSERT INTO tb_cliente VALUES ('88888888888', 'Leonardo Brito', 'leonardo.brito@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 10), tp_telefones(tp_telefone('91944445555')), 2, NULL);
INSERT INTO tb_cliente VALUES ('99999999999', 'Monica Vieira', 'monica.vieira@email.com', (SELECT REF(e) FROM tb_endereco e WHERE e.id = 1), tp_telefones(tp_telefone('01966667777')), 1, tp_hobbies(tp_hobby('Leitura')));

INSERT INTO tb_cargo_funcionario VALUES ('11122233344', 'Gerente Geral', 7500.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_cargo_funcionario VALUES ('55566677788', 'Vendedor', 3000.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_cargo_funcionario VALUES ('99988877766', 'Caixa', 2500.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_cargo_funcionario VALUES ('12345678901', 'Gerente de Vendas', 5000.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '12345678901'));
INSERT INTO tb_cargo_funcionario VALUES ('23456789012', 'Estoquista', 2000.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '23456789012'));
INSERT INTO tb_cargo_funcionario VALUES ('34567890123', 'Analista Financeiro', 4500.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '34567890123'));
INSERT INTO tb_cargo_funcionario VALUES ('45678901234', 'Recepcionista', 2200.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '45678901234'));
INSERT INTO tb_cargo_funcionario VALUES ('56789012345', 'Marketing', 3800.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '56789012345'));
INSERT INTO tb_cargo_funcionario VALUES ('67890123456', 'Limpeza', 1800.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '67890123456'));
INSERT INTO tb_cargo_funcionario VALUES ('78901234567', 'Atendente', 2800.00, (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '78901234567'));

INSERT INTO tb_evento VALUES (1, 'Lançamento HQ Nova', TO_DATE('2024-08-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lançamento', '3 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_evento VALUES (2, 'Sessão de Autógrafos', TO_DATE('2024-09-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Encontro', '2 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_evento VALUES (3, 'Concurso de Cosplay', TO_DATE('2024-10-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Competição', '6 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_evento VALUES (4, 'Leitura de Mangá', TO_DATE('2024-11-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Leitura', '1.5 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_evento VALUES (5, 'Oficina de Desenho', TO_DATE('2024-12-12 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Oficina', '4 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_evento VALUES (6, 'Noite de Jogos de Tabuleiro', TO_DATE('2025-01-25 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Entretenimento', '5 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_evento VALUES (7, 'Sessão de RPG', TO_DATE('2025-02-14 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Encontro', '3 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_evento VALUES (8, 'Exposição de Arte Geek', TO_DATE('2025-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exposição', '8 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '11122233344'));
INSERT INTO tb_evento VALUES (9, 'Bazar de Quadrinhos Usados', TO_DATE('2025-04-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Venda', '7 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_evento VALUES (10, 'Convenção de HQ', TO_DATE('2025-05-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Feira', '10 horas', (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '12345678901'));

INSERT INTO tb_venda_produto VALUES (1, TO_DATE('2024-06-20', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 101), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12345678900'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_venda_produto VALUES (2, TO_DATE('2024-06-21', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 102), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12345678900'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_venda_produto VALUES (3, TO_DATE('2024-06-22', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 103), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '09876543210'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_venda_produto VALUES (4, TO_DATE('2024-06-23', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 101), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '11111111111'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_venda_produto VALUES (5, TO_DATE('2024-06-24', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 104), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '22222222222'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_venda_produto VALUES (6, TO_DATE('2024-06-25', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 105), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '33333333333'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_venda_produto VALUES (7, TO_DATE('2024-06-26', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 102), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '44444444444'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_venda_produto VALUES (8, TO_DATE('2024-06-27', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 106), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '55555555555'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));
INSERT INTO tb_venda_produto VALUES (9, TO_DATE('2024-06-28', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 107), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '66666666666'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '99988877766'));
INSERT INTO tb_venda_produto VALUES (10, TO_DATE('2024-06-29', 'YYYY-MM-DD'), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 108), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '77777777777'), (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '55566677788'));

INSERT INTO tb_desconto VALUES (1, 10.00, 'DESCONTO10', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 1));
INSERT INTO tb_desconto VALUES (3, 5.00, 'PROMO5', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 3));
INSERT INTO tb_desconto VALUES (4, 15.00, 'NATAL15', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 4));
INSERT INTO tb_desconto VALUES (5, 7.50, 'VERAO7', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 5));
INSERT INTO tb_desconto VALUES (6, 20.00, 'BLACKFRIDAY20', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 6));
INSERT INTO tb_desconto VALUES (7, 3.00, 'CLIENTEVIP', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 7));
INSERT INTO tb_desconto VALUES (8, 12.00, 'ANIVERSARIO', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 8));
INSERT INTO tb_desconto VALUES (9, 8.00, 'LEALDADE', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 9));
INSERT INTO tb_desconto VALUES (10, 25.00, 'MEGAOFERTA', (SELECT REF(v) FROM tb_venda_produto v WHERE v.id = 10));

INSERT INTO tb_inscricao VALUES (1, '12345678900', (SELECT REF(e) FROM tb_evento e WHERE e.id = 1), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12345678900'));
INSERT INTO tb_inscricao VALUES (2, '09876543210', (SELECT REF(e) FROM tb_evento e WHERE e.id = 2), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '09876543210'));
INSERT INTO tb_inscricao VALUES (3, '11111111111', (SELECT REF(e) FROM tb_evento e WHERE e.id = 3), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '11111111111'));
INSERT INTO tb_inscricao VALUES (1, '22222222222', (SELECT REF(e) FROM tb_evento e WHERE e.id = 1), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '22222222222'));
INSERT INTO tb_inscricao VALUES (4, '33333333333', (SELECT REF(e) FROM tb_evento e WHERE e.id = 4), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '33333333333'));
INSERT INTO tb_inscricao VALUES (5, '44444444444', (SELECT REF(e) FROM tb_evento e WHERE e.id = 5), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '44444444444'));
INSERT INTO tb_inscricao VALUES (2, '55555555555', (SELECT REF(e) FROM tb_evento e WHERE e.id = 2), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '55555555555'));
INSERT INTO tb_inscricao VALUES (6, '66666666666', (SELECT REF(e) FROM tb_evento e WHERE e.id = 6), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '66666666666'));
INSERT INTO tb_inscricao VALUES (7, '77777777777', (SELECT REF(e) FROM tb_evento e WHERE e.id = 7), (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '77777777777'));

INSERT INTO tb_fornecimento VALUES (1001, 101, '12345678901234', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1001), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 101), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '12345678901234'));
INSERT INTO tb_fornecimento VALUES (1002, 103, '98765432109876', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1002), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 103), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '98765432109876'));
INSERT INTO tb_fornecimento VALUES (1003, 104, '00112233445566', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1003), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 104), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '00112233445566'));
INSERT INTO tb_fornecimento VALUES (1004, 105, '11223344556677', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1004), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 105), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '11223344556677'));
INSERT INTO tb_fornecimento VALUES (1005, 106, '22334455667788', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1005), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 106), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '22334455667788'));
INSERT INTO tb_fornecimento VALUES (1006, 107, '33445566778899', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1006), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 107), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '33445566778899'));
INSERT INTO tb_fornecimento VALUES (1007, 108, '44556677889900', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1007), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 108), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '44556677889900'));
INSERT INTO tb_fornecimento VALUES (1008, 109, '55667788990011', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1008), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 109), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '55667788990011'));
INSERT INTO tb_fornecimento VALUES (1009, 110, '66778899001122', (SELECT REF(l) FROM tb_lote l WHERE l.id = 1009), (SELECT REF(q) FROM tb_quadrinhos q WHERE q.id = 110), (SELECT REF(f) FROM tb_fornecedor f WHERE f.cnpj = '66778899001122'));

COMMIT;

BEGIN
   DBMS_OUTPUT.PUT_LINE('Povoamento das tabelas objeto-relacionais concluído com sucesso.');
END;
/

DECLARE
    v_cliente_obj tp_cliente;
BEGIN
    SELECT VALUE(c) INTO v_cliente_obj FROM tb_cliente c WHERE c.cpf = '12345678900';
    DBMS_OUTPUT.PUT_LINE('Consulta com VALUE:');
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_cliente_obj.nome);
    DBMS_OUTPUT.PUT_LINE('CPF: ' || v_cliente_obj.cpf);
END;
/
