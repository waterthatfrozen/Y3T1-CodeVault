import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab8"
)

with connection:
  with connection.cursor() as cursor:

    # create m2m table
    sql = """CREATE TABLE IF NOT EXISTS user_course  (
      user_email varchar(250) NOT NULL,
      course_code varchar(250) NOT NULL,
      PRIMARY KEY (user_email,course_code),
      CONSTRAINT uc_u_fk FOREIGN KEY (user_email) REFERENCES user (email)
      ON DELETE RESTRICT ON UPDATE CASCADE,
      CONSTRAINT uc_c_fk FOREIGN KEY (course_code) REFERENCES course (code)
      ON DELETE RESTRICT ON UPDATE CASCADE
    ) DEFAULT CHARSET=utf8mb4;
    """

    cursor.execute(sql)

    # add user data
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

    print(f"Total {cursor.rowcount} users inserted")

    # add user_course data
    sql2 = """INSERT INTO user_course(user_email, course_code) 
    VALUES (%s, %s);
    """
    values = [
      ("notime@todie.com", "SPY007"),
      ("dora@robot.cat", "DRA101")
    ]

    try:
      cursor.executemany(sql2, values)
      connection.commit()   # equal to save
    except Exception as err:
      print("Error, rollbacked!",err)
      connection.rollback()

    print(f"Total {cursor.rowcount} m2m inserted")

