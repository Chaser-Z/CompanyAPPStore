#!/usr/bin/python3
# -*- coding:utf-8 -*-
import pymysql.cursors

class Mysql:

  def queryData(self):
      config = {
          'host': '127.0.0.1',
          'port': 3306,
          'user': 'root',
          'password': 'root',#密码
          'db': 'appstore',
          'charset': 'utf8',
          'cursorclass': pymysql.cursors.DictCursor,
      }
      # Connect to the database
      connection = pymysql.connect(**config)

      try:
          with connection.cursor() as  cursor:
              sql = "SELECT * FROM app_list" #sql语句
              try:
                  cursor.execute(sql)
              except Exception as err:
                  result = {"msg": "Table doesn't exist", "resultData": '', "errorCode": -100}
                  print(err)
                  return result
              row = cursor.fetchall() #查询数据
              print(row)
              result = {"msg": "ok", "resultData": row, "errorCode": 0}
              return result
          connection.commit()
      finally:
          connection.close()