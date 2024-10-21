--=================================================================================
--------------------------CREATION DES TYPES---------------------------------------
--=================================================================================


drop type Dossier_t force;
drop type adresse_t force;
drop type tabPrenoms_t force;
drop type tabTelephones_t force;
drop type listRefDossiers_t force;
drop type client_t force;
drop type notaire_t force;
drop type document_t force;
drop type paiement_t force;
drop type rendezvous_t force;
drop type listRefDocuments_t force;
drop type listRefPaiements_t force;
drop type listRefRendevous_t force;


CREATE OR REPLACE TYPE DOSSIER_T;
/

CREATE OR REPLACE TYPE listRefDossiers_t as table of REF DOSSIER_T;
/

CREATE OR REPLACE TYPE ADRESSE_T as OBJECT(
    NUMERO          number(4),
    RUE             varchar2(50),
    CODE_POSTAL     number(10),
    VILLE           varchar2(50),
    QUARTIER	    varchar2(20),
    ORDER MEMBER FUNCTION compareAdresse (adresse in ADRESSE_T) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE tabPrenoms_t as varray(4) of varchar2(50);
/

CREATE OR REPLACE TYPE tabTelephones_t as varray(3) of varchar2(20);
/

CREATE OR REPLACE TYPE CLIENT_T;
/

CREATE OR REPLACE TYPE listRefclient_t as table of REF CLIENT_T;
/

CREATE OR REPLACE TYPE CLIENT_T AS OBJECT(     
    CLIENTNO                   number(8),
    NOM                        varchar2(50),
    PRENOM                     tabPrenoms_t,
    ADRESSE                    adresse_t,
    TELEPHONE                  tabTelephones_t,
    EMAIL                      varchar2(80),
    clistRefDossiers		   listRefDossiers_t,
    member procedure addLinkListeDossiers(RefDossier1 REF DOSSIER_T),
    member procedure deleteLinkListeDossiers (RefDossier1 REF DOSSIER_T),
    member procedure updateLinkListeDossiers(RefDossier1 REF DOSSIER_T, RefDossier2 REF DOSSIER_T),
    member procedure createClient(client in CLIENT_T),
    static function getClient (clientno1 IN NUMBER) RETURN CLIENT_T,
    member procedure updateClient(client IN CLIENT_T),
    member procedure deleteClient(clientno1 IN NUMBER),
    static function searchAllClient RETURN listRefclient_t
);
/

CREATE OR REPLACE TYPE NOTAIRE_T;
/

CREATE OR REPLACE TYPE listRefNotaire_t as table of REF NOTAIRE_T;
/

CREATE OR REPLACE TYPE NOTAIRE_T AS OBJECT(     
    NOTAIRENO                  number(8),
    NOM                        varchar2(50),
    PRENOM                     tabPrenoms_t,
    ADRESSE                    adresse_t,
    TELEPHONE                  tabTelephones_t,
    EMAIL                      varchar2(80),
    SPECIALITE		           varchar2(80),
    nlistRefDossiers		   listRefDossiers_t,
    member procedure addLinkListeDossiers(RefDossier1 REF DOSSIER_T),
    member procedure deleteLinkListeDossiers (RefDossier1 REF DOSSIER_T),
    member procedure updateLinkListeDossiers(RefDossier1 REF DOSSIER_T, RefDossier2 REF DOSSIER_T),
    member procedure createNotaire(notaire IN NOTAIRE_T),
    static function getNotaire (notaireno1 IN NUMBER) RETURN NOTAIRE_T,
    member procedure updateNotaire(notaire IN NOTAIRE_T),
    member procedure deleteNotaire(notaireno1 IN NUMBER),
    static function searchAllNotaire RETURN listRefNotaire_t
);
/

CREATE OR REPLACE TYPE DOCUMENT_T;
/

CREATE OR REPLACE TYPE listRefDocuments_t as table of REF DOCUMENT_T;
/

CREATE OR REPLACE TYPE DOCUMENT_T AS OBJECT(     
    DOCUMENTNO           number(8),
    TITRE                varchar2(50),
    TYPE_DOC             varchar2(50),
    CONTENU              CLOB,
    DATECREATION         date,
    RefDossier		     REF Dossier_t,
    member procedure createDocument(document IN DOCUMENT_T),
    static function searchDocument(documentno1 IN NUMBER) RETURN DOCUMENT_T,
    member procedure updateDocument(document IN DOCUMENT_T),
    member procedure deleteDocument(documentno1 IN NUMBER),
    static function searchAllDocument RETURN listRefDocuments_t
);
/

CREATE OR REPLACE TYPE PAIEMENT_T;
/

CREATE OR REPLACE TYPE listRefPaiements_t as table of REF PAIEMENT_T;
/

CREATE OR REPLACE TYPE PAIEMENT_T AS OBJECT(     
    PAIEMENTNO               number(8),
    MONTANT                  number(7,2),
    METHODE                  varchar2(50),
    DESC_PAIEMENT            varchar2(200),
    DATEPAIEMENT             date,
    RefDossier		         REF Dossier_t,
    member procedure createPaiement(paiement IN PAIEMENT_T),
    static function searchPaiement(paiementno1 IN NUMBER) RETURN PAIEMENT_T,
    member procedure updatePaiement(paiement IN PAIEMENT_T),
    member procedure deletePaiement(paiementno1 IN NUMBER),
    static function searchAllPaiement RETURN listRefPaiements_t
);
/

CREATE OR REPLACE TYPE RENDEZVOUS_T;
/

CREATE OR REPLACE TYPE listRefRendevous_t as table of REF RENDEZVOUS_T;
/

CREATE OR REPLACE TYPE RENDEZVOUS_T AS OBJECT(     
    RENDEZVOUSNO         number(8),
    DATE_RDV             date,
    HEURE                date,
    LIEU                 varchar2(100),
    DESCRIPTION          varchar2(200),
    RefDossier		     REF Dossier_t,
    member procedure createRendezvous(rendezvous IN RENDEZVOUS_T),
    static function searchRendezvous(rendezvousno1 IN NUMBER) RETURN RENDEZVOUS_T,
    member procedure updateRendezvous(rendezvous IN RENDEZVOUS_T),
    member procedure deleteRendezvous(rendezvousno1 IN NUMBER),
    static function searchAllRendezvous RETURN listRefRendevous_t
);
/

CREATE OR REPLACE TYPE DOSSIER_T AS OBJECT(        
    DOSSIERNO            number(4),
    NOM                  varchar2(30),
    DESCRIPTION          varchar2(30),
    DATEOUVERTURE		 date,
    DATEFERMETURE		 date,
    STATUT      		 varchar2(10),
    REFCLIENT			 REF client_t,
    REFNOTAIRE			 REF notaire_t,
    dListRefDocuments    listRefDocuments_t,
    pListRefPaiements	 listRefPaiements_t,
    rListRefRendezvous   listRefRendevous_t,
    member procedure addLinkListeDocuments(RefDocument REF DOCUMENT_T),
    member procedure deleteLinkListeDocuments (RefDocument REF DOCUMENT_T),
    member procedure updateLinkListeDocuments(RefDocument1 REF DOCUMENT_T, RefDocument2 REF DOCUMENT_T),
    member procedure addLinkListePaiements(RefPaiement REF PAIEMENT_T),
    member procedure deleteLinkListePaiements (RefPaiement REF PAIEMENT_T),
    member procedure updateLinkListePaiements(RefPaiement1 REF PAIEMENT_T, RefPaiement2 REF PAIEMENT_T),
    member procedure addLinkListeRendezvous(RefRendezvous REF RENDEZVOUS_T),
    member procedure deleteLinkListeRendezvous (RefRendezvous REF RENDEZVOUS_T),
    member procedure updateLinkListeRendezvous(RefRendezvous1 REF RENDEZVOUS_T, RefRendezvous2 REF RENDEZVOUS_T),
    member procedure createDossier(dossier IN DOSSIER_T),
    static function getDossier (dossierno1 IN NUMBER) RETURN DOSSIER_T,
    member procedure updateDossier(dossier IN DOSSIER_T),
    member procedure deleteDossier(dossierno1 IN NUMBER),
    static function searchAllDossier RETURN listRefDossiers_t
);
/

--------------------------FIN DE LA CREATION DES TYPES-----------------------------


drop table CLIENT_O;
drop table NOTAIRE_O;
drop table PAIEMENT_O;
drop table DOCUMENT_O;
drop table RENDEZVOUS_O;
drop table DOSSIER_O;

CREATE TABLE DOCUMENT_O OF DOCUMENT_T (
constraint pk_document_o_documentno primary key(documentno),
titre constraint document_o_titre_not_null not null,
type_doc constraint document_o_typedoc_not_null not null,
datecreation constraint document_o_datecreation_not_null not null
)
LOB (contenu) STORE AS storeContenu(PCTVERSION 30)
/

CREATE TABLE PAIEMENT_O OF PAIEMENT_T (
constraint pk_paiement_o_paiementno primary key (paiementno),
montant constraint paiement_o_montant_not_null not null,
constraint montant_check check(montant > 1),
methode constraint paiement_o_methode_not_null not null,
desc_paiement constraint paiement_o_desc_paiement_not_null not null,
datepaiement constraint paiement_o_datepaiement_not_null not null
);


CREATE  TABLE RENDEZVOUS_O OF RENDEZVOUS_T (
constraint pk_rendezvous_o_rendezvousno primary key (rendezvousno),
date_rdv constraint rendezvous_o_date_rdv_not_null not null,
heure constraint rendezvous_o_heure_not_null not null,
lieu  constraint rendezvous_o_lieu_not_null not null,
description  constraint rendezvous_o_description_not_null not null
);


CREATE TABLE DOSSIER_O OF DOSSIER_T (
constraint pk_dossier_o_dossierno primary key (dossierno),
nom constraint dossier_o_nom_not_null not null,
description constraint dossier_o_description_not_null not null,
dateouverture constraint dossier_o_dateouverture_not_null not null,
datefermeture constraint dossier_o_datefermeture_not_null not null,
statut constraint dossier_o_statut_not_null not null
)NESTED TABLE dListRefDocuments STORE AS table_ListRefDocuments
NESTED TABLE pListRefPaiements STORE AS table_ListRefPaiements
NESTED TABLE rListRefRendezvous STORE AS table_ListRefRendezvous
;


CREATE TABLE CLIENT_O OF CLIENT_T(
constraint pk_client_o_clientno primary key(clientno),
NOM constraint client_o_nom_not_null not null,
PRENOM constraint client_o_prenom_not_null not null,
TELEPHONE constraint client_o_telephone_not_null not null,
EMAIL constraint client_o_email_not_null not null)
NESTED TABLE cListRefDossiers STORE AS table_cListRefDossiers
;


CREATE TABLE NOTAIRE_O OF NOTAIRE_T (
constraint pk_notaire_o_notaireno primary key(notaireno),
NOM constraint notaire_o_nom_not_null not null,
PRENOM constraint notaire_o_prenom_not_null not null,
TELEPHONE constraint notaire_o_telephone_not_null not null,
EMAIL constraint notaire_o_email_not_null not null,
SPECIALITE constraint notaire_o_specialite_not_null not null)
NESTED TABLE nlistRefDossiers STORE AS table_nListRefDossiers
;





-------------------------------CREATION DES INDEX-----------------------------------------------

CREATE UNIQUE INDEX idx_client_o_email ON CLIENT_O(EMAIL);

ALTER TABLE table_cListRefDossiers ADD(SCOPE FOR(column_value) IS DOSSIER_O);
CREATE UNIQUE INDEX idx_table_cListRefDossiers_Nested_table_id_Column_value on table_cListRefDossiers(Nested_table_id, Column_value);

ALTER TABLE DOSSIER_O ADD(SCOPE FOR (REFCLIENT) IS CLIENT_O);
CREATE INDEX IDX_DOSSIER_O_RECLIENT ON DOSSIER_O(REFCLIENT); 

CREATE UNIQUE INDEX idx_notaire_o_email ON NOTAIRE_O(EMAIL);

ALTER TABLE table_nListRefDossiers ADD(SCOPE FOR(column_value) IS DOSSIER_O);
CREATE UNIQUE INDEX idx_table_nListRefDossiers_Nested_table_id_Column_value on table_nListRefDossiers(Nested_table_id, Column_value);

ALTER TABLE DOSSIER_O ADD(SCOPE FOR (REFNOTAIRE) IS NOTAIRE_O);
CREATE INDEX IDX_DOSSIER_O_REFNOTAIRE ON DOSSIER_O(REFNOTAIRE); 

ALTER TABLE table_ListRefDocuments ADD(SCOPE FOR(column_value) IS DOCUMENT_O);
CREATE UNIQUE INDEX idx_table_ListRefDocuments_Nested_table_id_Column_value on table_ListRefDocuments(Nested_table_id, Column_value);

ALTER TABLE DOCUMENT_O ADD(SCOPE FOR (REFDOSSIER) IS DOSSIER_O);
CREATE INDEX IDX_DOCUMENT_O_REFDOSSIER ON DOCUMENT_O(REFDOSSIER);

ALTER TABLE table_ListRefPaiements ADD(SCOPE FOR(column_value) IS PAIEMENT_O);
CREATE UNIQUE INDEX idx_table_ListRefPaiements_Nested_table_id_Column_value on table_ListRefPaiements(Nested_table_id, Column_value);

ALTER TABLE PAIEMENT_O ADD(SCOPE FOR (REFDOSSIER) IS DOSSIER_O);
CREATE INDEX IDX_PAIEMENT_O_REFDOSSIER ON PAIEMENT_O(REFDOSSIER);

ALTER TABLE table_ListRefRendezvous ADD(SCOPE FOR(column_value) IS RENDEZVOUS_O);
CREATE UNIQUE INDEX idx_table_ListRefRendezvous_Nested_table_id_Column_value on table_ListRefRendezvous(Nested_table_id, Column_value);

ALTER TABLE RENDEZVOUS_O ADD(SCOPE FOR (REFDOSSIER) IS DOSSIER_O);
CREATE INDEX IDX_RENDEZVOUS_O_REFDOSSIER ON RENDEZVOUS_O(REFDOSSIER);
