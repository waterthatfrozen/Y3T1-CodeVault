import pymysql
from pymysql.constants import CLIENT

connection = pymysql.connect(
  host="localhost",
  client_flag=CLIENT.MULTI_STATEMENTS
)

with connection:  # Create a connection (pipe)
  with connection.cursor() as cursor: # Create a cursor(pointer)

    sql = "DROP DATABASE IF EXISTS css326_lab9"
    cursor.execute(sql)
      
    sql = "CREATE DATABASE css326_lab9"
    cursor.execute(sql)

    sql = "USE css326_lab9"
    cursor.execute(sql)

    myfile = open('sample_database.sql')
    sql = myfile.read()

    cursor.execute(sql)

    print(f"Imported successfully".center(50,"-"))
    cursor.execute("SHOW TABLES;")
    for row in cursor:
      print(*row)
    
  
    
