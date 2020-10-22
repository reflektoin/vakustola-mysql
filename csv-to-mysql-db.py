import csv
import MySQLdb
#Alla oleva skripti on tehty "tutki hankintoja" -dataa (https://www.avoindata.fi/data/fi/dataset/tutkihankintoja-data) silmällä pitäen
mydb = MySQLdb.connect(host='127.0.0.1',
                           user='<username here>',
                           passwd='<password here>',
                           db='<database name here>')
cursor = mydb.cursor()

#varmista, että csv-tiedosto on samassa hakemistossa, mistä ajat skriptiä
with open('<filename here>', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in spamreader:
        cursor.execute("INSERT INTO hankinnat VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", row)
        #close the connection to the database.
        mydb.commit()
cursor.close()
print ("Done")
