# 🏪 Minimundo – Comic Center

Este documento apresenta o **Minimundo** do projeto **Comic Center**, desenvolvido para a disciplina **Gerenciamento de Dados e Informação – UFPE** (Grupo 07).

---

## 🎯 Descrição do mundo real

A aplicação modela uma loja física de quadrinhos, semelhante à retratada em séries como The Big Bang Theory.  
A loja vende quadrinhos presencialmente, organiza eventos como campeonatos e lançamentos, e é operada por funcionários.  
O foco é no controle local de estoque, sem entregas ou encomendas.

---

## 🎯 Objetivos da aplicação

1. Gerenciar vendas e controle de estoque.  
2. Controlar cadastro de produtos e fornecedores.  
3. Registrar a participação dos clientes em eventos.  
4. Suportar análises sobre vendas, estoque e engajamento dos clientes.

---

## 📦 Entidades

- **Pessoa** (disjunto, obrigatório):  
  Representa os indivíduos envolvidos (Cliente ou Funcionário).  
  - Atributos: CPF (PK), Nome, Email, Telefone (multivalorado).

- **Funcionário** (especialização de Pessoa):  
  Representa funcionários da loja.  
  - Atributos: Cargo, Salário, Endereço (CEP, Rua, Número), Data de Admissão.

- **Cliente** (especialização de Pessoa):  
  Representa clientes da loja.  
  - Atributo: Num_Eventos_Participados.

- **Quadrinhos**:  
  Representa os quadrinhos em estoque ou vendidos.  
  - Atributos: ID (PK), Nome, Gênero, Preço, Estoque, Periodicidade, Edição.

- **Evento**:  
  Representa eventos presenciais organizados pela loja.  
  - Atributos: ID (PK), Nome, Data, Tipo_Evento, Duração.

- **VendeProduto** (entidade associativa):  
  Representa a venda de um produto, podendo ter desconto associado.  
  - Atributo: ID (PK).

- **Desconto** (entidade fraca):  
  Representa descontos associados a vendas.  
  - Atributos: Valor, Cupom.

- **Lote**:  
  Representa o lote de quadrinhos recebidos.  
  - Atributos: ID (PK), Valor Unitário, Quantidade, Data de Entrega.

- **Fornecedor**:  
  Representa empresas fornecedoras de quadrinhos.  
  - Atributos: CNPJ (PK), Nome, Telefone.

---

## 🔗 Relacionamentos

- **Inscreve (temporal)**:  
  Um cliente se inscreve em um evento.  
  - Atributo: Data_Inscrição.  
  - Cardinalidade: mínima 0, máxima N (cliente e evento).

- **Organiza**:  
  Um funcionário organiza eventos.  
  - Cardinalidade: mínima 1 (funcionário) para 1 evento, máxima N.

- **Tem**:  
  Liga **VendeProduto** com a entidade fraca **Desconto**.  
  - Cardinalidade: mínima 0, máxima N.

- **Supervisiona (auto-relacionamento)**:  
  Funcionário pode supervisionar outros funcionários.  
  - Cardinalidade: mínima 0, máxima N.

- **Vende (relacionamento triplo)**:  
  Relaciona **Funcionário, Cliente e Quadrinhos**.  
  - Atributo: Data_Compra.  
  - Cardinalidade: mínima 1:1:1, máxima N:N:1.

- **Fornece (relacionamento triplo)**:  
  Relaciona **Fornecedor, Lote e Quadrinhos**.  
  - Cardinalidade: mínima 1:1:1, máxima N:N:N.

---

## 📌 Observação

Este minimundo foi adaptado e revisado conforme feedbacks recebidos, garantindo clareza e consistência para a modelagem do banco de dados.

---

