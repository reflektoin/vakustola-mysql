#load data
./lataa_aineisto.sh
#split files to smaller in order to import them faster to database using multiple processes
echo "Aloita splittaus"
./splittaus.sh .
echo "Splittaus päättyi"
#create table
mysql -h 127.0.0.1 -u <db_username> -p < luo_hankintataulu.sql
#create processes to insert files to table
for file in `ls -1 ./*.csv[0-9][0-9]`;
  do python3 import_arg.py $file &
done

#wait until all import processes are finished
prosessimaara=$(ps -ef | grep -i python | grep -v grep | wc -l)
while [ $prosessimaara -ne 0 ]
do
    echo "Odotetaan importtauksen valmistumista"
    sleep 60
    prosessimaara=$(ps -ef | grep -i python | grep -v grep | wc -l)
done
echo "Import päättyi"
