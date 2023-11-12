USE locadora_02
GO

-- consultar num_cadastro do cliente, nome do cliente, data_locação,
-- total de dias que o filme ficou alugado, titulo do filme, ano do filme 
-- da locacao do cliente cujo nome inicia com Matilde

SELECT c.num_cadastro, c.nome, 
       CONVERT(CHAR(10), l.data_locacao, 103) AS data_loc,
	   DATEDIFF(DAY, l.data_locacao, l.data_devolucao) AS qtd_dias_alugado,
	   f.titulo, f.ano
FROM dvd d, locacao l, cliente c, filme f
WHERE d.num = l.dvdnum
      AND l.clientenum_cadastro = c.num_cadastro
	  AND f.id = d.filmeid
	  AND c.nome LIKE 'Matilde%'

-- nome da estrela, nome real da estrela, titulo do filme 
-- filmes cadastrados do ano 2015

SELECT e.nome, e.nome_real, f.titulo
FROM estrela e, filme f, filme_estrela fe
WHERE e.id = fe.estrelaid
     AND f.id = fe.filmeid
	 AND f.ano = 2015

-- 3

SELECT f.titulo, CONVERT(CHAR(10), d.data_fabricacao, 103) AS data_fab,
       CASE WHEN (YEAR(GETDATE()) - ano > 6)
	        THEN 
			     CAST(YEAR(GETDATE()) - ano AS VARCHAR(4)) + ' anos'
			ELSE
			     CAST(YEAR(GETDATE()) - ano AS VARCHAR(4))
		END AS tempo
FROM filme f, dvd d
WHERE f.id = d.filmeid