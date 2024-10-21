--======================================================================================
----------------------------------CREATION DES INDEX------------------------------------
--======================================================================================

CREATE UNIQUE INDEX idx_client_o_email ON CLIENT_O(EMAIL);

CREATE UNIQUE INDEX idx_table_cListRefDossiers_Nested_table_id_Column_value on table_cListRefDossiers(Nested_table_id, Column_value);

CREATE INDEX IDX_DOSSIER_O_RECLIENT ON DOSSIER_O(REFCLIENT); 

CREATE UNIQUE INDEX idx_notaire_o_email ON NOTAIRE_O(EMAIL);

CREATE UNIQUE INDEX idx_table_nListRefDossiers_Nested_table_id_Column_value on table_nListRefDossiers(Nested_table_id, Column_value);

CREATE INDEX IDX_DOSSIER_O_REFNOTAIRE ON DOSSIER_O(REFNOTAIRE); 

CREATE UNIQUE INDEX idx_table_ListRefDocuments_Nested_table_id_Column_value on table_ListRefDocuments(Nested_table_id, Column_value);

CREATE INDEX IDX_DOCUMENT_O_REFDOSSIER ON DOCUMENT_O(REFDOSSIER);

CREATE UNIQUE INDEX idx_table_ListRefPaiements_Nested_table_id_Column_value on table_ListRefPaiements(Nested_table_id, Column_value);

CREATE INDEX IDX_PAIEMENT_O_REFDOSSIER ON PAIEMENT_O(REFDOSSIER);

CREATE UNIQUE INDEX idx_table_ListRefRendezvous_Nested_table_id_Column_value on table_ListRefRendezvous(Nested_table_id, Column_value);

CREATE INDEX IDX_RENDEZVOUS_O_REFDOSSIER ON RENDEZVOUS_O(REFDOSSIER);

