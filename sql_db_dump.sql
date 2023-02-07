-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: buxmpjevkhtpybg7vayc-mysql.services.clever-cloud.com:3306
-- Generation Time: Feb 07, 2023 at 03:17 PM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buxmpjevkhtpybg7vayc`
--

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int UNSIGNED NOT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` int DEFAULT NULL,
  `order_total` int UNSIGNED NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`, `updated_at`) VALUES
(1, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 24, '2023-02-05 20:23:47.550'),
(2, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 12, '2023-02-05 20:32:59.616'),
(3, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 12, '2023-02-05 20:35:11.356'),
(4, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 12, '2023-02-05 20:37:22.799'),
(5, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 52, '2023-02-05 20:42:24.250'),
(6, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 8, '2023-02-07 08:10:38.378'),
(7, 'Albin', 'Lindeborg', 'Karlskronaplan 9', '214 36', 'Malmö', 'albin.lindeborg@gmail.com', NULL, 12, '2023-02-07 15:11:57.377');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItem`
--

CREATE TABLE `OrderItem` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `item_price` int UNSIGNED NOT NULL,
  `item_total` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OrderItem`
--

INSERT INTO `OrderItem` (`id`, `product_id`, `qty`, `item_price`, `item_total`, `order_id`) VALUES
(1, 1, 2, 12, 24, 1),
(2, 1, 1, 12, 12, 2),
(3, 1, 1, 12, 12, 3),
(4, 1, 1, 12, 12, 4),
(5, 1, 1, 12, 12, 5),
(6, 3, 3, 8, 24, 5),
(7, 2, 1, 8, 8, 5),
(8, 5, 1, 8, 8, 5),
(9, 2, 1, 8, 8, 6),
(10, 1, 1, 12, 12, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int UNSIGNED NOT NULL,
  `images` json DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int UNSIGNED NOT NULL,
  `on_sale` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `description`, `price`, `images`, `stock_status`, `stock_quantity`, `on_sale`) VALUES
(1, 'Gott & Blandat Giants', '<p>En mix av lakrits och gelé med fruktsmak</p>\\n<p>Innehållsförteckning: Socker, glukossirap, glukos-fruktossirap, stärkelse, VETEMJÖL, melass, syra (citronsyra), fuktighetsbevarande medel (sorbitoler, glycerol), lakritsextrakt, salt, vegetabiliska oljor (kokos, palm), aromer, färgämnen (E153, E120, E100, E141), ytbehandlingsmedel (bivax), stabiliseringsmedel (E471).</p>\\n<p><em>Alla priser är per skopa.</em></p>\\n', 12, '{\"large\": \"/storage/products/1997509.png\", \"thumbnail\": \"/storage/products/thumbnails/1997509-300x300.png\"}', 'instock', 5, 0),
(2, 'Banana Bubs', '<p>Banan/gräddkola</p>\\n<p>Innehållsförteckning: Glukos-fruktossirap, socker, majsstärkelse, vatten, surhetsreglerande medel (äppelsyra, natriumcitrat), potatisprotein, aromämnen, färgämnen: (E150d, E100), kokosolja, ytbehandlingsmedel (karnaubavax).</p>\\n<p><em>Alla priser är per skopa.</em></p>\\n', 8, '{\"large\": \"/storage/products/156622.png\", \"thumbnail\": \"/storage/products/thumbnails/156622-300x300.png\"}', 'instock', 8, 0),
(3, 'Banana Splits', '<p>Fyllig vitchoklad med smak av kola krispig banan.</p>\\n<p>Innehållsförteckning: Socker, kakaosmör, torkad banan, HELMJÖLKSPULVER, mjölksocker(LAKTOS), SKUMMJÖLKSPULVER, emulgeringsmedel E322 (SOJALECITIN), naturliga aromer, ytbehandlingsmedel (E414, E904).</p>\\n<p>Kan innehålla spår av MANDEL, NÖTTER och VETE.</p>\\n<p><em>Alla priser är per skopa.</em></p>\\n', 8, '{\"large\": \"/storage/products/3827741.png\", \"thumbnail\": \"/storage/products/thumbnails/3827741-300x300.png\"}', 'instock', 6, 0),
(4, 'Ananas', '<p>Ananas</p>\\n<p>Innehållsförteckning: Glukosirap, socker, majsstärkelse, gelatin, syror: citronsyra, aromämnen, vegetabiliska oljor (kokosnöt, palmkärna), glansmedel: bivax, carnaubavax, färger: E100, E133.</p>\\n<p><em>Alla priser är per skopa.</em></p>\\n', 9, '{\"large\": \"/storage/products/2147890-1.png\", \"thumbnail\": \"/storage/products/thumbnails/2147890-1-300x300.png\"}', 'outofstock', 0, 0),
(5, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\\n<p><em>Alla priser är per skopa.</em></p>\\n', 8, '{\"large\": \"/storage/products/1595204.png\", \"thumbnail\": \"/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4, 0),
(6, 'Center', '<p>Mjölkchokladpralin med toffeefyllning</p>\n<p>Innehållsförteckning: Socker, glukossirap, kakaosmör, vegetabiliska fetter (palm, shea), HELMJÖLKSPULVER, kakaomassa, SKUMMJÖLKSPULVER, VASSLEPULVER (MJÖLK), salt, aromer (bl.a. vanillin), emulgeringsmedel (SOJALECITIN).</p>\n<p>Kan innehålla NÖTTER.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"/storage/products/200423.png\", \"thumbnail\": \"/storage/products/thumbnails/200423-300x300.png\"}', 'instock', 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `applied_steps_count`) VALUES
('96a8c67e-efa4-4a9c-8ae0-25efb6b31b90', '30a317a403cd47ea726c00fefe1da4ee067ed1b160d964eb1dad561c7bbc1b22', '2023-02-05 11:35:02.727', '20230205113340_init', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_product_id_fkey` (`product_id`),
  ADD KEY `OrderItem_order_id_fkey` (`order_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `OrderItem`
--
ALTER TABLE `OrderItem`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD CONSTRAINT `OrderItem_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
