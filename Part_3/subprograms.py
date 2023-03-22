import sqlite3
con = sqlite3.connect("ABC.sqlite")

cur = con.cursor()

cur.execute("CREATE TABLE movie(title, year, score)")