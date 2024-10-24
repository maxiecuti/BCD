DROP DATABASE IF EXISTS db_livrariasenai;

CREATE DATABASE IF NOT EXISTS db_livrariasenai;

USE db_livrariasenai;

CREATE TABLE IF NOT EXISTS tb_cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(30) NOT NULL UNIQUE,
cpf VARCHAR(11) NOT NULL UNIQUE,
rg VARCHAR(11) NOT NULL UNIQUE,
email VARCHAR(45) NOT NULL UNIQUE
);

SELECT * from tb_cliente;

INSERT INTO tb_cliente (id_cliente, nome_cliente, cpf, rg, email) VALUES
(DEFAULT, 'Camila Loures', '11111111111',  '10101010101', 'camilaloures24@gmail.com'),
(DEFAULT, 'Agatha Nunes', '22222222222', '99999999999', 'afonsinha69@gmail.com'),
(DEFAULT, 'Leandrinha', '33333333333', '88888888888', 'leandrinha.rodas@gmail.com'),
(DEFAULT, 'Saori Kido', '44444444444', '77777777777', 'saori_mussyr13@gmail.com'),
(DEFAULT, 'Juju do pix', '55555555555', '66666666666', 'iopixis3@gmail.com'),
(DEFAULT, 'Jojo Toddynho', '66666666666', '55555555555', 'toddy_.mis@gmail.com'),
(DEFAULT, 'Ygona', '77777777777', '44444444444', 'ygona.amaismais@gmail.com'),
(DEFAULT, 'Menina do ministerio etron', '88888888888', '33333333333', 'lucianohulk_angelica@gmail.com'),
(DEFAULT, 'Fernanda coxta', '99999999999', '22222222222', 'coxxxxtas90@gmail.com'),
(DEFAULT, 'Cariucha', '10101010101', '11111111111',  'cariuxadopixx1@gmail.com');

CREATE TABLE IF NOT EXISTS tb_cliente_telefones (
id_telefone INT PRIMARY KEY AUTO_INCREMENT,
telefone VARCHAR(15) NOT NULL UNIQUE,
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente) 
);

INSERT INTO tb_cliente_telefones (id_telefone, telefone, CLIENTE_id_cliente) VALUES
(DEFAULT, '15997474524', 1),
(DEFAULT, '15997474525', 2),
(DEFAULT, '13997474529', 3),
(DEFAULT, '13997474324', 3),
(DEFAULT, '10997273649', 4),
(DEFAULT, '10989805361', 4),
(DEFAULT, '15923456784', 5),
(DEFAULT, '10997789301', 6),
(DEFAULT, '10934678929', 6),
(DEFAULT, '10934567010', 6),
(DEFAULT, '12912345675', 7),
(DEFAULT, '12934567933', 8),
(DEFAULT, '11998765426', 9),
(DEFAULT, '11990123452', 9),
(DEFAULT, '17995243798', 10);

CREATE TABLE IF NOT EXISTS tb_cliente_enderecos (
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(15) NOT NULL,
bairro VARCHAR(15) NOT NULL,
numero INT NOT NULL UNIQUE,
cidade VARCHAR(15) NOT NULL,
estado VARCHAR(15) NOT NULL,
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente) 
);

INSERT INTO tb_cliente_enderecos (id_endereco, rua, bairro, numero, cidade, estado, CLIENTE_id_cliente) VALUES
(DEFAULT, 'josé antunes', 'vila haro', 47, 'sorocaba', 'são paulo', 1),
(DEFAULT, 'bares doidos', 'láele', 46, 'sorocaba', 'são paulo', 2),
(DEFAULT, 'batata moida', 'silva', 45, 'sorocaba', 'são paulo', 3),
(DEFAULT, 'nivea de cereja', 'amostradinha', 44, 'sorocaba', 'são paulo', 3),
(DEFAULT, 'hello kitty', 'capitão', 43, 'sorocaba', 'são paulo', 4),
(DEFAULT, 'emilly rose', 'jack frost', 42, 'sorocaba', 'são paulo', 4),
(DEFAULT, 'sesi e senai', 'gato', 41, 'sorocaba', 'são paulo', 5),
(DEFAULT, 'famosos pegos', 'rosinha', 40, 'sorocaba', 'são paulo', 6),
(DEFAULT, 'os simpsons', 'sesc', 49, 'sorocaba', 'são paulo', 6),
(DEFAULT, 'bhartolomel', 'cachos', 48, 'sorocaba', 'são paulo', 6),
(DEFAULT, 'coqueiro verde', 'camarão', 50, 'sorocaba', 'são paulo', 7),
(DEFAULT, 'piercing labret', 'praia', 57, 'sorocaba', 'são paulo', 8),
(DEFAULT, 'oculos duro', 'esquina', 56, 'sorocaba', 'são paulo', 9),
(DEFAULT, 'casca de bala', 'baleia', 54, 'sorocaba', 'são paulo', 9),
(DEFAULT, 'bora bill', 'fedida', 53, 'sorocaba', 'são paulo', 10);

CREATE TABLE IF NOT EXISTS tb_pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
dia DATE NOT NULL,
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente) 
);

INSERT INTO tb_pedido (id_pedido, dia, CLIENTE_id_cliente) VALUES
(DEFAULT, '2024-04-10', 1),
(DEFAULT, '2024-07-22', 2),
(DEFAULT, '2024-10-31', 3),
(DEFAULT, '2024-01-04', 4),
(DEFAULT, '2024-11-06', 5);

select * from tb_pedido;


CREATE TABLE IF NOT EXISTS tb_editora (
id_livro INT PRIMARY KEY AUTO_INCREMENT,
nome_editora VARCHAR(45) NOT NULL,
nome_contato VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL
);

INSERT INTO tb_editora (id_livro, nome_editora, nome_contato, email) VALUES
(DEFAULT, 'babados fortes', 'João do balão', 'joão.bocadobalão@gmail.com'),
(DEFAULT, 'livraria saber', 'Wanessa wolf', 'mommydiva2gmail.com'),
(DEFAULT, 'compre mais', 'Gustavo Niar', 'gustavo.niar45@gmail.com'),
(DEFAULT, 'blossons', 'Julia farias', 'blossonju90@gmail.com'),
(DEFAULT, 'sakura cherry', 'Sakura Nakamura', 'nakamura_sakura@gmail.com');

CREATE TABLE IF NOT EXISTS tb_livro (
id_livro INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
categoria VARCHAR(45) NOT NULL,
ISBN VARCHAR(13) NOT NULL,
ano DATE NOT NULL,
valor DECIMAL(10, 2) NOT NULL,
autor VARCHAR(45) NOT NULL,
EDITORA_id_editora INT,
FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_editora(id_livro) 
);

INSERT INTO tb_livro (id_livro, titulo, categoria, ISBN, ano, valor, autor) VALUES
(DEFAULT, 'O Castelo de Otranto', 'Literatura Gótica', '9788533302273', '1999-03-21', 69.00, 'Horace Walpole'),
(DEFAULT, 'Os Mistérios de Udolpho', 'Literatura Gótica', '9788533302274', '2003-10-30', 25.00, 'Ann Radcliffe'),
(DEFAULT, 'Frankenstein', 'Literatura Gótica', '9788533302275', '1943-06-01', 135.00, 'Mary Shelley'),
(DEFAULT, 'O Vampiro', 'Literatura Gótica', '9788533302276', '2009-04-01', 59.00, 'John Polidori'),
(DEFAULT, 'Carmilla', 'Literatura Gótica', '9788533302277', '2015-09-22', 40.00, 'Sheridan Le Fanu'),
(DEFAULT, 'Noite na Taverna', 'Literatura Gótica', '9788533302278', '2000-11-08', 87.00, 'Alvares de Azevedo'),
(DEFAULT, 'Drácula', 'Literatura Gótica', '9788533302279', '1945-05-21', 150.00, 'Bram Stoker'),
(DEFAULT, 'Rebecca', 'Literatura Gótica', '9788533302271', '2010-12-31', 79.00, 'Daphne du Maurier'),
(DEFAULT, 'A Queda da Casa de Usher', 'Literatura Gótica', '9788533302272', '1989-07-04', 159.00, 'Edgar Allan Poe'),
(DEFAULT, 'O Médico e o Monstro', 'Literatura Gótica', '9788533302237', '2006-02-19', 99.00, 'Robert Louis Stevenson');

select * from tb_livro;

CREATE TABLE IF NOT EXISTS tb_estoque (
quantidade INT NOT NULL,
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro) 
);

INSERT INTO tb_estoque (quantidade, LIVRO_id_livro) VALUES
(100, 1),
(69, 2),
(24, 3),
(666, 4),
(83, 5),
(275, 6),
(321, 7),
(1, 8),
(497, 9),
(512, 10);

CREATE TABLE IF NOT EXISTS tb_item_pedido (
PEDIDO_id_pedido INT,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_pedido(id_pedido),
quantidade INT NOT NULL,
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro) 
);

SELECT * from tb_item_pedido;

INSERT INTO tb_item_pedido (PEDIDO_id_pedido, quantidade, LIVRO_id_livro) VALUES
(1, 10, 1),
(2, 5, 2),
(3, 21, 3),
(4, 6, 4),
(5, 78, 5),
(1, 9, 6),
(2, 34, 7),
(3, 2, 8),
(4, 1, 9),
(5, 24, 10),
(1, 10, 1),
(2, 5, 2),
(3, 21, 3),
(4, 6, 4),
(5, 78, 5),
(1, 9, 6),
(2, 34, 7),
(3, 2, 8),
(4, 1, 9),
(5, 24, 10);