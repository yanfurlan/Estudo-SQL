
# Projeto de Otimização de Queries em SQLite

Este projeto demonstra como otimizar consultas SQL em um banco de dados SQLite. A otimização é feita através da criação de índices e análise dos planos de execução das queries. O objetivo é mostrar como melhorar a performance das consultas em um banco de dados simples de vendas.

## Estrutura do Projeto

- **Products**: Tabela que armazena informações sobre os produtos.
- **Orders**: Tabela que armazena informações sobre os pedidos.
- **OrderDetails**: Tabela que armazena os detalhes de cada pedido, como os produtos e quantidades.

## Passos do Projeto

1. **Criação das Tabelas**: Estrutura básica do banco de dados.
2. **Inserção de Dados**: Dados de exemplo para popular as tabelas.
3. **Consultas Iniciais**: Consultas para obter informações como total de vendas por categoria, pedidos e seus totais, e produtos mais vendidos.
4. **Otimizações**: Criação de índices para melhorar o desempenho das consultas.
5. **Análise de Planos de Execução**: Uso do comando `EXPLAIN QUERY PLAN` para verificar como o SQLite processa as queries.

## Como Executar

1. **Preparação**: Certifique-se de ter o SQLite instalado em seu sistema.
2. **Execução do Script**:
    - Abra o terminal.
    - Execute o comando `sqlite3 nome_do_seu_banco.db < otimizacao_query_sqlite.sql`.
3. **Verificação**: Use o comando `EXPLAIN QUERY PLAN` antes de cada consulta para observar como o SQLite otimiza as queries após a criação dos índices.

## Objetivo

Este projeto foi criado para fins educacionais, visando proporcionar uma compreensão prática de como otimizar queries SQL utilizando SQLite. Ele serve como um ponto de partida para quem deseja explorar técnicas de otimização de consultas em bancos de dados relacionais.