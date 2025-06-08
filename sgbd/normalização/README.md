
# 🗂️ Normalização – Comic Center (AV2)

Este documento apresenta a **normalização do modelo relacional** do projeto **Comic Center**, desenvolvido para a disciplina **Gerenciamento de Dados e Informação – UFPE** (Grupo 07).

Foram aplicadas as três primeiras formas normais (1FN, 2FN e 3FN), com justificativas detalhadas para cada relação.

---

## 📄 Relações e justificativas

### 1️⃣ Pessoa(CPF, Nome, Email, Telefone)  
✅ **1FN:** Atributos atômicos (Telefone tratado como múltiplos registros, não em lista).  
✅ **2FN:** Não há dependências parciais (CPF é a chave primária).  
✅ **3FN:** Não há dependências transitivas.

### 2️⃣ Funcionário(CPF, Cargo, Salario, CEP, Rua, Numero, Data_Admissao)  
✅ Especialização de Pessoa.  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 3️⃣ Cliente(CPF, Num_Eventos_Participados)  
✅ Especialização de Pessoa.  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 4️⃣ Quadrinhos(ID, Nome, Genero, Preco, Estoque, Periodicidade, Edicao)  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 5️⃣ Evento(ID, Nome, Data, Tipo_Evento, Duracao)  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 6️⃣ Vende(ClienteCPF, FuncionárioCPF, QuadrinhoID, Data_Compra)  
✅ PK composta: (ClienteCPF, FuncionárioCPF, QuadrinhoID).  
✅ **1FN:** Atributos atômicos.  
✅ **2FN:** Todos dependem da PK completa.  
✅ **3FN:** Sem dependências transitivas.

### 7️⃣ Desconto(VendaID, Valor, Cupom)  
✅ Entidade fraca associada a Vende.  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 8️⃣ Fornecedor(CNPJ, Nome, Telefone)  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 9️⃣ Lote(ID, Valor_Unitario, Quantidade, Data_Entrega)  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 🔟 Fornece(FornecedorCNPJ, LoteID, QuadrinhoID)  
✅ PK composta: (FornecedorCNPJ, LoteID, QuadrinhoID).  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 1️⃣1️⃣ Inscreve(ClienteCPF, EventoID, Data_Inscrição)  
✅ **1FN, 2FN, 3FN:** Cumpridas.

### 1️⃣2️⃣ Supervisiona(SupervisorCPF, SupervisionadoCPF)  
✅ Auto-relacionamento.  
✅ **1FN, 2FN, 3FN:** Cumpridas.

---

## 📌 Observação Final

Todos os esquemas foram normalizados até a **Terceira Forma Normal (3FN)**, garantindo integridade e minimização de redundâncias.  
Caso haja dúvidas ou sugestões, fique à vontade para abrir uma issue!

---
