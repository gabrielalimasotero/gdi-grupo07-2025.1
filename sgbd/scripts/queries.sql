-- Consulta que retorna todos os Funcionários 
SELECT nome FROM Pessoa INNER JOIN Funcionario ON Pessoa.cpf = Funcionario.cpf_func;

-- Consulta que retorna todos os Gerentes e quantos funcionarios ele gerencia
SELECT nome, COUNT(nome) as Quantos_gerencia FROM Pessoa INNER JOIN Funcionario ON Pessoa.cpf = Funcionario.cpf_supervisor GROUP BY nome;

-- Consulta que retorna o funcionario que não possui gerente
SELECT p.nome FROM Pessoa p JOIN Funcionario f ON p.cpf = f.cpf_func WHERE f.cpf_supervisor is NULL;

-- Consulta que retorna todos os Clientes
SELECT nome FROM Pessoa INNER JOIN Cliente ON Pessoa.cpf = Cliente.cpf_cliente;

-- Consulta que retorna os quadrinhos fornecidos pelos fornecedores com Papelaria ou Distribuidora no nome
SELECT q.nome FROM Quadrinhos q INNER JOIN Fornece f ON q.id = f.id_quadrinho WHERE f.cnpj_fornecedor IN (SELECT cnpj FROM Fornecedor WHERE nome LIKE '%Papelaria%' OR nome LIKE '%Distribuidora%');

-- Consulta que retorna o nome,cargo e salario dos funcionarios que ganham menos que a media salarial 
SELECT p.nome, c.cargo FROM Pessoa p JOIN Funcionario f ON p.cpf = f.cpf_func JOIN Cargo_Funcionario c ON f.cpf_func = c.cpf_funcionario WHERE c.salario < ANY (SELECT AVG(salario) FROM Cargo_Funcionario );

-- Consulta que retorna o nome do quadrinho e o desconto, do quadrinho vendido com o maior desconto
SELECT q.nome, d.valor as desconto FROM Quadrinhos q INNER JOIN VendeProduto vp ON q.id = vp.id_quadrinho INNER JOIN Desconto d ON vp.id = d.id_venda WHERE d.valor = (SELECT MAX(d.valor) FROM Desconto d );

-- Consulta que retorna o nome dos funcionarios que organizaram mais de 1 evento
SELECT p.nome, COUNT(*) as numeros_eventos FROM Pessoa p INNER JOIN Funcionario f ON p.cpf = f.cpf_func  INNER JOIN Evento e ON f.cpf_func = e.cpf_func GROUP BY p.nome HAVING COUNT(e.cpf_func) > 1;

-- Consulta que retorna o nome dos fornecedors e a quantidade de quadrinhos por lote, das fornecedoras que forneceram lotes com quantidade entre o menor e a media 
SELECT Fornecedor.nome, l.quantidade FROM Fornecedor INNER JOIN Fornece ON Fornecedor.cnpj = Fornece.cnpj_fornecedor INNER JOIN Lote l ON Fornece.id_lote = l.id WHERE l.quantidade 
    BETWEEN (SELECT MIN(quantidade) FROM Lote) AND (SELECT AVG(quantidade) FROM Lote);

-- Consulta retornará os nomes dos eventos que foram organizados por funcionários que possuem um salário estritamente maior do que o salário de qualquer funcionário com o cargo de 'Marketing'
SELECT e.nome_evento AS Nome_do_Evento FROM Evento e JOIN Funcionario f ON e.cpf_func = f.cpf_func JOIN Cargo_Funcionario cf ON f.cpf_func = cf.cpf_funcionario 
    WHERE cf.salario > ALL (SELECT cf2.salario FROM Cargo_Funcionario cf2 WHERE cf2.cargo = 'Marketing');

-- Consulta que retorna os nomes, cpf dos funcionarios e eventos que eles organizaram, ordenados pelos nomes em ordem alfabetica e data do evento
SELECT p.nome AS Nome_Funcionario, f.cpf_func AS CPF_Funcionario, e.nome_evento AS Nome_do_Evento, e.data_evento AS Data_do_Evento FROM Pessoa p 
    JOIN Funcionario f ON p.cpf = f.cpf_func LEFT JOIN Evento e ON f.cpf_func = e.cpf_func ORDER BY p.nome ASC, e.data_evento DESC NULLS LAST; 

-- Consulta que retorna os nomes de todas as pessoas que são funcionários e organizaram mais de 2 eventos
-- OU são clientes e participaram de mais de 2 eventos, utilizando o operador UNION para combinar os resultados.
SELECT p.nome AS Nome_Pessoa FROM Pessoa p JOIN Funcionario f ON p.cpf = f.cpf_func JOIN Evento e ON f.cpf_func = e.cpf_func GROUP BY p.nome HAVING COUNT(e.cpf_func) > 2
UNION
SELECT p.nome AS Nome_Pessoa FROM Pessoa p JOIN Cliente c ON p.cpf = c.cpf_cliente WHERE c.num_eventos_participados > 2 ORDER BY Nome_Pessoa ASC;

-- Esta VIEW retorna os nomes de todas as pessoas que são funcionários organizadores de eventos
-- OU são clientes, utilizando o operador UNION para combinar os resultados.
CREATE VIEW vw_Pessoas_Eventos_Clientes AS
SELECT p.nome AS Nome_Pessoa FROM Pessoa p JOIN Funcionario f ON p.cpf = f.cpf_func JOIN Evento e ON f.cpf_func = e.cpf_func
UNION
SELECT p.nome AS Nome_Pessoa FROM Pessoa p JOIN Cliente c ON p.cpf = c.cpf_cliente ORDER BY Nome_Pessoa ASC;
-- Consultando a VIEW
SELECT * FROM vw_Pessoas_Eventos_Clientes;

-- Concedendo privilégios de INSERT, UPDATE e DELETE em uma tabela para um usuário
-- Provavel erro no oracle live sql
GRANT INSERT, UPDATE, DELETE ON Cliente TO USUARIO_GESTOR_CLIENTES;
-- Revogando privilégios de INSERT, UPDATE e DELETE em uma tabela de um usuário
-- Provavel erro no oracle live sql
REVOKE INSERT, UPDATE, DELETE ON Cliente FROM USUARIO_GESTOR_CLIENTES;
