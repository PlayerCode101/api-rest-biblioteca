from distutils.command.config import config
from distutils.debug import DEBUG


class DevelopmentConfig():
  DEBUG = True
  MYSQL_HOST = '0.0.0.0'
  MYSQL_PORT = 23306
  MYSQL_USER = 'root'
  MYSQL_PASSWORD = 'carlos'
  MYSQL_DB = 'biblioteca_db'

config = {
  'development': DevelopmentConfig
}