CREATE TABLE CLIENT_O OF CLIENT_T(
constraint pk_client_o_clientno primary key(clientno),
NOM constraint client_o_nom_not_null not null,
PRENOM constraint client_o_prenom_not_null not null,
TELEPHONE constraint client_o_telephone_not_null not null,
EMAIL constraint client_o_email_not_null not null)
NESTED TABLE cListRefDossiers STORE AS table_cListRefDossiers
;
/


CREATE TABLE NOTAIRE_O OF NOTAIRE_T (
constraint pk_notaire_o_notaireno primary key(notaireno),
NOM constraint notaire_o_nom_not_null not null,
PRENOM constraint notaire_o_prenom_not_null not null,
TELEPHONE constraint notaire_o_telephone_not_null not null,
EMAIL constraint notaire_o_email_not_null not null,
SPECIALITE constraint notaire_o_specialite_not_null not null)
NESTED TABLE nlistRefDossiers STORE AS table_nListRefDossiers
;
/



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
/




CREATE  TABLE RENDEZVOUS_O OF RENDEZVOUS_T (
constraint pk_rendezvous_o_rendezvousno primary key (rendezvousno),
date_rdv constraint rendezvous_o_date_rdv_not_null not null,
heure constraint rendezvous_o_heure_not_null not null,
lieu  constraint rendezvous_o_lieu_not_null not null,
description  constraint rendezvous_o_description_not_null not null
);
/


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
/

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

desc client_o;

---------------------------------------------------------------------------------------------------------------------------

----INSERTION DES DONNEES DANS LES TABLES -
--==============================================
-- INSERER 10 CLIENTS ET 2 DOSSIERS PAR CLIENT

declare
        refClient1           REF client_t;
        refClient2           REF client_t;
        refDossier1          REF dossier_t;
        refDossier2          REF dossier_t;
        refDossier3          REF dossier_t;
        
begin
   insert into dept_o do
   values(
      dept_t (1000,'Recherche','Nord',listRefEmployes_t())) returning ref(do) into refDept1;
   
   insert into dept_o do
   values(
      dept_t (1001,'RH','Nord-Est',listRefEmployes_t())) returning ref(do) into refDept2;
   
   insert into employe_o eo
   values(
        employe_t(10000000,'ZULU',tabPrenoms_t('DIBANGA','MBAPE'),'Ingenieur',5000,NULL,'08-MAR-1980','4-FEB-2020',refDept1)
        ) returning ref(eo) into refEmp1;
     
   insert into employe_o eo
   values(
        employe_t(10000001,'JEAN-PAUL',tabPrenoms_t('Jackenson','Jonathan','Edouard'),'Ingenieur',4000,NULL,'08-OCT-1990','4-SEP-2022',refDept1)
        ) returning ref(eo) into refEmp2;  
        
     insert into employe_o eo
   values(
        employe_t(10000002,'GRAND-BLACK',tabPrenoms_t('NADINE'),'Secretaire',2500,NULL,'08-MAR-1996','4-FEB-2023',refDept2)
        ) returning ref(eo) into refEmp3;   
        
   INSERT INTO 
        TABLE(SELECT a.listRefEmps  FROM dept_o a WHERE a.deptno=1000)
        values (refEmp1);
        
   INSERT INTO 
        TABLE(SELECT a.listRefEmps  FROM dept_o a WHERE a.deptno=1000)
        values (refEmp2); 
            
      INSERT INTO 
        TABLE(SELECT a.listRefEmps  FROM dept_o a WHERE a.deptno=1001)
        values (refEmp3);  
end;
/
commit;











