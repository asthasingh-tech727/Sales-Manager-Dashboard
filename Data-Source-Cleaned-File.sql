/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Database: Retail Sales & Distribution Database
-- Description: Schema for customer, product, market, and transaction data
-- MySQL Version: 8.0+
--

--
-- Table structure for table `customers`
-- Stores information about retail customers (Brick & Mortar and E-Commerce)
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_code` varchar(45) NOT NULL COMMENT 'Unique customer identifier',
  `customer_name` varchar(45) DEFAULT NULL COMMENT 'Name of the customer',
  `customer_type` varchar(45) DEFAULT NULL COMMENT 'Type: Brick & Mortar or E-Commerce',
  PRIMARY KEY (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date`
-- Dimension table for date-based analytics
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `date` date NOT NULL COMMENT 'Calendar date',
  `cy_date` date DEFAULT NULL COMMENT 'Calendar year date',
  `year` int DEFAULT NULL COMMENT 'Year',
  `month_name` varchar(45) DEFAULT NULL COMMENT 'Month name',
  `date_yy_mmm` varchar(45) DEFAULT NULL COMMENT 'Date in YY-MMM format',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `markets`
-- Stores geographic market information
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markets` (
  `markets_code` varchar(45) NOT NULL COMMENT 'Unique market identifier',
  `markets_name` varchar(45) DEFAULT NULL COMMENT 'City or market name',
  `zone` varchar(45) DEFAULT NULL COMMENT 'Geographic zone (North, South, Central)',
  PRIMARY KEY (`markets_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
-- Stores product information
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_code` varchar(45) NOT NULL COMMENT 'Unique product identifier',
  `product_type` varchar(45) DEFAULT NULL COMMENT 'Type: Own Brand or Distribution',
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
-- Stores transaction/sales data
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` varchar(45) NOT NULL COMMENT 'Unique transaction identifier',
  `customer_code` varchar(45) DEFAULT NULL COMMENT 'Reference to customers table',
  `product_code` varchar(45) DEFAULT NULL COMMENT 'Reference to products table',
  `market_code` varchar(45) DEFAULT NULL COMMENT 'Reference to markets table',
  `date` date DEFAULT NULL COMMENT 'Reference to date table',
  KEY `fk_customer` (`customer_code`),
  KEY `fk_product` (`product_code`),
  KEY `fk_market` (`market_code`),
  KEY `fk_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
