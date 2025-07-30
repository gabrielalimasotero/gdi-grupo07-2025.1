CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cep VARCHAR2(8),
    rua VARCHAR2(255),
    numero NUMBER,
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT NOCOPY tp_endereco,
        cep VARCHAR2,
        rua VARCHAR2,
        numero NUMBER
    ) RETURN SELF AS RESULT,
    MAP MEMBER FUNCTION exibir_endereco_completo RETURN VARCHAR2,
    MEMBER PROCEDURE exibir_cep (SELF tp_endereco)
);
/

CREATE OR REPLACE TYPE BODY tp_endereco AS 
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT NOCOPY tp_endereco,
        cep VARCHAR2,
        rua VARCHAR2,
        numero NUMBER
    ) RETURN SELF AS RESULT IS
    BEGIN
        SELF.cep := cep;
        SELF.rua := rua;
        SELF.numero := numero;
        RETURN;
    END;

    MAP MEMBER FUNCTION exibir_endereco_completo RETURN VARCHAR2 IS
    BEGIN
        RETURN rua || ', ' || TO_CHAR(numero) || ' - ' || cep;
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

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    email VARCHAR2(100),
    endereco REF tp_endereco,
    telefone tp_telefones,
    CONSTRUCTOR FUNCTION tp_pessoa(
        SELF IN OUT NOCOPY tp_pessoa,
        cpf VARCHAR2,
        nome VARCHAR2,
        email VARCHAR2,
        endereco REF tp_endereco,
        telefone tp_telefones
    ) RETURN SELF AS RESULT,
    MEMBER FUNCTION exibir_nome RETURN VARCHAR2,
    FINAL MEMBER PROCEDURE exibir_detalhes_pessoa (SELF tp_pessoa)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
    data_admissao DATE,
    cargo VARCHAR2(100),
    ativo BOOLEAN,
    salario DECIMAL(10,2),
    cpf_supervisor REF tp_funcionario,
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255),
    data_evento DATE,
    tipo_evento VARCHAR2(255),
    duracao VARCHAR2(50),
    MEMBER FUNCTION exibir_detalhes_evento RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_quadrinhos AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255),
    genero VARCHAR2(50),
    preco DECIMAL(10,2),
    estoque NUMBER,
    peridiocidade VARCHAR2(50),
    edicao VARCHAR2(50),
    ORDER MEMBER FUNCTION comparaEstoque (X tp_quadrinhos) RETURN INTEGER
);
/

CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    cnpj VARCHAR2(18),
    nome VARCHAR2(255),
    telefone tp_telefone
);
/

CREATE OR REPLACE TYPE lote AS OBJECT (
    id NUMBER,
    quantidade NUMBER,
    preco_unitario DECIMAL(10,2),
    data_entrega DATE
);
/

CREATE TABLE endereco_obj OF tp_endereco
    OBJECT ID PRIMARY KEY
    WITH ROWID;

CREATE TABLE pessoa_obj OF tp_pessoa
    OBJECT ID PRIMARY KEY
    OBJECT IDENTIFIER IS PRIMARY KEY
    WITH ROWID;

CREATE TABLE funcionario_obj OF tp_funcionario
    OBJECT ID PRIMARY KEY
    SCOPE IS pessoa_obj
    WITH ROWID;

CREATE TABLE cliente_obj OF tp_cliente
    OBJECT ID PRIMARY KEY
    SCOPE IS pessoa_obj
    WITH ROWID;

CREATE TABLE evento_obj OF tp_evento
    OBJECT ID PRIMARY KEY
    WITH ROWID;

CREATE TABLE quadrinhos_obj OF tp_quadrinhos
    OBJECT ID PRIMARY KEY
    WITH ROWID;

CREATE TABLE fornecedor_obj OF tp_fornecedor
    OBJECT ID PRIMARY KEY
    WITH ROWID;

CREATE TABLE lote_obj OF lote
    OBJECT ID PRIMARY KEY
    WITH ROWID;

ALTER TABLE pessoa_obj
    ADD SCOPE FOR (endereco) IS endereco_obj;

ALTER TABLE funcionario_obj
    ADD SCOPE FOR (cpf_supervisor) IS funcionario_obj;
