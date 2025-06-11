
# 🗂️ Normalização – Comic Center - AV2

Este documento apresenta a **normalização do modelo relacional** do projeto **Comic Center**, desenvolvido para a disciplina **Gerenciamento de Dados e Informação – UFPE** (Grupo 07).

Foram aplicadas as três primeiras formas normais (1FN, 2FN e 3FN), com justificativas detalhadas para cada relação.

obs.: sempre atualizar daqui pra baixo conforme as entregas, só copiar o docs e pedir pro chatgpt formatar pra readme

## Normalização

### Pessoa
- **1FN**: Atributos atômicos (telefone multivalorado em tabela separada).  
- **2FN**: Não existem dependências parciais (CPF é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Tabela Pessoa com CPF como chave primária e CEP como chave estrangeira.  
  - Telefone armazenado em tabela Telefone_Pessoa.  
  - Tabela Endereço separada.

### Funcionário
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (CPF_Funcionário é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Funcionário herda CEP como FK a partir de Pessoa.
    
### Quadrinhos
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Tabela Quadrinhos com ID como chave primária.

### Evento
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Tabela Evento com ID como chave primária e organizador como FK.

### VendeProduto
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Tabela VendeProduto com ID como chave primária.  
  - FK para Quadrinhos, Funcionário e Pessoa (cliente).

### Desconto
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID_venda é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - ID_venda como chave primária e FK para VendeProduto.

### Lote
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - ID como chave primária.

### Fornecedor
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (CNPJ é chave primária).  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - CNPJ como chave primária.

### Inscreve
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - ID_evento como FK para Evento.  
  - CPF_Cliente como FK para Pessoa.

### Organiza
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Organizador representado como FK na tabela Evento.

### Tem
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Faz parte da tabela Desconto (cardinalidade máxima está em Desconto).

### Supervisiona
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - Representado como auto-relacionamento em Funcionário.

### Fornece
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  
- **Após a normalização:**  
  - ID_Lote como FK para Lote.  
  - ID_Quadrinho como FK para Quadrinhos.  
  - CNPJ_Fornecedor como FK para Fornecedor.

