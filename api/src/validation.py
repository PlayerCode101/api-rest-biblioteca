
# validaciones tabla productos
def isbn_validation(isbn_code: str) -> bool:
  isbn_list = isbn_code.split('-')
  if isbn_list[0].isnumeric() and\
    isbn_list[1].isnumeric() and\
    isbn_list[2].isnumeric() and\
    isbn_list[3].isnumeric() and\
    isbn_list[4].isnumeric():
    return ((isbn_list[0] == '978' or isbn_list[0] == '979') \
      and len(isbn_list[1]) >= 1 and len(isbn_list[1]) <= 5 \
      and len(isbn_list[2]) <= 7 and len(isbn_list[3]) <= 6 \
      and len(isbn_list[4]) == 1)
  else:
    return False

def book_name_validation(name_book: str) -> bool:
  name_book = name_book.strip()
  return (len(name_book) > 0 and len(name_book) <= 100)

def book_author_validation(id_author: int) -> bool:
  return ( id_author > 0 )

def editorial_validation(id_editorial: int) -> bool:
  return (id_editorial > 0)

def language_validation(id_language: int) -> bool:
  return (id_language > 0)

def stock_validation(stock: int) -> bool:
  return (stock > 0)

def price_validation(sale_price: int, purchase_price: int) -> bool:
  if sale_price > 0 and purchase_price > 0:
    return (sale_price > purchase_price)
  else:
    return False

def sale_type_validation(id_sale_type: int) -> bool:
  return (id_sale_type > 0)

def payment_type_validation(id_payment_type: int) -> bool:
  return (id_payment_type > 0)

def full_dale_validation(full_sale_price: int) -> bool:
  return (full_sale_price > 0)

def id_bookstore_validation(id_bookstore: int) -> bool:
  return (id_bookstore > 0)
