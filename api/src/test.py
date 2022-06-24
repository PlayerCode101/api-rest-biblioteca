isbn_code = '978-89899-9868-43-6'

isbn_list = isbn_code.split('-')

def val():
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