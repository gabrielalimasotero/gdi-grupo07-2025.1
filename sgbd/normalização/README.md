
# 🗂️ Normalização – Comic Center (AV2)

Este documento apresenta a **normalização do modelo relacional** do projeto **Comic Center**, desenvolvido para a disciplina **Gerenciamento de Dados e Informação – UFPE** (Grupo 07).

Foram aplicadas as três primeiras formas normais (1FN, 2FN e 3FN), com justificativas detalhadas para cada relação.

---
## Atualizar daqui pra baixo conforme as entregas

Normalização
Histórico

Entidades	

Pessoa (CPF, nome, email, telefone)
1FN - Atributos atômicos (Telefone tratado como multivalorado, não em lista).
2FN - Não existem dependências parcias(CPF é a única chave)
3FN - Não existem dependências transitivas

Após a normalização:
 O CPF será a chave primária da tabela Pessoa e será criada uma nova tabela (Telefone_Pessoa) para armazenar o atributo telefone, relacionando o CPF com um ou mais telefone.

Funcionário (CPF_Funcionário,Cargo, salário, ativo, endereço(CEP, rua, número ), data admissão)
1FN - Atributos atômicos (Endereço deixará de existir enquanto atributo, somente restante CEP, rua, número).
2FN - Não existem dependências parciais(CPF_Funcionário é a única chave)
3FN - Necessária criação de uma nova tabela para o Endereço, com o CEP como chave primária. Na tabela Funcionario CEP será uma chave estrangeira

Após a normalização: 
O CPF_Funcionario será a chave primária da tabela Funcionario e possuirá 
CEP como chave estrangeira. Será necessária a criação de uma nova tabela Endereço(CEP, rua, numero).

Cliente (CPF_Cliente, Num_eventos_participados)
1FN - Atributos atômicos (todos atributos atômicos).
2FN - Não existem dependências parciais(CPF_cliente é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O CPF_Cliente será a chave primária da tabela Cliente.


Quadrinhos(ID, nome, Gênero, preço, estoque, periodicidade, edição)
1FN - Atributos atômicos (todos atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID será a chave primária da tabela Quadrinhos.


Evento(ID, nome, data, tipo_evento, duração)
1FN - Atributos atômicos (todos atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID será a chave primária da tabela Evento

VendeProduto (ID, ID_Quadrinhos*, CPF_Funcionario*, CPF_Clientes*)
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID será a chave primária da tabela VendeProduto. ID_Quadrinhos, CPF_Funcionario, CPF_Clientes são chaves estrangeiras.

Desconto (ID_venda* ,valor, cupom)
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais(ID_venda é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID_venda será a chave primária da tabela Desconto.


Lote(ID, valor_unitário, quantidade, data_de_entrega)
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID será a chave primária da tabela Lote.


Fornecedor(CNPJ, nome, telefone)
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
O ID será a chave primária da tabela Fornecedor.

Relacionamentos


Inscreve(ID_evento*, cpf_cliente*)
	1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais(ID é a única chave)
3FN - Não existem dependências transitivas

Após a normalização: 
A Tabela Inscreve, conterá ID_evento referência(ID_evento Evento)
CPF_cliente referência(CPF_cliente Cliente)



Organiza

1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais
3FN - Não existem dependências transitivas

Após a normalização: 
Fará parte da tabela de evento visto que a cardinalidade máxima está com evento.

Tem
Descrição: Como a máxima está para desconto, desconto terá como atributos, também, o ID_Venda como chave estrangeira
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais
3FN - Não existem dependências transitivas
		
		Após a normalização: 
Fará parte da tabela Desconto visto que a cardinalidade máxima é igual, então optamos por colocalá em desconto.


 Supervisiona(CPF_Surpevisor, CPF_Surpevisionado)

		1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais
3FN - Não existem dependências transitivas

		Após a normalização: 
Fará parte da tabela Funcionário visto que a cardinalidade máxima é 1:N.

Vende (CPF_func*, ID_quadrinho*, CPF_cliente*, data_compra)
	
	
1FN - Atributos atômicos (Composto de atributos atômicos).
2FN - Não existem dependências parciais
3FN - Não existem dependências transitivas

		Após a normalização: 
		A Tabela Vende/ProdutoVende(apenas uma tabela para a entidade associativa)
		possui as seguintes referências:
		CPF_func referência(CPF_funcionário Funcionário)
	CPF cliente referência(CPF cliente Cliente)
	ID_quadrinho referência(ID_quadrinho Quadrinho)
													
Fornece (ID_lote*, ID_quadrinho*, CNPJ*)	

