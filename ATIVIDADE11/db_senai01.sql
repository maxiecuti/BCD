DROP DATABASE IF EXISTS db_senai;

CREATE DATABASE IF NOT EXISTS db_senai;

USE db_senai;

CREATE TABLE IF NOT EXISTS tb_aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome_aluno VARCHAR(45) NOT NULL,
nascimento DATE,
sexo ENUM('M', 'F', 'O'),
peso DECIMAL(5, 2),
altura DECIMAL(3, 2),
nacionalidade VARCHAR(20) DEFAULT'Brasileiro(a)'
);

DESC tb_aluno;

INSERT INTO tb_aluno (nome_aluno, nascimento, sexo, peso, altura, nacionalidade) 
VALUES
('Saiko' , '1998-03-18' , 'M' , 24.00 , 1.22 , 'Fortaleza');

SELECT * FROM tb_aluno;

INSERT INTO tb_aluno (id_aluno, nome_aluno, nascimento, sexo, peso, altura, nacionalidade) 
VALUES
(DEFAULT, 'Pedro Orochi' , '2000-06-08', 'M' , 69.00 , 1.69 , DEFAULT);

INSERT INTO tb_aluno VALUES 
(DEFAULT, 'Doazin' , '1999-04-22' , 'M' , 24.00 , 1.96 , 'Estadunidense'), 
(DEFAULT, 'Seijinho' , '1994-07-18' , 'M' , 15.00 , 1.51 , DEFAULT);

UPDATE tb_aluno
SET nome_aluno = 'Ycro'
WHERE id_aluno = 1;

UPDATE tb_aluno
set nome_aluno = 'Brino', nascimento = '1996-12-31', nacionalidade = 'Republica Tcheca'
WHERE id_aluno = 3;

UPDATE tb_aluno
SET nome_aluno = 'Cellbit'
WHERE altura = 1.96;

UPDATE tb_aluno
SET nome_aluno = 'Goulart'
WHERE altura = 1.51
LIMIT 2;

DELETE FROM tb_aluno
WHERE id_aluno = 8;

SELECT * from tb_aluno;

TRUNCATE TABLE tb_aluno;
