-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Jul-2025 às 19:55
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_clauapp`
--
CREATE DATABASE IF NOT EXISTS `bd_clauapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_clauapp`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `ID_AGENDA` int(11) NOT NULL,
  `TIPO` varchar(45) NOT NULL,
  `DATA_` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `FK_CLIENTE` int(11) NOT NULL,
  `VALOR` decimal(4,2) NOT NULL,
  `PAGO` tinyint(1) NOT NULL,
  `FORMA_PAGAMENTO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NM_CLIENTE` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `ID_COMPRA` int(11) NOT NULL,
  `DESCRICAO` text DEFAULT NULL,
  `VALOR_TOTAL` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomenda`
--

CREATE TABLE `encomenda` (
  `ID_ENCOMENDA` int(11) NOT NULL,
  `FK_CLIENTE` int(11) NOT NULL,
  `LOCAL` varchar(45) DEFAULT NULL,
  `DATA_` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomenda_has_produto`
--

CREATE TABLE `encomenda_has_produto` (
  `ID_ENCOM_PRODUTO` int(11) NOT NULL,
  `FK_ENCOMENDA` int(11) NOT NULL,
  `FK_PRODUTO` int(11) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID_PRODUTO` int(11) NOT NULL,
  `NM_PRODUTO` varchar(45) NOT NULL,
  `PRECO` decimal(6,2) NOT NULL,
  `TIPO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `ID_VENDA` int(11) NOT NULL,
  `TOTAL` decimal(5,2) NOT NULL,
  `DATA_HORA` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_has_produto`
--

CREATE TABLE `venda_has_produto` (
  `ID_VENDA_PRODUTO` int(11) NOT NULL,
  `FK_VENDA` int(11) NOT NULL,
  `FK_PRODUTO` int(11) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`ID_AGENDA`),
  ADD KEY `FK_CLIENTE` (`FK_CLIENTE`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID_COMPRA`);

--
-- Índices para tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD PRIMARY KEY (`ID_ENCOMENDA`),
  ADD KEY `ENC_CLIENTE` (`FK_CLIENTE`);

--
-- Índices para tabela `encomenda_has_produto`
--
ALTER TABLE `encomenda_has_produto`
  ADD PRIMARY KEY (`ID_ENCOM_PRODUTO`),
  ADD KEY `ENC_PRODUTO` (`FK_PRODUTO`),
  ADD KEY `ENC_ENCOM` (`FK_ENCOMENDA`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID_PRODUTO`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`ID_VENDA`);

--
-- Índices para tabela `venda_has_produto`
--
ALTER TABLE `venda_has_produto`
  ADD PRIMARY KEY (`ID_VENDA_PRODUTO`),
  ADD KEY `PRODUTO` (`FK_PRODUTO`),
  ADD KEY `VENDA` (`FK_VENDA`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `ID_AGENDA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `ID_COMPRA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encomenda`
--
ALTER TABLE `encomenda`
  MODIFY `ID_ENCOMENDA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encomenda_has_produto`
--
ALTER TABLE `encomenda_has_produto`
  MODIFY `ID_ENCOM_PRODUTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID_PRODUTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `ID_VENDA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda_has_produto`
--
ALTER TABLE `venda_has_produto`
  MODIFY `ID_VENDA_PRODUTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`FK_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD CONSTRAINT `ENC_CLIENTE` FOREIGN KEY (`FK_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `encomenda_has_produto`
--
ALTER TABLE `encomenda_has_produto`
  ADD CONSTRAINT `ENC_ENCOM` FOREIGN KEY (`FK_ENCOMENDA`) REFERENCES `encomenda` (`ID_ENCOMENDA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ENC_PRODUTO` FOREIGN KEY (`FK_PRODUTO`) REFERENCES `produto` (`ID_PRODUTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda_has_produto`
--
ALTER TABLE `venda_has_produto`
  ADD CONSTRAINT `PRODUTO` FOREIGN KEY (`FK_PRODUTO`) REFERENCES `produto` (`ID_PRODUTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `VENDA` FOREIGN KEY (`FK_VENDA`) REFERENCES `venda` (`ID_VENDA`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
