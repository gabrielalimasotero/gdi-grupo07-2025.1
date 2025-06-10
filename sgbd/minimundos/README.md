Minimundo AV1 
Loja de Quadrinhos (tipo a de The Big Bang Theory).

1. Descrição do mundo real
A aplicação modela uma loja física de quadrinhos, semelhante à retratada em séries como The Big Bang Theory. A loja vende quadrinhos presencialmente, organiza eventos como campeonatos e lançamentos, e é operada por funcionários. O foco é no controle local de estoque, sem entregas ou encomendas.

2. Objetivos da Aplicação
Gerenciar vendas e controle de estoque;
Controlar cadastro de produtos e fornecedores;
Registrar a participação dos clientes em eventos;
Suportar análises sobre vendas, estoque e engajamento dos clientes.

3. Descrição das entidades
Pessoa (disjunto, obrigatório)
Descrição: Entidade que representa os indivíduos que estão envolvidos na aplicação. A entidade especializa-se em Funcionário e Cliente.
Atributos:
CPF (Chave primária)
Nome
Email
Telefone (atributo multivalorado)

Funcionário (especialização de Pessoa)
Descrição: Entidade especializada de Pessoa que herda seus atributos, representa os Funcionários da loja de quadrinhos.
Atributos:
Cargo
Salário
Ativo
Endereço (atributo composto: CEP, Rua, Número)
Data de Admissão

Cliente (especialização de Pessoa)
Descrição: Entidade especializada de Pessoa que herda seus atributos, representa os clientes da loja de quadrinhos. Clientes compram e participam de eventos.
Atributos:
Num_Eventos_Participados


Quadrinhos
Descrição: Entidade que representa os quadrinhos em estoque ou vendidos pela loja.
Atributos:
ID (Chave primária)
Nome
Gênero
Preço
Estoque
Periodicidade
Edição

Evento
Descrição: Representa eventos presenciais organizados pela loja.
Atributos:
ID (Chave primária)
Nome
Data
Tipo_Evento (lançamento, campeonato etc.);
Duração

VendeProduto (Entidade associativa)
Descrição: Entidade responsável por representar a venda de um produto que pode está ou não associado a um desconto.
Atributos:
ID (Chave primária)

Desconto (Entidade fraca)
Descrição: Representa o desconto de uma compra, podendo ser aplicado ou não​.  
Atributos:
Valor
Cupom (Chave discriminadora)

Lote
Descrição: Representa o lote de quadrinhos recebido pela loja.
Atributos:
ID (Chave primária)
Valor unitário
Quantidade
Data de entrega

Fornecedor
Descrição: Representa empresas fornecedoras de quadrinhos
Atributos:
CNPJ (Chave primária)
Nome
Telefone

4. Descrição dos relacionamentos
Inscreve
Descrição: É um relacionamento temporal por que depende da data de inscrição do cliente no evento, que, através da data de inscrição, inscreve um Cliente em um Evento.
Atributos: Data_Inscrição 
Cardinalidade:  
Minima: 0(Cliente):0(Evento)
Máxima: N:N

Organiza
Descrição:  Funcionário organiza eventos. A loja permite que apenas 1 funcionário seja responsável por cada evento.
Atributos: N/A
Cardinalidade:  
Mínima: 1(Funcionário):0(Evento)
Máxima: 1:N	 

Tem
Descrição: Responsável por identificar a entidade fraca “Desconto” associada à entidade associativa “VendeProduto”
Atributos: N/A
Cardinalidade:
Mínima: 0(VendeProduto):1(Desconto)
Máxima: 1:1
		 		
Supervisiona
Descrição: Auto-relacionamento de funcionários, indicando que um funcionário por ser supervisor de outros funcionários.
Atributos: N/A
Cardinalidade:
Mínima: 0:0
Máxima: 1(Supervisor):N(Supervisionado)
Vende (Relacionamento triplo)
Descrição: Relacionamento entre Funcionário, Quadrinhos e Cliente. Responsável pela compra (por parte do Cliente) e venda (por parte do Funcionário), dos quadrinhos. 
Atributos: 
Data_Compra
Cardinalidade: 
Mínima: 1:1:1
Máxima: N:N:N 

Fornece (Relacionamento triplo)
Descrição: Relaciona Fornecedor, Lote e Quadrinhos.
Atributos: N/A
Cardinalidade:​
Mínim​a: 1:1:1​
Máxima: N:N:N

5. Possíveis Perguntas
Quantos clientes distintos compraram um quadrinho específico?
Quantos eventos ocorreram em um determinado período de tempo?
Qual funcionário vendeu mais quadrinhos?
Qual funcionário organizou mais eventos em um determinado período de tempo?
O que acontece se um funcionário for removido mas estiver vinculado a uma venda?
Quantos quadrinhos foram vendidos em um mês específico?

6. Possíveis Relatórios
Quais os itens mais vendidos na loja?
Qual o histórico de compras de um cliente?
Quais clientes participaram de mais eventos?
Quais quadrinhos estão com estoque crítico?
Quais eventos ocorreram em determinado período?
