/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
INSERT INTO CLIENT (ID_CLIENT, NOM, PRENOM, RUE, CP, VILLE, TEL_FIXE, MAIL, DATE_NAISSANCE, MOBILE) VALUES
(Nextval('CLIENT_SEQ'), 'GILLOT', 'André', 'rue des martyrs', '74000', 'Annecy', '0450487932', 'andre.guillot@myspace.fr', to_date('1954-06-12', 'YYYY-MM-DD'), '0615487932');
INSERT INTO CLIENT (ID_CLIENT, NOM, PRENOM, RUE, CP, VILLE, TEL_FIXE, MAIL, DATE_NAISSANCE, MOBILE) VALUES
(Nextval('CLIENT_SEQ'), 'MARTIN', 'Laurent', 'allee de la renaissance', '69003', 'Villeurbanne', '0450030478', 'lmartin@noos.com', to_date('1980-11-04', 'YYYY-MM-DD'), '0656030478');

