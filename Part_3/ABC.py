import sqlite3
from sqlite3 import Error
import sys

sys.builtin_module_names

def create_connection(db_file):
   
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        cursor=conn.cursor()
        cursor.execute("PRAGMA foreign_keys=ON")
        print("Connection Established " + sqlite3.version)
    except Error as e:
        print(e)
    return conn
    

if __name__ == '__main__':
    create_connection(r"ABC.sqlite")
    



def close_connection(conn):
     conn.close
     print("The connection with the database has been closed. ")

"""
insert: define functions here
"""

def select_questionOne(conn, addressInput):
    """
    Query Sites by address
    :param conn: the connection object
    :param addressInput: Address given in query
    :return:
    """
    cur=conn.cursor()
    cur.execute("SELECT * FROM Sites WHERE address = ?", (addressInput,))
    rows = cur.fetchall()

    for row in rows:
         print(row)
         
    print("Operation done successfully \n")
    close_connection(conn)
   
def select_questionTwo(conn, schedularSystemInput):
    """
    Query DigitalDisplay, Specializes, TechnicalSupport by schedularSystem
    :param conn: the connection object
    :param schedularSystemInput: schedularSystem entered in query
    :return:
    """
    cur=conn.cursor()
    cur.execute("SELECT serialNo, modelNo, names FROM DigitalDisplay, Specializes, TechnicalSupport WHERE DigitalDisplay.modelNo=Specializes.modelNo AND Specializes.empId=TechnicalSupport.empId AND schedularSystemInput = ?", (schedularSystemInput,))
    rows = cur.fetchall()

    for row in rows:
         print(row)
         
    print("Operation done successfully \n")
    close_connection(conn)

def select_questionThree(conn):
    """
    Query DigitalDisplay, Specializes, TechnicalSupport 
    :param conn: the connection object
    :return:
    """


def main():
    database = (r"ABC.sqlite")
    conn= create_connection(database)
   
    if __name__ == '__main__':
        create_connection(r"ABC.sqlite")
    
    print("Connection with database has been established")
  
    with conn:
        while( len(sys.argv) > 3):
            s1, s2 = sys.argv[1], sys.argv[2]

            """
            Insert call statements here
            """


if __name__ == '__main__':
    main()
    

