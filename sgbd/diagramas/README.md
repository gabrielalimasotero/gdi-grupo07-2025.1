
# 📈 Diagrama ER – AV2

Este documento apresenta o diagrama ER em **Mermaid** utilizado para a **Avaliação AV2** do projeto **Comic Center** na disciplina **Gerenciamento de Dados e Informação – UFPE**.

O diagrama foi revisado e modificado de acordo com o **feedback da AV1**, garantindo que todos os requisitos mínimos foram atendidos e que as correções foram aplicadas.

O minimundo pode ser encontrado [aqui](https://github.com/gabrielalimasotero/gdi-grupo07-2025.1/tree/main/sgbd/minimundos)

---

## ✅ Requisitos mínimos atendidos e explicações

- **Mínimo de 4 entidades regulares:** Cumprido com as entidades **PESSOA, FUNCIONARIO, CLIENTE, QUADRINHOS, EVENTO, LOTE, FORNECEDOR**.
- **Entidade fraca:** Cumprida com a entidade **DESCONTO**, que depende da entidade associativa **VENDE**.
- **Entidade associativa:** Cumprida com **VENDE** representando o relacionamento triplo entre Funcionário, Cliente e Quadrinhos.
- **Auto-relacionamento:** Cumprido com **SUPERVISAO**, indicando a relação de supervisão entre funcionários.
- **Relacionamento temporal:** Cumprido com **INSCRICAO**, onde a data de inscrição é registrada.
- **Especializações:** Cumpridas com a relação de especialização de **PESSOA** para **FUNCIONARIO** e **CLIENTE**.
- **Relacionamento triplo:** Cumprido explicitamente com a entidade associativa **VENDE** conectando **FUNCIONARIO, CLIENTE e QUADRINHOS**.

---

## 🔧 Modificações feitas de acordo com o feedback da AV1

- Corrigida a **cardinalidade mínima de ORGANIZA** (mínima = 1 funcionário).
- Corrigida a **cardinalidade mínima do relacionamento triplo FORNECE** (mínima = 1:1:1).
- Corrigida a **descrição de DESCONTO** e sua vinculação à entidade associativa **VENDE**.
- Ajustada a **máxima do relacionamento triplo VENDE** para apenas 1 funcionário por venda.
- Garantida a **consistência entre minimundo e diagrama**.

---

## 📋 Diagrama ER em Mermaid

```mermaid
erDiagram

  Pessoa {
    string CPF PK
    string Nome
    string Email
  }
  Cliente {
    string CPF PK
  }
  Funcionario {
    string CPF PK
    string Cargo
    float Salario
    boolean Ativo
    date Data_Admissao
  }
  Pessoa ||--|| Cliente : especializa
  Pessoa ||--|| Funcionario : especializa

  Telefone_Pessoa {
    string CPF_Pessoa FK
    string Telefone
  }
  Pessoa ||--o{ Telefone_Pessoa : possui

  Endereco {
    string CEP PK
    string Rua
    string Numero
  }
  Pessoa ||--|| Endereco : reside_em
  Funcionario ||--|| Endereco : alocado_em

  Supervisiona {
    string Supervisor FK
    string Supervisionado FK
  }
  Funcionario ||--o{ Supervisiona : supervisiona

  Evento {
    int ID PK
    string Nome
    date Data
    string Tipo_Evento
    int Duracao
  }
  Funcionario ||--o{ Evento : organiza

  Inscreve {
    int ID_Evento FK
    string CPF_Cliente FK
    date Data_Inscricao
  }
  Cliente ||--o{ Inscreve : participa
  Evento ||--o{ Inscreve : possui

  Quadrinhos {
    int ID PK
    string Nome
    string Genero
    float Preco
    int Estoque
    string Periodicidade
    string Edicao
  }

  VendeProduto {
    int ID PK
    int ID_Quadrinho FK
    string CPF_Cliente FK
    string CPF_Funcionario FK
    date Data_Compra
  }
  Cliente ||--o{ VendeProduto : compra
  Funcionario ||--o{ VendeProduto : vende
  Quadrinhos ||--o{ VendeProduto : pertence

  Desconto {
    int ID_Venda FK
    float Valor
    string Cupom
  }
  VendeProduto ||--|| Desconto : tem

  Lote {
    int ID PK
    float Preco_Unitario
    int Quantidade
    date Data_Entrega
  }

  Fornecedor {
    string CNPJ PK
    string Nome
    string Telefone
  }

  Fornece {
    int ID_Lote FK
    int ID_Quadrinho FK
    string CNPJ_Fornecedor FK
  }
  Lote ||--o{ Fornece : envia
  Quadrinhos ||--o{ Fornece : recebe
  Fornecedor ||--o{ Fornece : fornece
```

---

## 🔗 Links para visualização

- 📄 **Visualizar no Draw.io (diagramas.net)**:  
👉 [Abrir Diagrama](https://app.diagrams.net/?splash=0#G1z9cHzAu5elWG1Sr_yfaFSnkrfjwySuP5#%7B%22pageId%22%3A%22MDzwoyZKB1G08Y7-jSuO%22%7D)

- 📝 **Editar no Mermaid Live Editor**:  
👉 [Abrir no Mermaid Live Editor](https://mermaid.live/edit#pako:eNqNVltv2jAU_iuWn2lVCoGSt4rL1F2qbN36MCEhNz6l1hKfzHbQVuC_184NJ4DaF4jt79y-8_kkWxojBxpSUDPB1oqlS7mUhESgNTKydc-EaKOEXJNptCDRl9bWPabQ2pinTCRuZ-9-pokAaeCsnwK0yGUsUDIl8P2AU6bWWO48J8gMeWCJsyy3nhATYJLcGrGptjiz8WfMsNUtT4XWDJvAVZG73cXFbtfkGhLQGcSCJeKVHcP8bDtQB_4JCTyjhNU5BuuDRbuu2u5Ucrg9chuSDLXORRl0LjkoiI_om0dd-n7krN2_PAV1jpHGbUgUaMFhBWm3YcdQlmDMOBZYh37IM1AboZ1FJ8H6CFWXDt-IY3W6PxXcktOKEBLtLSt-NrazDTtCGnI3O6_kRjHtBokMV6Wjg5tZrljsKepEclXskKBaM9no5E7qWMEG2klVAbpsONnU8qyPDrouXAk_jRpbpdDEsqphyohYZMyj5QTK09b3nHGbxAvqj_JXbXwCWUmrvqqRU8jBx1wb_Ju3jSKw1HGbIWe8M1i4V6L7ewSruUghz8-2tiK1KeEjvHpHfjePaZ9imil2jvNWdiGJG_AJiXSwG7fsUH8aaXVuQMZQEjIDHeORzlfO5jBuyk482kuq2vXmGaZNMa041RVv3IfE1Hf7Kxo4w73X8tUvKcxhSDugLU0ar8kHWufSKFgzr9ELVBJi4HZKdObbffT5XRl2BqvnsMNTUcvio8qxoVdeYt6AKvxU_aoj2ReF3Ah2uqkHkCULnqBT8xHquXyiPbpWgtPQqBx61M5x--q1S1qUtaTmBSwVNLSPnKk_S7qUe2uTMfkbMa3NFObrl3qRZ64P1YdAg3BaUFPMpaHhsD8OCh803NJ_NLwIroaXo5ub4WQyCUb252rco_9pOAguR5NRMBwNBuPBIAjG-x59LcJeXwbD8aTfH_YHo5vr4MoZABcG1bfyS6T4INm_AYPK3Qw)
