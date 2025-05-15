-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/05/2025 às 23:43
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ezoom_backend`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(3, '2025-05-12-203957', 'App\\Database\\Migrations\\CreateNotificationsTable', 'default', 'App', 1747247837, 1),
(4, '2025-05-13-201713', 'App\\Database\\Migrations\\CreateUsersTable', 'default', 'App', 1747247837, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 0, '2025-05-14 19:47:31', '2025-05-14 19:47:31'),
(2, 12, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 0, '2025-05-14 20:34:10', '2025-05-14 20:34:10'),
(3, 12, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 0, '2025-05-14 20:40:20', '2025-05-14 20:40:20'),
(4, 10, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 1, '2025-05-14 20:40:34', '2025-05-14 20:41:26'),
(5, 10, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 1, '2025-05-14 20:47:25', '2025-05-14 20:58:48'),
(6, 11, 'Bem-vindo(a)!', 'Essa é sua primeira notificação.', 1, '2025-05-14 20:50:47', '2025-05-15 13:56:24'),
(7, 11, 'oir', 'gdsgsdgf', 1, '2025-05-15 02:35:43', '2025-05-15 13:55:37'),
(8, 11, 'testetets', 'fdsafasfasfasfdasfdasfasdfads', 1, '2025-05-15 02:55:17', '2025-05-15 13:52:48'),
(9, 11, 'teste', 'tegsdgadg', 1, '2025-05-15 03:07:20', '2025-05-15 13:52:29'),
(10, 11, 'safdasf', 'fdsafsaf', 1, '2025-05-15 03:08:31', '2025-05-15 13:44:46'),
(11, 11, 'fdasfdasfsa', 'fdsafdsafdsa', 1, '2025-05-15 03:11:03', '2025-05-15 13:52:26'),
(12, 11, 'fdsafdasfsa', 'fdsafsafdsaf', 1, '2025-05-15 03:12:42', '2025-05-15 13:40:46'),
(13, 11, 'fsdfasfsafdsafdsa', 'fdsafasfdsa', 1, '2025-05-15 03:16:18', '2025-05-15 13:31:56'),
(14, 11, 'dasdadasdas', 'dasdadasdasdasdadasdas', 1, '2025-05-15 13:32:57', '2025-05-15 13:40:44'),
(15, 11, 'testesss', 'testessstestesss', 1, '2025-05-15 13:34:39', '2025-05-15 13:38:11'),
(16, 11, 'testeterefasdfdsafsafdsafasfsdafasdfdsafdsafdsafdsafdsafdsafdsafdsafsd', 'fdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, '2025-05-15 13:40:16', '2025-05-15 13:52:24'),
(17, 11, 'fafdasfadsfd', 'fdfasfsafdsa', 1, '2025-05-15 13:57:16', '2025-05-15 15:10:30'),
(18, 11, 'fdsafsafd', 'fdsafasdfdas', 1, '2025-05-15 13:57:21', '2025-05-15 17:05:12'),
(19, 11, 'fdsafdsa', 'fdasfdsaf', 1, '2025-05-15 13:57:25', '2025-05-15 13:59:51'),
(20, 11, 'testess', 'testesstestesstestesstestesstestesstestess', 1, '2025-05-15 15:11:38', '2025-05-15 17:05:16'),
(21, 11, 'csadvdsaf', 'dsfasafdas', 1, '2025-05-15 15:15:37', '2025-05-15 15:20:30'),
(22, 11, '11', '11', 1, '2025-05-15 15:36:17', '2025-05-15 15:42:09'),
(23, 11, 'hgdasfsadf', 'fdsafdas', 1, '2025-05-15 16:08:22', '2025-05-15 17:10:35'),
(24, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:23', '2025-05-15 17:07:23'),
(25, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(26, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(27, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(28, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(29, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(30, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(31, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(32, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(33, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(34, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(35, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:24', '2025-05-15 17:07:24'),
(36, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(37, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(38, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(39, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(40, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(41, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(42, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(43, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(44, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(45, 19, 'teste notificação', 'teste notificação teste', 0, '2025-05-15 17:07:25', '2025-05-15 17:07:25'),
(46, 19, 'Teste', 'teste teste', 0, '2025-05-15 17:09:14', '2025-05-15 17:09:14'),
(47, 11, 'Teste', 'Teste', 1, '2025-05-15 17:10:24', '2025-05-15 17:14:34'),
(48, 11, 'Título de teste', 'Mensagem de teste', 1, '2025-05-15 17:14:22', '2025-05-15 17:14:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `role`, `created_at`, `updated_at`) VALUES
(1, 'teste@exemplo.com', '$2y$12$4pX5khcoHoubA2rBxlk5pOeeNzB6RDutztgp0/6Qm0a2XsCaSkxXC', 'user', '2025-05-14 18:56:55', '2025-05-14 18:56:55'),
(2, 'teste@exemplo.com', '$2y$12$rz9L67xXr186F1kZMa3WkuvsYIoOvKw28RsuFxAK0AJUQUmTOmFV.', 'user', '2025-05-14 18:57:25', '2025-05-14 18:57:25'),
(3, 'teste@exemplo.com', '$2y$12$ekNI3cfu8JjmGMRWx.xz..zPl.7iStbr5ozGWkPzcFBWjOoeJajTe', 'admin', '2025-05-14 19:28:05', '2025-05-14 19:28:05'),
(4, 'teste@exemplo.com', '$2y$12$3qUuY/zr0KVTBN1yC6MYZe7cbfBrXmGNypxDByw5qS3S13CU9NCtu', 'user', '2025-05-14 19:28:25', '2025-05-14 19:28:25'),
(5, 'teste@exemplo.com', '$2y$12$.yR0RYG0NaOivVaRdRVvXO3HxNhqdPPHnrPq12/poAxhZABLgyb9m', 'user', '2025-05-14 19:29:32', '2025-05-14 19:29:32'),
(7, 'teste@exemplo.com', '$2y$12$GLhGd7jgySSlOKN6Iuldpe2NgOtpticG3lYwoycCS9lccKZSJGWmi', 'admin', '2025-05-14 19:29:45', '2025-05-14 19:29:45'),
(8, 'teste1@exemplo.com', '$2y$12$VjKRFTLwi9SBLnLJMHpX..VjKIIpgzffITGvcOOfCHP8fhxOOoSoW', 'admin', '2025-05-14 19:32:35', '2025-05-14 19:32:35'),
(9, 'teste2@exemplo.com', '$2y$12$FydspbZAqtKQxEz4ynGN9OmMyCeNow9d/zPS9OCs90ukLwl662wf.', 'admin', '2025-05-14 19:32:40', '2025-05-14 19:32:40'),
(10, 'teste3@exemplo.com', '$2y$12$P1oVMQUh89Nxzv7q8i7.1.qAe4fH/JEOsN7KApG.rLL6MbBCbA.OK', 'user', '2025-05-14 19:32:55', '2025-05-14 19:32:55'),
(11, 'teste4@exemplo.com', '$2y$12$Xc/uejqcG7zkaJDtn7IjvuKRS7vN.QYBZZKcEs1DPM1c2oYsc1fPC', 'user', '2025-05-14 19:43:19', '2025-05-14 19:43:19'),
(12, 'teste5@exemplo.com', '$2y$12$bReeUOSaWi44tCibXTqWz.IBaT4Y6XUzXNwEsbnNeqkwxCKfwMU.y', 'admin', '2025-05-14 19:44:06', '2025-05-14 19:44:06');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
