#load data
./lataa_aineisto.sh
#split files to smaller in order to import them faster to database using multiple processes
echo "Aloita splittaus"
./splittaus.sh .
echo "Splittaus päättyi"
#create table
echo "Aloitaan importtaus"
mysql -h 127.0.0.1 -u <db_username> -p < luo_hankintataulu.sql
#create processes to insert files to table
for file in `ls -1 ./*.csv[0-9][0-9]`;
  do python3 import_arg.py $file
done
echo "hankinta-taulun tiedot importattu"
echo "luodaan yritys-taulu hankinta-taulun perusteella"
mysql -h 127.0.0.1 -u <db_username> -p < luo_yritystaulu.sql

echo "Import päättyi"

mysql -h 127.0.0.1 -u <db_username> -p < luo_indeksit.sql

echo "Indeksien luonti päättyi"