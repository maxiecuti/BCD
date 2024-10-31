USE db_loja;

SELECT*FROM tb_vendas; 

-- 1
SELECT id_nf, id_item, cod_prod, valor_unit FROM tb_vendas
WHERE desconto IS NULL;

-- 2
SELECT id_nf, id_item, cod_prod, valor_unit, valor_unit - (VALOR_UNIT*(DESCONTO/100)) AS valor_vendido
FROM tb_vendas
WHERE desconto IS NOT NULL;

-- 3
UPDATE tb_vendas 
SET desconto = 0;

SELECT*FROM tb_vendas; 

-- 4
SELECT id_nf, id_item, cod_prod, valor_unit, desconto, QUANTIDADE * VALOR_UNIT AS valor_total, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) AS valor_vendido
FROM tb_vendas;

-- 5
SELECT id_nf AS valor_total FROM tb_vendas
GROUP BY id_nf
ORDER BY id_nf DESC;

-- 6
SELECT id_nf, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) AS valor_vendido FROM tb_vendas
GROUP BY id_nf, valor_vendido
ORDER BY id_nf DESC;

-- 7
SELECT cod_prod, quantidade FROM tb_vendas
GROUP BY cod_prod, quantidade
ORDER BY cod_prod DESC;

-- 8
SELECT id_nf, cod_prod, COUNT(quantidade) FROM tb_vendas
WHERE quantidade > 10
GROUP BY ID_NF, COD_PROD;

-- 9
SELECT id_nf AS valor_total FROM tb_vendas
WHERE id_nf > 500
GROUP BY id_nf, valor_total
ORDER BY id_nf DESC;

-- 10
SELECT AVG(desconto) AS media
FROM tb_vendas
GROUP BY cod_prod;

-- 11
SELECT cod_prod, AVG(valor_unit * (desconto/100)) AS valor_medio
FROM tb_vendas
GROUP BY cod_prod;

-- 12
SELECT id_nf, SUM(quantidade) AS quantidade_intens
FROM tb_vendas
GROUP BY id_nf;