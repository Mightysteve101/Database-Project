import sqlite3
import sys, getopt


con = sqlite3.connect("example.sqlite")

cur = con.cursor()

res = cur.execute("SELECT name FROM sqlite_master")
res.fetchone()