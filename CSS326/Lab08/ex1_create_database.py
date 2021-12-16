import pymysql

connection = pymysql.connect(
  host="localhost"
)

with connection:
  with connection.cursor() as cursor:
    sql = "CREATE DATABASE css326_lab8"
    cursor.execute(sql)