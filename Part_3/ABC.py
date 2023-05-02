import sqlite3
from sqlite3 import Error
import sys
import argparse

sys.builtin_module_names

def create_connection(db_file):

<<<<<<< HEAD
    """Create a database connection to the SQLite database"""
   
=======
>>>>>>> 3cfa69997e67f26d57920f579cb62b40deacd28b
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        cursor=conn.cursor()
        cursor.execute("PRAGMA foreign_keys=ON")
        print("Connection Established " + sqlite3.version)
    except Error as e:
        print(e)
    return conn
<<<<<<< HEAD


if __name__ == '__main__':
    create_connection(r"ABC.sqlite")
    
=======
>>>>>>> 3cfa69997e67f26d57920f579cb62b40deacd28b

# if __name__ == '__main__':
#     create_connection(r"Part_3/ABC.sqlite")


def close_connection(conn):
     conn.close
     print("The connection with the database has been closed. ")



"""
insert: define functions here
"""

def select_questionOne(conn, other):
    """
    Query Sites by address
    :param conn: the connection object
    :param other: Address given in query
    :return:
    """
   

    cur=conn.cursor()

    wrapped_other = ("",)

    if(isinstance(other, str)):
        wrapped_other = ("%%"+other+"%%",)
    else:
        tmp_str = ""
        for item in other:
            tmp_str += item + " "
        tmp_str = tmp_str.strip()
        wrapped_other = ("%%"+tmp_str+"%%",)

   
    cur.execute("SELECT * FROM Site WHERE address LIKE ?", wrapped_other)

    records = cur.fetchall()


    if((len(records)) != 0):
        for row in records:
            print(row)
    else:
        print ("No matching rows returned.")


    close_connection(conn)

def select_questionTwo(conn, schedulerSystemInput):
    """
    Query DigitalDisplay, Specializes, TechnicalSupport by schedularSystem
    :param conn: the connection object
    :param schedularSystemInput: schedularSystem entered in query
    :return:
    """
    cur=conn.cursor()
    cur.execute("SELECT serialNo, DigitalDisplay.modelNo, name FROM DigitalDisplay, Specializes, TechnicalSupport WHERE DigitalDisplay.modelNo=Specializes.modelNo AND Specializes.empId=TechnicalSupport.empId AND schedulerSystem = ?", (schedulerSystemInput,))
    records = cur.fetchall()

    if((len(records)) != 0):
        for row in records:
            print(row)
    else:
        print ("No matching rows returned.")


    close_connection(conn)

def select_questionThree(conn, other):
    """
    Query DigitalDisplay, Specializes, TechnicalSupport
    :param conn: the connection object
    :return:
    """
    cur=conn.cursor()
    cur.execute("SELECT COUNT(name) AS cnt, name AS Name FROM Salesman WHERE (empId, name, gender) IN (SELECT empId, name, gender FROM Salesman WHERE Name = Name) GROUP BY name ORDER BY name ASC")
    counts = cur.fetchall()
    

    print("Name       cnt")
    print("--------------")

    if((len(counts)) != 0):
        for row in counts:
            if(row[0] == 1):
                print(row[1].ljust(10) , row[0])
            else:
                cur.execute("SELECT empId, name, gender FROM Salesman WHERE name = ?", [(row[1]),])
                dupes = cur.fetchall()
                dupe_string = ""
                for dupe in dupes:
                    dupe_string += ",(" + str(dupe[0]) + "," + dupe[1] + ",'" + dupe[2] + "')"
                print(row[1].ljust(10), row[0], dupe_string[1:])

    else:
        print ("Empty Table.")


    close_connection(conn)


def select_questionFour(conn, phone):
    """
    Query clientId, name, phone, address
    :param conn: phone ext '-####'
    :return:
    """

    cur=conn.cursor()
    cur.execute("SELECT clientId, name, phone, address FROM Client WHERE phone =?", (phone,))
    records = cur.fetchall()

    if((len(records)) != 0):
        for row in records:
            print(row)
    
    else:
        print("Empty Table.")

    close_connection(conn)

def select_questionFive(conn, other):
    """
    Query empID, name, hours
    :param conn: the connection object
    :return:
    """
    
    cur=conn.cursor()
    cur.execute("SELECT a.empID, a.name, hours FROM Administrator a JOIN AdmWorkHours b ON b.empID = a.empId ORDER BY hours ASC")
    records = cur.fetchall()

    if((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print("Empty Table.")

        close_connection(conn)

<<<<<<< HEAD
<<<<<<< HEAD

def select_question_Four(conn, phone):
    """
    Query phone from Client table
    :param conn: The connection object
    :param phone:
    :return:
    """

    cur = conn.cursor()
    cur.execute("SELECT phone FROM Client WHERE phone =?", (phone,))
    
    rows = cur.fetchall()

    for rows in rows:
        print(rows)

def select_AdmWorkHours_by_priority(conn, day):
    """
    Query tasks by priority
    :param conn: the connection object
    :param day
    :return:
    """
    cur = conn.cursor()
    cur.execute("SELECT * FROM AdmWorkHours WHERE day=?", (day,))

    rows = cur.fetchall()

    for row in rows:
        print(row)


def main():
    database = (r"ABC.sqlite")
    conn= create_connection(database)
   
    if __name__ == '__main__':
        create_connection(r"ABC.sqlite")
    
    print("Connection with database has been established")
  
    with conn:

        print("4.) Query selected phone numbers")
        select_question_Four(conn, -5539)


        """
        while( len(sys.argv) > 3):
            s1, s2 = sys.argv[1], sys.argv[2]
        """




if __name__ == '__main__':
    main()
=======
    close_connection(conn)
=======
def select_questionSix(conn, modelNo):
    """
    Query name
    :param conn: modelNo
    :return:
    """

    cur=conn.cursor()
    cur.execute("SELECT name FROM TechnicalSupport t JOIN Specializes s ON t.empId = s.empId WHERE modelNo =?", (modelNo,))
    records = cur.fetchall()

    if((len(records)) != 0):
        for row in records:
            print(row)
    else:
        print("Empty Table");

        close_connection(conn)
>>>>>>> 55366269864c5d66fde7c7ccfca40fc0a61efa41



#For number Seven

def select_questionSeven(conn, other):

    cur=conn.cursor()
    cur.execute("SELECT Salesman.name, AVG(Purchases.commissionRate) AS avg_commission FROM Salesman INNER JOIN Purchases ON Salesman.empId = Purchases.empId GROUP BY Salesman.name ORDER BY avg_commission DESC;")
    records = cur.fetchall()
    

    if((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print ("Empty Table.")


    close_connection(conn)


#For number eight

def select_questionEight(conn, other):

    cur=conn.cursor()
    cur.execute("SELECT 'Administrator' AS Role, COUNT(*) AS cnt FROM administrator UNION ALL SELECT 'Salesmen' AS Role, COUNT(*) AS cnt FROM salesman UNION ALL SELECT 'Technicians' AS Role, COUNT(*) AS cnt FROM technicalsupport;")
    records = cur.fetchall()
    print("Role       cnt")
    print("--------------")

    if((len(records)) != 0):
        for row in records:
            print(row)

    else:
        print ("Empty Table.")


    close_connection(conn)




def main(question_num, other):
    database = (r"Part_3/ABC.sqlite")
    conn= create_connection(database)
  

    if(question_num=='1'):
        print('calling question one')
        if other is None:
            #error message here
            print("Missing parameter.")
            return 1
        select_questionOne(conn, other)

    elif(question_num=='2'):
        if other is None:
            print("Missing parameter.")
            return 1
        select_questionTwo(conn, other)
    elif(question_num=='3'):
        select_questionThree(conn, other)

    elif(question_num=='4'):
        if other is None:
            print("Missing parameter.")
            return 1
        select_questionFour(conn,other)
    
    elif(question_num=='5'):
        select_questionFive(conn, other)
    #question
    elif(question_num=='6'):
        if other is None:
            print("Missing parameter.")
            return 1
        select_questionSix(conn, other)

#for selecting question Seven
    elif(question_num=='7'):
        select_questionSeven(conn, other)

 #for selecting question Eight
    elif(question_num=='8'):
        select_questionEight(conn, other)
    else:
        close_connection(conn)
        return 1


if __name__ == '__main__':
    print(sys.argv)
    if (len(sys.argv) >= 3):
        if (len(sys.argv) > 3):
            main(sys.argv[1], sys.argv[2:])
        else:
            main(sys.argv[1], sys.argv[2])


    else:
        main(sys.argv[1], None)

>>>>>>> 3cfa69997e67f26d57920f579cb62b40deacd28b
