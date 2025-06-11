# Minimundo – Loja de Quadrinhos (AV1)
[current](https://docs.google.com/document/d/14fISroQGGKWpOCCcORue4w9zgTj-Fa42GlfTILRQcdI/edit?usp=sharing)

Este projeto modela uma loja física de quadrinhos inspirada em séries como *The Big Bang Theory*. A loja vende quadrinhos presencialmente, organiza eventos como campeonatos e lançamentos, e conta com funcionários para operação e organização.

---

## 1. Descrição do Mundo Real

A aplicação representa uma loja física de quadrinhos. Seu foco é o controle local de estoque e a realização de eventos. Não há entregas ou encomendas.

---

## 2. Objetivos da Aplicação

- Gerenciar vendas e controle de estoque
- Controlar cadastro de produtos e fornecedores
- Registrar a participação dos clientes em eventos
- Suportar análises sobre vendas, estoque e engajamento dos clientes

---
## Atualizar daqui pra baixo conforme as entregas 

## 3. Descrição das Entidades

### Pessoa (disjunto, obrigatório)
- **Descrição:** Representa indivíduos envolvidos na loja. Especializa-se em Funcionário e Cliente.
- **Atributos:**
  - CPF (chave primária)
  - Nome
  - Email
  - Telefone (multivalorado)

### Funcionário (especialização de Pessoa)
- **Descrição:** Representa funcionários da loja.
- **Atributos:**
  - Cargo
  - Salário
  - Ativo
  - Endereço (CEP, Rua, Número)
  - Data de Admissão

### Cliente (especialização de Pessoa)
- **Descrição:** Representa clientes que compram quadrinhos e participam de eventos.
- **Atributos:**
  - VIP

### Quadrinhos
- **Descrição:** Representa quadrinhos em estoque ou vendidos.
- **Atributos:**
  - ID (chave primária)
  - Nome
  - Gênero
  - Preço
  - Estoque
  - Periodicidade
  - Edição

### Evento
- **Descrição:** Representa eventos presenciais organizados pela loja.
- **Atributos:**
  - ID (chave primária)
  - Nome
  - Data
  - Tipo_Evento (lançamento, campeonato etc.)
  - Duração

### VendeProduto (entidade associativa)
- **Descrição:** Representa a venda de um produto, com ou sem desconto.
- **Atributos:**
  - ID (chave primária)

### Desconto (entidade fraca)
- **Descrição:** Representa um desconto que pode ser aplicado a uma compra.
- **Atributos:**
  - Valor
  - Cupom (chave discriminadora)

### Lote
- **Descrição:** Representa lotes de quadrinhos recebidos.
- **Atributos:**
  - ID (chave primária)
  - Valor unitário
  - Quantidade
  - Data de entrega

### Fornecedor
- **Descrição:** Representa fornecedores de quadrinhos.
- **Atributos:**
  - CNPJ (chave primária)
  - Nome
  - Telefone

---

## 4. Descrição dos Relacionamentos

### Inscreve
- **Descrição:** Inscrição do cliente em um evento.
- **Atributos:** Data_Inscrição
- **Cardinalidade:** (Cliente) 0:N — 0:N (Evento)

### Organiza
- **Descrição:** Funcionário organiza eventos (um responsável por evento).
- **Cardinalidade:** (Funcionário) 1:1 — 0:N (Evento)

### Tem
- **Descrição:** Identifica o desconto (Desconto) associado à venda (VendeProduto).
- **Cardinalidade:** (VendeProduto) 0:1 — 1:1 (Desconto)

### Supervisiona
- **Descrição:** Auto-relacionamento indicando supervisão entre funcionários.
- **Cardinalidade:** (Supervisor) 0:1 — 0:N (Supervisionado)

### Vende (relacionamento triplo)
- **Descrição:** Compra e venda de quadrinhos (Cliente, Funcionário, Quadrinhos).
- **Atributos:** Data_Compra
- **Cardinalidade:** 1:1:1 — N:N:N

### Fornece (relacionamento triplo)
- **Descrição:** Relaciona Fornecedor, Lote e Quadrinhos.
- **Cardinalidade:** 1:1:1 — N:N:N

---

## 5. Possíveis Perguntas

- Quantos clientes distintos compraram um quadrinho específico?
- Quantos eventos ocorreram em um determinado período?
- Qual funcionário vendeu mais quadrinhos?
- Qual funcionário organizou mais eventos em um período?
- O que acontece se um funcionário for removido mas estiver vinculado a uma venda?
- Quantos quadrinhos foram vendidos em um mês específico?

---

## 6. Possíveis Relatórios

- Quais os itens mais vendidos na loja?
- Histórico de compras de um cliente
- Quais clientes participaram de mais eventos?
- Quadrinhos com estoque crítico
- Eventos que ocorreram em um período específico

