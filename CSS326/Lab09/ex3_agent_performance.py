import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab9"
)

with connection:
  with connection.cursor() as cursor:

    sql = """SELECT a.AGENT_NAME, SUM(c.OUTSTANDING_AMT) FROM customer c INNER JOIN agents a ON c.AGENT_CODE = a.AGENT_CODE GROUP BY c.AGENT_CODE;"""

    cursor.execute(sql)
    for row in cursor:
      print(*row)

