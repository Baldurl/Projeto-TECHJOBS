-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Nov-2023 às 14:05
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `techjobsdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assinatura`
--

CREATE TABLE `assinatura` (
  `id` int(11) NOT NULL,
  `periodo` varchar(55) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `meio_pagamento` varchar(50) NOT NULL,
  `valor` varchar(40) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Candidato'),
(3, 'Empresa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `razao_social` varchar(50) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `ddi` varchar(6) DEFAULT NULL,
  `ddd` varchar(20) DEFAULT NULL,
  `numero` varchar(17) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `logradouro` varchar(10) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `lote` varchar(10) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `razao_social`, `cpf`, `cnpj`, `senha`, `email`, `sexo`, `ddi`, `ddd`, `numero`, `cep`, `cidade`, `logradouro`, `bairro`, `lote`, `rua`, `complemento`, `perfil_id`) VALUES
(1, 'Jordan', NULL, '075-276-691-01', NULL, '123', 'jordanvieiracarvalho@hotmail.com', 'Masculino', '', '61', '998490406', '72251702', 'Ceilândia', NULL, 'QNO 7', '10', 'B', NULL, 1),
(29, 'Empresa', NULL, '1212312312', NULL, '123', 'empresa@email.com', NULL, NULL, '61', '998490406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(44, 'joao', NULL, '12312312312', NULL, '123', 'joao@email.com', NULL, NULL, '61', '91234-1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(49, 'laila', '', '07227669101', '', '1234', 'laila@email.com', NULL, '55', '61', '93333-3333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(51, 'Adidas', 'adidas', NULL, '111.111.111/1111', '123', 'adidas@email.com', NULL, NULL, '61', '91111-1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(52, 'Nike', 'nike', NULL, '222.222.222/2222', '123', 'nike@email.com', NULL, NULL, '61', '92222-2222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_vaga`
--

CREATE TABLE `usuario_has_vaga` (
  `usuario_id` int(11) DEFAULT NULL,
  `vaga_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario_has_vaga`
--

INSERT INTO `usuario_has_vaga` (`usuario_id`, `vaga_id`) VALUES
(44, 15),
(49, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga`
--

CREATE TABLE `vaga` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descricao` longtext NOT NULL,
  `salario` varchar(50) NOT NULL,
  `carga_horaria` varchar(100) NOT NULL,
  `data_publicacao` date NOT NULL,
  `data_expiracao` date NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vaga`
--

INSERT INTO `vaga` (`id`, `nome`, `tipo`, `descricao`, `salario`, `carga_horaria`, `data_publicacao`, `data_expiracao`, `usuario_id`) VALUES
(15, 'Vaga na adidas', 'Efetivo/Clt', 'O que é Lorem Ipsum? Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker. O que é Lorem Ipsum? Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'R$1000,00', '50h semanais', '2023-11-09', '2023-11-15', 51),
(16, 'Outra vaga na adidas', 'Efetivo/Clt', '.O que é Lorem Ipsum? Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker. .O que é Lorem Ipsum? Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'R$2000,00', '70h semanais', '2023-11-14', '2023-11-20', 51),
(17, 'Vaga na nike', 'Efetivo/Clt', 'Porque nós o usamos? É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de &#34;Conteúdo aqui, conteúdo aqui&#34;, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por &#39;lorem ipsum&#39; mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero). Onde posso conseguí-lo? Existem muitas variações disponíveis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de alteração, seja por inserção de passagens com humor, ou palavras aleatórias que não parecem nem um pouco convincentes. Se você pretende usar uma passagem de Lorem Ipsum, precisa ter certeza de que não há algo embaraçoso escrito escondido no meio do texto. Todos os geradores de Lorem Ipsum na internet tendem a repetir pedaços predefinidos conforme necessário, fazendo deste o primeiro gerador de Lorem Ipsum autêntico da internet. Ele usa um dicionário com mais de 200 palavras em Latim combinado com um punhado de modelos de estrutura de frases para gerar um Lorem Ipsum com aparência razoável, livre de repetições, inserções de humor, palavras não características, etc.', 'R$3000,00', '70h semanais', '2023-11-13', '2023-11-25', 52);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `assinatura`
--
ALTER TABLE `assinatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUsuario_3` (`usuario_id`);

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUsuario_2` (`usuario_id`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nome` (`nome`) USING BTREE;

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`) USING BTREE,
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `usuarios_ibfk_1` (`perfil_id`),
  ADD KEY `senha` (`senha`) USING BTREE,
  ADD KEY `nome` (`nome`) USING BTREE;

--
-- Índices para tabela `usuario_has_vaga`
--
ALTER TABLE `usuario_has_vaga`
  ADD UNIQUE KEY `fk_unique_pk` (`usuario_id`,`vaga_id`),
  ADD KEY `FKUsuario_4` (`usuario_id`),
  ADD KEY `FKVaga` (`vaga_id`);

--
-- Índices para tabela `vaga`
--
ALTER TABLE `vaga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUsuario` (`usuario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assinatura`
--
ALTER TABLE `assinatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `vaga`
--
ALTER TABLE `vaga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `assinatura`
--
ALTER TABLE `assinatura`
  ADD CONSTRAINT `FKUsuario_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `FKUsuario_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);

--
-- Limitadores para a tabela `usuario_has_vaga`
--
ALTER TABLE `usuario_has_vaga`
  ADD CONSTRAINT `FKUsuario_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKVaga` FOREIGN KEY (`vaga_id`) REFERENCES `vaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vaga`
--
ALTER TABLE `vaga`
  ADD CONSTRAINT `FKUsuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
