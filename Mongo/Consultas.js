
use Info_farmacia;

// 2. [FIND, PRETTY] - Listar todos os produtos com formatação legível.
print("\n[2] Listando todos os produtos:");
db.produtos.find().pretty();

// 3. [FINDONE] - Encontrar um único profissional pelo nome.
print("\n[3] Encontrando um profissional específico:");
db.profissionais.findOne({ nome_completo: "Carlos Andrade" });

// 4. [FIND, GTE] - Listar produtos com estoque maior ou igual a 100 unidades.
print("\n[4] Produtos com estoque >= 100:");
db.produtos.find({ quantidade_estoque: { $gte: 100 } }).pretty();

// 5. [COUNT / COUNTDOCUMENTS] - Contar quantos clientes estão cadastrados.
print("\n[5] Número total de clientes:");
db.clientes.countDocuments();

// 6. [EXISTS] - Listar profissionais que possuem um registro profissional (CRF).
print("\n[6] Profissionais com registro profissional:");
db.profissionais.find({ registro_profissional: { $exists: true, $ne: null } }).pretty();


// 7. [AGGREGATE, MATCH, GROUP, SUM] - Calcular o valor total em estoque por categoria de produto.
print("\n[7] Valor total do estoque por categoria:");
db.produtos.aggregate([
  { $match: { quantidade_estoque: { $gt: 0 } } }, // Filtra apenas produtos em estoque
  {
    $group: {
      _id: "$categoria",
      valor_total_estoque: { $sum: { $multiply: ["$preco", "$quantidade_estoque"] } }
    }
  }
]).pretty();

// 8. [AGGREGATE, GROUP, AVG, MAX] - Calcular o preço médio e o preço máximo dos produtos por fabricante.
print("\n[8] Preço médio e máximo por fabricante:");
db.produtos.aggregate([
  {
    $group: {
      _id: "$fabricante",
      preco_medio: { $avg: "$preco" },
      preco_maximo: { $max: "$preco" }
    }
  }
]).pretty();

// 9. [AGGREGATE, SORT, LIMIT, PROJECT] - Listar os 3 produtos mais caros, mostrando apenas nome e preço.
print("\n[9] Top 3 produtos mais caros:");
db.produtos.aggregate([
  { $sort: { preco: -1 } }, // Ordena do maior para o menor
  { $limit: 3 },
  {
    $project: {
      _id: 0,
      nome: "$nome_comercial",
      valor: "$preco"
    }
  }
]).pretty();

// 10. [AGGREGATE, LOOKUP] - Listar todas as vendas e juntar os dados do profissional que realizou a venda.
print("\n[10] Vendas com informações do profissional (usando LOOKUP):");
db.vendas.aggregate([
  {
    $lookup: {
      from: "profissionais",
      localField: "profissional_id",
      foreignField: "_id",
      as: "dados_profissional"
    }
  }
]).pretty();



// 11. [SIZE] - Encontrar vendas que contenham exatamente 2 itens.
print("\n[11] Vendas com exatamente 2 itens:");
db.vendas.find({ itens_vendidos: { $size: 2 } }).pretty();

// 12. [AGGREGATE, FILTER] - Em uma venda, mostrar apenas os itens com valor acima de R$ 50.
print("\n[12] Itens de uma venda com valor > R$50 (versão corrigida):");

db.vendas.aggregate([
  { $match: { "itens_vendidos.nome_produto": "Shampoo Anticaspa" } },
  {
    $project: {
      _id: 0,
      itens_vendidos_original: "$itens_vendidos.nome_produto", 
      itens_caros_filtrados: { 
        $filter: {
          input: "$itens_vendidos",
          as: "item",
          cond: { $gte: ["$$item.preco_unitario", 50] }
        }
      }
    }
  }
]).pretty();

// 13. [ALL] - Encontrar fornecedores que trabalham com as categorias "Medicamento" E "Medicamento Controlado".
print("\n[13] Fornecedores que trabalham com 'Medicamento' e 'Medicamento Controlado':");
db.fornecedores.find({
  categorias_fornecidas: { $all: ["Medicamento", "Medicamento Controlado"] }
});

// 14. [UPDATEONE, SET] - Atualizar a quantidade em estoque de um produto específico.
print("\n[14] Atualizando o estoque de um produto:");
db.produtos.updateOne(
  { nome_comercial: "Dipirona Monoidratada 500mg" },
  { $set: { quantidade_estoque: 125 } }
);
db.produtos.findOne({ nome_comercial: "Dipirona Monoidratada 500mg" });


// 15. [UPDATEMANY] - Aumentar o preço de todos os produtos da categoria "Higiene" em 10%.
print("\n[15] Aumentando o preço de produtos de 'Higiene' em 10%:");
db.produtos.updateMany(
  { categoria: "Higiene" },
  { $mul: { preco: 1.10 } }
);

// 16. [ADDTOSET] - Adicionar uma nova categoria a um fornecedor, sem duplicar.
print("\n[16] Adicionando categoria a um fornecedor:");
db.fornecedores.updateOne(
  { nome_fantasia: "Beleza & Cia" },
  { $addToSet: { categorias_fornecidas: "Dermocosméticos" } }
);

// 17. [RENAMECOLLECTION] - Renomear a coleção 'prescricoes' para 'receitas_medicas'.
print("\n[17] Renomeando coleção 'prescricoes' para 'receitas_medicas':");
db.prescricoes.renameCollection("receitas_medicas");

// 18. [SAVE - Equivalente Moderno] - Inserir um novo fornecedor ou atualizar se já existir.
print("\n[18] Usando updateOne com upsert (equivalente a SAVE):");
db.fornecedores.updateOne(
  { cnpj: "99.888.777/0001-66" },
  { $set: { razao_social: "Nova Farma Distribuidora", nome_fantasia: "Nova Farma" } },
  { upsert: true }
);


// 19. [TEXT, SEARCH] - Criar um índice de texto e buscar por produtos.
print("\n[19] Criando índice de texto e buscando por 'cápsulas':");
db.produtos.createIndex({ nome_comercial: "text", principio_ativo: "text" });
db.produtos.find({ $text: { $search: "cápsulas" } }).pretty();

// 20. [FUNCTION, $WHERE] - Encontrar produtos usando uma função JavaScript.
print("\n[20] Produtos com estoque < 30 usando função com $WHERE:");
db.produtos.find({
  $where: function() {
    return this.quantidade_estoque < 30;
  }
}).pretty();

// 21. [AGGREGATE, COND] - Adicionar um campo condicional para classificar o estoque.
print("\n[21] Classificando o status do estoque com COND:");
db.produtos.aggregate([
  {
    $project: {
      _id: 0,
      nome: "$nome_comercial",
      estoque: "$quantidade_estoque",
      status_estoque: {
        $cond: { if: { $lte: ["$quantidade_estoque", 50] }, then: "Baixo", else: "Normal" }
      }
    }
  }
]).pretty();

// 22. [MAPREDUCE] - Contar a quantidade de produtos por categoria usando MapReduce.
print("\n[22] Contando produtos por categoria com MapReduce:");
var mapFunction = function() {
  emit(this.categoria, 1);
};
var reduceFunction = function(key, values) {
  return Array.sum(values);
};
db.produtos.mapReduce(
  mapFunction,
  reduceFunction,
  { out: "produtos_por_categoria_mr" }
);
db.produtos_por_categoria_mr.find().pretty();
