import sys
import csv
import pymysql
#anna csv-tiedoston nimi parametrina


#talletetaan komentorivillä annettu argumentti muuttujaan
command_argument = sys.argv[1]
rivilista = []
with open(command_argument, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in spamreader:
        rivilista.append(row)
        
    mydb = pymysql.connect(host='127.0.0.1',
                           user='<db_user>',
                           passwd='<password_db_user>',
                           db='<database_name>')
    cursor = mydb.cursor()
    cursor.executemany("insert into hankinta values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", rivilista)
    mydb.commit()
cursor.close()
print (command_argument)
    
