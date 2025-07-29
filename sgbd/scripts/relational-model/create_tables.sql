-- Tabela Endereco
-- Adicionado id como PRIMARY KEY e sequência para o id
CREATE SEQUENCE seq_endereco
START WITH 1
INCREMENT BY 1;


CREATE TABLE Endereco (
    id NUMBER DEFAULT seq_endereco.NEXTVAL PRIMARY KEY,
    cep CHAR(9) NOT NULL,
    rua VARCHAR2(40) NOT NULL,
    numero NUMBER
);


-- Tabela Pessoa (Nova entidade centralizada)
CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR2(40) NOT NULL,
    email VARCHAR2(40) NOT NULL,
    id_endereco NUMBER, -- FK para Endereco
    CONSTRAINT fk_pessoa_endereco FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
);


-- Tabela Telefone_Pessoa (Substitui TelefoneCliente e TelefoneFuncionario)
CREATE TABLE Telefone_Pessoa (
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_telefone_pessoa PRIMARY KEY (cpf, telefone),
    CONSTRAINT fk_telefone_pessoa_cpf FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);


-- Tabela Funcionario (Atualizada após normalização)
CREATE TABLE Funcionario(
    cpf_func CHAR(11) PRIMARY KEY, -- Agora PK e FK para Pessoa
    ativo VARCHAR2(20) NOT NULL,
    data_admissao DATE NOT NULL,
    cpf_supervisor CHAR(11), -- Auto-referência
    CONSTRAINT chk_ativo CHECK (ativo IN ('ativo', 'inativo')),
    CONSTRAINT fk_func_pessoa FOREIGN KEY (cpf_func) REFERENCES Pessoa(cpf), -- FK para Pessoa
    CONSTRAINT fk_func_supervisor FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf_func) -- Auto-referência
);


-- Tabela Cargo_Funcionario (Nova tabela para normalizar Cargo e Salário)
CREATE SEQUENCE seq_cargo_funcionario
START WITH 1
INCREMENT BY 1;


CREATE TABLE Cargo_Funcionario (
    id NUMBER DEFAULT seq_cargo_funcionario.NEXTVAL PRIMARY KEY,
    cargo VARCHAR2(40) NOT NULL,
    salario NUMBER NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL, -- FK para Funcionario
    CONSTRAINT fk_cargo_func FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_func)
);


-- Tabela Cliente (Atualizada após normalização)
CREATE TABLE Cliente (
    cpf_cliente CHAR(11) PRIMARY KEY, -- Agora PK e FK para Pessoa
    num_eventos_participados NUMBER NOT NULL, -- Mantido aqui conforme a estrutura atual, pode ser movido para Pessoa se for genérico
    CONSTRAINT fk_cliente_pessoa FOREIGN KEY (cpf_cliente) REFERENCES Pessoa(cpf)
);


-- Tabela Quadrinhos (Sem mudanças na estrutura)
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


-- Tabela Evento (Atualizada com cpf_func do organizador)
CREATE SEQUENCE seq_evento
START WITH 1
INCREMENT BY 1;


CREATE TABLE Evento(
    id NUMBER PRIMARY KEY,
    cpf_func CHAR(11) NOT NULL, -- Renomeado de 'organizador' e agora FK para Funcionario
    nome_evento VARCHAR2(40) NOT NULL,
    data_evento DATE NOT NULL, -- 'data' renomeado para 'data_evento' para consistência
    tipo_evento VARCHAR2(40) NOT NULL,
    duracao VARCHAR2(40) NOT NULL,
    CONSTRAINT fk_evento_organizador FOREIGN KEY (cpf_func) REFERENCES Funcionario(cpf_func)
    -- Adicionar check em duração ou tipo de evento, se necessário
);


-- Tabela VendeProduto (Adicionado data_compra)
CREATE TABLE VendeProduto(
    id NUMBER PRIMARY KEY,
    id_quadrinho NUMBER NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL,
    data_compra DATE NOT NULL, -- Novo atributo
    CONSTRAINT fk_venda_quadrinho FOREIGN KEY (id_quadrinho) REFERENCES Quadrinhos(id),
    CONSTRAINT fk_venda_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente),
    CONSTRAINT fk_venda_funcionario FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_func)
);


-- Tabela Desconto (id_venda agora é PRIMARY KEY e FK)
CREATE TABLE Desconto (
    id_venda NUMBER PRIMARY KEY, -- Agora PRIMARY KEY
    valor NUMBER(5,2) NOT NULL,
    cupom VARCHAR2(20) UNIQUE, -- Mantido UNIQUE, se não for PK
    CONSTRAINT fk_desconto_venda FOREIGN KEY (id_venda) REFERENCES VendeProduto(id)
);


-- Tabela Lote (Sem mudanças na estrutura)
CREATE TABLE Lote(
    id NUMBER PRIMARY KEY, -- Alterado para PK, era NOT NULL e depois PK
    valor_unitario NUMBER NOT NULL,
    quantidade NUMBER NOT NULL,
    data_de_entrega DATE NOT NULL
);


-- Tabela Fornecedor (Sem mudanças na estrutura)
CREATE TABLE Fornecedor(
    cnpj CHAR(14) PRIMARY KEY,
    nome VARCHAR2(40) NOT NULL,
    telefone VARCHAR2(20) NOT NULL
);


-- Tabela Inscreve (Sem mudanças na estrutura)
CREATE TABLE Inscreve(
    id_evento NUMBER NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    PRIMARY KEY (id_evento, cpf_cliente),
    CONSTRAINT fk_inscreve_evento FOREIGN KEY (id_evento) REFERENCES Evento(id),
    CONSTRAINT fk_inscreve_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente)
);


-- Tabela Fornece (Sem mudanças na estrutura, mas garantindo FKs corretas)
CREATE TABLE Fornece (
    id_lote NUMBER NOT NULL,
    id_quadrinho NUMBER NOT NULL,
    cnpj_fornecedor CHAR(14) NOT NULL,
    PRIMARY KEY (id_lote, id_quadrinho, cnpj_fornecedor),
    CONSTRAINT fk_fornece_quadrinho FOREIGN KEY (id_quadrinho) REFERENCES Quadrinhos(id),
    CONSTRAINT fk_fornece_lote FOREIGN KEY (id_lote) REFERENCES Lote(id),
    CONSTRAINT fk_fornece_fornecedor FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);
