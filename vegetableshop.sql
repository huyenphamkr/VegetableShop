-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 17, 2023 lúc 04:44 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vegetableshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CategoryID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CategoryID`, `Name`, `Description`) VALUES
(1, 'Fruit', 'The kind that can be eaten without cooking'),
(2, 'Green Vegetables', 'The kind used to make salads or soups'),
(3, 'Spices', 'The kind used to enhance the taste of food');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Fullname` varchar(40) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`CustomerID`, `Password`, `Fullname`, `Address`, `City`, `Username`) VALUES
(1, '1234', 'John Smith', '30 Broadway', 'London', 'u123'),
(2, 'Abcd1234', 'Jonny English', '99 River View', 'Reading', 'u2222'),
(3, 'Abcd1234', 'Elizabeth', '23 Buckinghamshire', 'York', 'Elizabeth'),
(4, 'Abcd1234', 'Beatrix', '66 Royal Crescent', 'Bath', 'Beatrix');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `stt` int(11) NOT NULL,
  `OrderID` int(10) NOT NULL,
  `VegetableID` int(10) NOT NULL,
  `Quantity` tinyint(4) NOT NULL,
  `Price` float NOT NULL,
  `date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`stt`, `OrderID`, `VegetableID`, `Quantity`, `Price`, `date`, `note`, `total`) VALUES
(1, 0, 1, 1, 30, NULL, NULL, NULL),
(2, 0, 8, 1, 120, NULL, NULL, NULL),
(3, 1, 4, 1, 80, NULL, NULL, NULL),
(4, 1, 2, 1, 35, NULL, NULL, NULL),
(5, 1, 3, 1, 150, NULL, NULL, NULL),
(6, 2, 5, 1, 35, NULL, NULL, NULL),
(7, 2, 7, 2, 30, NULL, NULL, NULL),
(8, 3, 6, 2, 80, NULL, NULL, NULL),
(17, 9, 6, 1, 40, NULL, NULL, NULL),
(18, 9, 1, 2, 30, NULL, NULL, NULL),
(19, 10, 1, 10, 30, NULL, NULL, NULL),
(20, 10, 2, 10, 35, NULL, NULL, NULL),
(21, 1, 2, 1, 35, NULL, NULL, NULL),
(22, 69, 2, 1, 35, NULL, NULL, NULL),
(34, 4, 1, 1, 30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Total` float NOT NULL,
  `Note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `Date`, `Total`, `Note`) VALUES
(0, 1, '2021-08-15', 150, 'Use environmental protection bags'),
(1, 2, '2021-08-16', 235, ''),
(2, 3, '2023-02-19', 65, 'Need fast delivery'),
(3, 3, '2023-02-28', 80, ''),
(4, 1, '2023-03-01', 30, 'Test'),
(5, 1, '2023-03-01', 220, 'Test'),
(6, 1, '2023-03-01', 220, 'Test'),
(7, 1, '2023-03-02', 425, 'Test'),
(8, 1, '2023-03-02', 1020, 'Test'),
(9, 3, '2023-03-03', 100, 'Test'),
(10, 1, '2023-03-04', 650, 'Test'),
(16, 1, '2023-03-05', 205, ''),
(17, 1, '2023-03-05', 185, ''),
(18, 1, '2023-03-05', 65, ''),
(19, 1, '2023-03-06', 35, ''),
(20, 1, '2023-03-06', 35, ''),
(21, 1, '2023-03-06', 35, ''),
(22, 1, '2023-03-06', 35, ''),
(23, 1, '2023-03-07', 70, ''),
(24, 1, '2023-03-07', 70, ''),
(25, 1, '2023-03-07', 35, ''),
(26, 1, '2023-03-08', 35, ''),
(27, 1, '2023-03-08', 35, ''),
(28, 1, '2023-03-08', 35, ''),
(29, 1, '2023-03-08', 35, ''),
(30, 1, '2023-03-08', 35, ''),
(31, 1, '2023-03-08', 35, ''),
(32, 1, '2023-03-08', 35, ''),
(33, 2, '2023-03-08', 35, ''),
(34, 2, '2023-03-08', 35, ''),
(35, 3, '2023-03-08', 35, ''),
(36, 1, '2023-03-09', 35, ''),
(37, 4, '2023-03-09', 35, ''),
(38, 1, '2023-03-09', 35, ''),
(39, 3, '2023-03-09', 35, ''),
(40, 1, '2023-03-09', 35, ''),
(41, 1, '2023-03-09', 35, ''),
(42, 1, '2023-03-09', 35, ''),
(43, 3, '2023-03-10', 35, ''),
(44, 1, '2023-03-10', 35, ''),
(45, 3, '2023-03-10', 35, ''),
(46, 1, '2023-03-10', 35, ''),
(47, 1, '2023-03-10', 35, ''),
(48, 4, '2023-03-10', 35, ''),
(49, 1, '2023-03-10', 35, ''),
(50, 4, '2023-03-11', 35, ''),
(51, 1, '2023-03-12', 35, ''),
(52, 1, '2023-03-12', 35, ''),
(53, 1, '2023-03-12', 35, ''),
(54, 1, '2023-03-13', 35, ''),
(55, 4, '2023-03-13', 35, ''),
(56, 1, '2023-03-13', 35, ''),
(57, 2, '2023-03-14', 35, ''),
(58, 1, '2023-03-14', 35, ''),
(59, 1, '2023-03-14', 35, ''),
(60, 2, '2023-03-14', 35, ''),
(61, 1, '2023-03-15', 35, ''),
(62, 2, '2023-03-15', 35, ''),
(63, 1, '2023-03-15', 35, ''),
(64, 1, '2023-03-15', 35, ''),
(65, 2, '2023-03-16', 35, ''),
(66, 1, '2023-03-16', 35, ''),
(67, 4, '2023-03-16', 35, ''),
(68, 4, '2023-03-16', 35, ''),
(69, 3, '2023-03-16', 35, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vegetable`
--

CREATE TABLE `vegetable` (
  `VegetableID` int(10) NOT NULL,
  `CategoryID` int(10) NOT NULL,
  `Unit` varchar(20) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `vegetable_name` varchar(255) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vegetable`
--

INSERT INTO `vegetable` (`VegetableID`, `CategoryID`, `Unit`, `Amount`, `Image`, `Price`, `vegetable_name`, `Description`) VALUES
(1, 1, 'kg', 90, 'tomato.jpg', 30, 'Tomato', 'Tomatoes are a significant source of umami flavor. They are consumed in diverse ways: raw or cooked, and in many dishes, sauces, salads, and drinks.'),
(2, 1, 'kg', 3, 'potato.jpg', 35, 'Potato', 'The potato is one of the most cultivated products in the world. Its consumption is intended for human feeding in fresh, for cattle feeding and as raw material for food and agriculture processing industries, such as chips, potato flakes, frozen potatoes, eThe potato is one of the most cultivated products in the world. Its consumption is intended for human feeding in fresh, for cattle feeding and as raw material for food and agriculture processing industries, such as chips, potato flakes, frozen potatoes, etc.\n'),
(3, 1, 'bag', 50, 'apple.jpg', 150, 'Apple', 'Apples are the ideal fruit to eat at any time, having a positive role in the achievement of nourish balance. Their skin may be green, yellow or reddish, and the meat taste ranges from a bitter to sweet flavour.  It is one of the most consumed fruit in the world. There is a great amount of varieties; thanks to that, apples are available all the year round.'),
(4, 1, 'per fruit', 20, 'watermelon.jpg', 80, 'Watermelon', 'The watermelon is a large fruit of a more or less spherical shape. It is usually eaten raw as table dessert. It has a sweet reddish or yellowish flesh. It is a very refreshing food that supplies very few calories. It also provides some vitamins and minerals.'),
(5, 2, 'kg', 50, 'broccoli.jpg', 35, 'Broccoli', 'The broccoli is a vegetable that belongs the cabbage family. Its consumption increases constantly, since it is a healthy food with multiple culinary uses. It has a pleasant taste and it is rich in mineral and vitamins. It is also low in calories.'),
(6, 2, 'kg', 80, 'celery.jpg', 40, 'Celery', 'Celery is a vegetable with long petioles, meaty and succulent that are known by the name of stalks. They may be eaten raw in salads or alone, fried, boiled, with sauces and as a condiment for soups, stews, etc. It can also be used as an aromatic and besides the stalks, the leaves and seeds of the plant are used.'),
(7, 3, 'bunch', 50, 'springonion.jpg', 15, 'Spring Onion', 'Spring onions are comprised of small round to oval bulbs, averaging 2 to 5 centimeters in diameter, attached to a straight, layered stalk of overlapping leaves. The bulbs are smooth, firm, crisp, and succulent, found in bright white to red hues, depending on the variety. There may also be a cluster of fresh, flexible, and fine tan roots attached to the bulb\'s base. The slender, tubular leaves have a stiff, thick, and crunchy consistency and are hollow, bearing dark green hues on the edges and lightening to a pale green tone near the bulb. Spring onion bulbs contain sugars and are absent of the gases developed in more mature bulbs, creating a sweet and mild, mellow flavor. The leaves have a stronger taste and contribute herbaceous, pungent, and grassy nuances.'),
(8, 3, 'kg', 30, 'garlic.jpg', 120, 'Garlic', 'A herb growing from a strongly aromatic, rounded bulb composed of around 10 to 20 cloves covered in a papery coat. The long, sword-shaped leaves are attached to an underground stem and the greenish-white or pinkish flowers grow in dense, spherical clusters atop a flower stalk.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`stt`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `VegetableID` (`VegetableID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Chỉ mục cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  ADD PRIMARY KEY (`VegetableID`),
  ADD KEY `category_ibfk_1` (`CategoryID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  MODIFY `VegetableID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`VegetableID`) REFERENCES `vegetable` (`VegetableID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Các ràng buộc cho bảng `vegetable`
--
ALTER TABLE `vegetable`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
