# Minimundo – Loja de Quadrinhos (AV2)
[Current](https://docs.google.com/document/d/1LDpUb9rJD1lzPibhyFf6ewZ_M4Bt-b8FCiRk1mNGRXs/edit?usp=sharing)
Mudanças de acordo com o Feedback da AV2.

# 📚 Minimundo – Loja de Quadrinhos

Projeto de Banco de Dados para modelagem de uma loja de quadrinhos, inspirado na loja retratada em *The Big Bang Theory*.

---

## 🧾 Descrição do Mundo Real

A aplicação modela uma loja física de quadrinhos que:
- Vende quadrinhos presencialmente;
- Organiza eventos (campeonatos, lançamentos);
- É operada por funcionários;
- Não realiza entregas ou encomendas (controle local de estoque).

---

## 🎯 Objetivos da Aplicação

- Gerenciar vendas e controle de estoque;
- Controlar cadastro de produtos e fornecedores;
- Registrar participação dos clientes em eventos;
- Suportar análises de vendas, estoque e engajamento.

---

## 📦 Descrição das Entidades e Normalização

Todas as entidades e relacionamentos foram normalizados até a **3ª Forma Normal (3FN)**. Abaixo, apresentamos a estrutura de cada entidade com as devidas referências e observações:

### Pessoa

```plaintext
Pessoa(cpf, nome, email, id_endereço*)
Endereço(id, cep, rua, número)
Telefone_Pessoa(telefone, cpf*)
```

### Funcionário

```plaintext
Funcionário(cpf_func, ativo, data_admissão, cpf_supervisor*)
Cargo_Funcionário(id, cargo, salário, cpf_func*)
```

### Cliente

```plaintext
Cliente(cpf_cliente)
```

### Quadrinho

```plaintext
Quadrinho(id, nome, gênero, preço, estoque, periodicidade, edição)
```

### Evento

```plaintext
Evento(id, nome, data, tipo_evento, duração, cpf_func*)
```

### Vendas e Descontos

```plaintext
VendeProduto(id, id_quadrinho*, cpf_func*, cpf_cliente*)
Desconto(id_venda*, valor, cupom)
```

### Lote e Fornecimento

```plaintext
Lote(id, valor_unitário, quantidade, data_de_entrega)
Fornecedor(cnpj, nome, telefone)
Fornece(id_lote*, id_quadrinho*, cnpj*)
```

### Relacionamentos

```plaintext
Inscreve(id_evento*, cpf_cliente*)
Supervisiona(cpf_supervisor, cpf_supervisionado) → incorporado em Funcionário
```

---

## ❓ Possíveis Perguntas de Integridade

### 🔴 Remoção
- O que acontece se um funcionário for removido mas estiver vinculado a uma venda?
- E se um evento for removido com clientes ainda inscritos?
- E se um quadrinho ou fornecedor for excluído, mas ainda estiver em uso?

### 🟡 Inserção
- Inserir cliente com endereço inexistente?
- Vender sem cliente/funcionário válido?
- Evento com organizador que não é funcionário?
- Telefone com CPF inexistente?

### 🟢 Atualização
- Tornar funcionário inativo enquanto organiza eventos?
- Atualizar CPF de pessoa referenciada?
- Atualizar ID de quadrinho, evento ou CEP?

---

## 📊 Relatórios Possíveis

- Itens mais vendidos;
- Histórico de compras por cliente;
- Clientes mais engajados em eventos;
- Estoque crítico;
- Eventos por período;
- Quantidade de clientes por produto;
- Funcionário com mais vendas;
- Funcionário que mais organizou eventos.

---

## 🗂️ Esquema Lógico Final

```plaintext
Pessoa (cpf, nome, email)
Telefone_Pessoa(cpf_pessoa*, telefone)
Endereco(cep, rua, número)
Funcionário (cpf_func, ativo, data_admissão, cpf_supervisor*)
Cargo_Funcionário(id, cargo, salário, cpf_func*)
Cliente (cpf_cliente)
Quadrinhos(id, nome, gênero, preço, estoque, periodicidade, edição)
Evento(id, nome, data, tipo_evento, duração, cpf_func*)
VendeProduto (id, id_quadrinho*, cpf_func*, cpf_cliente*)
Desconto (id_venda*, valor, cupom)
Lote(id, valor_unitário, quantidade, data_de_entrega)
Fornecedor(cnpj, nome, telefone)
Inscreve(id_evento*, cpf_cliente*)
Fornece (id_lote*, id_quadrinho*, cnpj*)
```

---

## 🧠 Observações de Normalização

Cada entidade foi analisada quanto à:
- **1FN**: Atributos atômicos e não multivalorados;
- **2FN**: Ausência de dependências parciais;
- **3FN**: Ausência de dependências transitivas.

As entidades foram desmembradas em tabelas auxiliares quando necessário, como `Telefone_Pessoa` e `Cargo_Funcionário`.

---

## 📌 Licença

Projeto acadêmico desenvolvido para a disciplina de **Gerenciamento de Dados e Informação – 2025.1** – UFPE.

Grupo: Douglas Ventura, Gabriela Lima, Ithalo Rannieri, João Antônio, Lucas de Melo.
