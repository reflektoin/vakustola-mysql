# Käyttö

Tiedostoihin tarvitsee lisätä tietoja (tietokannan nimi, taulun nimi, käyttäjätunnus, salasana, kannan soite):
- <db_user> => tietokannan käyttäjänimi
- <db_username> => tietokannan käyttäjänimi
- <password_db_user> => tietokannan käyttäjän salasana
- <database_name> => käytettävän tietokannan nimi
- <table_name> => taulun nimi, joka luodaan ja johon tiedot tallennetaan

Seuraavilla komennoilla lisätään tietokannan yhteyteen ja taulujen luontiin vaadittavat tiedot ohjelmiin
```
sed -i 's/<db_username>/tietokannan käyttäjänimi/g' *.*
sed -i 's/<table_name>/taulun nimi/g' *.*
sed -i 's/<password_db_user>/salasana/g' *.*
sed -i 's/<database_name>/tietokannan nimi/g' *.*
```

Skripti kysyy ajon aikana käyttäjätunnuksen salasanaa tietokantayhteyden luomiseksi.

Tulevaisuudessa kovakoodatut tiedot on tarkoitus korvata parametrein tai muulla tavoin, jotta kirjautumistietojen vuotaminen vahingossa vaikeutuisi.
