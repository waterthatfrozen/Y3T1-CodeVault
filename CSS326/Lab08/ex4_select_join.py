import pymysql

connection = pymysql.connect(
  host="localhost",
  database="css326_lab8",
)

with connection:
  with connection.cursor() as cursor:
      
    sql = """SELECT u.email,u.first_name,u.last_name,c.title 
    FROM user_course uc INNER JOIN user u ON uc.user_email = u.email 
    INNER JOIN course c ON uc.course_code = c.code"""
    cursor.execute(sql)
    
    for row in cursor:
      print(row)

    