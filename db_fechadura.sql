CREATE DATABASE db_fechadura;
USE db_fechadura;

CREATE TABLE tbl_usuarios(
usu_codigo INT AUTO_INCREMENT PRIMARY KEY,
usu_nome VARCHAR(100) NOT NULL,
usu_matricula VARCHAR(100) NOT NULL,
usu_acesso VARCHAR(50) NOT NULL UNIQUE,
usu_ativo TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE tbl_salas(
sal_codigo INT AUTO_INCREMENT PRIMARY KEY,
sal_nome VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_permissoes(
per_codigo INT AUTO_INCREMENT PRIMARY KEY,
usu_codigo INT,
CONSTRAINT fk_permissoes_usuarios FOREIGN KEY (usu_codigo)
REFERENCES tbl_usuarios(usu_codigo),
sal_codigo INT,
CONSTRAINT fk_permissoes_salas FOREIGN KEY (sal_codigo)
REFERENCES tbl_salas(sal_codigo)
);

CREATE TABLE tbl_acessos(
ace_codigo INT AUTO_INCREMENT PRIMARY KEY,
ace_lido VARCHAR(100) NOT NULL,
sal_codigo INT,
CONSTRAINT fk_acessos_salas FOREIGN KEY (sal_codigo)
REFERENCES tbl_salas(sal_codigo),
ace_data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ace_resultado ENUM('AUTORIZADO', 'NEGADO') NOT NULL,
ace_motivo VARCHAR(100) NOT NULL,
usu_codigo INT,
CONSTRAINT fk_acessos_usuarios FOREIGN KEY (usu_codigo)
REFERENCES tbl_usuarios(usu_codigo)
);