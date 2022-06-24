CREATE OR REPLACE VIEW view_products
AS 
SELECT
	products.isbn_code,
	products.name_book,
	authors.name_author,
	languages.language,
	editorial.name_editorial,
	products.stock,
	products.sale_price
FROM products
JOIN authors
	ON products.id_author = authors.id_author
JOIN languages
	ON products.id_language = languages.id_language
JOIN editorial
	ON products.id_editorial = editorial.id_editorial;

-- 

CREATE OR REPLACE VIEW view_vauchers
AS
SELECT
	sales.id_sale,
	st.sale_type,
	pt.payment_type,
	vt.vaucher_type,
	DATE_FORMAT(sales.datetime_sale, "%H:%I:%S") AS sale_hour,
	DATE_FORMAT(sales.datetime_sale, "%d-%m-%Y") AS sale_date,
	sales.full_sale_price,
	bs.name_bookstore
FROM sales
JOIN payment_types AS pt
	ON sales.id_payment_type = pt.id_payment_type
JOIN sale_types AS st
	ON sales.id_sale_type = st.id_sale_type
JOIN vaucher_types AS vt
	ON sales.id_vaucher_type = vt.id_vaucher_type
JOIN bookstores AS bs
	ON sales.id_bookstore = bs.id_bookstore;