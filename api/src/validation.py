
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

def book_category_validation(book_category: str) -> bool:
  book_category = book_category.strip()
  return (len(book_category) > 0 and len(book_category) <=40)

def editorial_validation(editorial: str) -> bool:
  editorial = editorial.strip()
  return (len(editorial) > 0 and len(editorial) <= 100)

def sale_price_validation(sale_price: int, purchase_price: int) -> bool:
  return (sale_price > purchase_price)