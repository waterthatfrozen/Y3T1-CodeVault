import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab8"
)

with connection:
  with connection.cursor() as cursor:
    sql1 = """CREATE TABLE user (
      title varchar(100) DEFAULT NULL,
      first_name varchar(250) DEFAULT NULL,
      last_name varchar(250) DEFAULT NULL,
      email varchar(250) NOT NULL PRIMARY KEY,
      usergroup varchar(20) DEFAULT NULL,
      disabled tinyint(4) DEFAULT NULL
    ) DEFAULT CHARSET=utf8mb4;
    """

    cursor.execute(sql1)

    sql2 = """CREATE TABLE course(
      title varchar(250) DEFAULT NULL,
      code varchar(10) NOT NULL PRIMARY KEY,
      credit float DEFAULT NULL
    ) DEFAULT CHARSET=utf8mb4;
    """

    cursor.execute(sql2)

