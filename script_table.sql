CREATE TABLE `authors` (
  `id_author` INT NOT NULL AUTO_INCREMENT,
  `name_author` VARCHAR(100),
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `languages` (
  `id_language` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editorial` (
	`id_editorial` INT NOT NULL auto_increment,
	`name_editorial` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `isbn_code` VARCHAR(26) NOT NULL,
  `name_book` VARCHAR(50) NOT NULL,
  `id_author` INT,
  `id_language` INT,
  `id_editorial` INT,
  `stock` INT NOT NULL,
  `purchase_price` INT NOT NULL,
  `sale_price` INT NOT NULL,
  PRIMARY KEY (`isbn_code`),
  CONSTRAINT FK_AuthorProducts FOREIGN KEY (`id_author`) REFERENCES authors(`id_author`),
  CONSTRAINT FK_LanguageProducts FOREIGN KEY (`id_language`) REFERENCES languages(`id_language`),
  CONSTRAINT FK_EditorialPrducts FOREIGN KEY (`id_editorial`) REFERENCES editorial(`id_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region` (
	`id_region` INT NOT NULL auto_increment,
	`name_region` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `country` (
	`id_country` INT NOT NULL auto_increment,
	`name_country` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `address` (
	`id_address` INT NOT NULL auto_increment,
	`name_street` VARCHAR(50) NOT NULL,
	`number_street` INT NOT NULL,
	`id_region` INT,
	`id_country` INT,
	PRIMARY KEY (`id_address`),
  CONSTRAINT FK_RegionAddress FOREIGN KEY (`id_region`) REFERENCES region(`id_region`),
  CONSTRAINT FK_CountryAddress FOREIGN KEY (`id_country`) REFERENCES country(`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bookstores` (
	`id_bookstore` INT NOT NULL auto_increment,
	`name_bookstore` VARCHAR(50) NOT NULL,
	`id_address` INT,
	`email_bookstore` VARCHAR(50) NOT NULL,
	`fono_bookstore` VARCHAR(12) NOT NULL,
	PRIMARY KEY (`id_bookstore`),
  CONSTRAINT FK_AddressBookstores FOREIGN KEY (`id_address`) REFERENCES address(`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `positions` (
	`id_position` INT NOT NULL auto_increment,
	`position` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bookstore_staff` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name_employee` VARCHAR(100) NOT NULL,
  `email_employee` VARCHAR(100) NOT NULL,
  `id_bookstore` INT,
  `id_position` INT,
  PRIMARY KEY (`id_employee`),
  CONSTRAINT FK_BookstoreStaff FOREIGN KEY (`id_bookstore`) REFERENCES bookstores(`id_bookstore`),
  CONSTRAINT FK_PositionStaff FOREIGN KEY (`id_position`) REFERENCES positions(`id_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_types` (
  `id_sale_type` INT NOT NULL AUTO_INCREMENT,
  `type_sale` VARCHAR(20),
  PRIMARY KEY (`id_sale_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sales` (
  `id_sale` INT NOT NULL AUTO_INCREMENT,
  `id_sale_type` INT,
  `full_sale_price` INT NOT NULL,
  `datetime_sale` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_bookstore` INT,
  PRIMARY KEY (`id_sale`),
  CONSTRAINT FK_SalesTypeSales FOREIGN KEY (`id_sale_type`) REFERENCES sale_types(`id_sale_type`),
  CONSTRAINT FK_BookstoreSales FOREIGN KEY (`id_bookstore`) REFERENCES bookstores(`id_bookstore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `deliveries` (
  `id_delivery` INT NOT NULL AUTO_INCREMENT,
  `street_delivery` VARCHAR(50) NOT NULL,
  `number_street_delivery` INT NOT NULL,
  `id_region` INT,
  `id_country` INT,
  `id_sale` INT,
  `name_client` VARCHAR(100) NOT NULL,
  `email_client` VARCHAR(100),
  `fono_client` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  CONSTRAINT FK_RegionDeliveries FOREIGN KEY (`id_region`) REFERENCES region(`id_region`),
  CONSTRAINT FK_CountryDeliveries FOREIGN KEY (`id_country`) REFERENCES country(`id_country`),
  CONSTRAINT FK_SaleDeliveries FOREIGN KEY (`id_sale`) REFERENCES sales(`id_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `providers` (
  `id_provider` INT NOT NULL AUTO_INCREMENT,
  `name_provider` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `shopping` (
  `id_purchase` INT NOT NULL AUTO_INCREMENT,
  `id_provider` INT,
  `datetime_purchase` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `full_purchase_price` INT NOT NULL,
  `products_list` TEXT NOT NULL,
  PRIMARY KEY (`id_purchase`),
  CONSTRAINT FK_ProvidersShopping FOREIGN KEY (`id_purchase`) REFERENCES providers(`id_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;