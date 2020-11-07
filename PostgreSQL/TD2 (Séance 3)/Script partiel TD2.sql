-- Instructions DROP TABLE... à écrire
DROP TABLE IF EXISTS CARTE CASCADE;


/*==============================================================*/
/* Table : CARTE                                                */
/*==============================================================*/
create table CARTE  (
   ID_CARTE             INTEGER                         not null,
   REFERENCE_IGN        VARCHAR(25)			   		not null,
   TITRE                VARCHAR(80)                    not null,
   constraint CARTE_PK primary key (ID_CARTE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT  (
   ID_CLIENT            INTEGER                        not null,
   NOM                  VARCHAR(80)                    not null,
   PRENOM               VARCHAR(80)                    not null,
   RUE                  VARCHAR(200)                   not null,
   CP                   CHAR(5)                        not null,
   VILLE                VARCHAR(80)                    not null,
   TEL_FIXE             CHAR(10)                       not null,
   MAIL                 VARCHAR(100),
   DATE_NAISSANCE       DATE					   		not null,
   constraint CLIENT_PK primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : DIFFICULTE                                           */
/*==============================================================*/
create table DIFFICULTE  (
   CODE_DIFFICULTE      CHAR(3)                        not null,
   LIBELLE_DIFFICULTE   VARCHAR(20)                    not null,
   constraint DIFFICULTE_PK primary key (CODE_DIFFICULTE)
);

/*==============================================================*/
/* Table : ITINERAIRE                                           */
/*==============================================================*/
create table ITINERAIRE  (
   ID_SOMMET            INTEGER
   ID_ITINERAIRE        INTEGER
   NOM                  VARCHAR(80)
   DIFFICULTE           CHAR(3)
   ORIENTATION          CHAR(2)
   DENIVELE             INTEGER
   TEMPS_PARCOURS_TH    INTEGER
   con
   constraint DIFFICULTE_PK primary key (CODE_DIFFICULTE)
);

/*==============================================================*/
/* Table : ITINERAIRE_SORTIE                                    */
/*==============================================================*/
create table ITINERAIRE_SORTIE  (
   NUMERO               INTEGER                         not null,
   ID_SOMMET            INTEGER                         not null,
   ID_ITINERAIRE        INTEGER                         not null,
   ID_SORTIE            INTEGER                         not null,
   DUREE_ITINERAIRE     INTEGER				   			  not null,
   constraint ITINERAIRE_SORTIE_PK primary key (NUMERO)
);

/*==============================================================*/
/* Table : PARTICIPE                                        */
/*==============================================================*/
create table PARTICIPE  (
   ID_CLIENT            INTEGER
   ID_SORTIE            INTEGER
constraint PARTICIPE_PK primary key (ID_CLIENT)
constraint PARTICIPE_FK foreign key (ID_SORTIE)
   
);

/*==============================================================*/
/* Table : SOMMET                                               */
/*==============================================================*/
create table SOMMET  (
   ID_SOMMET            INTEGER                         not null,
   ID_CARTE             INTEGER                         not null,
   NOM_SOMMET           VARCHAR(80)                    not null,
   ALTITUDE             INTEGER                         not null,
   constraint SOMMET_PK primary key (ID_SOMMET)
   constraint SOMMET_FK foreign key (ID_CARTE)
);

/*==============================================================*/
/* Table : SORTIE                                               */
/*==============================================================*/
create table SORTIE  (
ID_SORTIE            INTEGER
DATE_SORTIE          DATE
METEO                VARCHAR(1000)
COMMENTAIRE          VARCHAR(1000)
constraint SORTIE_PK primary key (ID_SORTIE)
);


-- Instrcutions ALTER TABLE à écrire pour créer les clés étrangères
