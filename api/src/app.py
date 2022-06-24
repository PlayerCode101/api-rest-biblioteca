from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from config import config
from validation import *

app = Flask(__name__)

connection_mysql = MySQL(app)

def error404(error):
  return '<h1>Lo sentimos. Página no encontrada...</h1>', 404

@app.route('/products', methods=['GET'])
def products_list():
  cursor = connection_mysql.connection.cursor()
  sql = """
  SELECT  isbn_code,
          name_book,
          name_author,
          language,
          name_editorial,
          stock,
          sale_price
  FROM biblioteca_db.view_products
  WHERE stock > 0;
  """
  cursor.execute(sql)
  data_books = cursor.fetchall()
  if data_books != None:
    products = []
    for row in data_books:
      product = {
        'isbn_code': row[0],
        'name_book': row[1],
        'name_author': row[2],
        'language': row[3],
        'name_editorial': row[4],
        'stock': row[5],
        'sale_price': row[6]
      }
      products.append(product)
    return jsonify({'Data':products})
  else:
    return jsonify({'Data':None})

@app.route('/products/<book_code>', methods=['GET'])
def get_book(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = """
  SELECT  isbn_code,
          name_book,
          name_author,
          language,
          name_editorial,
          stock,
          sale_price
  FROM biblioteca_db.view_products WHERE isbn_code = '{0}'
  """.format(book_code)
  cursor.execute(sql)
  data_book = cursor.fetchone()
  if data_book != None:
    book = {
        'isbn_code': data_book[0],
        'name_book': data_book[1],
        'name_author': data_book[2],
        'language': data_book[3],
        'name_editorial': data_book[4],
        'stock': data_book[5],
        'sale_price': data_book[6]
        }
    return jsonify({'Data': book})
  else:
    return jsonify({'Data': None})

@app.route('/product_registration', methods=['POST'])
def product_registration():
  cursor = connection_mysql.connection.cursor()
  sql = """
  SELECT isbn_code FROM biblioteca_db.products WHERE isbn_code = '{0}'
  """.format(request.json['isbn_code'])
  cursor.execute(sql)
  data_book = cursor.fetchone()
  if (data_book != None):
    return jsonify({'Data': 'El producto ya está registrado.'})
  elif ( data_book == None and \
    isbn_validation(request.json['isbn_code']) and \
    book_name_validation(request.json['name_book']) and \
    book_author_validation(request.json['id_author']) and \
    editorial_validation(request.json['id_editorial']) and \
    language_validation(request.json['id_language']) and \
    price_validation(request.json['sale_price'], request.json['purchase_price']) and \
    stock_validation(request.json['stock'])):
    cursor = connection_mysql.connection.cursor()
    sql = """
    INSERT INTO biblioteca_db.products
    (isbn_code, name_book, id_author, id_language, id_editorial, stock, purchase_price, sale_price)
    VALUES('{0}', '{1}', {2}, '{3}', '{4}', {5}, {6}, {7});""".format(
      request.json['isbn_code'],
      request.json['name_book'],
      request.json['id_author'],
      request.json['id_language'],
      request.json['id_editorial'],
      request.json['stock'],
      request.json['purchase_price'],
      request.json['sale_price']
      )
    cursor.execute(sql)
    connection_mysql.connection.commit()
    return jsonify({'Data': 'producto {} registrado.'.format(request.json['isbn_code'])})
  else:
    return jsonify({'Data': 'ERROR'})

@app.route('/delete_book/<book_code>', methods=['DELETE'])
def delete_book(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = """
  SELECT isbn_code FROM biblioteca_db.products WHERE isbn_code = '{0}'
  """.format(book_code)
  cursor.execute(sql)
  data_book = cursor.fetchone()
  if (data_book != None):
    sql_delite = 'DELETE FROM biblioteca_db.products WHERE isbn_code = "{0}"'.format(book_code)
    cursor.execute(sql_delite)
    connection_mysql.connection.commit()
    return jsonify({'Data': 'producto {} eliminado.'.format(book_code)})
  else:
    return jsonify({'Data': 'El libro con el código {} no existe.'.format(book_code)})

@app.route('/update_stock/<book_code>', methods=['PUT'])
def update_stock(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = 'UPDATE biblioteca_db.products SET stock = {0} WHERE isbn_code = "{1}"'.format(request.json['stock'], book_code)
  cursor.execute(sql)
  connection_mysql.connection.commit()
  return jsonify({'Data': 'producto {} actualizado.'.format(book_code)})

@app.route('/vauchers', methods=['GET'])
def vauches():
  cursor = connection_mysql.connection.cursor()
  sql = """
  SELECT id_sale,
         sale_type,
         payment_type,
         vaucher_type,
         sale_hour,
         sale_date,
         full_sale_price,
         name_bookstore
  FROM view_vauchers
  """
  cursor.execute(sql)
  data_vauchers = cursor.fetchall()
  if data_vauchers != None:
    vauchers = []
    for row in data_vauchers:
      vaucher = {
          'id_sale': row[0],
          'sale_type': row[1],
          'payment_type': row[2],
          'vaucher_type': row[3],
          'sale_hour': row[4],
          'sale_date': row[5],
          'full_sale_price': row[6],
          'name_bookstore': row[7]
          }
      vauchers.append(vaucher)
    return jsonify({'Data': vauchers})
  else:
    return jsonify({'Data': None})

@app.route('/create_invoice', methods=['POST'])
def create_invoice():
  cursor = connection_mysql.connection.cursor()
  if (sale_type_validation(request.json['id_sale_type']) and \
    payment_type_validation(request.json['id_payment_type']) and \
    full_dale_validation(request.json['full_sale_price']) and \
    id_bookstore_validation(request.json['id_bookstore'])):
    cursor = connection_mysql.connection.cursor()
    sql = """
    INSERT INTO biblioteca_db.sales
    (id_sale_type, id_payment_type, id_vaucher_type, full_sale_price, datetime_sale, id_bookstore)
    VALUES('{0}', '{1}', 1, '{2}', CURRENT_TIMESTAMP, {3});""".format(
      request.json['id_sale_type'],
      request.json['id_payment_type'],
      request.json['full_sale_price'],
      request.json['id_bookstore'],
      )
    cursor.execute(sql)
    connection_mysql.connection.commit()
    return jsonify({'Data': 'Factura generada con exito.'})
  else:
    return jsonify({'Data': 'ERROR'})

@app.route('/create_ticket', methods=['POST'])
def create_ticket():
  cursor = connection_mysql.connection.cursor()
  if (sale_type_validation(request.json['id_sale_type']) and \
    payment_type_validation(request.json['id_payment_type']) and \
    full_dale_validation(request.json['full_sale_price']) and \
    id_bookstore_validation(request.json['id_bookstore'])):
    cursor = connection_mysql.connection.cursor()
    sql = """
    INSERT INTO biblioteca_db.sales
    (id_sale_type, id_payment_type, id_vaucher_type, full_sale_price, datetime_sale, id_bookstore)
    VALUES('{0}', '{1}', 2, '{2}', CURRENT_TIMESTAMP, {3});""".format(
      request.json['id_sale_type'],
      request.json['id_payment_type'],
      request.json['full_sale_price'],
      request.json['id_bookstore'],
      )
    cursor.execute(sql)
    connection_mysql.connection.commit()
    return jsonify({'Data': 'Boleta generada con exito.'})
  else:
    return jsonify({'Data': 'ERROR'})

if __name__ == '__main__':
  app.config.from_object(config['development'])
  app.register_error_handler(404, error404)
  app.run()
