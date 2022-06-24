-- DROP FOREIGN KEY
ALTER TABLE `products`
DROP FOREIGN KEY `FK_AuthorProducts`,
DROP FOREIGN key `FK_LanguageProducts`,
DROP FOREIGN KEY `FK_EditorialPrducts`;

ALTER TABLE `address`
DROP FOREIGN KEY `FK_RegionAddress`,
DROP FOREIGN KEY `FK_CountryAddress`;

ALTER TABLE `bookstores`
DROP FOREIGN KEY `FK_AddressBookstores`;

ALTER TABLE `bookstore_staff`
DROP FOREIGN KEY `FK_BookstoreStaff`,
DROP FOREIGN KEY `FK_PositionStaff`;

ALTER TABLE `sales`
DROP FOREIGN KEY `FK_SalesTypeSales`,
DROP FOREIGN KEY `FK_VaucerTypeSales`,
DROP FOREIGN KEY `FK_BookstoreSales`;

ALTER TABLE `deliveries`
DROP FOREIGN KEY `FK_RegionDeliveries`,
DROP FOREIGN KEY `FK_CountryDeliveries`,
DROP FOREIGN KEY `FK_SaleDeliveries`;

ALTER TABLE `shopping`
DROP FOREIGN KEY `FK_ProvidersShopping`;

-- DROP TABLES
DROP TABLE `authors`;
DROP TABLE `languages`;
DROP TABLE `editorial`;
DROP TABLE `products`;
DROP TABLE `region`;
DROP TABLE `country`;
DROP TABLE `address`;
DROP TABLE `bookstores`;
DROP TABLE `positions`;
DROP TABLE `bookstore_staff`;
DROP TABLE `sale_types`;
DROP TABLE `sales`;
DROP TABLE `deliveries`;
DROP TABLE `providers`;
DROP TABLE `shopping`;
DROP TABLE `vaucher_types`;
DROP TABLE `payment_types`;
