
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
👉 [Abrir Diagrama](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Diagrama%20ER&dark=auto#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1z9cHzAu5elWG1Sr_yfaFSnkrfjwySuP5%26export%3Ddownload)

- 📝 **Editar no Mermaid Live Editor**:  
👉 [Abrir no Mermaid Live Editor](https://mermaid.live/edit#pako:eNqdVs1ym0gQfpXOVKVKrsIuCSu2zE0FaJdNDARsH7Z0mRJjZWphhsyAK4ntY_IAOeeSU0573Cfwm-RJdgaQhARyVNFJNP11f9M_H3OPFjwhyEJEOBQvBc7mDNTv5UuIyPuSSlpwyJ7-ZTTjFrisoAlOiARBlmWKhfo3CN04DqYGzK592wv8aeQFBthvPNe_cg14ez11Is__M4gNcG-UTb18E-g3syDyXdt1guhonfPnt89wWWeDhMAYSE_GY7DLLBc04S9qYM0A7usn_ZOFoGwJdjiD8HXH7POMdIxuhmnasV6RlNxy1rg_zln9p3XWvrRYLPnGeptyXECMFXvKu85u2LFFJd7YKCvALzMiWtgEFwQcXOBpklEpMd_h15S_za0J496pknIZYlHQBc1xwuUOdtOxXbjnHFzNPwjbIlzXIBRkwbdjurLg78tugJCoYiWKou5-t1nqTefQ9Xj9Dul1Obv9pzmvS7Yd1SkF7jJoJni1JoCl5AuKC3qHYXBDWEKOutOrWDtbnVqzsblyxL_IcauJwMAhcsEVzZ4EjhvbwU5l6n7c4JSL7kSWOc92suqV_UVlWyGvGS22h137vy1xQ7rnrOo8asN3D7vRiL4188O_Dh7IPYvcVHNaFvxYkBQvKGc40_2GQVzmRNwpCVSmnrLG16Eb3XjxtE8CVlgutAbNXu910MET3nba5RZt0ypIlnOBUxh4TC4EueubKc-P7cizt6mta10B6f7xlTlRU5vST_jpx9N_lcYTNckYfn75CrOSaTZP31V_lc6nVLHqo9CI8sPD8fHDQ1swLZgjskkBg5E1OpqjPlQjY3sRrW9Vu0YSFBGm1Y3Krl7r2Py-UQsdOhBLzJq4_prJSkIb93VFNWJVeRgMW4hGfw4HPNtmQfOU71eNnhNVQqKzVZhnT_Oca0v_D_Bua1jTtZXeaMQVyfSZR4Chi2ptd5NJy4yGzbhgZLGTqtKgxnFDcq97N_oBoL3F3Wy7xsrW9m73tKUK_aPfD0UGWqruIqsQJTGQ-tqr64h6RNX-zlHxjihRQzpAgsU_GvKoMDlmf3OerWCCl8t3q4cy1wvf3OqQdYtTqV10C4XNS1YgazwyqxjIukcfkGWaFyfDM3Nkno6Hw4k5uRgb6COyRkPz5NXZ2XhimsPJ8OLi_OzRQJ-qtMOTV6PJ6dg8H5-ejybK4dRAJFF3RnFZXyur2-Xj_zZRHEI)

---

## 📌 Observação

Este diagrama está pronto para visualização em plataformas que suportam Mermaid ou Draw.io.  
Fique à vontade para abrir uma issue ou sugestão de melhoria!

---
