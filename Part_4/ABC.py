import sqlite3
from sqlite3 import Error
import sys
import argparse

sys.builtin_module_names


'''
    Creates a database file connection
'''
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

# if __name__ == '__main__':
#     create_connection(r"Part_3/ABC.sqlite")


def close_connection(conn):
     conn.close
     print("The connection with the database has been closed. ")

"""
insert: define functions here
"""
def select_option_one(conn):
    cur=conn.cursor()
    cur.execute("SELECT * FROM DigitalDisplay")
    records = cur.fetchall()
    if((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print("Empty Table.")
 
    model = input('If you wish to see the detailed information of a Model please enter the model number:')
    cur=conn.cursor()
    cur.execute("SELECT * FROM Model WHERE modelNo =?", (model,))
    records = cur.fetchall()
    for i in records:
        cur=conn.cursor()
        cur.execute("SELECT * FROM Model WHERE modelNo =?", (model,))
        records = cur.fetchall()
        if (i == model):
            print("The detailed model information: ")
        print(i)
    
 
def select_option_two(conn):
    '''
    Creates a connection to database 
    Creates a cursor option by calling the cursor method
    Search digital displays given a scheduler system
    '''
    schedularSystem = input("Search digital display given the schedular system:")
    cur=conn.cursor()
    cur.execute("SELECT * FROM DigitalDisplay WHERE schedulerSystem =?", (schedularSystem,))
    records = cur.fetchall()
    if((len(records)) != 0):
        for row in records:
            print(row)
    else:
        print("Empty Table.")

        close_connection(conn)


def select_option_three(conn):
    serialNo = input("What is the serialNo: ")
    schedularSystem = input("What type of schedularSystem: ")
    modelNo = input("What is the modelNo: ")
    cur = conn.cursor()
    cur.execute("INSERT INTO DigitalDisplay(serialNo, schedulerSystem, modelNo) VALUES (?, ?, ?)", (serialNo, schedularSystem, modelNo))
    #This method commits the current transaction. If you don't call this method, anything you did since the last call to commit() is not 
    #visible from other database connections.
    conn.commit()
    records = cur.fetchall()
    if((len(records)) !=0):
        for row in records:
            print(row)
    
    else:
        print("Empty table")

        close_connection(conn)





#def select_option_four(conn):

#def select_option_five(conn):
   

def select_option_six(conn):
    conn.close
    print("The connection with the database has been closed. ")
 



while True:
    def main():
        db_name = input("Please enter the name of the database: ")
        if (db_name == "ABC.sqlite"): 
            database = (r"Part_3/ABC.sqlite")
            conn= create_connection(database)
            print("1. Display all the digital displays.\n")
            print("2. Search digital displays given a scheduler system.\n")
            print("3. Insert a new digital display.\n")
            print("4. Delete a digital display.\n")
            print("5. Update a digital display.\n")
            print("6. Logout.")
            main_menu = input('Please enter the number for the desired option for the menu:')
        else: 
            print("Invalid database name. Please try again. ")
  

            if(main_menu=='1'):
                select_option_one(conn)

            elif(main_menu=='2'):
                select_option_two(conn)

            elif(main_menu=='3'):
                select_option_three(conn)

            #elif(main_menu=='4'):
                #select_option_four(conn)
    
            #elif(main_menu=='5'):
                #select_option_five(conn)
    #question
            #elif(main_menu=='6'):
                #select_option_six(conn)
            else:
                print("Invalid input. Please try again ")



        if __name__ == '__main__':
            main()