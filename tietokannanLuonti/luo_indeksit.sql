USE <database_name>;
CREATE INDEX hankinta_toim_nimi on <table_name> (toimittaja_nimi);

CREATE INDEX hankinta_y_tunnus ON <table_name> (toimittaja_y_tunnus);

CREATE INDEX i_y_tunnus on yritys (toimittaja_y_tunnus);
CREATE INDEX i_nimi on yritys (toimittaja_nimi);