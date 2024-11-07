USE db_petshop;

-- 1 
SELECT nome, especie, raca
FROM tb_animais;

-- 2
SELECT tipo_servico, data_servico, preco
FROM tb_servicos;

-- 3
SELECT nome, tipo_servico
FROM tb_animais
INNER JOIN tb_servicos;

-- 4
SELECT * FROM tb_animais
LEFT JOIN tb_servicos
ON tb_animais.id_animal = tb_servicos.id_animal;

-- 5
SELECT tb_animais.nome, tb_servicos.data_servico, tb_servicos.descricao
FROM tb_animais
JOIN tb_servicos
ON tb_animais.id_animal = tb_servicos.id_animal
WHERE tb_servicos.data_servico >= 2023;

-- 6 
SELECT tb_animais.nome, COUNT(tb_servicos.tipo_servico) AS servicos_realizados
FROM tb_animais
JOIN tb_servicos 
ON tb_animais.id_animal = tb_servicos.id_animal
GROUP BY nome
ORDER BY servicos_realizados DESC;

-- 7
SELECT tb_animais.nome, tb_servicos.preco
FROM tb_animais
JOIN tb_servicos
ON tb_animais.id_animal = tb_servicos.id_animal
WHERE tb_servicos.preco >= 100.00;

-- 8
SELECT tb_animais.especie, AVG(preco) AS média
FROM tb_servicos
JOIN tb_animais
ON tb_animais.id_animal = tb_servicos.id_animal
GROUP BY tb_animais.especie;

-- 9
SELECT tb_animais.nome_dono, COUNT(tb_servicos.tipo_servico) AS numero_servicos
FROM tb_animais
JOIN tb_servicos
ON tb_animais.id_animal = tb_servicos.id_animal
WHERE tb_animais.idade >= 5
GROUP BY tb_animais.nome_dono
HAVING numero_servicos > 2;

-- 10
SELECT tb_animais.especie, MAX(tb_servicos.tipo_servico) AS servico_mais_caro
FROM tb_animais
JOIN tb_servicos
ON tb_animais.id_animal = tb_servicos.id_animal
GROUP BY tb_animais.especie;