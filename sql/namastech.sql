--
-- Database: `namastech`
--

--
-- Estrutura da tabela `desenvolvimento`
--

CREATE TABLE `desenvolvimento` (
  `id` int(11) NOT NULL,
  `arquivo` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `aprovado` int(1) DEFAULT NULL,
  `data` date NOT NULL,
  `id_projeto` int(11) NOT NULL
);

--
-- Extraindo dados da tabela `desenvolvimento`
--

INSERT INTO `desenvolvimento` (`id`, `arquivo`, `aprovado`, `data`, `id_projeto`) VALUES
(5, 'arquivo.docx', 0, '2016-11-02', 1),
(4, 'arquivo2.docx', NULL, '2016-11-01', 1);

--
-- Estrutura da tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `id_projeto` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `valor` float NOT NULL,
  `aprovado` int(1) DEFAULT NULL,
  `data` date NOT NULL
);

--
-- Extraindo dados da tabela `financeiro`
--

INSERT INTO `financeiro` (`id`, `id_projeto`, `status_id`, `valor`, `aprovado`, `data`) VALUES
(1, 1, 1, 1100, NULL, '2016-11-02'),
(2, 1, 1, 1400, 0, '2016-11-02'),
(3, 2, 2, 900, 0, '2016-11-01');

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `id` int(11) NOT NULL,
  `cod_projeto` varchar(5) COLLATE utf8_swedish_ci NOT NULL,
  `quantidade` int(11) NOT NULL,
  `descricao` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `nome_cliente` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `observacao` varchar(300) COLLATE utf8_swedish_ci DEFAULT NULL
);

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`id`, `cod_projeto`, `quantidade`, `descricao`, `ativo`, `nome_cliente`, `observacao`) VALUES
(7, '2', 100, 'Folhetos', 1, 'Novo Cliente', NULL);


--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_swedish_ci NOT NULL
);

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'Pré Orçamento'),
(2, 'Orçamento');


--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `login` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `type` set('CLI','DEV','FIN','MAR') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `name`, `login`, `password`, `type`) VALUES
(1, 'Usuario', 'usuario', 'senha', 'FIN'),
(2, 'usuario', 'usuario', 'senha', 'CLI'),
(3, 'usuario', 'usuario', 'senha', 'DEV'),
(4, 'usuario', 'usuario', 'senha', 'MAR');


ALTER TABLE `desenvolvimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_projeto` (`id_projeto`);

ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `id_projeto` (`id_projeto`);

ALTER TABLE `projeto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod_projeto` (`cod_projeto`),
  ADD KEY `cod_projeto_2` (`cod_projeto`);

ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `desenvolvimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `projeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;