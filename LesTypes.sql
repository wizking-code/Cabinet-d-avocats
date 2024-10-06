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
 