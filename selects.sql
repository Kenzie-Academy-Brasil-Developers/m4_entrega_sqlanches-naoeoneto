-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
 	pe.id,
 	pe.status,
 	pe.cliente_id,
 	pr.id,
 	pr.nome,
 	pr.tipo,
 	pr.preço,
 	pr.pts_de_lealdade
FROM
 	pedidos pe
JOIN produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN produtos pr ON pr.id = pp.produto_id;

-- 2)
SELECT
	pp.pedido_id
FROM
	produtos_pedidos pp
WHERE
	produto_id = (
		SELECT id FROM produtos WHERE nome = 'Fritas'
	);

-- 3)
SELECT
	c.nome AS gostam_de_fritas
FROM
	clientes c 
JOIN 
	produtos_pedidos pp 
ON 
	c.id = pp.pedido_id
WHERE 
	pp.produto_id = 6;

-- 4)
SELECT
	SUM(pr.preço) 
FROM
	produtos pr
JOIN produtos_pedidos pp ON pr.id = pp.produto_id 
AND 
	pp.pedido_id = (
		SELECT id FROM clientes WHERE nome = 'Laura'
	);

-- 5)
SELECT
	pr.nome,
	COUNT(*)
FROM
	produtos pr
JOIN
	produtos_pedidos pp 
ON
	pr.id = pp.produto_id
GROUP BY
	pr.id
ORDER BY
	pr.nome;