import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab8",
)

with connection:
  with connection.cursor() as cursor:
      
    sql2 = """INSERT INTO course(title, code, credit) 
    VALUES (%s, %s, %s);
    """
    values = [("How to train your dragon","DRA101",3),
    ("Black magic defense","HOG411",3),("Killing License","SPY007",3)]

    try:
      cursor.executemany(sql2, values)
      connection.commit()   # equal to save
    except Exception as err:
      print("Error, rollbacked!",err)
      connection.rollback()

    print(f"Total {cursor.rowcount} course inserted")

    