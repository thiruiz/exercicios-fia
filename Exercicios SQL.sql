-- SHOW DATABASES;
-- 
-- USE bradesco;
-- 
-- CREATE TABLE  IF NOT EXISTS clientes (
-- 	codcliente INT PRIMARY KEY,
-- 	nome VARCHAR(50) NOT NULL
-- );
-- 
-- SELECT * FROM clientes;
-- 
-- CREATE TABLE IF NOT EXISTS vendedores(
-- 	codvendedor INT PRIMARY KEY,
-- 	nome VARCHAR(50) NOT NULL
-- );
-- 
-- CREATE TABLE IF NOT EXISTS vendas(
-- 	codvendas INT PRIMARY KEY,
-- 	datavenda DATE NOT NULL,
-- 	codcliente INT,
-- 	codvendedor INT 
-- );
-- 
-- INSERT into clientes
-- VALUES 
-- ('2', 'Amauri Junior'),
-- ('3', 'Pedro da Silva Santos'),
-- ('4', 'Felipe de Tal'),
-- ('5', 'Rafael Silva Filho'),
-- ('6', 'Mario Neto Sel'),
-- ('7', 'Bruno Andrade Bis'),
-- ('8', 'Vanessa Aparecida de Jesus'),
-- ('9', 'Pedro Alvares Cabral'),
-- ('10', 'Leticia Nascimento de Souza'); 
-- 
-- INSERT into vendedores
-- VALUES 
-- ('1', 'Elon Musk de Souza'),
-- ('2', 'Trato Feito Junior'),
-- ('3', 'Bob Esponja Calça Quadrada'),
-- ('4', 'Felipe Ribeiro Sell'),
-- ('5', 'Business Man da Silva'),
-- ('6', 'Steve Jobs do Santos'),
-- ('7', 'Mark Zuckerberg Instagram Junior'),
-- ('8', 'Maria Aparecida de Jesus'),
-- ('9', 'Arthur das Neves Cabral'),
-- ('10', 'Thiago Aniceto');
-- 
-- 
-- INSERT INTO vendas (codvendas, datavenda, codcliente, codvendedor)
-- VALUES 
--     (1, '2023-04-25', 5, 9),
--     (2, '2023-04-24', 2, 6),
--     (3, '2023-04-25', 9, 3),
--     (4, '2023-04-23', 6, 7),
--     (5, '2023-04-22', 7, 2),
--     (6, '2023-04-22', 4, 8),
--     (7, '2023-04-23', 8, 1),
--     (8, '2023-04-25', 1, 10),
--     (9, '2023-04-24', 10, 4),
--     (10, '2023-04-22', 3, 5),
--     (11, '2023-04-22', 6, 5),
--     (12, '2023-04-22', 2, 5),
--     (13, '2023-04-22', 2, 9);
-- 
-- SELECT * FROM vendas;

# EXERCICIO ALTERANDO A TABELA

#1)Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255)

ALTER TABLE vendas
ADD COLUMN regiaodavenda Varchar(255) NOT NULL;

#2)Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo)

ALTER TABLE vendas 
MODIFY COLUMN regiaodavenda Varchar(100) NOT NULL;

#3)Modificar a coluna datavenda na tabela vendas por data_venda

ALTER TABLE vendas
RENAME COLUMN datavenda TO data_venda;

#4)Excluir a coluna criada no exercício 1 da tabela venda

ALTER TABLE vendas
DROP COLUMN regiaodavenda;

#EXERCICIO UPDATE 
#1) REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores).

UPDATE vendedores
SET nome = CONCAT(nome, ' Ruiz')
WHERE codvendedor < 6;

#2) REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes).

UPDATE clientes
SET nome = CONCAT(nome, ' Ruiz')
WHERE codcliente < 6;

#EXERCICIO DE MANIPULAÇÃO

#1)INNER JOIN VENDAS X CLIENTES

SELECT * FROM vendas v
INNER JOIN clientes  c
ON c.codcliente =  v.codcliente 


#2)LEFT JOIN VENDAS X VENDEDORES

SELECT * FROM vendas v
LEFT JOIN vendedores v2  
ON v.codvendedor  =  v2.codvendedor;


#3)RIGHT JOIN VENDAS X VENDEDORES

SELECT * FROM vendas v
RIGHT JOIN vendedores v2  
ON v.codvendedor  =  v2.codvendedor;

#4)INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES

SELECT * FROM vendas v 
INNER JOIN clientes c  ON v.codcliente = c.codcliente  
LEFT JOIN vendedores v2 ON v2.codvendedor = v.codvendedor;

#5)LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1

SELECT v.data_venda FROM vendas v 
LEFT JOIN clientes c  ON v.codcliente = c.codcliente 
RIGHT JOIN vendedores v2 ON v.codvendedor = v2.codvendedor 
GROUP BY v.data_venda
ORDER BY v.data_venda DESC 
LIMIT 1;


