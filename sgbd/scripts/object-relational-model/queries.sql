-- Consulta 1: Retorna todos os Funcionários.
-- Como tb_funcionario herda de tp_pessoa, podemos selecionar o nome diretamente.
SELECT f.nome FROM tb_funcionario f;

-- Consulta 2: Pessoas cujo CPF seja um dos seguintes.
-- Como não há uma tabela "Pessoa", unimos as buscas em cliente e funcionário.
SELECT c.nome, c.cpf FROM tb_cliente c WHERE c.cpf IN ('12345678900', '09876543210', '11111111111')
UNION ALL
SELECT f.nome, f.cpf FROM tb_funcionario f WHERE f.cpf IN ('12345678900', '09876543210', '11111111111');

-- Consulta 3: Remove a inscrição de um cliente no evento.
-- Acessamos os atributos dos objetos referenciados na cláusula WHERE.
DELETE FROM tb_inscricao i
WHERE i.evento.id = 7 AND i.cliente.cpf = '77777777777';

-- Consulta 4: Atualizar o salário do funcionário.
UPDATE tb_cargo_funcionario c
SET c.salario = c.salario * 1.1
WHERE c.funcionario_cpf = '67890123456';

-- Consulta 5: Retorna todos os Gerentes e quantos funcionários eles gerenciam.
SELECT DEREF(f.supervisor).nome AS nome_gerente, COUNT(f.cpf) AS quantos_gerencia
FROM tb_funcionario f
WHERE f.supervisor IS NOT NULL
GROUP BY DEREF(f.supervisor).nome;

-- Consulta 6: Retorna o funcionário que não possui gerente.
SELECT f.nome FROM tb_funcionario f WHERE f.supervisor IS NULL;

-- Consulta 7: Retorna todos os Clientes.
SELECT c.nome FROM tb_cliente c;

-- Consulta 8: Retorna os quadrinhos fornecidos por "Papelaria" ou "Distribuidora".
SELECT DISTINCT DEREF(f.quadrinho).nome
FROM tb_fornecimento f
WHERE DEREF(f.fornecedor).nome LIKE '%Papelaria%' OR DEREF(f.fornecedor).nome LIKE '%Distribuidora%';

-- Consulta 9: Retorna nome e cargo dos funcionários que ganham menos que a média.
SELECT DEREF(c.funcionario).nome AS nome, c.cargo
FROM tb_cargo_funcionario c
WHERE c.salario < (SELECT AVG(salario) FROM tb_cargo_funcionario);

-- Consulta 10: Nome do quadrinho vendido com o maior desconto.
SELECT DEREF(d.venda.quadrinho).nome, d.valor AS desconto
FROM tb_desconto d
WHERE d.valor = (SELECT MAX(valor) FROM tb_desconto);

-- Consulta 11: Nome dos funcionários que organizaram mais de 1 evento.
SELECT DEREF(e.organizador).nome AS nome_organizador, COUNT(e.id) AS num_eventos
FROM tb_evento e
GROUP BY DEREF(e.organizador).nome
HAVING COUNT(e.id) > 1;

-- Consulta 12: Fornecedores e quantidade de quadrinhos em lotes entre o mínimo e a média.
SELECT DEREF(f.fornecedor).nome AS nome_fornecedor, DEREF(f.lote).quantidade
FROM tb_fornecimento f
WHERE DEREF(f.lote).quantidade BETWEEN (SELECT MIN(quantidade) FROM tb_lote) AND (SELECT AVG(quantidade) FROM tb_lote);

-- Consulta 13: Eventos organizados por funcionários que ganham mais que TODOS do 'Marketing'.
SELECT e.nome_evento
FROM tb_evento e
WHERE e.organizador.cpf IN (
    SELECT c.funcionario_cpf
    FROM tb_cargo_funcionario c
    WHERE c.salario > ALL (SELECT salario FROM tb_cargo_funcionario WHERE cargo = 'Marketing')
);

-- Consulta 14: Nomes, CPFs dos funcionários e eventos que eles organizaram.
SELECT
    f.nome AS Nome_Funcionario,
    f.cpf AS CPF_Funcionario,
    e.nome_evento AS Nome_do_Evento,
    e.data_evento AS Data_do_Evento
FROM
    tb_funcionario f
LEFT JOIN
    tb_evento e ON f.cpf = e.organizador.cpf
ORDER BY
    f.nome ASC, e.data_evento DESC NULLS LAST;


-- Consulta 15: Funcionários que organizaram > 2 eventos OU clientes que participaram > 2 eventos.
SELECT f.nome AS Nome_Pessoa
FROM tb_funcionario f
WHERE (SELECT COUNT(e.id) FROM tb_evento e WHERE e.organizador.cpf = f.cpf) > 2
UNION
SELECT c.nome AS Nome_Pessoa
FROM tb_cliente c
WHERE c.num_eventos_participados > 2
ORDER BY Nome_Pessoa ASC;

-- Consulta 16: Criação e consulta de uma VIEW.
CREATE OR REPLACE VIEW vw_Pessoas_Eventos_Clientes AS
SELECT f.nome AS Nome_Pessoa, 'Organizador' AS Papel
FROM tb_funcionario f
WHERE f.cpf IN (SELECT e.organizador.cpf FROM tb_evento e)
UNION
SELECT c.nome AS Nome_Pessoa, 'Cliente' AS Papel
FROM tb_cliente c
ORDER BY Nome_Pessoa ASC;

-- Consultando a VIEW
SELECT * FROM vw_Pessoas_Eventos_Clientes;

-- Consulta 16: VARRAY (telefones): Acessa os elementos de uma coleção VARRAY.
--    A função TABLE() transforma a coleção em um formato de tabela para a consulta.
SELECT c.nome, t.telefone
FROM tb_cliente c, TABLE(c.telefones) t
WHERE c.cpf = '12345678900';

-- Consulta 17: NESTED TABLE (hobbies): Acessa os elementos de uma NESTED TABLE.
--    A lógica é a mesma do VARRAY, usando a função TABLE().
SELECT c.nome, h.nome_hobby
FROM tb_cliente c, TABLE(c.hobbies) h
WHERE c.cpf = '12345678900';
