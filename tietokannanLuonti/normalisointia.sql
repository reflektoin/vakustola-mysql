use <database_name>;

create table tili (id int not null auto_increment, primary key(id)) select tili from hankinta group by tili;
create table toimittaja (id int not null auto_increment, PRIMARY KEY(id)) select toimittaja_y_tunnus, toimittaja_nimi from hankinta group by toimittaja_y_tunnus, toimittaja_nimi;
create table hankintayksikko (id int not null auto_increment, PRIMARY KEY(id)) SELECT HANKINTAYKSIKKO_TUNNUS, HANKINTAYKSIKKO FROM hankinta GROUP BY HANKINTAYKSIKKO_TUNNUS, HANKINTAYKSIKKO;
create table ylaorganisaatio (id int not null auto_increment, PRIMARY KEY(id)) SELECT YLAORGANISAATIO_TUNNUS, YLAORGANISAATIO FROM hankinta group by YLAORGANISAATIO_TUNNUS, YLAORGANISAATIO;
create table sektori (id int not null auto_increment, primary key(id)) select sektori from hankinta group by sektori;
create table tuote_palveluryhma (id int not null auto_increment, primary key(id)) select tuote_palveluryhma from hankinta group by tuote_palveluryhma;
create table hankintakategoria (id int not null auto_increment, primary key(id)) select hankintakategoria from hankinta group by hankintakategoria;

create unique index idx_tili on tili (tili);

select h.lasku_id, h.tili "hankinnan tili", t.tili "tilin tili", t.id from hankinta h inner join tili t on h.tili = t.tili;

create unique index y_tunnus_nimi on toimittaja (toimittaja_y_tunnus, toimittaja_nimi);
select h.lasku_id, t.id "tili_id", h.toimittaja_nimi, toim.toimittaja_nimi, toim.id "toimittaja_id" 
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi;


create unique index hy_tunnus_nimi on hankintayksikko (hankintayksikko_tunnus, hankintayksikko);
select h.lasku_id, t.id "tili_id", toim.id "toimittaja_id", hy.id "hankintayksikko_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko;


#ylaorganisaation lisays
create unique index yo_tunnus_nimi on ylaorganisaatio (ylaorganisaatio_tunnus, ylaorganisaatio);
select h.lasku_id, t.id "tili_id", toim.id "toimittaja_id", hy.id "hankintayksikko_id", yo.id "ylaorganisaatio_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko
#ylaorganisaation lisays
inner join ylaorganisaatio yo on h.ylaorganisaatio_tunnus = yo.ylaorganisaatio_tunnus and h.ylaorganisaatio = yo.ylaorganisaatio;


#sektorin lisays
create unique index idx_sektori on sektori(sektori);
select h.lasku_id, t.id "tili_id", toim.id "toimittaja_id", hy.id "hankintayksikko_id", yo.id "ylaorganisaatio_id", s.id "sektori_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko
#ylaorganisaation lisays
inner join ylaorganisaatio yo on h.ylaorganisaatio_tunnus = yo.ylaorganisaatio_tunnus and h.ylaorganisaatio = yo.ylaorganisaatio
#sektorin lisays
inner join sektori s on h.sektori = s.sektori;


#tuote_palveluryhman lisays
create unique index idx_tpr on tuote_palveluryhma(tuote_palveluryhma);
select 
	h.lasku_id, 
    t.id "tili_id", 
    toim.id "toimittaja_id", 
    hy.id "hankintayksikko_id", 
    yo.id "ylaorganisaatio_id", 
    s.id "sektori_id", 
    tpr.id "tpr_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko
#ylaorganisaation lisays
inner join ylaorganisaatio yo on h.ylaorganisaatio_tunnus = yo.ylaorganisaatio_tunnus and h.ylaorganisaatio = yo.ylaorganisaatio
#sektorin lisays
inner join sektori s on h.sektori = s.sektori
#tuote_palveluryhman lisäys
inner join tuote_palveluryhma tpr on h.tuote_palveluryhma = tpr.tuote_palveluryhma;

#hankintakategorian lisays
create unique index idx_hk on hankintakategoria(hankintakategoria);
select 
	h.lasku_id, 
    t.id "tili_id", 
    toim.id "toimittaja_id", 
    hy.id "hankintayksikko_id", 
    yo.id "ylaorganisaatio_id", 
    s.id "sektori_id", 
    tpr.id "tuote_palveluryhma_id",
    hk.id "hankintakategoria_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko
#ylaorganisaation lisays
inner join ylaorganisaatio yo on h.ylaorganisaatio_tunnus = yo.ylaorganisaatio_tunnus and h.ylaorganisaatio = yo.ylaorganisaatio
#sektorin lisays
inner join sektori s on h.sektori = s.sektori
#tuote_palveluryhman lisäys
inner join tuote_palveluryhma tpr on h.tuote_palveluryhma = tpr.tuote_palveluryhma
#hankintakategorian lisäys
inner join hankintakategoria hk on h.hankintakategoria = hk.hankintakategoria ;

#normalisoitu
create table laskurivi  (id int not null auto_increment, primary key(id)) comment = 'pohjana hankinta-taulu'
select 
	h.lasku_id, 
    t.id "tili_id",
    h.tiliointisumma,
    h.tositepvm,
    toim.id "toimittaja_id", 
    hy.id "hankintayksikko_id", 
    yo.id "ylaorganisaatio_id", 
    s.id "sektori_id", 
    tpr.id "tuote_palveluryhma_id",
    hk.id "hankintakategoria_id"
from hankinta h 
#tili-taulun lisäys
inner join tili t on h.tili = t.tili 
#toimittaja-taulun lisäys
inner join toimittaja toim on toim.toimittaja_y_tunnus = h.toimittaja_y_tunnus and toim.toimittaja_nimi = h.toimittaja_nimi
#hankintayksikkö-taulun lisäys
inner join hankintayksikko hy on h.hankintayksikko_tunnus = hy.hankintayksikko_tunnus and h.hankintayksikko = hy.hankintayksikko
#ylaorganisaation lisays
inner join ylaorganisaatio yo on h.ylaorganisaatio_tunnus = yo.ylaorganisaatio_tunnus and h.ylaorganisaatio = yo.ylaorganisaatio
#sektorin lisays
inner join sektori s on h.sektori = s.sektori
#tuote_palveluryhman lisäys
inner join tuote_palveluryhma tpr on h.tuote_palveluryhma = tpr.tuote_palveluryhma
#hankintakategorian lisäys
inner join hankintakategoria hk on h.hankintakategoria = hk.hankintakategoria ;