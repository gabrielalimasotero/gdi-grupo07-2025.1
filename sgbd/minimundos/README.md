# Minimundo – Loja de Quadrinhos (AV2)
[Current]([https://docs.google.com/document/d/1LDpUb9rJD1lzPibhyFf6ewZ_M4Bt-b8FCiRk1mNGRXs/edit?usp=sharing](https://docs.google.com/document/d/1LDpUb9rJD1lzPibhyFf6ewZ_M4Bt-b8FCiRk1mNGRXs/edit?tab=t.0))

### 🔧 Modificações feitas de acordo com o feedback da AV1
Corrigida a cardinalidade mínima de ORGANIZA (mínima = 1 funcionário).
Corrigida a cardinalidade mínima do relacionamento triplo FORNECE (mínima = 1:1:1).
Corrigida a descrição de DESCONTO e sua vinculação à entidade associativa VENDE.
Ajustada a máxima do relacionamento triplo VENDE para apenas 1 funcionário por venda.
Garantida a consistência entre minimundo e diagrama.

### Objetivos da Aplicação
- Gerenciar vendas e controle de estoque.  
- Controlar cadastro de produtos e fornecedores.  
- Registrar a participação dos clientes em eventos.  
- Suportar análises sobre vendas, estoque e engajamento dos clientes.

---

## Descrição das Entidades

### Pessoa (disjunto, obrigatório)
- **Descrição:** Representa indivíduos envolvidos na aplicação, podendo ser Funcionário ou Cliente.  
- **Atributos:**  
  - CPF (Chave primária)  
  - Nome  
  - Email  
  - Telefone (atributo multivalorado)  
  - Endereço (CEP como FK para a tabela Endereço)

### Funcionário (especialização de Pessoa)
- **Descrição:** Representa os funcionários da loja de quadrinhos.  
- **Atributos:**  
  - Cargo  
  - Salário  
  - Ativo  
  - Data de admissão

### Cliente (especialização de Pessoa)
- **Descrição:** Não possui atributos próprios. É identificado apenas pelo papel no campo `tipo_pessoa` na tabela Pessoa.  
- **Observação:** A participação em eventos é derivada da contagem de registros na tabela Inscreve.

### Endereço
- **Descrição:** Representa o endereço de uma pessoa.  
- **Atributos:**  
  - CEP (Chave primária)  
  - Rua  
  - Número

### Quadrinhos
- **Descrição:** Representa os quadrinhos em estoque ou vendidos pela loja.  
- **Atributos:**  
  - ID (Chave primária)  
  - Nome  
  - Gênero  
  - Preço  
  - Estoque  
  - Periodicidade  
  - Edição

### Evento
- **Descrição:** Representa eventos presenciais organizados pela loja.  
- **Atributos:**  
  - ID (Chave primária)  
  - Nome  
  - Data  
  - Tipo de evento (lançamento, campeonato etc.)  
  - Duração  
  - Organizador (FK para Funcionário)

### VendeProduto (entidade associativa)
- **Descrição:** Representa a venda de um produto, podendo ou não ter desconto associado.  
- **Atributos:**  
  - ID (Chave primária)  
  - ID_Quadrinho (FK)  
  - CPF_Funcionário (FK)  
  - CPF_Cliente (FK)  
  - Data de compra

### Desconto (entidade fraca)
- **Descrição:** Representa um desconto aplicado em uma venda.  
- **Atributos:**  
  - ID_venda (Chave primária e FK para VendeProduto)  
  - Valor  
  - Cupom (chave discriminadora)

### Lote
- **Descrição:** Representa o lote de quadrinhos recebido pela loja.  
- **Atributos:**  
  - ID (Chave primária)  
  - Valor unitário  
  - Quantidade  
  - Data de entrega

### Fornecedor
- **Descrição:** Empresas fornecedoras de quadrinhos.  
- **Atributos:**  
  - CNPJ (Chave primária)  
  - Nome  
  - Telefone

---

## Descrição dos Relacionamentos

### Inscreve
- **Descrição:** Relacionamento temporal entre Cliente e Evento, registrado pela data de inscrição.  
- **Atributos:**  
  - Data de inscrição  
- **Cardinalidade:**  
  - Mínima: 0 (Cliente) : 0 (Evento)  
  - Máxima: N:N  

### Organiza
- **Descrição:** Um Funcionário organiza um Evento.  
- **Cardinalidade:**  
  - Mínima: 1 (Funcionário) : 1 (Evento)  
  - Máxima: 1:N  

### Tem
- **Descrição:** Relaciona a entidade fraca Desconto à entidade associativa VendeProduto.  
- **Cardinalidade:**  
  - Mínima: 0 (VendeProduto) : 1 (Desconto)  
  - Máxima: 1:1  

### Supervisiona
- **Descrição:** Auto-relacionamento indicando que um funcionário pode ser supervisor de outros.  
- **Cardinalidade:**  
  - Mínima: 0:0  
  - Máxima: 1 (Supervisor) : N (Supervisionado)  

### Vende
- **Descrição:** Relacionamento triplo que envolve Funcionário, Quadrinhos e Cliente.  
- **Atributos:**  
  - Data de compra  
- **Cardinalidade:**  
  - Mínima: 1:1:1  
  - Máxima: N:N:N  

### Fornece
- **Descrição:** Relaciona Fornecedor, Lote e Quadrinhos.  
- **Cardinalidade:**  
  - Mínima: 1:1:1  
  - Máxima: N:N:N  

---

## Problemas Possíveis

**De remoção:**  
- Funcionário removido vinculado a uma venda.  
- Evento removido com clientes ainda inscritos.  
- Endereço removido mas vinculado a pessoas.  
- Quadrinho removido mas ainda associado a uma venda ou lote.  
- Fornecedor removido mas vinculado a um lote de quadrinhos.

**De inserção:**  
- Cliente inserido sem um endereço válido (CEP inexistente).  
- Venda cadastrada sem cliente ou funcionário correspondente.  
- Evento inserido com organizador que não é funcionário.  
- Telefone cadastrado para CPF inexistente.  
- Desconto cadastrado sem venda correspondente.

**De atualização:**  
- Funcionário atualizado para “inativo” mas ainda organizando eventos ou vendendo produtos.  
- CPF atualizado em Pessoa/Funcionário mas ainda referenciado em outras tabelas.  
- CEP de um endereço atualizado mas já referenciado em Pessoa.  
- ID de um quadrinho atualizado mas vinculado a venda ou lote.  
- ID de um evento atualizado mas ainda vinculado a inscrições de clientes.

---

## Possíveis Relatórios

- Itens mais vendidos na loja.  
- Histórico de compras de um cliente.  
- Clientes que participaram de mais eventos.  
- Quadrinhos com estoque crítico.  
- Eventos ocorridos em determinado período.  
- Quantos clientes distintos compraram um quadrinho específico.  
- Quantos eventos ocorreram em um período específico.  
- Qual funcionário vendeu mais quadrinhos.  
- Qual funcionário organizou mais eventos.  
- Quantos quadrinhos foram vendidos em um mês específico.

---

## Tabelas

- **Pessoa (CPF, nome, email, CEP*)**  
- **Endereço (CEP, rua, número)**  
- **Telefone_Pessoa (CPF_Pessoa, telefone)**  
- **Funcionário (CPF_Funcionário, cargo, salário, ativo, data_admissão)**  
- **Quadrinhos (ID, nome, gênero, preço, estoque, periodicidade, edição)**  
- **Evento (ID, nome, data, tipo_evento, duração, organizador*)**  
- **VendeProduto (ID, ID_Quadrinho*, CPF_Funcionário*, CPF_Cliente*, data_compra)**  
- **Desconto (ID_venda*, valor, cupom)**  
- **Lote (ID, valor_unitário, quantidade, data_de_entrega)**  
- **Fornecedor (CNPJ, nome, telefone)**  
- **Inscreve (ID_evento*, CPF_Cliente*, data_inscrição)**  
- **Fornece (ID_Lote*, ID_Quadrinho*, CNPJ_Fornecedor*)**  

---

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

