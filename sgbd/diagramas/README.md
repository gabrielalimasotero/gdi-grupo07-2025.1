
# 📈 Diagrama ER – AV2 (será atualizado a cada entrega)

Este documento apresenta o diagrama ER em **Mermaid** utilizado para a **Avaliação AV2** do projeto **Comic Center** na disciplina **Gerenciamento de Dados e Informação – UFPE**.

O diagrama foi revisado e modificado de acordo com o **feedback da AV1**, garantindo que todos os requisitos mínimos foram atendidos e que as correções foram aplicadas.

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
    PESSOA {
        string CPF
        string Nome
        string Email
    }
    TELEFONE_PESSOA {
        string CPF_Pessoa
        string Telefone
    }
    FUNCIONARIO {
        string CPF_Funcionario
        string Cargo
        float Salario
        boolean Ativo
        date Data_Admissao
        string CEP
    }
    ENDERECO {
        string CEP
        string Rua
        int Numero
    }
    CLIENTE {
        string CPF_Cliente
        int Num_eventos_participados
    }
    QUADRINHOS {
        int ID
        string Nome
        string Genero
        float Preco
        int Estoque
        string Periodicidade
        string Edicao
    }
    EVENTO {
        int ID
        string Nome
        date Data
        string Tipo_Evento
        string Duracao
        string Organizador
    }
    INSCRICAO {
        int ID_Evento
        string CPF_Cliente
        date Data_Inscricao
    }
    VENDEPRODUTO {
        int ID
        int ID_Quadrinho
        string CPF_Funcionario
        string CPF_Cliente
        date Data_Compra
    }
    DESCONTO {
        int ID_Venda
        float Valor
        string Cupom
    }
    FORNECEDOR {
        string CNPJ
        string Nome
        string Telefone
    }
    LOTE {
        int ID
        float Valor_Unitario
        int Quantidade
        date Data_Entrega
    }
    FORNECE {
        int ID_Lote
        int ID_Quadrinho
        string CNPJ_Fornecedor
    }
    SUPERVISIONA {
        string CPF_Supervisor
        string CPF_Supervisionado
    }

    %% Relacionamentos
    PESSOA ||--o| TELEFONE_PESSOA: "possui"
    PESSOA ||--|| FUNCIONARIO: "é"
    PESSOA ||--|| CLIENTE: "é"
    FUNCIONARIO ||--|| ENDERECO: "tem"
    FUNCIONARIO ||--o| SUPERVISIONA: "supervisiona"
    FUNCIONARIO ||--o| EVENTO: "organiza"
    FUNCIONARIO ||--o| VENDEPRODUTO: "vende"
    CLIENTE ||--o| INSCRICAO: "inscreve-se"
    CLIENTE ||--o| VENDEPRODUTO: "compra"
    EVENTO ||--o| INSCRICAO: "tem inscrição"
    QUADRINHOS ||--o| VENDEPRODUTO: "é vendido"
    VENDEPRODUTO ||--o| DESCONTO: "tem"
    FORNECEDOR ||--o| FORNECE: "fornece"
    LOTE ||--o| FORNECE: "faz parte"
    QUADRINHOS ||--o| FORNECE: "é entregue"

%% Legenda para chaves (PK / FK):
%% PK: CPF, ID, CNPJ, etc.
%% FK: CEP, CPF_Pessoa, Organizador, ID_Quadrinho, CPF_Funcionario, CPF_Cliente, ID_Evento, ID_Venda, ID_Lote, CNPJ_Fornecedor
```

---

## 🔗 Links para visualização

- 📄 **Visualizar no Draw.io (diagramas.net)**:  
👉 [Abrir Diagrama](https://app.diagrams.net/?splash=0#G1z9cHzAu5elWG1Sr_yfaFSnkrfjwySuP5#%7B%22pageId%22%3A%22MDzwoyZKB1G08Y7-jSuO%22%7D)

- 📝 **Editar no Mermaid Live Editor**:  
👉 [Abrir no Mermaid Live Editor](https://mermaid.live/edit#pako:eNqVVtFuozgU_RVkaaQdye122rSb8haBM8s2Cww0eVhVQh5wU2uDzRqodtv0a_ZhNd_RH1ubQGIDiWZ4SWyfe3197r3HfgUpzwiwAREuxWuB8wdmyS9EcRzMrNfdSH1lJShbW044H8z5PCeDSZRjutnNvu1-7tECzQMfJaecJyEpS44HS_dkQx45I4bH-dJ3vMCfRV5wxNu8ZinlDAvKh-tYrLXZxw3HlRXjjQn-yvmGYGbNKvqsTWe4IpaLK5zMspyWJR7xj0IjWuS7KELOaKgdVJuLao0FyirLr3MiuOHSWXjIv0dHDu9sKGEVGXhJyLOc52VSYFHRlBY446Xh98ty5kae_2sQ666Vued-X_o_E7YP9sBuKEjKTYeorPhf9dBBSGQaMhldhrOR6pIr2OQCrSQVwQ_Hu0_ksORowRPUUDVYc2uB05GcB2KNGX2RhAojOM-PnchzZiPxHdtiNIOHsvNYmYoBCStVZGEUuMvTVLRbf6lxJjd74j_ePKejc3heCGyE5qLYCUYzlKwIy3C_VlZ405Go71sXPDdFIIh85CA3iMbawA9_-76CHRWYRWA2V59GLdJkyWhlUqXQkmFW9Wr4QBNilSBrPHaeEZoWvN_Mp1Moz57MuWAkJf16jJchilZerNTziHrEdUHEMy3HkqAtqwLJDkW4-_PhgxWRDW6qJ2-0xrhWttuzM77tXwi29QAKXpY1fQAD-Harq72Cvn8bh7WaaEL0m6LFdXKsgBXJjyFlnDpZCl1qRz9hthMkZcBbVTgB1htXmUhNkCUDTJlvsXsxUUCqdEAK-ll5DN53ne56ExiyOeZasmI17un7f-__8s5CuxyO7PD-zVLx02xvY-hSa9UJQj8Bh35uge2Mwj3uyrnDNv05gsIvlrrbyPGQNbSMljR9WDf4Byard0HWSpOUF2ylT_iZlNZP4Z31szW_-2g3kPDOVo0AZRPCptegRar0vFmbqzUUQu1FA_W7ARqdC_tqC3V5hYc7Au7FEnZ6AIdtDiBYC5oBuxI1gUA-GuRTTA5B0-eS6yci9Q-oo2dY_KnO_CZtCsz-4DzvzASv10_doC6UZrUvxD1ClahweM0qYN82DoD9Cv4G9s30_OL6cnI1uZ1eTi5vbq4g-AfYV9fnt_KbfppcTyaTi9vp5A2Cl2bLi_PpL9cQkIxWXPy-e5E2D9O3_wEvtSfY)

---

## 📌 Observação

Este diagrama está pronto para visualização em plataformas que suportam Mermaid ou Draw.io.  
Fique à vontade para abrir uma issue ou sugestão de melhoria!

---
