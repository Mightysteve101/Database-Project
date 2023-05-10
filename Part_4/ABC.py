import sqlite3
from sqlite3 import Error
import sys


# sys.builtin_module_names


'''
    Creates a database file connection
'''


def create_connection(db_file):

    conn = None
    try:
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()
        cursor.execute("PRAGMA foreign_keys=ON")
        print("Connection Established " + sqlite3.version)
    except Error as e:
        print(e)
    return conn

# if __name__ == '__main__':
#     create_connection(r"ABC.sqlite")


def close_connection(conn):
    conn.close
    print("The connection with the database has been closed. ")


"""
insert: define functions here
"""


def select_option_one(conn):
    cur = conn.cursor()
    cur.execute("SELECT * FROM DigitalDisplay")
    records = cur.fetchall()
    if ((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print("Empty Table.")

    model = input(
        'If you wish to see the detailed information of a Model please enter the model number:')
    cur = conn.cursor()
    cur.execute("SELECT * FROM Model WHERE modelNo =?", (model,))
    records = cur.fetchall()
    for i in records:
        cur = conn.cursor()
        # cur.execute("SELECT * FROM Model WHERE modelNo =?", (model,))
        # records = cur.fetchall()
        if (i[0] == model):
            print("The detailed model information: ")
        print(i)


def select_option_two(conn):
    '''
    Creates a connection to database 
    Creates a cursor option by calling the cursor method
    Search digital displays given a scheduler system
    '''
    schedulerSystem = input(
        "Search digital display given the schedular system:")
    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM DigitalDisplay WHERE schedulerSystem =?", (schedulerSystem,))
    records = cur.fetchall()
    if ((len(records)) != 0):
        for row in records:
            print(row)
    else:
        print("Empty Table.")

        
#strip spaces from schedularsystem

#Check if model exists before creating DigitalDisplay, Foreign Key requires it
#Add error handle in case there is the same modelNo
def select_option_three(conn):
    cur = conn.cursor()
    modelNo = input("What is the modelNo: ")
    serialNo = input("What is the serialNo: ")
    schedulerSystem = input("What type of schedularSystem: ")
<<<<<<< HEAD
    modelNo = input("What is the modelNo: ")
    cur.execute("INSERT INTO Model(modelNo) VALUES (?)", (modelNo,))
    cur.execute("INSERT INTO DigitalDisplay(serialNo, schedulerSystem, modelNo) VALUES (?, ?, ?)", (serialNo, schedulerSystem, modelNo,))
    # This method commits the current transaction. If you don't call this method, anything you did since the last call to commit() is not
    # visible from other database connections.
    conn.commit()
    #execute select statement to fetchall digitaldisplays
    records = cur.fetchall()
    if ((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print("This is Empty table")
=======
    
    cur.execute("SELECT * FROM Model WHERE modelNo = ?", (modelNo,))
    model = cur.fetchone()
    if model:
        cur.execute("INSERT INTO DigitalDisplay(serialNo, schedulerSystem, modelNo) VALUES (?, ?, ?)", (serialNo, schedulerSystem, modelNo,))
        # This method commits the current transaction. If you don't call this method, anything you did since the last call to commit() is not
        # visible from other database connections.
        conn.commit()
        #execute select statement to fetchall digitaldisplays
        records = cur.fetchall()
        if ((len(records)) != 0):
            for row in records:
                print(row)
        else:
            print("This is Empty table")
    else:
        print("Model with modelNo", modelNo, "does not exist")
>>>>>>> e49559d4e497cf2943e54a8bca3f3f081cd84fe4

# Ask how to handle DigitalDisplays that have Specializes records that reference it
def select_option_four(conn):
    cur = conn.cursor()
    cur.execute("SELECT * FROM DigitalDisplay")
    records = cur.fetchall()

    if len(records) == 0:
        print("Empty table")
        return

    # Display all digital displays
    print("All digital displays:")
    for row in records:
        print(row)

    # Ask user to select a digital display to delete
    serialNo = input("Enter the serial number of the digital display to delete: ")

    # Check if the selected digital display exists in the table
    cur.execute("SELECT * FROM DigitalDisplay WHERE serialNo=?", (serialNo,))
    record = cur.fetchone()

    if record is None:
        print("Digital display not found")
        return
    
    
    # Delete any Locates records that reference the soon-to-be-deleted serialNo
    cur.execute("DELETE FROM Locates WHERE serialNo = ?", (serialNo,))
    conn.commit()

    # Delete the selected digital display
    cur.execute("DELETE FROM DigitalDisplay WHERE serialNo=?", (serialNo,))
    conn.commit()
    print("Digital display deleted")

    # Check if any other digital display has the same model number
    cur.execute("SELECT * FROM DigitalDisplay WHERE modelNo=?", (record[2],))
    records = cur.fetchall()

    if len(records) == 0:
        # Delete any Specializes records that reference the soon-to-be-deleted modelNo
        cur.execute("DELETE FROM Specializes WHERE modelNo = ?", (record[2],))
        conn.commit()
        # Delete the corresponding model number from the "Model" table
        cur.execute("DELETE FROM Model WHERE modelNo=?", (record[2],))
        conn.commit()
        print("Model number deleted")

    # Display all digital displays and models after deletion
    print("All digital displays after deletion:")
    cur.execute("SELECT * FROM DigitalDisplay")
    records = cur.fetchall()
    for row in records:
        print(row)

    print("All models after deletion:")
    cur.execute("SELECT * FROM Model")
    records = cur.fetchall()
    for row in records:
        print(row)


## Check if model exists before updating the DigitalDisplay, and do not update the old model with the new model number
def select_option_five(conn):
    cur = conn.cursor()
    cur.execute("SELECT * FROM DigitalDisplay")
    records = cur.fetchall()
    if ((len(records)) != 0):
        for row in records:
            print(row)
        
        serialNo = input("Enter the serial number of the digital display you want to update: ")
        cur.execute("SELECT * FROM DigitalDisplay WHERE serialNo=?", (serialNo,))
        record = cur.fetchone()

        if record:
            print("Updating digital display with serial number:", serialNo)

            schedulerSystem = input("Enter the new scheduler system for the digital display(Random, Smart, Virtue): ").strip()
            if schedulerSystem in ["Random", "Smart", "Virtue"]:
                modelNo = input("Enter the new model number for the digital display: ")

                cur.execute("SELECT * FROM Model WHERE modelNo = ?", (modelNo,))
                model = cur.fetchone()
                if model:
                    # Update the DigitalDisplay table
                    cur.execute("UPDATE DigitalDisplay SET schedulerSystem=?, modelNo=? WHERE serialNo=?",
                            (schedulerSystem, modelNo, serialNo))

                    # Commit the changes
                    conn.commit()

                    print("Digital display with serial number", serialNo, "updated successfully")
                else:
                    print("Model with modelNo", modelNo, "does not exist")
            else:
                print("Scheduler System ", schedulerSystem, " not a valid value")
        else:
            print("Digital display with serial number", serialNo, "does not exist")
    else:
        print("Empty table")




def select_option_six(conn):
    conn.close
    print("The connection with the database has been closed. ")


def main():
    db_name = input("Please enter the name of the database: ")
    conn = create_connection(db_name)
    while True:
        
        # if (db_name == "ABC.sqlite"):
        #     database = (r"ABC.sqlite")
            
            print("1. Display all the digital displays.\n")
            print("2. Search digital displays given a scheduler system.\n")
            print("3. Insert a new digital display.\n")
            print("4. Delete a digital display.\n")
            print("5. Update a digital display.\n")
            print("6. Logout.")
            main_menu = input(
                'Please enter the number for the desired option for the menu:')
        # else:
        #     print("Invalid database name. Please try again. ")

            if (main_menu == '1'):
                select_option_one(conn)

            elif (main_menu == '2'):
                select_option_two(conn)

            elif (main_menu == '3'):
                select_option_three(conn)

            elif(main_menu=='4'):
                select_option_four(conn)

            elif(main_menu=='5'):
                select_option_five(conn)
    # question
            elif (main_menu == '6'):
                break
            
            else:
                print("Invalid input. Please try again ")

    close_connection(conn)

if __name__ == '__main__':
    main()
