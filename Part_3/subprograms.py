import sqlite3
con = sqlite3.connect("example.sqlite")

cur = con.cursor()

cur.execute("CREATE TABLE movie(title, year, score)")