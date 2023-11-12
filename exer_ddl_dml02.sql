USE exer_ddl_dml02
GO
INSERT INTO usuario VALUES 
('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')
GO
INSERT INTO projetos VALUES 
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC´s', '2014/09/12')
GO
-- id, nome e email de usuario
-- id, nome, descrição e data de projetos, dos usuarios que participaram do projeto nome Re-folha
SELECT us.id AS usuario_id, us.nome AS nome_usuario, us.email, p.id AS projetos_id,
       p.nome AS projeto_nome, p.descricao,
	   CONVERT(CHAR(10), p.data_proj, 103) AS data_projeto
FROM usuario us, projetos p, usuario_projetos up
WHERE us.id = up.usuario_id
      AND p.id = up.projetos_id
	  AND p.nome LIKE 'Re-%'

-- nome dos projetos que não tem  usuarios
SELECT p.nome
FROM usuario_projetos up RIGHT OUTER JOIN projetos p
ON p.id = up.projetos_id
WHERE up.projetos_id IS NULL

-- nome dos usuarios que não tem projetos
SELECT us.nome
FROM usuario us LEFT OUTER JOIN usuario_projetos up
ON us.id = up.usuario_id
WHERE up.usuario_id IS NULL

