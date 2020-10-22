import csv
import MySQLdb
#Alla oleva skripti on tehty "tutki hankintoja" -dataa (https://www.avoindata.fi/data/fi/dataset/tutkihankintoja-data) silmällä pitäen
#komento hankinnat-taulun luontiin "create table hankinnat (lasku_id varchar(8), tili varchar(40) , tiliointisumma numeric(10,2), tositepvm varchar(10), toimittaja_y_tunnus varchar(10), toimittaja_nimi  varchar(50), hankintayksikko_tunnus varchar(5), hankintayksikko varchar(128), ylaorganisaatio_tunnus varchar(5), ylaorganisaatio varchar(128), sektori varchar(128), tuote_palveluryhma varchar(128), hankintakategoria varchar(128));
"
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
