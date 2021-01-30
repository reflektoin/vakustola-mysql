use <database_name>;
DROP TABLE yritys;
CREATE TABLE yritys select h.toimittaja_y_tunnus, h.toimittaja_nimi from hankinta h group by  h.toimittaja_y_tunnus, h.toimittaja_nimi;
