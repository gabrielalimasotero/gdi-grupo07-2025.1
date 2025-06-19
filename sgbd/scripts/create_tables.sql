-- Tabela Endereco

CREATE TABLE Endereco (
    cep CHAR(9) NOT NULL,
    rua VARCHAR2(40) NOT NULL,
    numero NUMBER,
    CONSTRAINT endereco_pk PRIMARY KEY (cep)
);

-- Tabela TelefoneCliente (Nova Tabela)

CREATE TABLE TelefoneCliente (
    cpf_cliente CHAR(11) NOT NULL,
    telefone VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_telefone_cliente PRIMARY KEY (cpf_cliente, telefone),
    CONSTRAINT fk_cpf_cliente_tel FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente)
);

-- Tabela TelefoneFuncionario (Nova Tabela)

CREATE TABLE TelefoneFuncionario (
    cpf_funcionario CHAR(11) NOT NULL,
    telefone VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_telefone_funcionario PRIMARY KEY (cpf_funcionario, telefone),
    CONSTRAINT fk_cpf_funcionario_tel FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_funcionario)
);

-- Tabela Funcionario

CREATE TABLE Funcionario(
    nome VARCHAR2(40) NOT NULL,
    email VARCHAR2(40) NOT NULL,
    cpf_funcionario CHAR(11) PRIMARY KEY,
    cep CHAR(9) NOT NULL,
    cargo VARCHAR2(40) NOT NULL,
    salario NUMBER NOT NULL, 
    ativo VARCHAR2(20) NOT NULL,
    data_admissao DATE NOT NULL, 
    cpf_gerente CHAR(11), 
    CONSTRAINT chk_ativo CHECK (ativo IN ('ativo', 'inativo')), 
    CONSTRAINT fk_cep FOREIGN KEY (cep) REFERENCES Endereco(cep), 
    CONSTRAINT fk_cpf_gerente FOREIGN KEY (cpf_gerente) REFERENCES Funcionario(cpf_funcionario)
);

-- Tabela Cliente

CREATE TABLE Cliente (
    nome VARCHAR2(40) NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    email VARCHAR2(40) NOT NULL,
    num_eventos_participados NUMBER NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente) 
);

-- Tabela Quadrinhos

CREATE TABLE Quadrinhos(
    id NUMBER PRIMARY KEY, 
    nome VARCHAR2(40) NOT NULL,
    genero VARCHAR2(40) NOT NULL,
    preco NUMBER NOT NULL, 
    estoque NUMBER NOT NULL,
    periodicidade VARCHAR2(40),
    edicao VARCHAR2(40),
    CONSTRAINT chk_periodicidade CHECK (periodicidade IN ('Diario', 'Semanal', 'Quinzenal', 'Mensal', 'Bimestral', 'Trimestral', 'Semestral', 'Anual', 'Unico'))
);

-- Tabela Evento

CREATE SEQUENCE seq_evento
START WITH 1
INCREMENT BY 1;

CREATE TABLE Evento(
    id NUMBER PRIMARY KEY,
    organizador CHAR(11) NOT NULL,
    nome_evento VARCHAR2(40) NOT NULL,
    data_evento DATE NOT NULL,
    tipo_evento VARCHAR2(40) NOT NULL,
    duracao VARCHAR2(40) NOT NULL, 
    CONSTRAINT fk_organizador FOREIGN KEY (organizador) REFERENCES Funcionario(cpf_funcionario) 
    -- implementar check em duração ou tipo de evento
);

-- Tabela VendeProduto

CREATE TABLE VendeProduto(
    id NUMBER PRIMARY KEY,
    id_quadrinho NUMBER NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL,
    CONSTRAINT fk_id_quadrinho FOREIGN KEY (id_quadrinho) REFERENCES Quadrinhos(id), 
    CONSTRAINT fk_cpf_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente), 
    CONSTRAINT fk_cpf_funcionario FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_funcionario) 
);

-- Tabela Desconto

CREATE TABLE Desconto (
    id_venda NUMBER NOT NULL,
    valor NUMBER(5,2) NOT NULL, 
    cupom VARCHAR2(20) PRIMARY KEY, 
    CONSTRAINT fk_id_venda FOREIGN KEY (id_venda) REFERENCES VendeProduto(id) 
);

-- Tabela Lote

CREATE TABLE Lote(
    id NUMBER NOT NULL,
    valor_unitario NUMBER NOT NULL, 
    quantidade NUMBER NOT NULL,
    data_de_entrega DATE NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (id) 
);

-- Tabela Fornecedor

CREATE TABLE Fornecedor(
    cnpj CHAR(14) PRIMARY KEY,
    nome VARCHAR2(40) NOT NULL,
    telefone VARCHAR2(20) NOT NULL
);

-- Tabela Inscreve

CREATE TABLE Inscreve(
    id_evento NUMBER NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    PRIMARY KEY (id_evento, cpf_cliente), 
    CONSTRAINT pk_id_evento FOREIGN KEY (id_evento) REFERENCES Evento(id), 
    CONSTRAINT pk_cpf_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente) 
);

-- Tabela Fornece

CREATE TABLE Fornece (
    id_lote NUMBER NOT NULL,
    id_quadrinho NUMBER NOT NULL,
    cnpj_fornecedor CHAR(14) NOT NULL, 
    PRIMARY KEY (id_lote, id_quadrinho, cnpj_fornecedor), 
    CONSTRAINT fk_id_quadrinho_fornece FOREIGN KEY (id_quadrinho) REFERENCES Quadrinhos(id), 
    CONSTRAINT fk_id_lote_fornece FOREIGN KEY (id_lote) REFERENCES Lote(id), 
    CONSTRAINT fk_cnpj_fornecedor_fornece FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj) 
);
