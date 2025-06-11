
# 🗂️ Normalização – Comic Center

Este documento apresenta a **normalização do modelo relacional** do projeto **Comic Center**, desenvolvido para a disciplina **Gerenciamento de Dados e Informação – UFPE** (Grupo 07).

Foram aplicadas as três primeiras formas normais (1FN, 2FN e 3FN), com justificativas detalhadas para cada relação.

---
## Atualizar daqui pra baixo conforme as entregas
### copia o docs e pede pro chatgpt formatar pra readme

###AV2

# Normalização

## Histórico

Durante a modelagem, percebemos que a especialização de Pessoa (Cliente e Funcionário) poderia ser simplificada. Cliente não possui atributos próprios e suas informações podem ser obtidas por consultas na tabela Pessoa e relacionamentos. Assim, Cliente deixou de ser uma tabela separada e passou a ser identificado como um papel no atributo `tipo_pessoa` da tabela Pessoa.

Além disso, atributos como `num_eventos_participados` são derivados (calculados a partir da contagem de inscrições) e não precisam ser armazenados diretamente, seguindo o princípio de normalização que evita redundância de dados (Sommerville, 2011).

---

## Entidades

### Pessoa (CPF, nome, email, CEP*, telefone)
- **1FN**: Atributos atômicos (telefone tratado como multivalorado, em tabela separada).  
- **2FN**: Não existem dependências parciais (CPF é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
CPF é chave primária da tabela Pessoa.  
Telefone é armazenado em tabela separada `Telefone_Pessoa`.  
CEP é chave estrangeira para a tabela Endereço.

---

### Funcionário (CPF_Funcionário, cargo, salário, ativo, data_admissão)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (CPF_Funcionário é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
CPF_Funcionário é chave primária e estrangeira para Pessoa.  
Herdará o CEP da tabela Pessoa (não precisa atributo Endereço direto).

---

### Endereço (CEP, rua, número)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (CEP é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
CEP é chave primária da tabela Endereço.

---

### Quadrinhos (ID, nome, gênero, preço, estoque, periodicidade, edição)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID é chave primária.

---

### Evento (ID, nome, data, tipo_evento, duração)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID é chave primária.

---

### VendeProduto (ID, ID_Quadrinho*, CPF_Funcionário*, CPF_Cliente*, data_compra)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID é chave primária.  
ID_Quadrinho, CPF_Funcionário e CPF_Cliente são chaves estrangeiras.

---

### Desconto (ID_venda*, valor, cupom)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID_venda é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID_venda é chave primária e estrangeira para VendeProduto.

---

### Lote (ID, valor_unitário, quantidade, data_de_entrega)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (ID é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID é chave primária.

---

### Fornecedor (CNPJ, nome, telefone)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais (CNPJ é a única chave).  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
CNPJ é chave primária.

---

## Relacionamentos

### Inscreve (ID_evento*, CPF_Cliente*, data_inscrição)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID_evento referência Evento.  
CPF_Cliente referência Pessoa.

---

### Organiza
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
Faz parte da tabela Evento, pois a cardinalidade máxima está do lado do Evento.

---

### Tem
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
Faz parte da tabela Desconto, pois a cardinalidade máxima está do lado de Desconto.

---

### Supervisiona (CPF_Supervisor, CPF_Supervisionado)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
Faz parte da tabela Funcionário (auto-relacionamento).

---

### Fornece (ID_Lote*, ID_Quadrinho*, CNPJ_Fornecedor*)
- **1FN**: Atributos atômicos.  
- **2FN**: Não existem dependências parciais.  
- **3FN**: Não existem dependências transitivas.  

**Após a normalização:**  
ID_Lote referência Lote.  
ID_Quadrinho referência Quadrinhos.  
CNPJ_Fornecedor referência Fornecedor.

---

## Problemas Possíveis

**De remoção:**  
- O que acontece se um funcionário for removido mas estiver vinculado a uma venda?  
- O que acontece se um evento for removido mas clientes ainda estiverem inscritos?  
- O que acontece se o endereço for removido mas ainda estiver vinculado a pessoas?  
- O que acontece se um quadrinho for removido mas estiver associado a uma venda ou lote?  
- O que acontece se um fornecedor for removido mas ainda estiver vinculado a um lote de quadrinhos?

**De inserção:**  
- O que acontece se um cliente for inserido sem um endereço válido (CEP inexistente)?  
- O que acontece se tentar cadastrar uma venda sem existir um cliente ou funcionário correspondente?  
- O que acontece se alguém tentar inserir um evento com um organizador que não é funcionário?  
- O que acontece se tentar inserir um telefone para um CPF inexistente na tabela Pessoa?  
- O que acontece se tentar cadastrar um desconto sem existir a venda correspondente?

**De atualização:**  
- O que acontece se um funcionário for atualizado para “inativo” mas ainda estiver organizando eventos ou vendendo produtos?  
- O que acontece se atualizar o CPF de um cliente ou funcionário que está referenciado em outras tabelas?  
- O que acontece se atualizar o CEP de um endereço que já está referenciado em Pessoa?  
- O que acontece se atualizar o ID de um quadrinho que está em venda ou lote?  
- O que acontece se atualizar o ID de um evento que já está vinculado a inscrições de clientes?


												
