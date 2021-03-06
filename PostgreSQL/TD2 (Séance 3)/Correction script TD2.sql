-- Q2

drop table if exists CARTE cascade;drop table if exists CLIENT cascade;drop table if exists DIFFICULTE cascade;drop table if exists ITINERAIRE cascade;drop table if exists ITINERAIRE_SORTIE cascade;drop table if exists PARTICIPE cascade;
drop table if exists PARTICIPATION cascade;drop table if exists SOMMET cascade;drop table if exists SORTIE cascade;/*==============================================================*//* Table : CARTE                                                *//*==============================================================*/create table CARTE  (   ID_CARTE             INTEGER                         not null,   REFERENCE_IGN        VARCHAR(25)			   		not null,   TITRE                VARCHAR(80)                    not null,   constraint CARTE_PK primary key (ID_CARTE));/*==============================================================*//* Table : CLIENT                                               *//*==============================================================*/create table CLIENT  (   ID_CLIENT            INTEGER                         not null,   NOM                  VARCHAR(80)                    not null,   PRENOM               VARCHAR(80)                    not null,   RUE                  VARCHAR(200)                   not null,   CP                   CHAR(5)                         not null,   VILLE                VARCHAR(80)                    not null,   TEL_FIXE             CHAR(10)                        not null,   MAIL                 VARCHAR(100),   DATE_NAISSANCE       DATE					   		not null,   constraint CLIENT_PK primary key (ID_CLIENT));/*==============================================================*//* Table : DIFFICULTE                                           *//*==============================================================*/create table DIFFICULTE  (   CODE_DIFFICULTE      CHAR(3)                         not null,   LIBELLE_DIFFICULTE   VARCHAR(20)                    not null,   constraint DIFFICULTE_PK primary key (CODE_DIFFICULTE));/*==============================================================*//* Table : ITINERAIRE                                           *//*==============================================================*/create table ITINERAIRE  (   ID_SOMMET            INTEGER                         not null,   ID_ITINERAIRE        INTEGER                         not null,   NOM                  VARCHAR(80)                    not null,   DIFFICULTE           CHAR(3)                         not null,   ORIENTATION          CHAR(2)                         not null   	  constraint ITINERAIRE_ORIENTATION_CK check (orientation IN ('N','NE','E','SE','S','SO','O', 'NO')),   DENIVELE             INTEGER				   			not null,   TEMPS_PARCOURS_TH    INTEGER				   			not null,   constraint ITINERAIRE_PK primary key (ID_SOMMET, ID_ITINERAIRE));/*==============================================================*//* Table : ITINERAIRE_SORTIE                                    *//*==============================================================*/create table ITINERAIRE_SORTIE  (   NUMERO               INTEGER                         not null,   ID_SOMMET            INTEGER                         not null,   ID_ITINERAIRE        INTEGER                         not null,   ID_SORTIE            INTEGER                         not null,   DUREE_ITINERAIRE     INTEGER				   			not null,   constraint ITINERAIRE_SORTIE_PK primary key (NUMERO),
   constraint ITINERAIRE_SORTIE_UK unique (	   ID_SOMMET,	   ID_ITINERAIRE,	   ID_SORTIE	));/*==============================================================*//* Table : PARTICIPE                                        *//*==============================================================*/create table PARTICIPE  (   ID_CLIENT            INTEGER                         not null,   ID_SORTIE            INTEGER                         not null,   Constraint PARTICIPE_PK primary key (ID_CLIENT, ID_SORTIE));/*==============================================================*//* Table : SOMMET                                               *//*==============================================================*/create table SOMMET  (   ID_SOMMET            INTEGER                         not null,   ID_CARTE             INTEGER                         not null,   NOM_SOMMET           VARCHAR(80)                    not null,   ALTITUDE             INTEGER                         not null,   constraint SOMMET_PK primary key (ID_SOMMET));/*==============================================================*//* Table : SORTIE                                               *//*==============================================================*/create table SORTIE  (   ID_SORTIE            INTEGER                         not null,   DATE_SORTIE          DATE                            not null,   METEO                VARCHAR(1000),   COMMENTAIRE          VARCHAR(1000),   constraint SORTIE_PK primary key (ID_SORTIE));alter table ITINERAIRE   add constraint ITINERAIRE_SOMMET_FK foreign key (ID_SOMMET)      references SOMMET (ID_SOMMET);alter table ITINERAIRE   add constraint ITINERAIRE_DIFFICULTE_FK foreign key (DIFFICULTE)      references DIFFICULTE (CODE_DIFFICULTE);alter table ITINERAIRE_SORTIE   add constraint ITINERAIRE_SORTIE_ITI_FK foreign key (ID_SOMMET, ID_ITINERAIRE)      references ITINERAIRE (ID_SOMMET, ID_ITINERAIRE);alter table ITINERAIRE_SORTIE   add constraint ITINERAIRE_SORTIE_SORTIE_FK foreign key (ID_SORTIE)      references SORTIE (ID_SORTIE);alter table PARTICIPE   add constraint PARTICIPE_CLIENT_FK foreign key (ID_CLIENT)      references CLIENT (ID_CLIENT);alter table PARTICIPE   add constraint PARTICIPE_SORTIE_FK foreign key (ID_SORTIE)      references SORTIE (ID_SORTIE);alter table SOMMET   add constraint SOMMET_CARTE_FK foreign key (ID_CARTE)      references CARTE (ID_CARTE);
      