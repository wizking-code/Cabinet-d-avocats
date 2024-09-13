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




create or replace type Dossier_t;
/

create or replace type listRefDossiers_t as table of REF Dossier_t;
/


create or replace  type adresse_t as OBJECT(
NUMERO        number(4),
RUE           varchar2(20),
CODE_POSTAL   number(10),
VILLE         varchar2(30)
);
/

create or replace  type tabPrenoms_t as varray(4) of varchar2(40);
/


create or replace type tabTelephones_t as varray(3) of varchar2(15);
/



create or replace type client_t;
/

create or replace type listRefclient_t as table of REF Client_t;
/

create or replace type CLIENT_T AS OBJECT(     
CLIENTNO                   number(8),
NOM                        varchar2(15),
PRENOM                     tabPrenoms_t,
ADRESSE                    adresse_t,
TELEPHONE                  tabTelephones_t,
EMAIL                      varchar2(80),
clistRefDossiers		   listRefDossiers_t,
ORDER MEMBER FUNCTION COMPARE (client in client_t) RETURN NUMBER,
static function getClient (clientno1 IN number) RETURN client_t,
member procedure addLinkListeDossiers(RefDossier1 REF Dossier_t),
member procedure deleteLinkListeDossiers (RefDossier1 REF Dossier_t),
member procedure updateLinkListeDossiers(RefDossier1 REF Dossier_t),
member procedure createClient(client in client_t),
member function searchClient(clientno in client_t) RETURN client_t,
member procedure updateClient(clientno in client_t),
member procedure deleteClient(clientno in client_t),
member function searchAllClient(client in client_t) RETURN listRefclient_t
);
/


create or replace type Notaire_t;
/

create or replace type listRefNotaire_t as table of REF Notaire_t;
/

create or replace type NOTAIRE_T AS OBJECT(     
NOTAIRENO                  number(8),
NOM                        varchar2(15),
PRENOM                     tabPrenoms_t,
ADRESSE                    adresse_t,
TELEPHONE                  tabTelephones_t,
EMAIL                      varchar2(80),
SPECIALITE		           varchar2(80),
nlistRefDossiers		   listRefDossiers_t,
ORDER MEMBER FUNCTION COMPARE (notaire in notaire_t) RETURN NUMBER,
static function getNotaire (notaire1 IN number) RETURN notaire_t,
member procedure addLinkListeDossiers(RefDossier1 REF Dossier_t),
member procedure deleteLinkListeDossiers (RefDossier1 REF Dossier_t),
member procedure updateLinkListeDossiers(RefDossier1 REF Dossier_t),
member procedure createNotaire(notaire in notaire_t),
member function searchNotaire(notaireno in notaire_t) RETURN notaire_t,
member procedure updateNotaire(notaireno in notaire_t),
member procedure deleteNotaire(notaireno in notaire_t),
member function searchAllNotaire(notaire in notaire_t) RETURN listRefnotaire_t
);
/




create or replace type Document_t;
/

create or replace type listRefDocuments_t as table of Ref Document_t;
/


create or replace type DOCUMENT_T AS OBJECT(     
DOCUMENTNO           number(8),
TITRE                varchar2(50),
TYPE_DOC             varchar2(50),
CONTENU              CLOB,
DATECREATION         date,
RefDossier		     REF Dossier_t,
ORDER MEMBER FUNCTION COMPARE (document1 in Document_t) RETURN NUMBER,
member procedure createDocument(document in Document_t),
member function searchDocument(documentno in Document_t) RETURN Document_t,
member procedure updateDocument(documentno in Document_t),
member procedure deleteDocument(documentno in Document_t),
member function searchAllDocument(document in Document_t) RETURN listRefDocuments_t
);
/


create or replace type Paiement_t;
/

create or replace type listRefPaiements_t as table of REF Paiement_t;
/

create or replace type PAIEMENT_T AS OBJECT(     
PAIEMENTNO               number(8),
MONTANT                  number(7,2),
METHODE                  varchar2(50),
DESC_PAIEMENT            varchar2(200),
DATEPAIEMENT             date,
RefDossier		         REF Dossier_t,
ORDER MEMBER FUNCTION COMPARE (paiement1 in Paiement_t) RETURN NUMBER,
member procedure createPaiement(paiement in paiement_t),
member function searchPaiement(paiementno in Paiement_t) RETURN Paiement_t,
member procedure updatePaiement(paiementno in Paiement_t),
member procedure deletePaiement(paiementno in Paiement_t),
member function searchAllPaiement(paiement in paiement_t) RETURN listRefPaiements_t
);
/


create or replace type RendezVous_t;
/

create or replace type listRefRendevous_t as table of REF RendezVous_t;
/

create or replace type RENDEZVOUS_T AS OBJECT(     
RENDEZVOUSNO         number(8),
DATE_RDV             date,
HEURE                date,
LIEU                 varchar2(100),
DESCRIPTION          varchar2(200),
RefDossier		     REF Dossier_t,
ORDER MEMBER FUNCTION COMPARE (rendezv in Rendezvous_t) RETURN NUMBER,
member procedure createRendezvous(rendezvous in Rendezvous_t),
member function searchRendezvous(rendezvousno in Rendezvous_t) RETURN Rendezvous_t,
member procedure updateRendezvous(rendezvousno in Rendezvous_t),
member procedure deleteRendezvous(rendezvousno in Rendezvous_t),
member function searchAllRendezvous(rendezvous in Rendezvous_t) RETURN listRefRendevous_t
);
/



create or replace type Dossier_t AS OBJECT(        
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
ORDER MEMBER FUNCTION compare(dossier in Dossier_t) RETURN NUMBER,
member function getDossier (dossier IN number) RETURN dossier_t,
member procedure addLinkListeDocuments(RefDocument REF Document_t),
member procedure deleteLinkListeDocuments (RefDocument REF Document_t),
member procedure updateLinkListeDocuments(RefDocument REF Document_t),
member procedure addLinkListePaiements(RefPaiement REF Paiement_t),
member procedure deleteLinkListePaiements (RefPaiement REF Paiement_t),
member procedure updateLinkListePaiements(RefPaiement REF Paiement_t),
member procedure addLinkListeRendezvous(RefRendezvous REF Rendezvous_t),
member procedure deleteLinkListeRendezvous (RefRendezvous REF Rendezvous_t),
member procedure updateLinkListeRendezvous(RefRendezvous REF Rendezvous_t),
member procedure createDossier(dossier in Dossier_t),
member function searchDossier(dossierno in Dossier_t) RETURN Dossier_t,
member procedure updateDossier(dossierno in Dossier_t),
member procedure deleteDossier(dossierno in Dossier_t),
member function searchAllDossier(dossier in Dossier_t) RETURN listRefDossiers_t
);
/
 