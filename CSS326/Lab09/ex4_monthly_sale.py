import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab9"
)

with connection:
  with connection.cursor() as cursor:

    sql = """SELECT MONTHNAME(ORD_DATE),SUM(ORD_AMOUNT) FROM orders GROUP BY MONTH(ORD_DATE) ORDER BY MONTH(ORD_DATE);"""

    cursor.execute(sql)
    for row in cursor:
      print(*row)

