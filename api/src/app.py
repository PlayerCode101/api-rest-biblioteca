from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from config import config
from validation import *

app = Flask(__name__)

@app.route('/')
def index():
  return 'Hola'

connection_mysql = MySQL(app)

def error404(error):
  return '<h1>Página no encontrada...</h1>', 404

@app.route('/productos', methods=['GET'])
def products_list():
  cursor = connection_mysql.connection.cursor()
  sql = "SELECT * FROM biblioteca_db.producto WHERE stock > 0;"
  cursor.execute(sql)
  data_books = cursor.fetchall()
  if data_books != None:
    products = []
    for row in data_books:
      product = {
        'codigo_isbn': row[0],
        'nombre_libro': row[1],
        'stock': row[2],
        'categoria_libro': row[3],
        'editorial': row[4],
        'precio_compra': row[5],
        'precio_venta': row[6]
      }
      products.append(product)
    return jsonify({'Data':products})
  else:
    return jsonify({'Data':None})

@app.route('/productos/<book_code>', methods=['GET'])
def get_book(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = 'SELECT * FROM biblioteca_db.producto WHERE isbn_code = "{0}"'.format(book_code)
  cursor.execute(sql)
  data_book = cursor.fetchone()
  if data_book != None:
    book = {
      'codigo_isbn': data_book[0],
      'nombre_libro': data_book[1],
      'stock': data_book[2],
      'categoria_libro': data_book[3],
      'editorial': data_book[4],
      'precio_compra': data_book[5],
      'precio_venta': data_book[6]
    }
    return jsonify({'Data': book})
  else:
    return jsonify({'Data': None})

@app.route('/product_registration', methods=['POST'])
def product_registration():
  if(isbn_validation(request.json['isbn_code']) and \
    book_name_validation(request.json['nombre_libro']) and \
    book_category_validation(request.json['categoria_libro']) and \
    editorial_validation(request.json['editorial']) and \
    sale_price_validation(request.json['precio_venta'], request.json['precio_compra'])):
    cursor = connection_mysql.connection.cursor()
    sql = """
    INSERT INTO biblioteca_db.producto
    (isbn_code, nombre_libro, stock, categoria_libro, editorial, precio_compra, precio_venta)
    VALUES('{0}', '{1}', {2}, '{3}', '{4}', {5}, {6});""".format(
      request.json['isbn_code'],
      request.json['nombre_libro'],
      request.json['stock'],
      request.json['categoria_libro'],
      request.json['editorial'],
      request.json['precio_compra'],
      request.json['precio_venta']
      )
    cursor.execute(sql)
    connection_mysql.connection.commit()
    return jsonify({'Data': 'producto {} registrado.'.format(request.json['isbn_code'])})
  else:
    return jsonify({'Data': 'ERROR'})

@app.route('/delete_book/<book_code>', methods=['DELETE'])
def delete_book(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = 'DELETE FROM biblioteca_db.producto WHERE isbn_code = "{0}"'.format(book_code)
  cursor.execute(sql)
  connection_mysql.connection.commit()
  return jsonify({'Data': 'producto {} eliminado.'.format(book_code)})

@app.route('/update_stock/<book_code>', methods=['PUT'])
def update_stock(book_code):
  cursor = connection_mysql.connection.cursor()
  sql = 'UPDATE biblioteca_db.producto SET stock = {0} WHERE isbn_code = "{1}"'.format(request.json['stock'], book_code)
  cursor.execute(sql)
  connection_mysql.connection.commit()
  return jsonify({'Data': 'producto {} actualizado.'.format(book_code)})

if __name__ == '__main__':
  app.config.from_object(config['development'])
  app.register_error_handler(404, error404)
  app.run()
