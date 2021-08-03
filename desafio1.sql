DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
nome_artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
nome_album VARCHAR(40) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artista(artista_id) 
) engine = InnoDB;

CREATE TABLE plano(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
nome_plano VARCHAR(20) NOT NULL,
valor_plano DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES plano(plano_id) 
) engine = InnoDB;

CREATE TABLE cancao(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
nome_cancao VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
FOREIGN KEY (album_id) REFERENCES album(album_id) 
) engine = InnoDB;

CREATE TABLE seguidor(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
FOREIGN KEY (artista_id) REFERENCES artista(artista_id) 
) engine = InnoDB;

CREATE TABLE historico(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id) 
) engine = InnoDB;

INSERT INTO plano (nome_plano, valor_plano) VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);
INSERT INTO usuario (nome_usuario, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artista (nome_artista) VALUES
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Walter Phoenix');

INSERT INTO album (nome_album, artista_id) VALUES
('Envious', 4),
('Exuberant', 4),
('Hallowed Steam', 3),
('Incandescent', 2),
('Temporary Culture', 1);

INSERT INTO cancao (nome_cancao, artista_id, album_id) VALUES
('Celebration Of More', 3, 3),
('Dance With Her Own', 4, 1),
('Diamond Power', 2, 4),
('Fantasy For Me', 3, 3),
('Home Forever', 2, 4),
("Honey, Let's Be Silly", 2, 4),
('Honey, So Do I', 3, 3),
('Magic Circus', 3, 3),
('Reflections Of Magic', 4, 1),
('Rock His Everything', 2, 4),
('She Knows', 3, 3),
('Soul For Us', 4, 1),
("Sweetie, Let's Go Wild", 3, 3),
('Thang Of Thunder', 1, 5),
('Time Fireworks', 4, 2),
('Troubles Of My Inner Fire', 4, 2),
('Without My Streets', 1, 5 ),
('Words Of Her Life', 1, 5 );

INSERT INTO historico (usuario_id, cancao_id) VALUES
(1, 12),
(1, 8),
(1, 3),
(1, 14),
(2, 5),
(2, 18),
(2, 9),
(2, 6),
(3, 16),
(3, 14),
(3, 8),
(4, 2),
(4, 17),
(4, 1);

INSERT INTO seguidor (usuario_id, artista_id) VALUES
(1, 4),
(1, 1),
(1, 2),
(2, 4),
(2, 2),
(3, 3),
(3, 4),
(4, 1);
