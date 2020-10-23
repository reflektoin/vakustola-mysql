import sys
import csv
import MySQLdb
#give anna csv-tiedoston nimi parametrina
mydb = MySQLdb.connect(host='127.0.0.1',
                           user='<username>',
                           passwd='<password>',
                           db='<database>')
cursor = mydb.cursor()

#talletetaan komentorivillä annettu argumentti muuttujaan
command_argument = sys.argv[1]
with open(command_argument, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in spamreader:
        cursor.execute("INSERT INTO hankinta VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", row)
        #close the connection to the database.
        mydb.commit()
cursor.close()
print (command_argument)
    
