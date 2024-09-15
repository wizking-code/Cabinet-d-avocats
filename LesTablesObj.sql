CREATE TABLE CLIENT_O OF CLIENT_T (
constraint pk_o_client_clientno primary key(clientno),
NOM constraint client_o_nom_not_null not null,
PRENOM constraint client_o_prenom_not_null not null,
TELEPHONE constraint client_o_telephone_not_null not null,
EMAIL constraint client_o_email_not_null not null)
NESTED TABLE cListRefDossiers STORE AS table_cListRefDossiers
;
/


CREATE TABLE NOTAIRE_O OF NOTAIRE_T (
constraint pk_o_notaire_notaireno primary key(notaireno),
NOM constraint notaire_o_nom_not_null not null,
PRENOM constraint notaire_o_prenom_not_null not null,
TELEPHONE constraint notaire_o_telephone_not_null not null,
EMAIL constraint notaire_o_email_not_null not null,
SPECIALITE constraint notaire_o_specialite_not_null not null)
NESTED TABLE nlistRefDossiers STORE AS table_nListRefDossiers
;
/



CREATE TABLE DOCUMENT_O OF DOCUMENT_T (
constraint pk_o_document_documentno primary key(documentno),
titre constraint document_o_titre_not_null not null,
typedoc constraint document_o_typedoc_not_null not null,
datecreation constraint document_o_datecreation_not_null not null
)
LOB (contenu) STORE AS storeContenu(PCTVERSION 30)
/


CREATE TABLE PAIEMENT_O OF PAIEMENT_T (
constraint pk_o_paiement_paiementno primary key (paiementno),
montant constraint paiement_o_montant_not_null not null,
methode constraint paiement_o_methode_not_null not null,
desc_paiement constraint paiement_o_desc_paiement_not_null not null,
date_paiement constraint paiement_o_date_paiement_not_null not null
);
/




CREATE  TABLE RENDEZVOUS_O OF RENDEZVOUS_T (
constraint pk_o_rendezvous_rendezvousno primary key (rendezvousno),
date_rdv constraint rendezvous_o_date_rdv_not_null not null,
heure constraint rendezvous_o_heure_not_null not null,
lieu  constraint rendezvous_o_lieu_not_null not null,
description  constraint rendezvous_o_description_not_null not null
);
/


CREATE TABLE DOSSIER_O OF DOSSIER_T (
constraint pk_o_dossier_dossierno primary key (dossierno),
nom constraint dossier_o_nom_not_null not null,
description constraint dossier_o_description_not_null not null,
dateouverture constraint dossier_o_dateouverture_not_null not null,
datefermeture constraint dossier_o_datefermeture_not_null not null,
statut constraint dossier_o_statut_not_null not null
);
/


ALTER TABLE table_cListRefDossiers ADD(SCOPE FOR(column_value) IS DOSSIER_O);
CREATE UNIQUE INDEX idx_table_cListRefDossiers_Nested_table_id_Column_value on table_cListRefDossiers(Nested_table_id, Column_value);

ALTER TABLE DOSSIER_O ADD(SCOPE FOR (REFCLIENT) IS CLIENT_O);
CREATE INDEX IDX_DOSSIER_O_RECLIENT ON DOSSIER_O(REFCLIENT); 




ALTER TABLE table_listRefEmps
        ADD (SCOPE FOR (column_value) IS EMPLOYE_O);

CREATE UNIQUE INDEX idx_table_listRefEmps_Nested_table_id_Column_value on table_listRefEmps(Nested_table_id,Column_value);

-- Créer un index sur la référence vers un département dans la table employe_o
ALTER TABLE EMPLOYE_O
        ADD (SCOPE FOR (REFDEPT) IS DEPT_O);
        
CREATE INDEX IDX_EMPLOYE_O_REFDEPT ON EMPLOYE_O(REFDEPT);