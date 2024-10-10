CREATE DATABASE db_livrariaSesiSenai;

USE db_livrariaSesiSenai;

CREATE TABLE tb_cliente(
id_cliente int PRIMARY KEY NOT NULL,
nome varchar(45) NOT NULL,
cpf varchar(11) NOT NULL,
rg varchar(11) NOT NULL,
email varchar(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_cliente_telefones(
id_telefone int PRIMARY KEY NOT NULL,
telefone varchar(15) NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_CLIENTE(id_cliente)
);

CREATE TABLE IF NOT EXISTS tb_cliente_endereco(
id_enderco int PRIMARY KEY NOT NULL,
rua varchar(45) NOT NULL,
numero int NOT NULL,
cidade varchar(45) NOT NULL,
estado varchar(45) NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_CLIENTE(id_cliente)
);

CREATE TABLE IF NOT EXISTS tb_pedido(
id_pedido int PRIMARY KEY NOT NULL,
valor decimal(10,2),
dia_hora date NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_CLIENTE(id_cliente)
);

CREATE TABLE IF NOT EXISTS tb_editora(
id_editora int PRIMARY KEY NOT NULL,
nome_editora varchar(45) NOT NULL,
nome_contato varchar(45) NOT NULL,
email varchar(45) NOT NULL,
contato varchar(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_livro(
id_livro int PRIMARY KEY NOT NULL,
titulo varchar(45) NOT NULL,
categoria varchar(45) NOT NULL,
isbn varchar(45) NOT NULL,
ano date NOT NULL,
valor decimal(10,2),
autor varchar(45) NOT NULL,
EDITORA_id_editora int,
FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_EDITORA(id_editora)
);

CREATE TABLE IF NOT EXISTS tb_estoque(
quantidade int NOT NULL,
LIVRO_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_LIVRO(id_livro)
);

CREATE TABLE IF NOT EXISTS tb_item_pedido(
quantidade int NOT NULL,
valor decimal(10,2) NOT NULL,
PEDIDO_id_pedido int,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_PEDIDO(id_pedido),
Livro_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_LIVRO(id_livro)
);

SHOW TABLES;