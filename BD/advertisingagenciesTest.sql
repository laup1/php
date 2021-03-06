-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 12 Octobre 2018 à 05:19
-- Version du serveur :  5.5.58
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `advertisingagencies`
--

-- --------------------------------------------------------

--
-- Structure de la table `agencies`
--

CREATE TABLE IF NOT EXISTS `agencies` (
  `id` int(11) NOT NULL,
  `agencie_details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date,
  `modified` date,
  `user_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
   `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `agencies`
--

INSERT INTO `agencies` (`id`, `agencie_details`, `created`, `modified`, `user_id`, `code_id`, `subcategory_id`) VALUES
(4, 'agency1', '2018-10-09', '2018-10-09', 5, 1,0),
(5, 'agency2', '2018-10-09', '2018-10-09', 6, 1,0),
(6, 'agencie5', '2018-10-09', '2018-10-09', 5, 1,0),
(7, 'agencie15', '2018-10-10', '2018-10-10', 5, 1,0);

-- --------------------------------------------------------

--
-- Structure de la table `agencies_files`
--

CREATE TABLE IF NOT EXISTS `agencies_files` (
  `id` int(11) NOT NULL,
  `agencie_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `agencies_files`
--

INSERT INTO `agencies_files` (`id`, `agencie_id`, `file_id`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 6, 1),
(4, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `agencies_tags`
--

CREATE TABLE IF NOT EXISTS `agencies_tags` (
  `agencie_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `codes`
--

CREATE TABLE IF NOT EXISTS `codes` (
  `id` int(11) NOT NULL,
  `code_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `codes`
--

INSERT INTO `codes` (`id`, `code_description`, `created`, `modified`) VALUES
(1, 'gouvernement', '2018-08-27', '2018-08-27');

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `files`
--

INSERT INTO `files` (`id`, `name`, `path`, `created`, `modified`, `status`) VALUES
(1, 'Tulips.jpg', 'Files/', '2018-10-09', '2018-10-09', 1);

-- --------------------------------------------------------

--
-- Structure de la table `i18n`
--

CREATE TABLE IF NOT EXISTS `i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `i18n`
--

INSERT INTO `i18n` (`id`, `locale`, `model`, `foreign_key`, `field`, `content`) VALUES
(1, 'es', 'Invoices', 3, 'invoice_details', 'pagado'),
(2, 'en', 'Invoices', 3, 'invoice_details', 'paid'),
(3, 'es', 'Invoices', 4, 'invoice_details', 'hablar con la persona'),
(4, 'en', 'Invoices', 4, 'invoice_details', 'speak with the person');

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL,
  `agencie_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `invoice_details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `invoices`
--

INSERT INTO `invoices` (`id`, `agencie_id`, `status_id`, `invoice_details`, `created`, `modified`) VALUES
(3, 4, 1, 'payé', '2018-10-10', '2018-10-11'),
(4, 5, 2, 'parler avec la personne', '2018-10-11', '2018-10-11');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL,
  `description_Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `status`
--

INSERT INTO `status` (`id`, `description_Status`, `created`, `modified`) VALUES
(1, 'payee', '2018-08-27', '2018-08-27'),
(2, 'payée', '2018-10-09', '2018-10-11'),
(3, 'annulé', '2018-10-09', '2018-10-11'),
(4, 'en attente', '2018-10-09', '2018-10-09'),
(5, 'en retard', '2018-10-09', '2018-10-09');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'tag1', '2018-10-09', '2018-10-09');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agencie'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `created`, `modified`, `username`, `email`, `password`, `type`) VALUES
(5, '2018-10-09', '2018-10-09', 'cryspelo', 'arhalltraste@hotmail.com', '$2y$10$U2IaenpdF1nOwj8XvQ0xDOZRffH8H9D2kvDsauJ5ibf17usH8/LcG', 'agencie'),
(6, '2018-10-09', '2018-10-09', 'admin', 'laurent_perez@hotmail.com', '$2y$10$gVRzGQk0/R5r8BxeOSKS.uYPE3raLxqg65wUo40/MdwTsM03nrsbq', 'admin'),
(10, '2018-10-12', '2018-10-12', 'kkk', 'williamzeus91@hotmail.com', '$2y$10$.ItlaQgLKNlUsZSfVBbf/.YtjmkPSwRVbFz5nbD0y1qM/km5QkY/y', 'agencie'),
(11, '2018-10-12', '2018-10-12', 'rocio', 'laurenrpl0@gmail.com', '$2y$10$kJdXTHQJOMTFHfHxWwu9/.M9cREMatdwnVJwv1NtVGhVBVxmIEN0q', 'agencie'),
(12, '2018-10-12', '2018-10-12', 'jaja', 'jaja@jajaj.jaja', '$2y$10$NhOHNUuWgZq3qTup5h9d7OWgwLNc6rOmoBKxMjuLFO6vng9Tb9vKC', 'agencie');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `code_id` (`code_id`) USING BTREE;

--
-- Index pour la table `agencies_files`
--
ALTER TABLE `agencies_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agency_id` (`agencie_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Index pour la table `agencies_tags`
--
ALTER TABLE `agencies_tags`
  ADD PRIMARY KEY (`agencie_id`),
  ADD KEY `tag_id` (`tag_id`),
  ADD KEY `tag_id_2` (`tag_id`);

--
-- Index pour la table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status_id` (`status_id`),
  ADD KEY `agency_id` (`agencie_id`) USING BTREE;

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `agencies_files`
--
ALTER TABLE `agencies_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `agencies_tags`
--
ALTER TABLE `agencies_tags`
  MODIFY `agencie_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `agencies_ibfk_2` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agencies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `agencies_files`
--
ALTER TABLE `agencies_files`
  ADD CONSTRAINT `agencies_files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agencies_files_ibfk_3` FOREIGN KEY (`agencie_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `agencies_tags`
--
ALTER TABLE `agencies_tags`
  ADD CONSTRAINT `agencies_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agencies_tags_ibfk_2` FOREIGN KEY (`agencie_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `FK_Agencies_Invoices` FOREIGN KEY (`agencie_id`) REFERENCES `agencies` (`id`),
  ADD CONSTRAINT `FK_Status_Invoices` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
