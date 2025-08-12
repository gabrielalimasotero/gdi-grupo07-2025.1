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

-- Consulta 18: Retorna o nome dos funcionários e número de eventos organizados por todos os funcionario que organizaram mais de um evento.
SELECT f.nome AS "Nome do Funcionário", COUNT(e.id) AS "Quantidade de Eventos Organizados"
FROM tb_evento e
JOIN tb_funcionario f ON e.organizador = REF(f)
GROUP BY f.nome
HAVING COUNT(e.id) > 1;

-- Consulta 19: O nome dos clientes que gastaram um total de mais de R$ 40,00.
SELECT c.nome AS "Nome do Cliente", SUM(DEREF(v.quadrinho).preco) AS "Gasto"
FROM tb_cliente c, tb_venda_produto v, tb_desconto d
WHERE v.cliente = REF(c) AND d.venda (+) = REF(v)
GROUP BY c.cpf, c.nome
HAVING SUM(DEREF(v.quadrinho).preco - COALESCE(d.valor, 0)) > 40.00;

-- Consulta 20: O nome do quadrinho mais caro que cada um desses clientes comprou.
SELECT c.nome AS "Nome do Cliente", VendasRankeadas.nome_quadrinho AS "Quadrinho Mais Caro Comprado"
FROM tb_cliente c, (SELECT
        DEREF(v.cliente).cpf AS cliente_cpf,
        DEREF(v.quadrinho).nome AS nome_quadrinho,
        RANK() OVER (PARTITION BY DEREF(v.cliente).cpf ORDER BY (DEREF(v.quadrinho).preco - COALESCE(d.valor, 0)) DESC) as rank_preco
     FROM tb_venda_produto v, tb_desconto d
     WHERE d.venda (+) = REF(v)) VendasRankeadas
WHERE c.cpf = VendasRankeadas.cliente_cpf AND VendasRankeadas.rank_preco = 1;

-- Consulta 21: Lista todos os funcionarios supervisados por João Silva que residem em endereços diferentes dele.
SELECT f.nome AS "Nome do Funcionário", DEREF(f.endereco).exibir_endereco_completo() AS "Endereço do Funcionário"
FROM tb_funcionario f, tb_funcionario s
WHERE s.nome = 'João Silva' AND f.supervisor = REF(s) AND DEREF(f.endereco).id != DEREF(s.endereco).id;

-- Consulta 22: Calcula a possível receita de cada gênero, cada todo o estoque disponível seja vendido
SELECT q.genero AS "Gênero do Quadrinho", SUM(q.preco * q.estoque) AS "Receita Potencial Total (R$)"
FROM tb_quadrinhos q
GROUP BY q.genero
ORDER BY "Receita Potencial Total (R$)" DESC;

-- Consulta 23: Lista todos os clientes que possuem o hobby 'Leitura' e que também estão inscritos em pelo menos um evento da loja.
SELECT DISTINCT c.nome AS "Cliente Leitor Inscrito"
FROM tb_cliente c, tb_inscricao i, TABLE(c.hobbies) h
WHERE i.cliente = REF(c) AND h.nome_hobby = 'Leitura';

-- Consulta 24: Lista quais fornecedores abastecem a loja de quadrinhos do gênero 'Fantasia'
SELECT DISTINCT f.nome AS "Nome do Fornecedor"
FROM tb_fornecedor f, tb_fornecimento fo, tb_quadrinhos q
WHERE fo.fornecedor = REF(f) AND fo.quadrinho = REF(q) AND q.genero = 'Fantasia';

-- Consulta 25: Lista todos os detalhes da transação de id 1
SELECT
    c.nome AS "Cliente",
    q.nome AS "Quadrinho Comprado",
    q.preco AS "Preço Original (R$)",
    d.valor AS "Desconto Aplicado (R$)",
    (q.preco - COALESCE(d.valor, 0)) AS "Preço Final (R$)",
    f.nome AS "Funcionário Responsável"
FROM
    tb_venda_produto v,
    tb_cliente c,
    tb_funcionario f,
    tb_quadrinhos q,
    tb_desconto d
WHERE
    v.id = 1
    AND v.cliente = REF(c)
    AND v.funcionario = REF(f)
    AND v.quadrinho = REF(q)
    AND d.venda (+) = REF(v);
