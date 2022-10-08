-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 08, 2022 at 12:53 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcdonalds`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_orderID` (IN `x` INT(50))  BEGIN
SELECT * FROM orders INNER JOIN drivethru_orders ON orders.OrderID = drivethru_orders.orderID and orders.custID = x ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_order_ID` (IN `x` INT(50))  BEGIN
SELECT * FROM orders INNER JOIN drivethru_orders ON orders.OrderID = drivethru_orders.orderID and orders.custID = x ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_paymentDate` ()  BEGIN
SELECT paymentDate
FROM orders, order_details, payment
WHERE order_details.orderID = orders.orderID
and orders.custID = payment.custID
and payment.paymentDate = '2022-04-02';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cash`
--

CREATE TABLE `cash` (
  `cpaymentID` int(11) NOT NULL,
  `orderID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cash`
--

INSERT INTO `cash` (`cpaymentID`, `orderID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `cdpaymentID` int(16) NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`cdpaymentID`, `orderID`) VALUES
(1, 1),
(5, 5),
(8, 8),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `crew_member`
--

CREATE TABLE `crew_member` (
  `crewID` int(11) NOT NULL,
  `empID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crew_member`
--

INSERT INTO `crew_member` (`crewID`, `empID`) VALUES
(4, 4),
(7, 7),
(9, 9),
(10, 10),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custID` int(255) NOT NULL,
  `custFirstName` varchar(100) NOT NULL,
  `custLastName` varchar(100) NOT NULL,
  `cardInfo` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custID`, `custFirstName`, `custLastName`, `cardInfo`) VALUES
(51, 'Thea', 'Kendrew', '5108750175802362'),
(138, 'Stanton', 'Egarr', '5108757022562487'),
(167, 'Filippa', 'Bouller', '5048375418355219'),
(172, 'Aidan', 'Roylance', '5048379048054291'),
(249, 'Broddie', 'Lushey', '5108757996643701'),
(298, 'Flory', 'Craig', '5108752230536340'),
(324, 'Alyda', 'Elie', '5048370311020812'),
(340, 'Kirby', 'Vaune', '5108750357893239'),
(361, 'Bobbye', 'Labrum', '5108753876212972'),
(394, 'Kellyann', 'Paz', '5048371676531765'),
(489, 'Murielle', 'Sanbroke', '5048378950409808'),
(563, 'Emlyn', 'Thorbon', '5108757298915005'),
(599, 'Zsazsa', 'Curtiss', '5048376693570605'),
(639, 'Livvyy', 'Stouther', '5108759615865616'),
(661, 'Hayes', 'Barthelmes', '5048378040141759'),
(722, 'Stephie', 'Churm', '5108758558736396'),
(731, 'Byrom', 'Matskevich', '5108755444177272'),
(744, 'Tallou', 'Eouzan', '5108759750801533'),
(817, 'Enrique', 'Michell', '5108755508868550'),
(846, 'Ambrose', 'Swindley', '5108757792481421'),
(849, 'Rodolph', 'Carles', '5048374658334935'),
(863, 'Benjamen', 'Berecloth', '5108752431218417'),
(879, 'Josephina', 'Fleckney', '5048374318290410'),
(922, 'Sydney', 'Dossantos', '5048370614581841'),
(974, 'Dyan', 'Whitworth', '5108753557291956'),
(2107799584, 'Michelle', 'Gheeraert', '5048375989092670');

-- --------------------------------------------------------

--
-- Table structure for table `debit_card`
--

CREATE TABLE `debit_card` (
  `dcpaymentID` int(16) NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `debit_card`
--

INSERT INTO `debit_card` (`dcpaymentID`, `orderID`) VALUES
(3, 3),
(4, 4),
(9, 9),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `dessert`
--

CREATE TABLE `dessert` (
  `dessertID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `dessertName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dessert`
--

INSERT INTO `dessert` (`dessertID`, `productID`, `dessertName`) VALUES
(5, 5, 'Chocolate Shake Dessert'),
(6, 6, 'McFlurry Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `drink`
--

CREATE TABLE `drink` (
  `drinkID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `drinkName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drink`
--

INSERT INTO `drink` (`drinkID`, `productID`, `drinkName`) VALUES
(11, 11, 'Coca Cola'),
(12, 12, 'Diet Coca Cola'),
(13, 13, 'Sprite'),
(14, 14, 'Dr. Pepper'),
(15, 15, 'Root Beer');

-- --------------------------------------------------------

--
-- Table structure for table `drivethru_orders`
--

CREATE TABLE `drivethru_orders` (
  `driveID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drivethru_orders`
--

INSERT INTO `drivethru_orders` (`driveID`, `orderID`, `paymentID`) VALUES
(6, 6, 6),
(7, 7, 7),
(11, 11, 11),
(13, 13, 13),
(17, 17, 17),
(19, 19, 19),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `empID` int(11) NOT NULL,
  `empFirstName` varchar(100) NOT NULL,
  `empLastName` varchar(100) NOT NULL,
  `dateHired` date DEFAULT NULL,
  `positionType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`empID`, `empFirstName`, `empLastName`, `dateHired`, `positionType`) VALUES
(1, 'Anthony', 'Kim', '2022-04-01', 'Manager'),
(2, 'Kelly', 'Sorno', '2022-04-02', 'kitchen_staff'),
(3, 'Carlos', 'Flores', '2022-03-31', 'kitchen_staff'),
(4, 'James', 'Smith', '2022-04-04', 'crew_member'),
(5, 'Alvin', 'Johnson', '2022-04-05', 'manager'),
(6, 'Linda', 'Hong', '2022-03-01', 'kitchen_staff'),
(7, 'Jane', 'Doe', '2022-03-30', 'crew_member'),
(8, 'Allen', 'Wang', '2022-03-29', 'kitchen_staff'),
(9, 'Mike', 'Koyono', '2022-03-26', 'crew_member'),
(10, 'Hugo', 'Yamuochoi', '2022-04-01', 'crew_member'),
(11, 'Melvin', 'Toby', '2022-03-24', 'kitchen_staff'),
(12, 'Shane', 'Law', '2022-03-02', 'kitchen_staff'),
(13, 'Joe', 'Budding', '2022-03-10', 'kitchen_staff'),
(14, 'Blaine', 'Bamo', '2022-04-24', 'kitchen_staff'),
(15, 'Do', 'Yu', '2022-03-25', 'kitchen_staff'),
(16, 'Timothy', 'Malarkson', '2022-04-05', 'kitchen_staff'),
(17, 'Sam', 'Lam', '2022-04-01', 'kitchen_staff'),
(18, 'Brian', 'Rich', '2022-04-02', 'kitchen_staff'),
(19, 'Jeff', 'Kusos', '2022-04-06', 'kitchen_staff'),
(20, 'Long', 'Musk', '2022-04-09', 'kitchen_staff'),
(21, 'Francis', 'Pope', '2022-04-13', 'kitchen_staff'),
(22, 'Mac', 'Roni', '2022-04-07', 'crew_member'),
(23, 'Sal', 'Mon', '2022-04-06', 'crew_member'),
(24, 'Sloane', 'Lion', '2022-04-07', 'crew_member'),
(25, 'Mountain', 'Everest', '2022-04-01', 'crew_member'),
(26, 'Paris', 'Towers', '2022-04-01', 'crew_member'),
(27, 'Crete', 'Wall', '2022-04-01', 'crew_member'),
(28, 'Bumble', 'Bee', '2022-03-04', 'crew_member'),
(29, 'Alexander', 'Great', '2022-03-11', 'crew_member'),
(30, 'Lu', 'Bu', '2022-03-17', 'crew_member'),
(31, 'Guan', 'Yu', '2022-03-24', 'crew_member'),
(32, 'Will', 'Smith', '2022-03-25', 'manager'),
(33, 'Chris', 'Rock', '2022-03-18', 'manager'),
(34, 'Jo', 'Koy', '2022-03-11', 'manager'),
(35, 'Shuri', 'Stones', '2022-04-07', 'manager'),
(36, 'Edward', 'Teach', '2022-04-02', 'manager'),
(37, 'Kobe', 'Beef', '2022-04-07', 'manager'),
(38, 'LeBron', 'James', '2022-04-06', 'manager'),
(39, 'Clayton', 'Kershaw', '2022-04-03', 'manager'),
(40, 'Mount', 'Himalayas', '2022-04-14', 'manager'),
(41, 'Hews', 'Fires', '2022-04-07', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `foodType` varchar(100) NOT NULL,
  `mealID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`foodType`, `mealID`) VALUES
('Beef', 1),
('Cheese', 2),
('Poultry', 3),
('Egg', 4),
('Chocolate', 5),
('Ice Cream', 6),
('Mystery Meat', 7),
('Lettuce ', 8),
('Breakfast', 9),
('Sausage', 10);

-- --------------------------------------------------------

--
-- Table structure for table `instore_orders`
--

CREATE TABLE `instore_orders` (
  `instID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instore_orders`
--

INSERT INTO `instore_orders` (`instID`, `paymentID`, `orderID`) VALUES
(1, 1, 1),
(2, 2, 2),
(9, 9, 9),
(12, 12, 12),
(15, 15, 15),
(18, 18, 18),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_staff`
--

CREATE TABLE `kitchen_staff` (
  `ktchnID` int(11) NOT NULL,
  `empID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kitchen_staff`
--

INSERT INTO `kitchen_staff` (`ktchnID`, `empID`) VALUES
(2, 2),
(3, 3),
(6, 6),
(8, 8),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `mgmtID` int(11) NOT NULL,
  `empID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`mgmtID`, `empID`) VALUES
(1, 1),
(5, 5),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41);

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `mealID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `mealName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`mealID`, `productID`, `mealName`) VALUES
(1, 1, 'Big Mac Meal'),
(2, 2, '2 Cheeseburgers Meal'),
(3, 3, 'Buttermilk Crispy Chicken Meal'),
(4, 4, 'Donut Sticks Breakfast Meal'),
(5, 5, 'Chocolate Shake Meal'),
(6, 6, 'McFlurry Meal'),
(7, 7, 'McRib Meal'),
(8, 8, 'Southwest Salad Meal'),
(9, 9, 'McGriddle Breakfast Meal'),
(10, 10, 'McMuffin Breakfast Meal');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_orders`
--

CREATE TABLE `mobile_orders` (
  `mobilID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobile_orders`
--

INSERT INTO `mobile_orders` (`mobilID`, `paymentID`, `orderID`) VALUES
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(14, 14, 14),
(16, 16, 16),
(20, 20, 20),
(25, 25, 25),
(26, 26, 26);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(255) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `trackingNumber` int(20) NOT NULL,
  `orderType` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `paymentID`, `custID`, `trackingNumber`, `orderType`) VALUES
(1, 1, 324, 414466, 'instore'),
(2, 2, 846, 413274, 'instore'),
(3, 3, 863, 4515165, 'mobile'),
(4, 4, 361, 174215, 'mobile'),
(5, 5, 817, 564564, 'mobile'),
(6, 6, 172, 54165412, 'drive_thru'),
(7, 7, 249, 6546846, 'drive_thru'),
(8, 8, 974, 4646464, 'mobile'),
(9, 9, 138, 4684644, 'instore'),
(10, 10, 172, 54165412, 'drive_thru'),
(11, 11, 849, 5464456, 'drive_thru'),
(12, 12, 846, 45465443, 'instore'),
(13, 13, 849, 6546464, 'drive_thru'),
(14, 14, 324, 3154465, 'mobile'),
(15, 15, 661, 54864646, 'instore'),
(16, 16, 722, 4646464, 'mobile'),
(17, 17, 167, 2464354, 'drive_thru'),
(18, 18, 863, 35465433, 'instore'),
(19, 19, 974, 4643543, 'drive_thru'),
(20, 20, 599, 354135, 'mobile'),
(21, 21, 167, 513565, 'drive_thru'),
(22, 22, 489, 2511313, 'drive_thru'),
(23, 23, 361, 3131351, 'drive_thru'),
(24, 24, 846, 21351353, 'drive-thru'),
(25, 25, 731, 2313131, 'mobile'),
(26, 26, 849, 23131351, 'mobile'),
(27, 27, 394, 516135, 'instore'),
(28, 28, 744, 513515, 'instore'),
(29, 29, 846, 135151, 'instore'),
(30, 30, 138, 1231351, 'instore');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `orderID` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `orderQuantity` int(5) DEFAULT NULL,
  `totalPrice` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`orderID`, `custID`, `orderQuantity`, `totalPrice`) VALUES
(1, 172, 3, 20.02),
(2, 324, 10, 52.99),
(3, 846, 2, 10.89),
(4, 863, 1, 5.99),
(5, 361, 12, 87.45),
(6, 249, 3, 14.54),
(7, 731, 2, 12.78),
(8, 974, 4, 17.54),
(9, 563, 10, 45.21),
(10, 817, 1, 12.55);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `custID`, `orderID`, `totalPrice`, `paymentDate`, `paymentType`) VALUES
(1, 172, 1, 20.02, '2022-04-02', 'Credit Card'),
(2, 324, 2, 52.99, '2022-04-29', 'Cash'),
(3, 846, 3, 10.89, '2022-03-09', 'Debit Card'),
(4, 863, 4, 5.99, '2022-04-12', 'Debit Card'),
(5, 361, 5, 87.45, '2022-04-12', 'Credit Card'),
(6, 249, 6, 14.54, '2022-04-13', 'Cash'),
(7, 731, 7, 12.78, '2022-04-11', 'Cash'),
(8, 974, 8, 17.54, '2022-04-19', 'Credit Card'),
(9, 563, 9, 45.21, '2022-04-11', 'Debit Card'),
(10, 167, 10, 12.55, '2022-04-14', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productDesc` varchar(1000) DEFAULT NULL,
  `productType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productDesc`, `productType`) VALUES
(1, 'Big Mac', 3.99, 'Burger with three buns and two patties.', 'Lunch'),
(2, '2 Cheeseburgers', 2, 'Two cheeseburgers.', 'Lunch'),
(3, 'Buttermilk Crispy Chicken', 4.39, 'Buttermilk chicken with two buns and lettuce.', 'Lunch'),
(4, 'Donut Sticks', 2.59, 'Sugar coated donut fried sticks.', 'Breakfast'),
(5, 'Chocolate Shake', 2.19, 'Smooth chocolatey shake.', 'Dessert'),
(6, 'McFlurry', 1.79, 'Oreo churned ice cream with bits.', 'Dessert'),
(7, 'McRib', 3.69, 'Limited time rib sandwich with bbq sauce. ', 'Lunch'),
(8, 'Southwest Salad', 6.13, 'Salad with chicken and ranch dressing.', 'Lunch'),
(9, 'McGriddle', 3.99, 'Two pancake buns with sausage patty.', 'Breakfast'),
(10, 'McMuffin', 3.19, 'English toasted muffin with sausage patty.', 'Breakfast'),
(11, 'Coca Cola', 1, 'Classic Coca Cola', 'Drink'),
(12, 'Diet Coca Cola', 1, 'Diet ice cold coca cola', 'Drink'),
(13, 'Sprite', 1, 'Lemon lime soda ', 'Drink'),
(14, 'Dr. Pepper', 1, 'Coca cola but with a bit more intensity.', 'Drink'),
(15, 'Root Beer', 1, 'Coca Cola but more wood taste', 'Drink');

-- --------------------------------------------------------

--
-- Table structure for table `syrup`
--

CREATE TABLE `syrup` (
  `syrupID` int(11) NOT NULL,
  `drinkID` int(11) NOT NULL,
  `syrupName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `syrup`
--

INSERT INTO `syrup` (`syrupID`, `drinkID`, `syrupName`) VALUES
(11, 11, 'Coca Cola Syrup'),
(12, 12, 'Sugar Free Cola Syrup'),
(13, 13, 'Lemon Lime Syrup'),
(14, 14, 'Spicy Coca Cola Syrup'),
(15, 15, 'Oak Barrel Cola Syrup');

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `toppingID` int(11) NOT NULL,
  `dessertID` int(11) NOT NULL,
  `toppingName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`toppingID`, `dessertID`, `toppingName`) VALUES
(5, 5, 'Sprinkles'),
(6, 6, 'Oreo Bits');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`cpaymentID`),
  ADD KEY `cash_fk` (`orderID`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`cdpaymentID`),
  ADD KEY `credit_card_fk` (`orderID`);

--
-- Indexes for table `crew_member`
--
ALTER TABLE `crew_member`
  ADD PRIMARY KEY (`crewID`),
  ADD KEY `crew_member_fk` (`empID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custID`);

--
-- Indexes for table `debit_card`
--
ALTER TABLE `debit_card`
  ADD PRIMARY KEY (`dcpaymentID`),
  ADD KEY `debit_card_fk` (`orderID`);

--
-- Indexes for table `dessert`
--
ALTER TABLE `dessert`
  ADD PRIMARY KEY (`dessertID`),
  ADD KEY `dessert_fk` (`productID`);

--
-- Indexes for table `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`drinkID`),
  ADD KEY `drink_fk` (`productID`);

--
-- Indexes for table `drivethru_orders`
--
ALTER TABLE `drivethru_orders`
  ADD PRIMARY KEY (`driveID`),
  ADD KEY `drivethru_orders_fk` (`orderID`,`paymentID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`empID`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`foodType`),
  ADD KEY `ingredients_fk` (`mealID`);

--
-- Indexes for table `instore_orders`
--
ALTER TABLE `instore_orders`
  ADD PRIMARY KEY (`instID`),
  ADD KEY `instore_orders_fk` (`orderID`,`paymentID`);

--
-- Indexes for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD PRIMARY KEY (`ktchnID`),
  ADD KEY `kitchen_staff_fk` (`empID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mgmtID`),
  ADD KEY `manager_fk` (`empID`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`mealID`),
  ADD KEY `meal_fk` (`productID`);

--
-- Indexes for table `mobile_orders`
--
ALTER TABLE `mobile_orders`
  ADD PRIMARY KEY (`mobilID`),
  ADD KEY `mobile_orders_fk` (`orderID`,`paymentID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`,`paymentID`),
  ADD KEY `orders_fk` (`custID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `order_details_fk2` (`custID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `payment_fk1` (`custID`),
  ADD KEY `payment_fk2` (`orderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `syrup`
--
ALTER TABLE `syrup`
  ADD PRIMARY KEY (`syrupID`),
  ADD KEY `syrup_fk` (`drinkID`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`toppingID`),
  ADD KEY `topping_fk` (`dessertID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `cpaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `cdpaymentID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `crew_member`
--
ALTER TABLE `crew_member`
  MODIFY `crewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `custID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2107799585;

--
-- AUTO_INCREMENT for table `debit_card`
--
ALTER TABLE `debit_card`
  MODIFY `dcpaymentID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `dessert`
--
ALTER TABLE `dessert`
  MODIFY `dessertID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `drink`
--
ALTER TABLE `drink`
  MODIFY `drinkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `drivethru_orders`
--
ALTER TABLE `drivethru_orders`
  MODIFY `driveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `empID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `instore_orders`
--
ALTER TABLE `instore_orders`
  MODIFY `instID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  MODIFY `ktchnID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `mgmtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `mealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mobile_orders`
--
ALTER TABLE `mobile_orders`
  MODIFY `mobilID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `syrup`
--
ALTER TABLE `syrup`
  MODIFY `syrupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `topping`
--
ALTER TABLE `topping`
  MODIFY `toppingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash`
--
ALTER TABLE `cash`
  ADD CONSTRAINT `cash_fk` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE;

--
-- Constraints for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `credit_card_fk` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE;

--
-- Constraints for table `crew_member`
--
ALTER TABLE `crew_member`
  ADD CONSTRAINT `crew_member_fk` FOREIGN KEY (`empID`) REFERENCES `employees` (`empID`);

--
-- Constraints for table `debit_card`
--
ALTER TABLE `debit_card`
  ADD CONSTRAINT `debit_card_fk` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE;

--
-- Constraints for table `dessert`
--
ALTER TABLE `dessert`
  ADD CONSTRAINT `dessert_fk` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `drink`
--
ALTER TABLE `drink`
  ADD CONSTRAINT `drink_fk` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `drivethru_orders`
--
ALTER TABLE `drivethru_orders`
  ADD CONSTRAINT `drivethru_orders_fk` FOREIGN KEY (`orderID`,`paymentID`) REFERENCES `orders` (`orderID`, `paymentID`);

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_fk` FOREIGN KEY (`mealID`) REFERENCES `meal` (`mealID`);

--
-- Constraints for table `instore_orders`
--
ALTER TABLE `instore_orders`
  ADD CONSTRAINT `instore_orders_fk` FOREIGN KEY (`orderID`,`paymentID`) REFERENCES `orders` (`orderID`, `paymentID`) ON UPDATE CASCADE;

--
-- Constraints for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD CONSTRAINT `kitchen_staff_fk` FOREIGN KEY (`empID`) REFERENCES `employees` (`empID`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_fk` FOREIGN KEY (`empID`) REFERENCES `employees` (`empID`);

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `meal_fk` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `mobile_orders`
--
ALTER TABLE `mobile_orders`
  ADD CONSTRAINT `mobile_orders_fk` FOREIGN KEY (`orderID`,`paymentID`) REFERENCES `orders` (`orderID`, `paymentID`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_fk` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_fk1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_fk2` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_fk1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_fk2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON UPDATE CASCADE;

--
-- Constraints for table `syrup`
--
ALTER TABLE `syrup`
  ADD CONSTRAINT `syrup_fk` FOREIGN KEY (`drinkID`) REFERENCES `drink` (`drinkID`);

--
-- Constraints for table `topping`
--
ALTER TABLE `topping`
  ADD CONSTRAINT `topping_fk` FOREIGN KEY (`dessertID`) REFERENCES `dessert` (`dessertID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
