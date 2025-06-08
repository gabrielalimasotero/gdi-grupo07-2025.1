
# 🏪 Minimundo – Comic Center (AV2)

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
  - Atributos: Cargo, Salário, Endereço (CEP, Rua, Número), Data de Admissão.

- **Cliente** (especialização de Pessoa):  
  - Atributo: Num_Eventos_Participados.

- **Quadrinhos**:  
  - Atributos: ID (PK), Nome, Gênero, Preço, Estoque, Periodicidade, Edição.

- **Evento**:  
  - Atributos: ID (PK), Nome, Data, Tipo_Evento, Duração.

- **VendeProduto** (entidade associativa):  
  - Atributo: ID (PK).

- **Desconto** (entidade fraca):  
  - Atributos: Valor, Cupom.

- **Lote**:  
  - Atributos: ID (PK), Valor Unitário, Quantidade, Data de Entrega.

- **Fornecedor**:  
  - Atributos: CNPJ (PK), Nome, Telefone.

---

## 🔗 Relacionamentos

- **Inscreve (temporal)**: Cliente se inscreve em Evento.  
  - Atributo: Data_Inscrição.  
  - Cardinalidade: mínima 0, máxima N.

- **Organiza**: Funcionário organiza Evento.  
  - Cardinalidade: mínima 1, máxima N.

- **Tem**: VendeProduto pode ter um Desconto.  
  - Cardinalidade: mínima 0, máxima N.

- **Supervisiona (auto-relacionamento)**: Funcionário supervisiona outros.  
  - Cardinalidade: mínima 0, máxima N.

- **Vende (relacionamento triplo)**: Relaciona Funcionário, Cliente e Quadrinhos.  
  - Atributo: Data_Compra.  
  - Cardinalidade: mínima 1:1:1, máxima N:N:1.

- **Fornece (relacionamento triplo)**: Relaciona Fornecedor, Lote e Quadrinhos.  
  - Cardinalidade: mínima 1:1:1, máxima N:N:N.

---

## 📌 Observação

Este minimundo está atualizado para a **AV2** e foi revisado conforme feedbacks recebidos.

---
