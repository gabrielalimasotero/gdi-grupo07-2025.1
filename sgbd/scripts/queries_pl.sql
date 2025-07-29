-- Tipo de dado para armazenar uma pessoa
DECLARE TYPE pessoa_rec IS RECORD (
    cpf VARCHAR2(11),
    nome VARCHAR2(40),
    email VARCHAR2(40),
    id_endereco NUMBER
);
pessoa pessoa_rec;

-- Seleciona uma pessoa e exibe seus dados
BEGIN
    SELECT cpf, nome, email, id_endereco INTO pessoa
    FROM Pessoa
    WHERE cpf = '11122233344';
    
    DBMS_OUTPUT.PUT_LINE('CPF: ' || pessoa.cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoa.nome);
    DBMS_OUTPUT.PUT_LINE('Email: ' || pessoa.email);
END;
/

-- Tipo de dado para armazenar uma pessoa
DECLARE TYPE pessoa_tab IS TABLE OF Pessoa%ROWTYPE;
pessoas pessoa_tab;

-- Seleciona todas as pessoas e exibe seus dados
BEGIN
    SELECT * BULK COLLECT INTO pessoas
    FROM Pessoa;
   
    FOR i IN 1..pessoas.COUNT LOOP
		CASE i
            WHEN pessoas.COUNT THEN DBMS_OUTPUT.PUT_LINE('Última Pessoa');
            ELSE DBMS_OUTPUT.PUT_LINE(i || 'º Pessoa');
        END CASE;

        DBMS_OUTPUT.PUT_LINE('CPF: ' || pessoas(i).cpf);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoas(i).nome);
        DBMS_OUTPUT.PUT_LINE('Email: ' || pessoas(i).email);
		DBMS_OUTPUT.PUT_LINE('======================================');
    END LOOP;
END;
/

-- Bloco anônimo para exibir a data atual
DECLARE
    current_date DATE := SYSDATE;
BEGIN
    dbms_output.put_line( current_date );
END;
/

-- Insere um quadrinho no sistema
CREATE OR REPLACE PROCEDURE InserirQuadrinho(
    value_id IN OUT Quadrinhos.id%TYPE,
    value_nome IN OUT Quadrinhos.nome%TYPE,
    value_genero IN OUT Quadrinhos.genero%TYPE,
    value_preco IN OUT Quadrinhos.preco%TYPE,
    value_estoque IN OUT Quadrinhos.estoque%TYPE,
    value_periodicidade IN OUT Quadrinhos.periodicidade%TYPE,
    value_edicao IN OUT Quadrinhos.edicao%TYPE
    )
IS
BEGIN
    INSERT INTO Quadrinhos (id, nome, genero, preco, estoque, periodicidade, edicao)
    VALUES (value_id, value_nome, value_genero, value_preco, value_estoque, value_periodicidade, value_edicao);
END;
/

-- Determina a frequência (alta, média, baixa) de vendas de um quadrinho
CREATE OR REPLACE FUNCTION ObterFrequencia(value_id Quadrinhos.id%TYPE)
    RETURN VARCHAR2
IS 
    frequencia NUMBER;
BEGIN
    SELECT COUNT(*) INTO frequencia FROM VendeProduto WHERE id_quadrinho = value_id;

    IF frequencia > 100 THEN
        RETURN 'O Quadrinho' || value_id || 'tem frequência alta de vendas';
    ELSIF frequencia > 50 THEN
        RETURN 'O Quadrinho' || value_id || 'tem frequência média de vendas';
    ELSE
        RETURN 'O Quadrinho' || value_id || 'tem frequência baixa de vendas';
    END IF;
END;
/

-- Exibe o salário de todos os funcionários que foram admitidos em 2025
DECLARE 
    CURSOR funcionario_cursor IS
        SELECT f.cpf_func, f.data_admissao
        FROM Funcionario f;

    value_cpf_funcionario Funcionario.cpf_func%TYPE;
    value_data_admissao Funcionario.data_admissao%TYPE;
    value_nome Pessoa.nome%TYPE;
BEGIN
    OPEN funcionario_cursor;
    LOOP
        FETCH funcionario_cursor INTO value_cpf_funcionario, value_data_admissao, value_nome;
        EXIT WHEN funcionario_cursor%NOTFOUND;
        IF value_cpf_funcionario IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Nome: ' || value_nome);
            DBMS_OUTPUT.PUT_LINE('CPF: ' || value_cpf_funcionario);
		    DBMS_OUTPUT.PUT_LINE('======================================');
        END IF;
    END LOOP;
    CLOSE funcionario_cursor;
END;
/

-- Lista de cpfs de todos os clientes que ja inscreveram em algum evento
DECLARE
    TYPE lista IS TABLE OF Inscreve.cpf_cliente%TYPE INDEX BY PLS_INTEGER;
    cpfs lista;
    i PLS_INTEGER := 1;
BEGIN
    SELECT cpf_cliente
    BULK COLLECT INTO cpfs
    FROM Inscreve;

    WHILE i <= cpfs.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente ' || i || ': ' || cpfs(i));
        i := i + 1;
    END LOOP;
END;
/

-- Define o salário padrão
CREATE OR REPLACE TRIGGER InsereSalarioMinimo
BEFORE INSERT ON Cargo_Funcionario
FOR EACH ROW
BEGIN
    IF :NEW.salario IS NULL THEN
        :NEW.salario := 1512.00;
    END IF;
END;
/

-- Verifica o estoque
CREATE OR REPLACE TRIGGER VerificaEstoque
BEFORE INSERT OR UPDATE ON VendeProduto
FOR EACH ROW
BEGIN
    IF :NEW.id_quadrinho IS NOT NULL THEN
        UPDATE Quadrinhos
        SET estoque = estoque - 1
        WHERE id = :NEW.id_quadrinho;
    END IF;
END;
/

-- Reduzir o estoque
CREATE OR REPLACE PACKAGE pkg_quadrinhos IS
  PROCEDURE ReduzEstoque(p_id IN Quadrinhos.id%TYPE, p_qtd IN NUMBER);
  FUNCTION EstoqueAtual(p_id IN Quadrinhos.id%TYPE) RETURN NUMBER;
END pkg_quadrinhos;
/

-- Exceção quando não encontrar um cliente
DECLARE
  v_nome Pessoa.nome%TYPE;
BEGIN
  SELECT nome INTO v_nome FROM Pessoa WHERE cpf = '00000000000';
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Cliente não encontrado.');
END;
/

-- Reduz o estoque
CREATE OR REPLACE PACKAGE BODY pkg_quadrinhos IS
  PROCEDURE ReduzEstoque(p_id IN Quadrinhos.id%TYPE, p_qtd IN NUMBER) IS
  BEGIN
    UPDATE Quadrinhos SET estoque = estoque - p_qtd WHERE id = p_id;
  END;

  FUNCTION EstoqueAtual(p_id IN Quadrinhos.id%TYPE) RETURN NUMBER IS
    v_estoque NUMBER;
  BEGIN
    SELECT estoque INTO v_estoque FROM Quadrinhos WHERE id = p_id;
    RETURN v_estoque;
  END;
END pkg_quadrinhos;
/