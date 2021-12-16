import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab8",
)

with connection:
  with connection.cursor() as cursor:
      
    sql = """INSERT INTO user(title, first_name, last_name, email) 
    VALUES (%s, %s, %s, %s);
    """
    values = [
      ("Mr", "James", "NoTime", "notime@todie.com"),
      ("Mr", "Dora", "Emon", "dora@robot.cat"),
      ("Mr", "Aegon", "Targaryen", "aegon@dragonstone.thefirst"),
      ("Mr", "Walter", "White", "white@heisenburg.best")
    ]

    try:
      cursor.executemany(sql, values)
      connection.commit()   # equal to save
    except Exception as err:
      print("Error, rollbacked!",err)
      connection.rollback()

    print(f"Total {cursor.rowcount} inserted")

    