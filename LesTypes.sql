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


CREATE OR REPLACE TYPE Dossier_t;
/

CREATE OR REPLACE TYPE listRefDossiers_t as table of REF Dossier_t;
/

CREATE OR REPLACE TYPE adresse_t as OBJECT(
    NUMERO          number(4),
    RUE             varchar2(50),
    CODE_POSTAL     number(10),
    VILLE           varchar2(50),
    QUARTIER	    varchar2(20),
    ORDER MEMBER FUNCTION compareAdresse (adresse in adresse_t) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE tabPrenoms_t as varray(4) of varchar2(50);
/

CREATE OR REPLACE TYPE tabTelephones_t as varray(3) of varchar2(20);
/

CREATE OR REPLACE TYPE client_t;
/

CREATE OR REPLACE TYPE listRefclient_t as table of REF Client_t;
/

CREATE OR REPLACE TYPE CLIENT_T AS OBJECT(     
    CLIENTNO                   number(8),
    NOM                        varchar2(50),
    PRENOM                     tabPrenoms_t,
    ADRESSE                    adresse_t,
    TELEPHONE                  tabTelephones_t,
    EMAIL                      varchar2(80),
    clistRefDossiers		   listRefDossiers_t,
    member procedure addLinkListeDossiers(RefDossier1 REF Dossier_t),
    member procedure deleteLinkListeDossiers (RefDossier1 REF Dossier_t),
    member procedure updateLinkListeDossiers(RefDossier1 REF Dossier_t, RefDossier2 REF Dossier_t),
    member procedure createClient(client in client_t),
    static function getClient (clientno NUMBER) RETURN client_t,
    member procedure updateClient(client in client_t),
    member procedure deleteClient(clientno NUMBER),
    static function searchAllClient RETURN listRefclient_t
);
/

CREATE OR REPLACE TYPE Notaire_t;
/

CREATE OR REPLACE TYPE listRefNotaire_t as table of REF Notaire_t;
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
    member procedure addLinkListeDossiers(RefDossier1 REF Dossier_t),
    member procedure deleteLinkListeDossiers (RefDossier1 REF Dossier_t),
    member procedure updateLinkListeDossiers(RefDossier1 REF Dossier_t, RefDossier2 REF Dossier_t),
    member procedure createNotaire(notaire in notaire_t),
    static function getNotaire (notaireno NUMBER) RETURN notaire_t,
    member procedure updateNotaire(notaire in notaire_t),
    member procedure deleteNotaire(notaireno NUMBER),
    static function searchAllNotaire RETURN listRefNotaire_t
);
/

CREATE OR REPLACE TYPE Document_t;
/

CREATE OR REPLACE TYPE listRefDocuments_t as table of Ref Document_t;
/

CREATE OR REPLACE TYPE DOCUMENT_T AS OBJECT(     
    DOCUMENTNO           number(8),
    TITRE                varchar2(50),
    TYPE_DOC             varchar2(50),
    CONTENU              CLOB,
    DATECREATION         date,
    RefDossier		     REF Dossier_t,
    member procedure createDocument(document in Document_t),
    static function searchDocument(documentno NUMBER) RETURN Document_t,
    member procedure updateDocument(document in Document_t),
    member procedure deleteDocument(documentno NUMBER),
    static function searchAllDocument RETURN listRefDocuments_t
);
/

CREATE OR REPLACE TYPE Paiement_t;
/

CREATE OR REPLACE TYPE listRefPaiements_t as table of REF Paiement_t;
/

CREATE OR REPLACE TYPE PAIEMENT_T AS OBJECT(     
    PAIEMENTNO               number(8),
    MONTANT                  number(7,2),
    METHODE                  varchar2(50),
    DESC_PAIEMENT            varchar2(200),
    DATEPAIEMENT             date,
    RefDossier		         REF Dossier_t,
    member procedure createPaiement(paiement in paiement_t),
    static function searchPaiement(paiementno NUMBER) RETURN Paiement_t,
    member procedure updatePaiement(paiement in Paiement_t),
    member procedure deletePaiement(paiementno NUMBER),
    static function searchAllPaiement RETURN listRefPaiements_t
);
/

CREATE OR REPLACE TYPE RendezVous_t;
/

CREATE OR REPLACE TYPE listRefRendevous_t as table of REF RendezVous_t;
/

CREATE OR REPLACE TYPE RENDEZVOUS_T AS OBJECT(     
    RENDEZVOUSNO         number(8),
    DATE_RDV             date,
    HEURE                date,
    LIEU                 varchar2(100),
    DESCRIPTION          varchar2(200),
    RefDossier		     REF Dossier_t,
    member procedure createRendezvous(rendezvous in Rendezvous_t),
    static function searchRendezvous(rendezvousno Number) RETURN Rendezvous_t,
    member procedure updateRendezvous(rendezvous in Rendezvous_t),
    member procedure deleteRendezvous(rendezvousno NUMBER),
    static function searchAllRendezvous RETURN listRefRendevous_t
);
/

CREATE OR REPLACE TYPE Dossier_t AS OBJECT(        
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
    member procedure addLinkListeDocuments(RefDocument REF Document_t),
    member procedure deleteLinkListeDocuments (RefDocument REF Document_t),
    member procedure updateLinkListeDocuments(RefDocument1 REF Document_t, RefDocument2 REF Document_t),
    member procedure addLinkListePaiements(RefPaiement REF Paiement_t),
    member procedure deleteLinkListePaiements (RefPaiement REF Paiement_t),
    member procedure updateLinkListePaiements(RefPaiement1 REF Paiement_t, RefPaiement2 REF Paiement_t),
    member procedure addLinkListeRendezvous(RefRendezvous REF Rendezvous_t),
    member procedure deleteLinkListeRendezvous (RefRendezvous REF Rendezvous_t),
    member procedure updateLinkListeRendezvous(RefRendezvous1 REF Rendezvous_t, RefRendezvous2 REF Rendezvous_t),
    member procedure createDossier(dossier in Dossier_t),
    static function getDossier (dossierno number) RETURN dossier_t,
    member procedure updateDossier(dossier in Dossier_t),
    member procedure deleteDossier(dossierno NUMBER),
    static function searchAllDossier RETURN listRefDossiers_t
);
/
 