USE utotonox_laskututkinta;
CREATE INDEX hankinta_toim_nimi on test_hankinta (toimittaja_nimi);

CREATE INDEX hankinta_y_tunnus ON test_hankinta (toimittaja_y_tunnus);
