INSERT INTO biblioteca_db.authors
(name_author)
values
('Martina Rifo'),
('Carlos Ramirez'),
('Cristina Reyes'),
('Matias Toro'),
('Jesion Aceituno'),
('Gorge Bustamante'),
('Brayan Gonzales'),
('Aramis Galindo'),
('Damaris Rodriguez'),
('Juancho de la villa');

INSERT INTO biblioteca_db.languages
(`language`)
values
('Español'),
('Ingles');

INSERT INTO biblioteca_db.editorial
(name_editorial)
values
('Paido'),
('Gigamesh'),
('Minotauro'),
('Nova'),
('Cuneta'),
('Alma'),
('Hueders'),
('La Pollera Ediciones'),
('Montacerdos'),
('Edicola ');

INSERT INTO biblioteca_db.products
(isbn_code, name_book, id_author, id_language, id_editorial, stock, purchase_price, sale_price)
values
('978-89-98675-43-6', 'Deshacer la Ansiedad', 1, 1, 1, 300, 7990, 14990),
('979-67-89765-98-9','Juego de Tronos', 2, 2, 2, 150, 5990, 12990),
('978-57653-4687956-786456-6', 'El Señor de los Anillos', 3, 2, 3, 500, 9990, 19990),
('978-9789-8765498-7898-9', 'Ready Player One', 4, 1, 4, 200, 5990, 13990),
('979-768-765456-987-5', 'El Resplandor', 5, 2, 5, 120, 11990, 22990),
('978-3156-45284-465-5', 'Dracula', 6, 1, 6, 379, 8990, 18990),
('978-6785-789654-721-8', '50 sombras de Grey', 7, 2, 7, 238, 8990, 19990),
('978-354-4563-13-2', '50 sombras liberadas', 8, 1, 8, 50, 8990, 19990),
('979-45-453-25-0', 'Pideme lo que quieras', 9, 1, 9, 100, 4990, 9990),
('979-345-731-16-4', 'El perfume', 10, 1, 10, 230, 7990, 13990);

INSERT INTO biblioteca_db.region
(name_region)
values
('Metropolitana'),
('Valparaiso'),
('Bio bio');

INSERT INTO biblioteca_db.country
(name_country)
values
('Chile');

INSERT INTO biblioteca_db.address
(name_street, number_street, id_region, id_country)
values
('Predredos', 8765, 1, 1),
('Antonio', 653, 2, 1),
('Miraflores', 123, 3, 1),
('Sanjon Rojo', 2333, 1, 1),
('Marmoles', 3434, 1, 1),
('Marionetas', 2112, 3, 1),
('Manzanillasa', 5928, 2, 1),
('Cerrano', 887, 1, 1),
('Marcacion', 98, 1, 1),
('Azombrado', 5545, 1, 1);

INSERT INTO biblioteca_db.bookstores
(name_bookstore, id_address, email_bookstore, fono_bookstore)
values
('Biblioteca Roja', 1, 'fhfhdh@bcbf', '+56964564657'),
('Biblioteca Saltillo', 2, 'dhfhh@rgfh', '+56967984567'),
('Biblioteca Arco Iris', 3, 'fnfk@hfhf', '+56954678934'),
('Biblioteca Mis sueños', 4, 'fjshs@hfhf', '+56976848468'),
('Biblioteca Vikings', 5, 'dhndi@jdkof', '+56965748965'),
('Biblioteca Dreams', 6, 'fhdkj@hbfhf', '+56954683940'),
('Biblioteca Monolito', 7, 'fbdjds@hnfjf', '+56965783746'),
('Biblioteca Red', 8, 'fhdu@hfjf', '+56964537384'),
('Biblioteca Joker', 9, 'dhsh@hfjf', '+56943647589'),
('Biblioteca Tanjiro', 10, 'fnfk@hfhf', '+56954637384');

INSERT INTO biblioteca_db.positions
(`position`)
values
('Reponedor'),
('Vendedor'),
('Bodegero'),
('Contador'),
('Secretario'),
('Aseo'),
('Vendedor'),
('Aseo'),
('Vendedor'),
('Reponedor');

INSERT INTO biblioteca_db.bookstore_staff
(name_employee, email_employee, id_bookstore, id_position)
values
('Alejandro Rojas', 'fhfhdh@bcbf', 1, 1),
('Javiera Reyes', 'dhfhh@rgfh', 2, 2),
('Ignacio Toro', 'fnfk@hfhf', 3, 3),
('Lucas Quintanilla', 'fjshs@hfhf', 4, 4),
('Vicente Saavedra', 'dhndi@jdkof', 5,5),
('Felipe Guerra', 'fhdkj@hbfhf', 6, 6),
('Gean Paolo Zuccone', 'fnkidhy@hbfjf', 7, 7),
('Martina Gomara', 'fbdjds@hnfjf', 8, 8),
('Joice Contreas', 'fhdu@hfjf', 9, 9),
('Sivia Figueroa', 'dhsh@hfjf', 10, 10);

INSERT INTO biblioteca_db.sale_types
(sale_type)
values
('Presencial'),
('Online');

INSERT INTO biblioteca_db.payment_types
(payment_type)
values
('Efectivo'),
('Cheque'),
('Tarjeta de Crédito'),
('Tarjeta de Débito');

INSERT INTO biblioteca_db.vaucher_types
(vaucher_type)
values
('Factura'),
('Boleta');

INSERT INTO biblioteca_db.sales
(id_sale_type, id_vaucher_type, id_payment_type, full_sale_price, datetime_sale, id_bookstore)
values
(1, 1,1, 129900, CURRENT_TIMESTAMP, 1),
(1, 2,1, 59990, CURRENT_TIMESTAMP, 2),
(1, 2,2, 9990, CURRENT_TIMESTAMP, 3),
(2, 1,3, 34990, CURRENT_TIMESTAMP, 4),
(2, 1,3, 120990, CURRENT_TIMESTAMP, 5),
(1, 2,2, 78990, CURRENT_TIMESTAMP, 6),
(1, 1,3, 89990, CURRENT_TIMESTAMP, 7),
(2, 1,4, 22990, CURRENT_TIMESTAMP, 8),
(1, 1,4, 35990, CURRENT_TIMESTAMP, 9),
(1, 2,3, 123990, CURRENT_TIMESTAMP, 10);

INSERT INTO biblioteca_db.deliveries
(street_delivery, number_street_delivery, id_region, id_country, id_sale, name_client, email_client, fono_client)
values
('Predredos', 14536, 1, 1, 1, 'Mateo Torres', 'fhfhdh@bcbf', '+56964564657'),
('Antonio', 2456, 2, 1, 2, 'Dylan Correa', 'fnfk@hfhf', '+56965748965'),
('Miraflores', 3568, 1, 1, 3, 'Julieta Arraño', 'dhsh@hfjf', '+56954637384'),
('Sanjon Rojo', 4457, 3, 1, 4, 'Tomas Gonzales', 'fbdjds@hnfjf', '+56954637384'),
('Marmoles', 5654, 2, 1, 5, 'Gary Medel', 'dhndi@jdkof','+56964537384'),
('Marionetas', 6432, 1, 1, 6, 'Mauricio Isla', 'fnfk@hfhf', '+56954683940'),
('Manzanillasa', 7567, 1, 1, 7, 'Harold Basure', 'dhndi@jdkof', '+56954637384'),
('Cerrano', 8765, 1, 1, 8, 'Francisco Saavedra', 'fjshs@hfhf', '+56943647589'),
('Marcacion', 9432, 1, 1, 9, 'Javiera Reyes', 'fhdkj@hbfhf', '+56964537384'),
('Azombrado', 1043, 2, 1, 10, 'Magadalena Toro', 'fhfhdh@bcbf', '+56954683940');


INSERT INTO biblioteca_db.providers
(name_provider)
values
('Libros Pepito'),
('Libros Manzana Verde'),
('Libros Bananas'),
('Libros Auto rojo'),
('Libros Pera'),
('Libros Semillita'),
('Libros Girasoles'),
('Libros Sueños'),
('Libros Despertar'),
('Libros Mouse');

INSERT INTO biblioteca_db.shopping
(id_provider, datetime_purchase, full_purchase_price, products_list)
values
(1, CURRENT_TIMESTAMP, 129900, '978-89-98675-43-6, 978-57653-4687956-786456-6, 978-3156-45284-465-5'),
(2, CURRENT_TIMESTAMP, 59990, '978-6785-789654-721-8,979-345-731-16-4, 978-354-4563-13-2 '),
(3, CURRENT_TIMESTAMP, 9990, '978-354-4563-13-2, 978-3156-45284-465-5, 978-9789-8765498-7898-9'),
(4, CURRENT_TIMESTAMP, 34990, '978-9789-8765498-7898-9, 979-67-89765-98-9, 979-345-731-16-4, 978-354-4563-13-2'),
(5, CURRENT_TIMESTAMP, 120990, '978-57653-4687956-786456-6, 978-9789-8765498-7898-9, 978-57653-4687956-786456-6'),
(6, CURRENT_TIMESTAMP, 78990, '978-6785-789654-721-8, 978-354-4563-13-2, 979-345-731-16-4, 979-768-765456-987-5'),
(7, CURRENT_TIMESTAMP, 89990, '979-67-89765-98-9, 978-57653-4687956-786456-6, 978-9789-8765498-7898-9, 978-354-4563-13-2'),
(8, CURRENT_TIMESTAMP, 22990, '978-89-98675-43-6, 978-6785-789654-721-8, 979-45-453-25-0, 978-3156-45284-465-5'),
(9, CURRENT_TIMESTAMP, 35990, '979-67-89765-98-9, 978-9789-8765498-7898-9'),
(10, CURRENT_TIMESTAMP, 123990, '978-354-4563-13-2, 978-354-4563-13-2, 979-768-765456-987-5');
