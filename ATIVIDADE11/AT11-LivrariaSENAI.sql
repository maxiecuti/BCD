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

INSERT INTO tb_cliente_telefones (telefone, CLIENTE_id_cliente) VALUES
('15997474524', 1),
('15997474525', 2),
('13997474529', 3),
('13997474324', 3),
('10997273649', 4),
('10989805361', 4),
('15923456784', 5),
('10997789301', 6),
('10934678929', 6),
('10934567010', 6),
('12912345675', 7),
('12934567933', 8),
('11998765426', 9),
('11990123452', 9),
('17995243798', 10);

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

INSERT INTO tb_cliente_endereco (rua, bairro, numero, cidade, estado, CLIENTE_id_cliente) VALUES
('josé antunes soares', 'vila haro', 47, 'sorocaba', 'são paulo', 1),
('bares doidos', 'láele', 46, 'sorocaba', 'são paulo', 2),
('batata moida', 'silva', 45, 'sorocaba', 'são paulo', 3),
('nivea de cereja', 'amostradinha', 44, 'sorocaba', 'são paulo', 3),
('hello kitty demonio', 'capitão', 43, 'sorocaba', 'são paulo', 4),
('o exorcismo de emilly rose', 'jack frost', 42, 'sorocaba', 'são paulo', 4),
('sesi e senai', 'gato', 41, 'sorocaba', 'são paulo', 5),
('famosos pegos', 'rosinha', 40, 'sorocaba', 'são paulo', 6),
('os simpsons', 'sesc', 49, 'sorocaba', 'são paulo', 6),
('bhartolomel', 'cachos', 48, 'sorocaba', 'são paulo', 6),
('coqueiro verde', 'camarão', 50, 'sorocaba', 'são paulo', 7),
('piercing labret', 'praia', 57, 'sorocaba', 'são paulo', 8),
('oculos duro', 'esquina', 56, 'sorocaba', 'são paulo', 9),
('casca de bala', 'baleia', 54, 'sorocaba', 'são paulo', 9),
('bora bill', 'fedida', 53, 'sorocaba', 'são paulo', 10);

CREATE TABLE IF NOT EXISTS tb_pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
dia DATE NOT NULL,
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente) 
);

INSERT INTO tb_pedido (dia, CLIENTE_id_cliente) VALUES
('2024-04-10', 1),
('2024-07-22', 2),
('2024-10-31', 3),
('2024-01-04', 4),
('2024-11-06', 5);

CREATE TABLE IF NOT EXISTS tb_editora (
id_livro INT PRIMARY KEY AUTO_INCREMENT,
nome_editora VARCHAR(45) NOT NULL,
nome_contato VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL
);

INSERT INTO tb_editora (nome_editora, nome_contato, email) VALUES
('babados fortes', 'João do balão', 'joão.bocadobalão@gmail.com'),
('livraria saber', 'Wanessa wolf', 'mommydiva2gmail.com'),
('compre mais', 'Gustavo Niar', 'gustavo.niar45@gmail.com'),
('blossons', 'Julia farias', 'blossonju90@gmail.com'),
('sakura cherry', 'Sakura Nakamura', 'nakamura_sakura@gmail.com');

CREATE TABLE IF NOT EXISTS tb_livro (
id_livro INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
categoria VARCHAR(45) NOT NULL,
ISBN VARCHAR(13) NOT NULL,
ano DATE NOT NULL,
valor DECIMAL(10, 2) NOT NULL,
autor VARCHAR(45) NOT NULL,
EDITORA_id_editora INT,
FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_editora(id_editora) 
);

CREATE TABLE IF NOT EXISTS tb_estoque (
quantidade INT NOT NULL,
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro) 
);

CREATE TABLE IF NOT EXISTS tb_item_pedido (
PEDIDO_id_pedido INT,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_pedido(id_pediod),
quantidade INT NOT NULL,
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro) 
);