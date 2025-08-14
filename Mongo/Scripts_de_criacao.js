use Info_farmacia;


print("--- Criando e populando a coleção: fornecedores ---");
db.createCollection("fornecedores");
db.fornecedores.insertMany([
  {
    razao_social: "Distribuidora de Medicamentos Saúde Plena Ltda.",
    cnpj: "11.222.333/0001-44",
    nome_fantasia: "MedSaúde Distribuidora",
    contato: {
        telefone: "11-3030-4040",
        email: "comercial@medsaude.com"
    },
    categorias_fornecidas: ["Medicamento", "Medicamento Controlado"]
  },
  {
    razao_social: "Beleza & Cia Cosméticos S.A.",
    cnpj: "55.666.777/0001-88",
    nome_fantasia: "Beleza & Cia",
    contato: {
        telefone: "21-2020-5050",
        email: "pedidos@belezaecia.com"
    },
    categorias_fornecidas: ["Perfumaria", "Higiene", "Infantil"]
  }
]);

print("--- Criando e populando a coleção: produtos ---");
db.createCollection("produtos");
db.produtos.insertMany([
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a1"), nome_comercial: "Dipirona Monoidratada 500mg", principio_ativo: "Dipirona Monoidratada", fabricante: "Medley Genéricos", categoria: "Medicamento", preco: 7.50, quantidade_estoque: 150, necessita_receita: false },
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a2"), nome_comercial: "Amoxicilina 500mg - 21 Cápsulas", principio_ativo: "Amoxicilina", fabricante: "EMS", categoria: "Medicamento", preco: 25.80, quantidade_estoque: 45, necessita_receita: true },
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a3"), nome_comercial: "Protetor Solar FPS 50", principio_ativo: "Dióxido de Titânio, Avobenzona", fabricante: "Nivea", categoria: "Perfumaria", preco: 55.90, quantidade_estoque: 80, necessita_receita: false },
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a4"), nome_comercial: "Shampoo Anticaspa", principio_ativo: "Cetoconazol", fabricante: "Medicasp", categoria: "Higiene", preco: 35.00, quantidade_estoque: 60, necessita_receita: false },
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a5"), nome_comercial: "Rivotril 2mg - 30 Comprimidos", principio_ativo: "Clonazepam", fabricante: "Roche", categoria: "Medicamento Controlado", preco: 29.99, quantidade_estoque: 25, necessita_receita: true },
  { _id: ObjectId("665e3a34a1a7b8e0b6b2b1a6"), nome_comercial: "Fralda Descartável Pampers G - 40 Unidades", principio_ativo: "N/A", fabricante: "P&G", categoria: "Infantil", preco: 65.70, quantidade_estoque: 120, necessita_receita: false }
]);


print("--- Criando e populando a coleção: profissionais ---");
db.createCollection("profissionais");
db.profissionais.insertMany([
  { _id: ObjectId("665e3a5da1a7b8e0b6b2b1b1"), nome_completo: "Carlos Andrade", cargo: "Farmacêutico", registro_profissional: "CRF-PE 12345", data_admissao: new Date("2022-05-20") },
  { _id: ObjectId("665e3a5da1a7b8e0b6b2b1b2"), nome_completo: "Ana Costa", cargo: "Atendente de Farmácia", registro_profissional: null, data_admissao: new Date("2023-11-10") }
]);


print("--- Criando e populando a coleção: clientes ---");
db.createCollection("clientes");
db.clientes.insertMany([
  { _id: ObjectId("665e3a75a1a7b8e0b6b2b1c1"), nome_completo: "Fernanda Lima", cpf: "111.222.333-44", data_nascimento: new Date("1985-10-23"), contato: { email: "fernanda.lima@email.com", telefone: "81987654321" } },
  { _id: ObjectId("665e3a75a1a7b8e0b6b2b1c2"), nome_completo: "Ricardo Souza", cpf: "555.666.777-88", data_nascimento: new Date("1992-03-12"), contato: { email: "ricardo.souza@email.com", telefone: "81912345678" } }
]);


print("--- Criando e populando a coleção: prescricoes ---");
db.createCollection("prescricoes");
db.prescricoes.insertMany([
  {
    cliente_id: ObjectId("665e3a75a1a7b8e0b6b2b1c1"), // Fernanda Lima
    medico: {
        nome: "Dr. Roberto Medeiros",
        crm: "CRM/PE 9876"
    },
    data_emissao: new Date("2025-08-10"),
    medicamentos_prescritos: [
      {
        produto_id: ObjectId("665e3a34a1a7b8e0b6b2b1a2"), // Amoxicilina 500mg
        posologia: "Tomar 1 cápsula de 8 em 8 horas por 7 dias."
      }
    ],
    status: "Ativa"
  }
]);


print("--- Criando e populando a coleção: vendas ---");
db.createCollection("vendas");
db.vendas.insertMany([
  {
    data_venda: new Date(),
    profissional_id: ObjectId("665e3a5da1a7b8e0b6b2b1b1"), // Carlos Andrade (Farmacêutico)
    cliente_id: ObjectId("665e3a75a1a7b8e0b6b2b1c1"),     // Fernanda Lima
    itens_vendidos: [
      {
        produto_id: ObjectId("665e3a34a1a7b8e0b6b2b1a2"), // Amoxicilina 500mg
        nome_produto: "Amoxicilina 500mg - 21 Cápsulas",
        quantidade: 1,
        preco_unitario: 25.80
      }
    ],
    valor_total: 25.80,
    status: "Concluída",
    prescricao_associada: true
  },
  {
    data_venda: new Date(),
    profissional_id: ObjectId("665e3a5da1a7b8e0b6b2b1b2"), // Ana Costa (Atendente)
    cliente_id: ObjectId("665e3a75a1a7b8e0b6b2b1c2"),     // Ricardo Souza
    itens_vendidos: [
      {
        produto_id: ObjectId("665e3a34a1a7b8e0b6b2b1a4"), // Shampoo Anticaspa
        nome_produto: "Shampoo Anticaspa",
        quantidade: 2,
        preco_unitario: 35.00
      },
      {
        produto_id: ObjectId("665e3a34a1a7b8e0b6b2b1a1"), // Dipirona Monoidratada 500mg
        nome_produto: "Dipirona Monoidratada 500mg",
        quantidade: 1,
        preco_unitario: 7.50
      }
    ],
    valor_total: 77.50,
    status: "Concluída",
    prescricao_associada: false
  }
]);
