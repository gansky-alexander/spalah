SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Телевизоры', 'Категория телевизоров'),
(2, 'Телефоны', 'Категория телефонов'),
(3, 'Утюги', 'Категория утюгов');

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `phone`) VALUES
(1, 'Геннадий', 'Петрович', '0930000000'),
(2, 'Марина', 'Васильевна', '0630000000'),
(3, 'Владислав', 'Аркадьевич', '0660000000'),
(4, 'Роман', 'Прокофьевич', '0970000000');

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `order` (`id`, `customer_id`, `date`) VALUES
(1, 1, '2017-04-01 12:00:00'),
(2, 2, '2017-04-04 12:00:00'),
(3, 3, '2017-01-01 12:00:00');

CREATE TABLE `order_entry` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `order_entry` (`id`, `order_id`, `product_id`, `price`, `count`) VALUES
(2, 1, 2, 1000, 3),
(3, 1, 3, 8000, 2),
(4, 2, 6, 2500, 1),
(5, 3, 5, 25000, 1);

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product` (`id`, `name`, `price`, `category_id`) VALUES
(2, 'Березка', 1000, 1),
(3, 'Phillips 100', 8000, 1),
(4, 'HTC 616 gray', 7500, 2),
(5, 'Iphone 5 black', 25000, 2),
(6, 'Красный утюг', 2500, 3),
(7, 'Утюг Samsung 125', 6000, 3);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_customer_id_fk` (`customer_id`);

ALTER TABLE `order_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_entry_order_id_fk` (`order_id`),
  ADD KEY `product_order_entry___fk` (`product_id`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poduct_category_id_fk` (`category_id`);

ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `order_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `order`
  ADD CONSTRAINT `order_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `order_entry`
  ADD CONSTRAINT `order_entry_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `product_order_entry___fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `product`
  ADD CONSTRAINT `poduct_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);