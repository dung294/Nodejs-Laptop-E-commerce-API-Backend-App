-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 06:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'LG', 1, '2024-05-13 03:23:39', '2024-05-13 03:23:39'),
(2, 'HP', 1, '2024-05-13 03:23:54', '2024-05-13 03:23:54'),
(3, 'Dell', 1, '2024-05-13 03:24:02', '2024-05-13 03:24:02'),
(4, 'MSI', 1, '2024-05-13 03:24:14', '2024-05-13 03:24:14'),
(5, 'Lenovo', 1, '2024-05-13 03:24:22', '2024-05-13 03:24:22'),
(6, 'AUSUS', 1, '2024-05-13 03:24:36', '2024-05-13 03:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `laptop_id`, `qty`, `createdAt`, `updatedAt`) VALUES
(15, 7, 3, 1, '2024-05-23 17:00:27', '2024-05-23 17:00:27'),
(16, 7, 2, 1, '2024-05-23 17:07:26', '2024-05-23 17:07:26'),
(17, 7, 1, 1, '2024-05-27 04:05:01', '2024-05-27 04:05:01'),
(21, 8, 3, 1, '2024-05-27 04:42:43', '2024-05-27 04:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_image`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Laptop Gaming', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716396629/8ed8ded0-30db-11ea-9ffa-63728c0e08f8_rmjjza.jpg', 1, '2024-05-23 00:56:08', '2024-05-23 00:56:08'),
(2, 'Office', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716399807/h732_7df2b97f9362401f8ebaa3c780748c77_grande_zvkxyu.webp', 1, '2024-05-23 00:57:53', '2024-05-23 00:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `categorylaptops`
--

CREATE TABLE `categorylaptops` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorylaptops`
--

INSERT INTO `categorylaptops` (`id`, `category_id`, `laptop_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, '2024-05-23 00:57:06', '2024-05-23 00:57:06'),
(2, 2, 1, '2024-05-23 00:58:35', '2024-05-23 00:58:35'),
(3, 1, 3, '2024-05-23 01:10:49', '2024-05-23 01:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `detaillaptops`
--

CREATE TABLE `detaillaptops` (
  `id` int(11) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `rom` varchar(255) NOT NULL,
  `card_vga` varchar(255) DEFAULT NULL,
  `webcam` varchar(255) NOT NULL,
  `connect` varchar(255) NOT NULL,
  `weight` float NOT NULL,
  `pin` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detaillaptops`
--

INSERT INTO `detaillaptops` (`id`, `cpu`, `ram`, `rom`, `card_vga`, `webcam`, `connect`, `weight`, `pin`, `os`, `desc`, `other`, `createdAt`, `updatedAt`) VALUES
(1, 'm1', 'ddr4', '256gb', 'co', '300px', '2 Type-C', 1.5, '100 w', 'windown 11', 'Laptop gaming ASUS ROG Strix G16 G614JVR N4141W đây là một trong những chiếc laptop chuyên game cực khủng bởi nó mang trong mình một hiệu năng vượt trội từ những linh kiện cao cấp.', NULL, '2024-05-23 00:06:23', '2024-05-23 00:06:23'),
(2, 'Intel® Core™ i9-14900HX', '64GB', '2TB', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 99, 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090.Stereo speakers (super linear speaker), 2W x2, audio by HARMAN, optimized with Nahimic Audio, Smart Amplifier (AMP)', 'Stereo speakers (super linear speaker), 2W x2, audio by HARMAN, optimized with Nahimic Audio, Smart Amplifier (AMP)', '2024-05-16 01:07:17', '2024-05-23 01:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `laptop_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`, `image_name`, `laptop_id`, `createdAt`, `updatedAt`) VALUES
(1, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716396629/8ed8ded0-30db-11ea-9ffa-63728c0e08f8_rmjjza.jpg', 'shop_laptop/laptops/prxcshiqkw7ulo0wo0n7', 1, '2024-05-13 03:58:09', '2024-05-13 03:58:09'),
(2, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1715572688/shop_laptop/laptops/lponplzfwlt1dhx9707y.jpg', 'shop_laptop/laptops/lponplzfwlt1dhx9707y', 2, '2024-05-13 03:58:09', '2024-05-13 03:58:09'),
(3, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716401141/ava_cb6020f8edcc4099b555e6092b9137a9_grande_je9wk4.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716401141/ava_cb6020f8edcc4099b555e6092b9137a9_grande_je9wk4.webp', 3, '2024-05-22 20:14:34', '2024-05-22 20:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `inforshippings`
--

CREATE TABLE `inforshippings` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `ward_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inforshippings`
--

INSERT INTO `inforshippings` (`id`, `address`, `phone`, `ward_id`, `district_id`, `createdAt`, `updatedAt`) VALUES
(6, 'vn Phường Hoà Quý Quận Ngũ Hành Sơn Điện Biên', '089555455566', 40402, 1529, '2024-05-23 15:13:43', '2024-05-23 15:13:43'),
(7, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', '07889966666', 220713, 2194, '2024-05-23 17:17:03', '2024-05-23 17:17:03'),
(8, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', '0809595955', 90816, 2264, '2024-05-27 03:12:23', '2024-05-27 03:12:23'),
(9, 'g Xã Việt Hưng Huyện Văn Lâm Hòa Bình', '0', 220911, 2046, '2024-05-27 03:40:58', '2024-05-27 03:40:58'),
(10, 'KTX VKU Xã Hợp Phong Huyện Cao Phong Lai Châu', '0826262626', 800035, 2087, '2024-05-27 04:37:22', '2024-05-27 04:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE `laptops` (
  `id` int(11) NOT NULL,
  `laptop_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`id`, `laptop_name`, `qty`, `price`, `status`, `brand_id`, `detail_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Asus Zenbook 14 Flip', 4, 1100000, 1, 6, 1, '2024-05-22 23:59:41', '2024-05-22 23:59:41'),
(2, 'Iphone 15 ProMax', 2, 4000000, 1, 6, 1, '2024-05-22 23:45:30', '2024-05-22 23:45:35'),
(3, 'Laptop gaming Lenovo Legion 9 16IRX9 83G0001AVN', 9, 136990000, 1, 5, 2, '2024-05-23 01:09:06', '2024-05-23 01:09:06');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `laptop_id`, `order_id`, `price`, `qty`, `createdAt`, `updatedAt`) VALUES
(8, 1, 34, 1100000, 1, '2024-05-27 04:03:10', '2024-05-27 04:03:10'),
(9, 3, 35, 136990000, 1, '2024-05-27 04:03:45', '2024-05-27 04:03:45'),
(16, 3, 37, 136990000, 1, '2024-05-27 04:43:24', '2024-05-27 04:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total_product` double NOT NULL,
  `total` double NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `shipping_id`, `user_id`, `payment_id`, `status`, `total_product`, `total`, `createdAt`, `updatedAt`) VALUES
(32, 11, 7, 1, 0, 1111, 11, '2024-05-27 11:00:11', '2024-05-27 11:04:42'),
(33, 32, 7, 1, 0, 1100000, 1133300, '2024-05-27 04:00:20', '2024-05-27 04:00:20'),
(34, 33, 7, 1, 0, 1100000, 1133300, '2024-05-27 04:03:10', '2024-05-27 04:03:10'),
(35, 34, 7, 1, 0, 136990000, 137010000, '2024-05-27 04:03:45', '2024-05-27 04:03:45'),
(37, 36, 8, 1, 0, 136990000, 137010000, '2024-05-27 04:43:24', '2024-05-27 04:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `value`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'COD', 'R1', 1, '2024-05-13 03:27:02', '2024-05-13 03:27:02'),
(2, 'Zalo pay', 'R2', 1, '2024-05-13 03:27:31', '2024-05-13 03:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `value`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'R1', '2024-05-13 10:19:33', '2024-05-13 10:21:02'),
(2, 'user', 'R2', '2024-05-13 10:19:47', '2024-05-13 10:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230301021315-create-image.js'),
('crate-brand.js'),
('crate-user.js'),
('create-cart.js'),
('create-category.js'),
('create-categoryLaptop.js'),
('create-detail-laptop.js'),
('create-inforShipping.js'),
('create-laptop.js'),
('create-order_detal.js'),
('create-order.js'),
('create-payment.js'),
('create-role.js'),
('create-shipping.js'),
('create-slider.js'),
('create-userInforShipping.js');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `fees_ship` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `address`, `phone`, `fees_ship`, `notes`, `createdAt`, `updatedAt`) VALUES
(11, 'vn Phường Hoà Quý Quận Ngũ Hành Sơn Điện Biên', 2147483647, 20000, 'Notes ', '2024-05-23 17:10:29', '2024-05-23 17:10:29'),
(16, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', 2147483647, 20000, 'Notes ', '2024-05-23 17:17:25', '2024-05-23 17:17:25'),
(19, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', 2147483647, 20000, 'Notes ', '2024-05-23 17:25:19', '2024-05-23 17:25:19'),
(20, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', 2147483647, 20000, 'Notes ', '2024-05-23 17:26:18', '2024-05-23 17:26:18'),
(21, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', 2147483647, 20000, 'Notes ', '2024-05-23 17:26:53', '2024-05-23 17:26:53'),
(22, 'vn Xã Tống Phan Huyện Phù Cừ Hưng Yên', 2147483647, 20000, 'Notes ', '2024-05-27 03:01:20', '2024-05-27 03:01:20'),
(23, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 03:12:55', '2024-05-27 03:12:55'),
(24, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 03:14:25', '2024-05-27 03:14:25'),
(27, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 03:40:01', '2024-05-27 03:40:01'),
(28, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 03:42:44', '2024-05-27 03:42:44'),
(29, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 03:46:43', '2024-05-27 03:46:43'),
(30, 'Ktx Viet Han', 1234, 33300, 'Hang de vo xin nhe tay', '2024-05-27 03:54:44', '2024-05-27 03:54:44'),
(31, 'Ktx Viet Han', 1234, 33300, 'Hang de vo xin nhe tay', '2024-05-27 03:57:05', '2024-05-27 03:57:05'),
(32, 'Ktx Viet Han', 1234, 33300, 'Hang de vo xin nhe tay', '2024-05-27 04:00:20', '2024-05-27 04:00:20'),
(33, 'Ktx Viet Han', 1234, 33300, 'Hang de vo xin nhe tay', '2024-05-27 04:03:10', '2024-05-27 04:03:10'),
(34, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 809595955, 20000, 'Notes ', '2024-05-27 04:03:45', '2024-05-27 04:03:45'),
(35, 'KTX VKU Xã Hợp Phong Huyện Cao Phong Lai Châu', 826262626, 120000, 'Notes ', '2024-05-27 04:37:26', '2024-05-27 04:37:26'),
(36, 'KTX VKU Xã Hợp Phong Huyện Cao Phong Lai Châu', 826262626, 20000, 'Notes ', '2024-05-27 04:43:24', '2024-05-27 04:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `path`, `image_name`, `createdAt`, `updatedAt`) VALUES
(1, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716396591/web_slider_800x400_nang_cap_ram_374b4f778d694ad995c4dc40c6f59e9e_w7bfsv.webp', 'shop_laptop/slider/dfpxkg9o2qbm3jvtrkaf', '2024-05-22 23:50:52', '2024-05-22 23:50:52'),
(2, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1715571206/shop_laptop/slider/qnxzgfk9w1tqc5baxer4.jpg', 'shop_laptop/slider/qnxzgfk9w1tqc5baxer4', '2024-05-13 03:33:26', '2024-05-13 03:33:26'),
(3, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1715571204/shop_laptop/slider/nwnl6ae6w6qxibwcrum9.jpg', 'shop_laptop/slider/nwnl6ae6w6qxibwcrum9', '2024-05-13 03:33:26', '2024-05-13 03:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `userinforshippings`
--

CREATE TABLE `userinforshippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inforShipping_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinforshippings`
--

INSERT INTO `userinforshippings` (`id`, `user_id`, `inforShipping_id`, `status`, `createdAt`, `updatedAt`) VALUES
(8, 7, 8, 1, '2024-05-27 03:41:42', '2024-05-27 03:41:42'),
(9, 7, 9, 0, '2024-05-27 03:41:42', '2024-05-27 03:41:42'),
(10, 8, 10, 1, '2024-05-27 04:37:22', '2024-05-27 04:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `type_account` varchar(255) NOT NULL DEFAULT 'local',
  `provider_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `type_account`, `provider_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Le Van Hanh ', 'hanh2@gmail.com', '$2a$10$1B1UIUBK.VTNV5hyVpnjEOlBWAdSSzWa0DXUnzJpm75OdGDiZvj7q', 1, 'local', NULL, '2024-05-13 03:20:22', '2024-05-13 10:23:10'),
(2, 'Nguyen Van Dung', 'dung@gmail.com', '$2a$10$7CiQtuHB7TChDxd5w3eM2.eiuTls8PMAWK.L1EqZZr9EoRZhhsE8W', 2, 'local', NULL, '2024-05-13 04:02:21', '2024-05-13 04:02:21'),
(3, 'quan', 'quan@gmail.com', '$2a$10$WpvQpo.M0R4SO/MRlZzAmePwCbTbao5CXiTrefWW6t7goQqqj0i0O', 2, 'local', NULL, '2024-05-13 12:58:01', '2024-05-13 12:58:01'),
(4, 'CasssanoQuan', 'a@gmail.com', '$2a$10$/uBgl8AJ9lJEhBmEFIUaL.QXtnczFpefrVAERoJpEq3a3M0sXJew6', 2, 'local', NULL, '2024-05-13 15:06:56', '2024-05-13 15:06:56'),
(5, 'A ', 'b@gmail.com', '$2a$10$dXVPM1NmIv7.mRcUs8.E7OAk7L1Z/5zEIgQBJYgUIB/G7O812as2i', 2, 'local', NULL, '2024-05-22 16:22:36', '2024-05-22 16:22:36'),
(6, 'TestAcc', 'c@gmail.com', '$2a$10$KxizqB9UIdP5sGEFW7ZOS.xStYe6G9q8kv6aDH/KlPzzxW.qRo9eC', 2, 'local', NULL, '2024-05-22 18:00:55', '2024-05-22 18:00:55'),
(7, 'Test2', 'd@gmail.com', '$2a$10$WUe8sJrRIYV.p1muCA7u0.PiKqHixk7yhhTSNIAgww0FLahwdDHc2', 2, 'local', NULL, '2024-05-22 18:12:36', '2024-05-22 18:12:36'),
(8, 'Anh Quan', 'f@gmail.com', '$2a$10$5NQ5NsF/L6gdouR8phGrseKilvB0v4ZOMbdzjcag3BqrNpyy9Lq4y', 2, 'local', NULL, '2024-05-27 04:36:15', '2024-05-27 04:36:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_fkey__laptops` (`laptop_id`),
  ADD KEY `carts_fkey__users` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorylaptops`
--
ALTER TABLE `categorylaptops`
  ADD PRIMARY KEY (`id`,`category_id`,`laptop_id`),
  ADD KEY `category_fkey__categoryLaptop` (`category_id`),
  ADD KEY `categorylaptops_fkey_laptop` (`laptop_id`);

--
-- Indexes for table `detaillaptops`
--
ALTER TABLE `detaillaptops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_fkey__laptops` (`laptop_id`);

--
-- Indexes for table `inforshippings`
--
ALTER TABLE `inforshippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laptops_fkey__brand` (`brand_id`),
  ADD KEY `laptop_fkey_constraint_detail` (`detail_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetails_fkey_orders` (`order_id`),
  ADD KEY `orderdetails_fkey_laptop` (`laptop_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_fkey_shipping11` (`shipping_id`),
  ADD KEY `orders_fkey_payments111` (`payment_id`),
  ADD KEY `orders_ibfk_1` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinforshippings`
--
ALTER TABLE `userinforshippings`
  ADD PRIMARY KEY (`id`,`user_id`,`inforShipping_id`),
  ADD KEY `category_fkey__UserInforShipping` (`user_id`),
  ADD KEY `UserInforShippings_fkey_laptop` (`inforShipping_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_fkey_roles` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorylaptops`
--
ALTER TABLE `categorylaptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detaillaptops`
--
ALTER TABLE `detaillaptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inforshippings`
--
ALTER TABLE `inforshippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laptops`
--
ALTER TABLE `laptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userinforshippings`
--
ALTER TABLE `userinforshippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_fkey__laptops` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_fkey__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categorylaptops`
--
ALTER TABLE `categorylaptops`
  ADD CONSTRAINT `category_fkey__categoryLaptop` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categorylaptops_fkey_laptop` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_fkey__laptops` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laptops`
--
ALTER TABLE `laptops`
  ADD CONSTRAINT `laptop_fkey_constraint_detail` FOREIGN KEY (`detail_id`) REFERENCES `detaillaptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laptops_fkey__brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_fkey_laptop` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_fkey_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fkey_payments111` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_fkey_shipping11` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userinforshippings`
--
ALTER TABLE `userinforshippings`
  ADD CONSTRAINT `UserInforShippings_fkey_laptop` FOREIGN KEY (`inforShipping_id`) REFERENCES `inforshippings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_fkey__UserInforShipping` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_fkey_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
