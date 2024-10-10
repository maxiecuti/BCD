-- Criando um banco de dados
CREATE DATABASE db_cadastro;

-- Usando um banco de dados
USE db_cadastro;

-- Criando uma tabela
CREATE TABLE pessoas (
idade int,
peso float,
sexo char(1),
altura float,
nome varchar(30),
nacionalidade varchar(20)
);

-- Alterando a tabela pessoas
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10);

-- Mostra a tabela
SELECT * FROM pessoas;

-- Adiciona uma coluna depois da escolhida
ALTER TABLE pessoas
ADD COLUMN cpf varchar(11)
AFTER nome;

-- Adiciona uma coluna antes de tds
ALTER TABLE pessoas
ADD COLUMN id_pessoas int
FIRST;

-- Drop remove a coluna escolhida
ALTER TABLE pessoas
DROP COLUMN profissao;

-- ALtera o tipo da coluna
ALTER TABLE pessoas
MODIFY COLUMN cpf int NOT NULL;

-- Muda o nome da coluna
ALTER TABLE pessoas
CHANGE COLUMN cpf rg varchar(11);

-- Descreve a tabela
DESC pessoas;

-- Ele renomeia o nome da tabela
ALTER TABLE pessoas
RENAME TO alunos;

-- Disca alunos
DESC alunos;

-- Exclui a tabela
DROP TABLE IF EXISTS alunos;

-- Mostra a tabela
SHOW TABLES;

-- Criar uma tabela se não existir a tabela x
-- Primary key designa a chave primara
-- NOT NULL: obrigatorio, UNIQUE: unico, UNSIGNED: valores positivos, DEFAULT: inseri valor padrão
CREATE TABLE IF NOT EXISTS tb_curso(
id_curso int NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
ano year DEFAULT '2024',
PRIMARY KEY(id_curso)
)DEFAULT CHARSET=utf8;

-- Enum: para escolhas, date: data
-- Decimal: ex: 8,2= ele poderá ter 8 dígitos à esquerda da vírgula, e duas casas decimais à direita da vírgula.
-- FOREIGN KEY: é a chave estrangeira, REFERENCE: referencia outra tabela 
CREATE TABLE IF NOT EXISTS tb_professor(
id_professor int PRIMARY KEY NOT NULL,
nome varchar(30) NOT NULL,
nascimento date,
sexo enum('M', 'F', 'Other'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira',
CURSO_id_curso int,
FOREIGN KEY (CURSO_id_curso) REFERENCES tb_curso(id_curso)
);

CREATE TABLE IF NOT EXISTS tb_aluno(
id_alunos int NOT NULL,
nome varchar(30) NOT NULL,
sexo enum('M', 'F', 'Other'),
altura decimal(3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira'
);

-- Outra forma de identificar a chave primaria
-- AUTO_INCREMENT: auto adiciona
ALTER TABLE tb_aluno
MODIFY COLUMN id_aluno int PRIMARY KEY 
NOT NULL AUTO_INCREMENT;

ALTER TABLE tb_aluno
ADD COLUMN CURSO_id_curso int;

ALTER TABLE tb_aluno
ADD FOREIGN KEY (CURSO_id_curso)
REFERENCES tb_curso(id_curso);

