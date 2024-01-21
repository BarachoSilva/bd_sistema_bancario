# Projeto de Sistema Bancário Simples

Este é um projeto de exemplo para um sistema bancário simples, utilizando um banco de dados fictício chamado "MeuBancoDeDados". O sistema é concebido para gerenciar clientes e suas transações financeiras. Abaixo, você encontrará informações sobre a estrutura do banco de dados e a lógica por trás do sistema.

# O banco de dados é composto por duas tabelas principais:

Clientes:

IDCliente: Identificador único do cliente (chave primária).
Nome: Nome do cliente.
Email: Endereço de e-mail do cliente.
SaldoConta: Saldo atual na conta do cliente.

Transacoes:

IDTransacao: Identificador único da transação (chave primária).
IDCliente: ID do cliente associado à transação (chave estrangeira referenciando a tabela Clientes).
Valor: Valor da transação.
TipoOperacao: Tipo de operação da transação (por exemplo, "depósito", "saque", etc.).
DataTransacao: Data da transação.
Trigger de Atualização de Saldo
Foi implementado um trigger chamado TriggerAtualizarSaldo que é acionado após a inserção de uma nova transação na tabela Transacoes. Este trigger chama a função AtualizarSaldo, que atualiza automaticamente o saldo da conta do cliente com base no valor da transação.
