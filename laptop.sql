-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2024 at 03:46 AM
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
(21, 8, 3, 1, '2024-05-27 04:42:43', '2024-05-27 04:42:43'),
(24, 9, 5, 1, '2024-05-27 15:45:59', '2024-05-27 15:45:59'),
(25, 9, 6, 1, '2024-05-27 15:48:04', '2024-05-27 15:48:04'),
(26, 10, 3, 1, '2024-05-27 16:01:47', '2024-05-27 16:01:47'),
(28, 11, 2, 2, '2024-05-29 14:32:50', '2024-05-29 21:33:15'),
(29, 11, 3, 1, '2024-05-29 16:48:02', '2024-05-29 16:48:02'),
(32, 13, 5, 1, '2024-06-20 16:14:13', '2024-06-20 16:14:13');

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
(3, 1, 3, '2024-05-23 01:10:49', '2024-05-23 01:10:49'),
(4, 1, 4, '2024-05-27 22:30:02', '2024-05-27 22:30:02'),
(5, 1, 6, '2024-05-27 22:41:37', '2024-05-27 22:41:37'),
(7, 1, 5, '2024-05-27 22:41:51', '2024-05-27 22:41:51'),
(8, 2, 7, '2024-05-27 22:44:55', '2024-05-27 22:44:55'),
(9, 2, 8, '2024-05-30 00:14:31', '2024-05-30 00:14:31');

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
(2, 'Intel® Core™ i9-14900HX', '64GB', '2TB', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 99, 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090', 'NVIDIA® GeForce RTX™ 4090.Stereo speakers (super linear speaker), 2W x2, audio by HARMAN, optimized with Nahimic Audio, Smart Amplifier (AMP)', 'Stereo speakers (super linear speaker), 2W x2, audio by HARMAN, optimized with Nahimic Audio, Smart Amplifier (AMP)', '2024-05-16 01:07:17', '2024-05-23 01:07:17'),
(3, 'Intel® Core™ Ultra 7 Processor 155H 1.4 GHz', '16GB ', '16GB ', 'Intel® Arc™ Graphics', '2x Thunderbolt', '2x Thunderbolt', 23, '4 Cells 75WHrs', 'windown 11', 'ASUS Vivobook S 16 OLED (S5606) với sức mạnh vượt trội từ Chip AI Intel® Core™ Ultra 7 cùng phím tắt Co-pilot đảm bảo hiệu năng xử lý mọi tác vụ mượt mà & nhanh chóng. Thiết kế mỏng nhẹ trong khung máy hoàn toàn bằng kim loại cho tính di động tuyệt đối. T', 'Mist Blue Aluminum', '2024-05-27 22:28:11', '2024-05-27 22:28:11');

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
(3, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716401141/ava_cb6020f8edcc4099b555e6092b9137a9_grande_je9wk4.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716401141/ava_cb6020f8edcc4099b555e6092b9137a9_grande_je9wk4.webp', 3, '2024-05-22 20:14:34', '2024-05-22 20:14:34'),
(4, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716823229/s-vivobook-s-16-oled-s5606ma-mx051w_1_b0f568af3bfe48c399c99a9ae7e3d0f8_8ea43a50f21a4d4290752931ecf1b7b5_grande_ekurmo.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716823229/s-vivobook-s-16-oled-s5606ma-mx051w_1_b0f568af3bfe48c399c99a9ae7e3d0f8_8ea43a50f21a4d4290752931ecf1b7b5_grande_ekurmo.webp', 4, '2024-05-27 22:32:02', '2024-05-27 22:32:04'),
(5, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824035/z4252850982548_99a43e5e8d9b75aa366d4218b0e490dd_1270958bea714520abedd34975c345d3_grande_v0dtku.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824035/z4252850982548_99a43e5e8d9b75aa366d4218b0e490dd_1270958bea714520abedd34975c345d3_grande_v0dtku.webp', 5, '2024-05-27 17:36:00', '2024-05-27 17:36:00'),
(6, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824036/gearvn-laptop-gaming-gigabyte-g5-mf5-h2vn353sh-1_5b796e3e07a24cada88712168c0d71d4_grande_polsmb.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824036/gearvn-laptop-gaming-gigabyte-g5-mf5-h2vn353sh-1_5b796e3e07a24cada88712168c0d71d4_grande_polsmb.webp', 6, '2024-05-27 17:36:52', '2024-05-27 17:36:52'),
(7, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824658/v14-grey_707c6949533e4bf286293cbd6e8bddc4_grande_ovdaqg.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716824658/v14-grey_707c6949533e4bf286293cbd6e8bddc4_grande_ovdaqg.webp', 7, '2024-05-27 17:43:48', '2024-05-27 17:43:48'),
(8, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716399807/h732_7df2b97f9362401f8ebaa3c780748c77_grande_zvkxyu.webp', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716399807/h732_7df2b97f9362401f8ebaa3c780748c77_grande_zvkxyu.webp', 8, '2024-05-30 00:12:51', '2024-05-30 00:12:54');

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
(10, 'KTX VKU Xã Hợp Phong Huyện Cao Phong Lai Châu', '0826262626', 800035, 2087, '2024-05-27 04:37:22', '2024-05-27 04:37:22'),
(11, 'vku Xã Si Pa Phìn Huyện Nậm Pồ Lào Cai', '08616126', 621014, 2179, '2024-05-27 15:16:02', '2024-05-27 15:16:02'),
(12, 'VKU Xã Tư Nghĩa Huyện Cát Tiên Hưng Yên', '08464654646', 420911, 3146, '2024-05-27 16:18:20', '2024-05-27 16:18:20'),
(13, 'VKU Xã Tri Phương Huyện Trà Lĩnh Hưng Yên', '0846846846', 60509, 3305, '2024-05-27 16:18:59', '2024-05-27 16:18:59'),
(14, 'VKU Xã Tri Phương Huyện Trà Lĩnh Hưng Yên', '0846846846', 60509, 3305, '2024-05-27 16:19:09', '2024-05-27 16:19:09'),
(15, 'VVV Xã Đồng Tân Huyện Mai Châu Hưng Yên', '08546546', 800052, 2163, '2024-05-27 16:21:13', '2024-05-27 16:21:13'),
(16, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', '08486486', 70212, 2010, '2024-05-27 16:23:58', '2024-05-27 16:23:58'),
(17, 'vku Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', '015113123322123', 90816, 2264, '2024-05-29 14:30:30', '2024-05-29 14:30:30'),
(18, 'vku Xã Tà Mung Huyện Than Uyên Lào Cai', '0888888888', 70612, 2025, '2024-05-30 06:27:34', '2024-05-30 06:27:34'),
(19, 'vku Xã Thào Chư Phìn Huyện Si Ma Cai Lào Cai', '08213135111', 80213, 2264, '2024-06-20 15:48:23', '2024-06-20 15:48:23'),
(20, '12 Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', '900589989598', 90816, 2264, '2024-06-21 01:44:43', '2024-06-21 01:44:43');

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
(3, 'Laptop gaming Lenovo Legion 9 16IRX9 83G0001AVN', 9, 136990000, 1, 5, 2, '2024-05-23 01:09:06', '2024-05-23 01:09:06'),
(4, 'Laptop ASUS Vivobook S 16 OLED', 5, 28990000, 1, 6, 3, '2024-05-27 22:29:05', '2024-05-27 22:29:05'),
(5, 'Laptop gaming Dell G15 5530 i9H1', 100, 44990000, 1, 3, 3, '2024-05-27 22:35:06', '2024-05-27 22:35:06'),
(6, 'Laptop gaming Gigabyte G5 MF5 H2VN353SH', 100, 23990000, 1, 4, 3, '2024-05-27 22:35:41', '2024-05-27 22:35:41'),
(7, 'Laptop Lenovo V14 G4 IRU 83A0000TVN', 50, 10490000, 1, 2, 3, '2024-05-27 22:43:19', '2024-05-27 22:43:19'),
(8, 'Laptop HP 123', 1, 10000000, 1, 1, 1, '2024-05-30 00:12:30', '2024-05-30 00:12:30');

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
(16, 3, 37, 136990000, 1, '2024-05-27 04:43:24', '2024-05-27 04:43:24'),
(17, 3, 38, 136990000, 1, '2024-05-27 15:16:10', '2024-05-27 15:16:10'),
(18, 2, 39, 4000000, 1, '2024-05-27 15:16:25', '2024-05-27 15:16:25'),
(19, 2, 39, 4000000, 1, '2024-05-27 15:16:25', '2024-05-27 15:16:25'),
(24, 3, 43, 136990000, 1, '2024-05-27 16:32:04', '2024-05-27 16:32:04'),
(25, 4, 44, 28990000, 1, '2024-05-27 16:37:20', '2024-05-27 16:37:20'),
(26, 3, 45, 136990000, 1, '2024-05-27 16:39:58', '2024-05-27 16:39:58'),
(27, 3, 45, 136990000, 1, '2024-05-27 16:39:58', '2024-05-27 16:39:58'),
(28, 3, 46, 136990000, 1, '2024-05-30 02:48:37', '2024-05-30 02:48:37'),
(29, 3, 47, 136990000, 1, '2024-05-30 04:44:45', '2024-05-30 04:44:45'),
(30, 3, 47, 136990000, 1, '2024-05-30 04:44:45', '2024-05-30 04:44:45'),
(31, 2, 48, 4000000, 1, '2024-05-30 06:29:15', '2024-05-30 06:29:15'),
(32, 2, 48, 4000000, 1, '2024-05-30 06:29:15', '2024-05-30 06:29:15'),
(33, 2, 49, 4000000, 1, '2024-05-30 07:09:21', '2024-05-30 07:09:21'),
(34, 2, 49, 4000000, 1, '2024-05-30 07:09:21', '2024-05-30 07:09:21'),
(35, 2, 50, 4000000, 1, '2024-06-20 15:48:26', '2024-06-20 15:48:26'),
(36, 2, 50, 4000000, 1, '2024-06-20 15:48:26', '2024-06-20 15:48:26'),
(37, 2, 51, 4000000, 1, '2024-06-20 16:13:30', '2024-06-20 16:13:30'),
(38, 2, 51, 4000000, 1, '2024-06-20 16:13:30', '2024-06-20 16:13:30'),
(39, 3, 52, 136990000, 1, '2024-06-20 16:13:57', '2024-06-20 16:13:57'),
(40, 5, 53, 44990000, 1, '2024-06-20 16:14:23', '2024-06-20 16:14:23'),
(41, 5, 53, 44990000, 1, '2024-06-20 16:14:23', '2024-06-20 16:14:23'),
(42, 3, 54, 136990000, 1, '2024-06-21 01:45:11', '2024-06-21 01:45:11'),
(43, 3, 54, 136990000, 1, '2024-06-21 01:45:11', '2024-06-21 01:45:11');

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
(37, 36, 8, 1, 0, 136990000, 137010000, '2024-05-27 04:43:24', '2024-05-27 04:43:24'),
(38, 37, 9, 1, 0, 136990000, 137010000, '2024-05-27 15:16:10', '2024-05-27 15:16:10'),
(39, 38, 9, 1, 0, 8000000, 8040000, '2024-05-27 15:16:24', '2024-05-27 15:16:24'),
(43, 42, 10, 1, 0, 136990000, 137010000, '2024-05-27 16:32:04', '2024-05-27 16:32:04'),
(44, 43, 10, 1, 1, 28990000, 29010000, '2024-05-27 16:37:20', '2024-05-27 23:38:01'),
(45, 44, 10, 1, 0, 273980000, 274020000, '2024-05-27 16:39:58', '2024-05-27 16:39:58'),
(46, 45, 10, 1, 0, 136990000, 137010000, '2024-05-30 02:48:37', '2024-05-30 02:48:37'),
(47, 46, 10, 1, 0, 273980000, 274020000, '2024-05-30 04:44:45', '2024-05-30 04:44:45'),
(48, 47, 12, 1, 0, 8000000, 8040000, '2024-05-30 06:29:15', '2024-05-30 06:29:15'),
(49, 48, 12, 1, 0, 8000000, 8040000, '2024-05-30 07:09:21', '2024-05-30 07:09:21'),
(50, 49, 13, 1, 0, 8000000, 8040000, '2024-06-20 15:48:26', '2024-06-20 15:48:26'),
(51, 50, 13, 1, 0, 8000000, 8040000, '2024-06-20 16:13:30', '2024-06-20 16:13:30'),
(52, 51, 13, 1, 0, 136990000, 137010000, '2024-06-20 16:13:57', '2024-06-20 16:13:57'),
(53, 52, 13, 1, 0, 89980000, 90020000, '2024-06-20 16:14:23', '2024-06-20 16:14:23'),
(54, 53, 15, 1, 0, 273980000, 274020000, '2024-06-21 01:45:11', '2024-06-21 01:45:11');

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
(36, 'KTX VKU Xã Hợp Phong Huyện Cao Phong Lai Châu', 826262626, 20000, 'Notes ', '2024-05-27 04:43:24', '2024-05-27 04:43:24'),
(37, 'vku Xã Si Pa Phìn Huyện Nậm Pồ Lào Cai', 8616126, 20000, 'Notes ', '2024-05-27 15:16:10', '2024-05-27 15:16:10'),
(38, 'vku Xã Si Pa Phìn Huyện Nậm Pồ Lào Cai', 8616126, 40000, 'Notes ', '2024-05-27 15:16:24', '2024-05-27 15:16:24'),
(39, 'VKU Xã Tư Nghĩa Huyện Cát Tiên Hưng Yên', 2147483647, 0, 'Notes ', '2024-05-27 16:18:28', '2024-05-27 16:18:28'),
(40, 'VVV Xã Đồng Tân Huyện Mai Châu Hưng Yên', 8546546, 120000, 'Notes ', '2024-05-27 16:21:34', '2024-05-27 16:21:34'),
(41, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 120000, 'Notes ', '2024-05-27 16:24:40', '2024-05-27 16:24:40'),
(42, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 20000, 'Notes ', '2024-05-27 16:32:04', '2024-05-27 16:32:04'),
(43, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 20000, 'Notes ', '2024-05-27 16:37:20', '2024-05-27 16:37:20'),
(44, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 40000, 'Notes ', '2024-05-27 16:39:58', '2024-05-27 16:39:58'),
(45, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 20000, 'Notes ', '2024-05-30 02:48:37', '2024-05-30 02:48:37'),
(46, 'vku Xã Sùng Phài Huyện Tam Đường Hòa Bình', 8486486, 40000, 'Notes ', '2024-05-30 04:44:45', '2024-05-30 04:44:45'),
(47, 'vku Xã Tà Mung Huyện Than Uyên Lào Cai', 888888888, 40000, 'Notes ', '2024-05-30 06:29:15', '2024-05-30 06:29:15'),
(48, 'vku Xã Tà Mung Huyện Than Uyên Lào Cai', 888888888, 40000, 'Notes ', '2024-05-30 07:09:21', '2024-05-30 07:09:21'),
(49, 'vku Xã Thào Chư Phìn Huyện Si Ma Cai Lào Cai', 2147483647, 40000, 'Notes ', '2024-06-20 15:48:26', '2024-06-20 15:48:26'),
(50, 'vku Xã Thào Chư Phìn Huyện Si Ma Cai Lào Cai', 2147483647, 40000, 'Notes ', '2024-06-20 16:13:29', '2024-06-20 16:13:29'),
(51, 'vku Xã Thào Chư Phìn Huyện Si Ma Cai Lào Cai', 2147483647, 20000, 'Notes ', '2024-06-20 16:13:57', '2024-06-20 16:13:57'),
(52, 'vku Xã Thào Chư Phìn Huyện Si Ma Cai Lào Cai', 2147483647, 40000, 'Notes ', '2024-06-20 16:14:23', '2024-06-20 16:14:23'),
(53, '12 Thị Trấn Si Ma Cai Huyện Si Ma Cai Lào Cai', 2147483647, 40000, 'Notes ', '2024-06-21 01:45:11', '2024-06-21 01:45:11');

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
(4, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/09_Mayf2ee789db14f004dd48fe187f88b639d_ohwb84.png', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/01_Apr143e5c64e79d9f1a0dccd36d2fb071f3_nj2jpm.jpg', '2024-05-27 22:56:51', '2024-05-27 22:56:51'),
(5, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/15_Apra8201a0c20a1ae11c55dff5309b8482c_ut14bg.jpg', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/15_Apra8201a0c20a1ae11c55dff5309b8482c_ut14bg.jpg', '2024-05-27 22:51:46', '2024-05-27 22:51:46'),
(6, 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/01_Apr143e5c64e79d9f1a0dccd36d2fb071f3_nj2jpm.jpg', 'https://res.cloudinary.com/dlftx4ucg/image/upload/v1716825068/09_Mayf2ee789db14f004dd48fe187f88b639d_ohwb84.png', '2024-05-27 22:56:47', '2024-05-27 22:56:47');

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
(10, 8, 10, 1, '2024-05-27 04:37:22', '2024-05-27 04:37:22'),
(11, 9, 11, 1, '2024-05-27 15:16:02', '2024-05-27 15:16:02'),
(12, 10, 12, 0, '2024-05-27 16:24:37', '2024-05-27 16:24:37'),
(13, 10, 13, 0, '2024-05-27 16:24:37', '2024-05-27 16:24:37'),
(14, 10, 14, 0, '2024-05-27 16:24:37', '2024-05-27 16:24:37'),
(15, 10, 15, 0, '2024-05-27 16:24:37', '2024-05-27 16:24:37'),
(16, 10, 16, 1, '2024-05-27 23:39:27', '2024-05-27 23:39:27'),
(17, 11, 17, 1, '2024-05-29 14:30:30', '2024-05-29 14:30:30'),
(18, 12, 18, 1, '2024-05-30 06:27:35', '2024-05-30 06:27:35'),
(19, 13, 19, 1, '2024-06-20 15:48:23', '2024-06-20 15:48:23'),
(20, 15, 20, 1, '2024-06-21 01:44:43', '2024-06-21 01:44:43');

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
(8, 'Anh Quan', 'f@gmail.com', '$2a$10$5NQ5NsF/L6gdouR8phGrseKilvB0v4ZOMbdzjcag3BqrNpyy9Lq4y', 2, 'local', NULL, '2024-05-27 04:36:15', '2024-05-27 04:36:15'),
(9, 'ANh QUAN', 'h@gmail.com', '$2a$10$myunO3YkwQpFfIynns5/VuXXKVMMVq/UpQEDcS5e9z7gG47UaFp5e', 2, 'local', NULL, '2024-05-27 15:14:36', '2024-05-27 15:14:36'),
(10, 'Dung', 'j@gmail.com', '$2a$10$mYT2u2jV8cUfQVDdGj5O1egCh25AxXyIw9DbORXYN.57OW811nFOK', 2, 'local', NULL, '2024-05-27 15:58:34', '2024-05-27 15:58:34'),
(11, 'dung1', 'h1@gmail.com', '$2a$10$6mI9CAbzbKEhK47WOtE5G.6lsyVtDzLts6h1YAC0jHyEr7YnxBuLq', 2, 'local', NULL, '2024-05-29 14:29:38', '2024-05-29 14:29:38'),
(12, 'bao', 'b1@gmail.com', '$2a$10$/NBe9.CjbI9OZ0tJxV0ZleWqaTX3SPT4aMNQiPNepb6jw6OxZvLHq', 2, 'local', NULL, '2024-05-30 06:09:31', '2024-05-30 06:09:31'),
(13, 'Anh Quan ', 'anhquan@gmail.com', '$2a$10$wsOlBgvHF6QVigXaOOqqQeTAvmnnRbclQpPtb7z0t5m.wMYq.ipg6', 2, 'local', NULL, '2024-06-20 15:03:22', '2024-06-20 15:03:22'),
(14, 'thanh', 't@gmail.com', '$2a$10$.RS8Unvxc.IAeX1Cj20.KutKRf5Aux2OddqQxA2aqpBtoMBmgx/Wi', 2, 'local', NULL, '2024-06-20 15:49:42', '2024-06-20 15:49:42'),
(15, 'Dung Ninh', 'dungn@gmail.com', '$2a$10$wVj.L5NZUSbrDGIxuTMCVu75eIZl7EBs2xH5pc5/y1rHbdD0RZPn.', 2, 'local', NULL, '2024-06-21 00:44:43', '2024-06-21 00:44:43');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorylaptops`
--
ALTER TABLE `categorylaptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detaillaptops`
--
ALTER TABLE `detaillaptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inforshippings`
--
ALTER TABLE `inforshippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `laptops`
--
ALTER TABLE `laptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userinforshippings`
--
ALTER TABLE `userinforshippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
