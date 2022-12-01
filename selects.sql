-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)


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


-- 4)


-- 5)