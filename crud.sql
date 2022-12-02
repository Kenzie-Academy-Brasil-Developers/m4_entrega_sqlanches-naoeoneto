-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
	(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)
INSERT INTO pedidos
	(status, cliente_id)
VALUES
	('Recebido', 6);

-- 3)
INSERT INTO produtos_pedidos
	(pedido_id, produto_id)
VALUES
	(6, (SELECT id FROM produtos WHERE nome = 'Big Serial')),
	(6, (SELECT id FROM produtos WHERE nome = 'Varchapa')),
	(6, (SELECT id FROM produtos WHERE nome = 'Fritas')),
	(6, (SELECT id FROM produtos WHERE nome = 'Coca-Cola')),
	(6, (SELECT id FROM produtos WHERE nome = 'Coca-Cola'));

-- Leitura

-- 1)
SELECT
	c.id,
 	c.nome,
 	c.lealdade,
 	pe.id,
 	pe.status,
 	pe.cliente_id,
 	pr.id,
 	pr.nome,
 	pr.tipo,
 	pr.preço,
 	pr.pts_de_lealdade
FROM 
	clientes c 
JOIN pedidos pe ON c.id = pe.cliente_id
JOIN produtos_pedidos pp ON	pp.pedido_id = 6
JOIN produtos pr ON pr.id = pp.produto_id 
WHERE
	c.id = pp.pedido_id;

-- Atualização

-- 1)
UPDATE
	clientes 
SET
	lealdade = (
        SELECT
            SUM(pr.pts_de_lealdade) 
        FROM
            produtos pr
        JOIN produtos_pedidos pp ON	pr.id = pp.produto_id 
        WHERE
            pp.pedido_id = 6)
WHERE
	id = (
	    SELECT id FROM clientes WHERE nome = 'Georgia'
    );

-- Deleção

-- 1)
DELETE FROM 
	clientes
WHERE
	id = ( 
	    SELECT id FROM clientes	WHERE nome = 'Marcelo'
    );