import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab9"
)

with connection:
  with connection.cursor() as cursor:

    sql = """SELECT MAX(OUTSTANDING_AMT),MIN(OUTSTANDING_AMT),AVG(OUTSTANDING_AMT) FROM customer;"""

    cursor.execute(sql)
    for row in cursor:
      print(*row)

