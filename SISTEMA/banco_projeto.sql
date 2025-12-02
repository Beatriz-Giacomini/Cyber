-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_projeto
DROP DATABASE IF EXISTS `banco_projeto`;
CREATE DATABASE IF NOT EXISTS `banco_projeto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `banco_projeto`;

-- Copiando estrutura para tabela banco_projeto.fale_conosco
DROP TABLE IF EXISTS `fale_conosco`;
CREATE TABLE IF NOT EXISTS `fale_conosco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL DEFAULT '0',
  `email` varchar(250) NOT NULL DEFAULT '0',
  `telefone` varchar(9) DEFAULT '0',
  `assunto` varchar(100) NOT NULL DEFAULT '0',
  `mensagem` varchar(250) NOT NULL DEFAULT '0',
  `data/hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.fale_conosco: ~4 rows (aproximadamente)
DELETE FROM `fale_conosco`;
INSERT INTO `fale_conosco` (`id`, `nome`, `email`, `telefone`, `assunto`, `mensagem`, `data/hora`) VALUES
	(1, 'Sara Gomes', 'saragomes@gmail.com', '159874623', 'Emprego', 'Há vagas de emprego?', '2025-11-18 13:18:56'),
	(2, 'Paula Silva', 'paulasilva@gmail.com', '456879512', 'Dúvida', 'É possível aprender CyberSecurity em casa?', '2025-11-18 13:18:56'),
	(3, 'Beatriz', 'beatriz@gmail.com', '457893526', 'Pergunta sobre a área de segurança', 'Como proteger o meu número de golpes?', '2025-11-18 13:18:56'),
	(7, 'Sara Gomes', 'saragomes@gmail.com', '159874623', 'Emprego', 'Há vagas de emprego? Não obtive respostas', '2025-11-25 14:19:47');

-- Copiando estrutura para tabela banco_projeto.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.usuarios: ~6 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
	(1, 'Beatriz Vasconcelo', 'beatrizvasconcelo@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
	(6, 'Sara Gomes', 'saragomes@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
	(7, 'Paula Silva', 'paulasilva@gmail.com', '5600715f42bf51c40dc330d750cd996f58fead4ddea56466ce7498d17801b3a5'),
	(8, 'Laura Muraro', 'lauramuraro@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414'),
	(9, 'Luca Souza', 'lucassouza@gmail.com', 'e54fc6b51915e222ba6196747a19ebb8dfa651fd2b46a385a0ded647fbfefda0'),
	(12, 'Eric Santos', 'ericsantos@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
