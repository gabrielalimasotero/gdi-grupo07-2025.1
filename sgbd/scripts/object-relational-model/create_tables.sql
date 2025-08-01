CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    id NUMBER,
    cep CHAR(9),
    rua VARCHAR2(40),
    numero NUMBER,
    CONSTRUCTOR FUNCTION tp_endereco(SELF IN OUT NOCOPY tp_endereco, id NUMBER, cep CHAR, rua VARCHAR2, numero NUMBER) RETURN SELF AS RESULT,
    MAP MEMBER FUNCTION exibir_endereco_completo RETURN VARCHAR2,
    MEMBER PROCEDURE exibir_cep (SELF tp_endereco)
);
/

CREATE OR REPLACE TYPE BODY tp_endereco AS
    CONSTRUCTOR FUNCTION tp_endereco(SELF IN OUT NOCOPY tp_endereco, id NUMBER, cep CHAR, rua VARCHAR2, numero NUMBER) RETURN SELF AS RESULT IS
    BEGIN
        SELF.id := id;
        SELF.cep := cep;
        SELF.rua := rua;
        SELF.numero := numero;
        RETURN;
    END;
    MAP MEMBER FUNCTION exibir_endereco_completo RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.rua || ', ' || TO_CHAR(SELF.numero) || ' - CEP: ' || SELF.cep;
    END;

    MEMBER PROCEDURE exibir_cep (SELF tp_endereco) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('CEP: ' || SELF.cep);
    END;
END;
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_hobby AS OBJECT (
    nome_hobby VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_hobbies AS TABLE OF tp_hobby;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    cpf CHAR(11),
    nome VARCHAR2(40),
    email VARCHAR2(40),
    endereco REF tp_endereco,
    telefones tp_telefones,
    MEMBER FUNCTION exibir_nome RETURN VARCHAR2,
    FINAL MEMBER PROCEDURE exibir_detalhes_pessoa (SELF tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER FUNCTION exibir_nome RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.nome;
    END;
    
    FINAL MEMBER PROCEDURE exibir_detalhes_pessoa (SELF tp_pessoa) IS
        v_endereco tp_endereco;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('CPF: ' || SELF.cpf);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.exibir_nome());
        DBMS_OUTPUT.PUT_LINE('Email: ' || SELF.email);
        
        SELECT DEREF(SELF.endereco) INTO v_endereco FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('Endereço: ' || v_endereco.exibir_endereco_completo());
        
        IF SELF.telefones IS NOT NULL AND SELF.telefones.COUNT > 0 THEN
            FOR i IN 1..SELF.telefones.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE('Telefone ' || i || ': ' || SELF.telefones(i).telefone);
            END LOOP;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
    data_admissao DATE,
    ativo VARCHAR2(20),
    supervisor REF tp_funcionario,
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2 IS
    BEGIN
        RETURN '[Funcionário] ' || SELF.nome;
    END;
END;
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
    num_eventos_participados NUMBER,
    hobbies tp_hobbies,
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2 IS
    BEGIN
        RETURN '[Cliente] ' || SELF.nome;
    END;
END;
/

CREATE OR REPLACE TYPE tp_cargo_funcionario AS OBJECT (
    funcionario_cpf CHAR(11),
    cargo VARCHAR2(40),
    salario NUMBER,
    funcionario REF tp_funcionario
);
/

CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id NUMBER,
    nome_evento VARCHAR2(40),
    data_evento DATE,
    tipo_evento VARCHAR2(40),
    duracao VARCHAR2(40),
    organizador REF tp_funcionario,
    MEMBER FUNCTION exibir_detalhes_evento RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_evento AS
    MEMBER FUNCTION exibir_detalhes_evento RETURN VARCHAR2 IS
        v_organizador tp_funcionario;
    BEGIN
        SELECT DEREF(SELF.organizador) INTO v_organizador FROM DUAL;
        RETURN 'Evento: ' || SELF.nome_evento || ' - Data: ' || TO_CHAR(SELF.data_evento, 'DD/MM/YYYY') || ' - Organizador: ' || v_organizador.nome;
    END;
END;
/

CREATE OR REPLACE TYPE tp_quadrinhos AS OBJECT (
    id NUMBER,
    nome VARCHAR2(40),
    genero VARCHAR2(40),
    preco NUMBER,
    estoque NUMBER,
    periodicidade VARCHAR2(40),
    edicao VARCHAR2(40),
    ORDER MEMBER FUNCTION comparaEstoque (p_quadrinho tp_quadrinhos) RETURN INTEGER
);
/

CREATE OR REPLACE TYPE BODY tp_quadrinhos AS
    ORDER MEMBER FUNCTION comparaEstoque (p_quadrinho tp_quadrinhos) RETURN INTEGER IS
    BEGIN
        IF SELF.estoque < p_quadrinho.estoque THEN
            RETURN -1;
        ELSIF SELF.estoque > p_quadrinho.estoque THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;
END;
/

ALTER TYPE tp_quadrinhos
ADD ATTRIBUTE data_publicacao DATE CASCADE;
/

CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    cnpj CHAR(14),
    nome VARCHAR2(40),
    telefone VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_lote AS OBJECT (
    id NUMBER,
    valor_unitario NUMBER,
    quantidade NUMBER,
    data_de_entrega DATE
);
/

CREATE OR REPLACE TYPE tp_venda_produto AS OBJECT (
    id NUMBER,
    data_compra DATE,
    quadrinho REF tp_quadrinhos,
    cliente REF tp_cliente,
    funcionario REF tp_funcionario
);
/

CREATE OR REPLACE TYPE tp_desconto AS OBJECT (
    venda_id NUMBER,
    valor NUMBER(5,2),
    cupom VARCHAR2(20),
    venda REF tp_venda_produto
);
/

CREATE OR REPLACE TYPE tp_inscricao AS OBJECT (
    evento_id NUMBER,
    cliente_cpf CHAR(11),
    evento REF tp_evento,
    cliente REF tp_cliente
);
/

CREATE OR REPLACE TYPE tp_fornecimento AS OBJECT (
    lote_id NUMBER,
    quadrinho_id NUMBER,
    fornecedor_cnpj CHAR(14),
    lote REF tp_lote,
    quadrinho REF tp_quadrinhos,
    fornecedor REF tp_fornecedor
);
/

CREATE TABLE tb_endereco OF tp_endereco (PRIMARY KEY (id));
CREATE TABLE tb_quadrinhos OF tp_quadrinhos (PRIMARY KEY (id));
CREATE TABLE tb_fornecedor OF tp_fornecedor (PRIMARY KEY (cnpj));
CREATE TABLE tb_lote OF tp_lote (PRIMARY KEY (id));

CREATE TABLE tb_cliente OF tp_cliente (
    PRIMARY KEY (cpf),
    SCOPE FOR (endereco) IS tb_endereco
) NESTED TABLE hobbies STORE AS tb_hobbies_cliente;

CREATE TABLE tb_funcionario OF tp_funcionario (
    PRIMARY KEY (cpf),
    SCOPE FOR (endereco) IS tb_endereco,
    SCOPE FOR (supervisor) IS tb_funcionario
);

CREATE TABLE tb_evento OF tp_evento (
    PRIMARY KEY (id),
    SCOPE FOR (organizador) IS tb_funcionario
);

CREATE TABLE tb_cargo_funcionario OF tp_cargo_funcionario (
    PRIMARY KEY (funcionario_cpf, cargo),
    funcionario WITH ROWID REFERENCES tb_funcionario
);

CREATE TABLE tb_venda_produto OF tp_venda_produto (
    PRIMARY KEY (id),
    SCOPE FOR (quadrinho) IS tb_quadrinhos,
    SCOPE FOR (cliente) IS tb_cliente,
    SCOPE FOR (funcionario) IS tb_funcionario
);

CREATE TABLE tb_desconto OF tp_desconto (
    PRIMARY KEY (venda_id),
    SCOPE FOR (venda) IS tb_venda_produto
);

CREATE TABLE tb_inscricao OF tp_inscricao (
    PRIMARY KEY (evento_id, cliente_cpf),
    SCOPE FOR (evento) IS tb_evento,
    SCOPE FOR (cliente) IS tb_cliente
);

CREATE TABLE tb_fornecimento OF tp_fornecimento (
    PRIMARY KEY (lote_id, quadrinho_id, fornecedor_cnpj),
    SCOPE FOR (lote) IS tb_lote,
    SCOPE FOR (quadrinho) IS tb_quadrinhos,
    SCOPE FOR (fornecedor) IS tb_fornecedor
);
/
