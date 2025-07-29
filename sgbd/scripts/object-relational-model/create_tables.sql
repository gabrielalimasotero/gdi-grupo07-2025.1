CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cep VARCHAR2(8),
    rua VARCHAR2(255),
    numero NUMBER,

    CONSTRUCTOR FUNCTION tp_endereco(SELF IN OUT NOCOPY tp_endereco, cep VARCHAR2, rua VARCHAR2, numero NUMBER) RETURN SELF AS RESULT,

    MAP MEMBER FUNCTION exibir_endereco_completo RETURN VARCHAR2,
    MEMBER PROCEDURE exibir_cep (SELF tp_moradia)
);
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
    cargo VARCHAR(100),
    ativo BOOLEAN,
    salario DECIMAL(10,2),
    cpf_supervisor REF tp_funcionario,

    OVERRIDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
    OVERRINDING MEMBER FUNCTION exibir_nome RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id NUMBER,
    nome VARCHAR2(255),
    data_evento DATE,
    tipo_evento VARCHAR2(255),
    duracao VARCHAR(50),

    MEMBER FUNCTION exibir_detalhes_evento RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE tp_quadrinhos(
    id NUMBER,
    nome VARCHAR2(255),
    genero VARCHAR(50),
    preco DECIMAL(10,2),
    estoque NUMBER,
    peridiocidade VARCHAR(50),
    edicao VARCHAR(10),

    ORDER MEMBER FUNCTION comparaEstoque (X tp_quadrinhos) RETURN INTEGER
);
/

ALTER TYPE tp_quadrinhos MODIFY ATTRIBUTE edicao VARCHAR2(50) CASCADE;
/

CREATE OR REPLACE TYPE tp_fornecedor(
    cnpj VARHCHAR(18),
    nome VARHCAR2(255),
    telefone tp_telefone
);
/

CREATE OR REPLACE TYPE lote(
    id NUMBER,
    quantidade NUMBER,
    preco_unitario DECIMAL(10,2),
    data_entrega DATE
);
/