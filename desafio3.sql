
CREATE VIEW historico_reproducao_usuarios AS SELECT u.nome_usuario AS 'usuario', c.nome_cancao AS 'nome' FROM SpotifyClone.cancao AS c INNER JOIN SpotifyClone.historico AS h ON c.cancao_id = h.cancao_id INNER JOIN SpotifyClone.usuario AS u ON h.usuario_id = u.usuario_id ORDER BY u.nome_usuario, c.nome_cancao;