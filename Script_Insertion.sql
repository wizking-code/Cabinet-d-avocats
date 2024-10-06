----INSERTION DES DONNEES DANS LES TABLES -
--==============================================
DECLARE
    refClient1              REF client_t;
    refClient2              REF client_t;
    refClient3              REF client_t;
    refClient4              REF client_t;
    refClient5              REF client_t;
    refClient6              REF client_t;
    refClient7              REF client_t;
    refClient8              REF client_t;
    refClient9              REF client_t;
    refClient10             REF client_t;
    refNotaire1             REF notaire_t;
    refNotaire2             REF notaire_t;
    refNotaire3             REF notaire_t;
    refNotaire4             REF notaire_t;
    refNotaire5             REF notaire_t;
    refDossier1             REF dossier_t;
    refDossier2             REF dossier_t;
    refDossier3             REF dossier_t;
    refDossier4             REF dossier_t;
    refDossier5             REF dossier_t;
    refDossier6             REF dossier_t;
    refDossier7             REF dossier_t;
    refDossier8             REF dossier_t;
    refDossier9             REF dossier_t;
    refDossier10            REF dossier_t;
    refDossier11            REF dossier_t;
    refDossier12            REF dossier_t;
    refDossier13            REF dossier_t;
    refDossier14            REF dossier_t;
    refDossier15            REF dossier_t;
    refDocument1            REF document_t;
    refDocument2            REF document_t;
    refDocument3            REF document_t;
    refDocument4            REF document_t;
    refDocument5            REF document_t;
    refDocument6            REF document_t;
    refDocument7            REF document_t;
    refDocument8            REF document_t;
    refDocument9            REF document_t;
    refDocument10           REF document_t;
    refDocument11           REF document_t;
    refDocument12           REF document_t;
    refDocument13           REF document_t;
    refDocument14           REF document_t;
    refDocument15           REF document_t;
    refPaiement1            REF paiement_t;
    refPaiement2            REF paiement_t;
    refPaiement3            REF paiement_t;
    refPaiement4            REF paiement_t;
    refPaiement5            REF paiement_t;
    refPaiement6            REF paiement_t;
    refPaiement7            REF paiement_t;
    refPaiement8            REF paiement_t;
    refPaiement9            REF paiement_t;
    refPaiement10           REF paiement_t;
    refPaiement11           REF paiement_t;
    refPaiement12           REF paiement_t;
    refPaiement13           REF paiement_t;
    refPaiement14           REF paiement_t;
    refPaiement15           REF paiement_t;
    refRendezvous1          REF rendezvous_t;
    refRendezvous2          REF rendezvous_t;
    refRendezvous3          REF rendezvous_t;
    refRendezvous4          REF rendezvous_t;
    refRendezvous5          REF rendezvous_t;
    refRendezvous6          REF rendezvous_t;
    refRendezvous7          REF rendezvous_t;
    refRendezvous8          REF rendezvous_t;
    refRendezvous9          REF rendezvous_t;
    refRendezvous10         REF rendezvous_t;
BEGIN

    --  Insertion de 10 clients dans la table CLIENT_O
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T (1, 'Dupont', tabPrenoms_t('Jean', 'Michel'), adresse_t(123, 'Rue de Paris', 75000, 'Paris', 'Nord'), tabTelephones_t('0123456789', '0987654321'), 'jean.dupont@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient1;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(2, 'Durand', tabPrenoms_t('Marie', 'Anne'), adresse_t(456, 'Rue de Lyon', 69000, 'Lyon', 'Ouest'), tabTelephones_t('0223456789', '0887654321'), 'marie.durand@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient2;
            
    INSERT INTO CLIENT_O co
        VALUES ( 
                CLIENT_T(3, 'Lefevre', tabPrenoms_t('Sophie'), adresse_t(789, 'Rue de Lille', 59000, 'Lille', 'Nord'), tabTelephones_t('0323456789', '0987123456'), 'sophie.lefevre@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient3;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(4, 'Moreau', tabPrenoms_t('Pierre'), adresse_t(321, 'Rue de Marseille', 13000, 'Marseille', 'Sud'), tabTelephones_t('0423456789', '0787123456'), 'pierre.moreau@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient4;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(5, 'Blanc', tabPrenoms_t('Claire'), adresse_t(987, 'Rue de Toulouse', 31000, 'Toulouse', 'Sud'), tabTelephones_t('0523456789', '0687123456'), 'claire.blanc@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient5;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(6, 'Garnier', tabPrenoms_t('Luc'), adresse_t(654, 'Rue de Bordeaux', 33000, 'Bordeaux', 'Ouest'), tabTelephones_t('0623456789', '0587123456'), 'luc.garnier@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient6;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(7, 'Simon', tabPrenoms_t('Paul', 'Antoine'), adresse_t(111, 'Rue de Rennes', 35000, 'Rennes', 'Nord'), tabTelephones_t('0723456789', '0887123456'), 'paul.simon@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient7;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(8, 'Martinez', tabPrenoms_t('Laura'), adresse_t(222, 'Rue de Strasbourg', 67000, 'Strasbourg', 'Centre'), tabTelephones_t('0823456789', '0987123456'), 'laura.martinez@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient8;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T(9, 'Bernard', tabPrenoms_t('François'), adresse_t(333, 'Rue de Nice', 06000, 'Nice', 'Ouest'), tabTelephones_t('0923456789', '0887123456'), 'francois.bernard@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient9;
            
    INSERT INTO CLIENT_O co
        VALUES (
                CLIENT_T (10, 'David', tabPrenoms_t('Alice'), adresse_t(444, 'Rue de Nantes', 44000, 'Nantes', 'Centre'), tabTelephones_t('0723456789', '0787123456'), 'alice.david@example.com', listRefDossiers_t())
            ) returning ref(co) into refclient10;
            
    -- Insertion dans la table NOTAIRE_O
    
    INSERT INTO NOTAIRE_O no
        VALUES (
                NOTAIRE_T(1, 'Martin', tabPrenoms_t('Pierre', 'Louis'), adresse_t(789, 'Rue de Bordeaux', 33000, 'Bordeaux', 'Nord'), tabTelephones_t('0323456789', '0787654321'), 'pierre.martin@example.com', 'Immobilier', listRefDossiers_t())
            ) returning ref(no) into refnotaire1;
            
    INSERT INTO NOTAIRE_O no
        VALUES (
                NOTAIRE_T(2, 'Leclerc', tabPrenoms_t('Julie', 'Sophie'), adresse_t(321, 'Rue de Nice', 06000, 'Nice', 'Centre'), tabTelephones_t('0423456789', '0687654321'), 'julie.leclerc@example.com', 'Droit des affaires', listRefDossiers_t())
            ) returning ref(no) into refnotaire2;
            
    INSERT INTO NOTAIRE_O no
        VALUES (
                NOTAIRE_T(3, 'Dubois', tabPrenoms_t('Alain'), adresse_t(555, 'Rue de Lille', 59000, 'Lille', 'Sud'), tabTelephones_t('0523456789', '0787654321'), 'alain.dubois@example.com', 'Successions', listRefDossiers_t())
            ) returning ref(no) into refnotaire3;
            
    INSERT INTO NOTAIRE_O no
        VALUES (
                NOTAIRE_T(4, 'Roux', tabPrenoms_t('Lucie'), adresse_t(678, 'Rue de Marseille', 13000, 'Marseille', 'Nord'), tabTelephones_t('0623456789', '0687654321'), 'lucie.roux@example.com', 'Fiscalité', listRefDossiers_t())
            ) returning ref(no) into refnotaire4;
            
    INSERT INTO NOTAIRE_O no
        VALUES (
                NOTAIRE_T(5, 'Giraud', tabPrenoms_t('Nathalie'), adresse_t(890, 'Rue de Toulouse', 31000, 'Toulouse', 'Ouest'), tabTelephones_t('0723456789', '0687654321'), 'nathalie.giraud@example.com', 'Immobilier', listRefDossiers_t())
            ) returning ref(no) into refnotaire5;
    
    -- Insertion dans la table DOSSIER_O 
    
    INSERT INTO DOSSIER_O do 
        VALUES ( 
                DOSSIER_T(1, 'Dossier Succession', 'Succession familiale', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Clos', refclient1, refnotaire1, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier1;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(2, 'Contrat immobilier', 'Achat d''une maison', TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 'Ouvert', refclient2, refnotaire1, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier2;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(3, 'Testament', 'Rédaction du testament', TO_DATE('2023-08-03', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 'Ouvert', refclient3, refnotaire2, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier3;
            
    INSERT INTO DOSSIER_O do 
        VALUES (
                DOSSIER_T(4, 'Litige judiciaire', 'Conflit de propriété', TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-09-04', 'YYYY-MM-DD'), 'En cours', refclient4, refnotaire2, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier4;
            
    INSERT INTO DOSSIER_O do 
        VALUES (
                DOSSIER_T(5, 'Acte de vente', 'Vente d''un appartement', TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 'En cours', refclient5, refnotaire3, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier5;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(6, 'Prêt immobilier', 'Demande de prêt bancaire', TO_DATE('2023-08-06', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 'Ouvert', refclient6, refnotaire3, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier6;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(7, 'Donation', 'Donation d''une propriété', TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 'Clos', refclient7, refnotaire4, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier7;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(8, 'Rénovation immobilière', 'Projet de rénovation', TO_DATE('2023-08-08', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'), 'En cours', refclient8, refnotaire4, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier8;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(9, 'Contrat de bail', 'Location d''un bien immobilier', TO_DATE('2023-08-09', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 'Ouvert', refclient9, refnotaire5, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier9;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(10, 'Contrat commercial', 'Partenariat commercial', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'En cours', refclient10, refnotaire5, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier10;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(11, 'Prêt immobilier', 'Demande de prêt bancaire', TO_DATE('2023-08-06', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 'Ouvert', refclient6, refnotaire3, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier11;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(12, 'Donation', 'Donation d''une propriété', TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 'Clos', refclient7, refnotaire4, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier12;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(13, 'Rénovation immobilière', 'Projet de rénovation', TO_DATE('2023-08-08', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'), 'En cours', refclient8, refnotaire4, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier13;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(14, 'Contrat de bail', 'Location d''un bien immobilier', TO_DATE('2023-08-09', 'YYYY-MM-DD'), TO_DATE('2023-09-09', 'YYYY-MM-DD'), 'Ouvert', refclient9, refnotaire5, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier14;
            
    INSERT INTO DOSSIER_O do
        VALUES (
                DOSSIER_T(15, 'Contrat commercial', 'Partenariat commercial', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'En cours', refclient10, refnotaire5, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t())
            ) returning ref(do) into refdossier15;
    
    -- Insertion dans la table DOCUMENT_O
    INSERT INTO DOCUMENT_O dc 
        VALUES ( 
                DOCUMENT_T(1, 'Contrat de vente', 'Contrat', EMPTY_CLOB(), TO_DATE('2023-09-01', 'YYYY-MM-DD'), refdossier1)
            ) RETURNING ref(dc) into refDocument1;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(2, 'Testament', 'Document légal', EMPTY_CLOB(), TO_DATE('2023-09-02', 'YYYY-MM-DD'), refdossier2)
            ) RETURNING ref(dc) into refDocument2;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(3, 'Procès-verbal', 'Rapport', EMPTY_CLOB(), TO_DATE('2023-09-03', 'YYYY-MM-DD'), refdossier3)
            ) RETURNING ref(dc) into refDocument3;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(4, 'Acte de naissance', 'Document officiel', EMPTY_CLOB(), TO_DATE('2023-09-04', 'YYYY-MM-DD'), refdossier4)
            ) RETURNING ref(dc) into refDocument4;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(5, 'Bail commercial', 'Contrat', EMPTY_CLOB(), TO_DATE('2023-09-05', 'YYYY-MM-DD'), refdossier5)
            ) RETURNING ref(dc) INTO refDocument5;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(6, 'Procédure judiciaire', 'Document légal', EMPTY_CLOB(), TO_DATE('2023-09-06', 'YYYY-MM-DD'), refdossier6)
            ) RETURNING ref(dc) INTO refDocument6;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(7, 'Acte de vente', 'Contrat', EMPTY_CLOB(), TO_DATE('2023-09-07', 'YYYY-MM-DD'), refdossier7)
            ) RETURNING ref(dc) INTO refDocument7;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(8, 'Rapport d''expertise', 'Rapport', EMPTY_CLOB(), TO_DATE('2023-09-08', 'YYYY-MM-DD'), refdossier8)
            )  RETURNING ref(dc) INTO refDocument8;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(9, 'Certificat de propriété', 'Document officiel', EMPTY_CLOB(), TO_DATE('2023-09-09', 'YYYY-MM-DD'), refdossier9)
            )  RETURNING ref(dc) INTO refDocument9;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(10, 'Testament olographe', 'Document légal', EMPTY_CLOB(), TO_DATE('2023-09-10', 'YYYY-MM-DD'), refdossier10)
            )  RETURNING ref(dc) INTO refDocument10;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(11, 'Procédure judiciaire', 'Document légal', EMPTY_CLOB(), TO_DATE('2023-09-06', 'YYYY-MM-DD'), refdossier11)
            )  RETURNING ref(dc) INTO refDocument11;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(12, 'Acte de vente', 'Contrat', EMPTY_CLOB(), TO_DATE('2023-09-07', 'YYYY-MM-DD'), refdossier12)
            )  RETURNING ref(dc) INTO refDocument12;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(13, 'Rapport d''expertise', 'Rapport', EMPTY_CLOB(), TO_DATE('2023-09-08', 'YYYY-MM-DD'), refdossier13)
            )  RETURNING ref(dc) INTO refDocument13;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(14, 'Certificat de propriété', 'Document officiel', EMPTY_CLOB(), TO_DATE('2023-09-09', 'YYYY-MM-DD'), refdossier14)
            )  RETURNING ref(dc) INTO refDocument14;
            
    INSERT INTO DOCUMENT_O dc 
        VALUES (
                DOCUMENT_T(15, 'Testament olographe', 'Document légal', EMPTY_CLOB(), TO_DATE('2023-09-10', 'YYYY-MM-DD'), refdossier15)
            )  RETURNING ref(dc) INTO refDocument15;
            
    -- Insertion dans la table PAIEMENT_O
    
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(1, 1200.00, 'Carte de crédit', 'Paiement pour achat immobilier', TO_DATE('2023-09-01', 'YYYY-MM-DD'), refdossier1)
            ) returning ref(po) into refPaiement1;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(2, 300.00, 'Virement', 'Honoraires notariaux', TO_DATE('2023-09-02', 'YYYY-MM-DD'), refdossier2)
            ) returning ref(po) into refPaiement2;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(3, 500.00, 'Chèque', 'Paiement pour testament', TO_DATE('2023-09-03', 'YYYY-MM-DD'), refdossier3)
            ) returning ref(po) into refPaiement3;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(4, 2000.00, 'Carte de crédit', 'Achat de terrain', TO_DATE('2023-09-04', 'YYYY-MM-DD'), refdossier4)
            ) returning ref(po) into refPaiement4;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(5, 150.00, 'Virement', 'Frais de dossier', TO_DATE('2023-09-05', 'YYYY-MM-DD'), refdossier5)
            ) returning ref(po) into refPaiement5;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(6, 1000.00, 'Chèque', 'Honoraires d''expertise', TO_DATE('2023-09-06', 'YYYY-MM-DD'), refdossier6)
            ) returning ref(po) into refPaiement6;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(7, 800.00, 'Virement', 'Règlement pour procédure judiciaire', TO_DATE('2023-09-07', 'YYYY-MM-DD'), refdossier7)
            ) returning ref(po) into refPaiement7;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(8, 750.00, 'Carte de crédit', 'Honoraires immobiliers', TO_DATE('2023-09-08', 'YYYY-MM-DD'), refdossier8)
            ) returning ref(po) into refPaiement8;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(9, 950.00, 'Chèque', 'Honoraires pour succession', TO_DATE('2023-09-09', 'YYYY-MM-DD'), refdossier9)
            ) returning ref(po) into refPaiement9;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(10, 1200.00, 'Virement', 'Frais de notaire', TO_DATE('2023-09-10', 'YYYY-MM-DD'), refdossier10)
            ) returning ref(po) into refPaiement10;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(11, 1000.00, 'Chèque', 'Honoraires d''expertise', TO_DATE('2023-09-06', 'YYYY-MM-DD'), refdossier11)
            ) returning ref(po) into refPaiement11;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(12, 800.00, 'Virement', 'Règlement pour procédure judiciaire', TO_DATE('2023-09-07', 'YYYY-MM-DD'), refdossier12)
            ) returning ref(po) into refPaiement12;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(13, 750.00, 'Carte de crédit', 'Honoraires immobiliers', TO_DATE('2023-09-08', 'YYYY-MM-DD'), refdossier13)
            ) returning ref(po) into refPaiement13;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(14, 950.00, 'Chèque', 'Honoraires pour succession', TO_DATE('2023-09-09', 'YYYY-MM-DD'), refdossier14)
            ) returning ref(po) into refPaiement14;
            
    INSERT INTO PAIEMENT_O po 
        VALUES (
                PAIEMENT_T(15, 1200.00, 'Virement', 'Frais de notaire', TO_DATE('2023-09-10', 'YYYY-MM-DD'), refdossier15)
            ) returning ref(po) into refPaiement15;
            
    -- Insertion dans la table RENDEZVOUS_O 
    
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(1, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('09:30', 'HH24:MI'), 'Bureau notaire', 'Consultation sur la succession', refdossier1)
            ) returning ref(ro) into refrendezvous1;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(2, TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('10:00', 'HH24:MI'), 'Cabinet avocat', 'Discussion sur un contrat immobilier', refdossier2)
            ) returning ref(ro) into refrendezvous2;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(3, TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('11:00', 'HH24:MI'), 'Maison du client', 'Signature du contrat d''achat', refdossier3)
            ) returning ref(ro) into refrendezvous3;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(4, TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('14:30', 'HH24:MI'), 'Banque', 'Rendez-vous pour un prêt immobilier', refdossier4)
            ) returning ref(ro) into refrendezvous4;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(5, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('15:00', 'HH24:MI'), 'Bureau notaire', 'Consultation juridique', refdossier5)
            ) returning ref(ro) into refrendezvous5;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(6, TO_DATE('2023-09-06', 'YYYY-MM-DD'), TO_DATE('16:00', 'HH24:MI'), 'Cabinet notaire', 'Signature d''un acte de vente', refdossier6)
            ) returning ref(ro) into refrendezvous6;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(7, TO_DATE('2023-09-07', 'YYYY-MM-DD'), TO_DATE('09:00', 'HH24:MI'), 'Mairie', 'Rendez-vous officiel pour la propriété', refdossier7)
            ) returning ref(ro) into refrendezvous7;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(8, TO_DATE('2023-09-08', 'YYYY-MM-DD'), TO_DATE('10:30', 'HH24:MI'), 'Agence immobilière', 'Rendez-vous pour la vente d''un appartement', refdossier8)
            ) returning ref(ro) into refrendezvous8;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(9, TO_DATE('2023-09-09', 'YYYY-MM-DD'), TO_DATE('13:00', 'HH24:MI'), 'Tribunal', 'Affaire légale liée à la propriété', refdossier9)
            ) returning ref(ro) into refrendezvous9;
            
    INSERT INTO RENDEZVOUS_O ro
        VALUES (
                RENDEZVOUS_T(10, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('11:30', 'HH24:MI'), 'Cabinet notaire', 'Conseil juridique pour succession', refdossier10)
            ) returning ref(ro) into refrendezvous10;
            
    -- Insertion indirecte dans la table table_cListRefDossiers
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 1) 
        VALUES (refdossier1);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 2) 
        VALUES (refdossier2);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 3) 
        VALUES (refdossier3);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 4) 
        VALUES (refdossier4);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 5) 
        VALUES (refdossier5);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 6) 
        VALUES (refdossier6);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 6) 
        VALUES (refdossier11);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 7) 
        VALUES (refdossier7);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 7) 
        VALUES (refdossier12);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 8) 
        VALUES (refdossier8);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 8) 
        VALUES (refdossier13);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 9) 
        VALUES (refdossier9);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 9) 
        VALUES (refdossier14);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 10) 
        VALUES (refdossier10);
    
    INSERT INTO 
        TABLE(SELECT c.clistrefdossiers  FROM client_o c WHERE c.clientno = 10) 
        VALUES (refdossier15);
    
    -- Insertion indirecte dans la table table_nListRefDossiers
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 1) 
        VALUES (refdossier1);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 1) 
        VALUES (refdossier2);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 2) 
        VALUES (refdossier3);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 2) 
        VALUES (refdossier4);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 3) 
        VALUES (refdossier5);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 3) 
        VALUES (refdossier6);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 3) 
        VALUES (refdossier11);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 4) 
        VALUES (refdossier7);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 4) 
        VALUES (refdossier8);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 4) 
        VALUES (refdossier12);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 4) 
        VALUES (refdossier13);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 5) 
        VALUES (refdossier9);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 5) 
        VALUES (refdossier10);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 5) 
        VALUES (refdossier14);
    
    INSERT INTO 
        TABLE(SELECT n.nListRefDossiers  FROM notaire_o n WHERE n.notaireno = 5) 
        VALUES (refdossier15);
    
    -- Insertion indirecte dans la table table_ListRefDocuments
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments FROM dossier_o d WHERE d.dossierno = 1) 
        VALUES (refDocument1);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 2) 
        VALUES (refDocument2);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 3) 
        VALUES (refDocument3);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 4) 
        VALUES (refDocument4);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 5) 
        VALUES (refDocument5);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 6) 
        VALUES (refDocument6);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 7) 
        VALUES (refDocument7);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 8) 
        VALUES (refDocument8);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 9) 
        VALUES (refDocument9);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 10) 
        VALUES (refDocument10);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 11) 
        VALUES (refDocument11);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 12) 
        VALUES (refDocument12);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 13) 
        VALUES (refDocument13);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 14) 
        VALUES (refDocument14);
    
    INSERT INTO 
        TABLE(SELECT d.dlistrefdocuments  FROM dossier_o d WHERE d.dossierno = 15) 
        VALUES (refDocument15);
    
    -- Insertion indirecte dans la table table_ListRefPaiements
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements FROM dossier_o d WHERE d.dossierno = 1) 
        VALUES (refPaiement1);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 2) 
        VALUES (refPaiement2);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 3) 
        VALUES (refPaiement3);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 4) 
        VALUES (refPaiement4);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 5) 
        VALUES (refPaiement5);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 6) 
        VALUES (refPaiement6);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 7) 
        VALUES (refPaiement7);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 8) 
        VALUES (refPaiement8);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 9) 
        VALUES (refPaiement9);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 10) 
        VALUES (refPaiement10);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 11) 
        VALUES (refPaiement11);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 12) 
        VALUES (refPaiement12);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 13) 
        VALUES (refPaiement13);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 14) 
        VALUES (refPaiement14);
    
    INSERT INTO 
        TABLE(SELECT d.pListRefPaiements  FROM dossier_o d WHERE d.dossierno = 15) 
        VALUES (refPaiement15);
    
    -- Insertion indirecte dans la table table_ListRefRendezvous
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous FROM dossier_o d WHERE d.dossierno = 1) 
        VALUES (refRendezvous1);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 2) 
        VALUES (refRendezvous2);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 3) 
        VALUES (refRendezvous3);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 4) 
        VALUES (refRendezvous4);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 5) 
        VALUES (refRendezvous5);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 6) 
        VALUES (refRendezvous6);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 7) 
        VALUES (refRendezvous7);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 8) 
        VALUES (refRendezvous8);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 9) 
        VALUES (refRendezvous9);
    
    INSERT INTO 
        TABLE(SELECT d.rListRefRendezvous  FROM dossier_o d WHERE d.dossierno = 10) 
        VALUES (refRendezvous10);
END;
/

commit;

-- ==================================================================================================================
-- == Requêtes de modification impliquant une table == ------------------
-- Modification de nom et prénom du client numéro 1
 UPDATE CLIENT_O SET 
    Nom = 'Josue',
    Prenom = tabPrenoms_t('Jean', 'Fabien')
WHERE Clientno = 1;
/

-- Modification des numéros de téléphone, de l'email du notaire numéro 2
UPDATE NOTAIRE_O SET
    Telephone = tabtelephones_t('0423456767', '06876543213'),
    Email = 'jsophie.leclerc@gmail.com'
WHERE notaireno = 2;
/

--===========================================================================================
-- == Requêtes de modification impliquant deux tables == ------------------
-- Modification du nom, de l'email du client correspondant au numéro 2 si le nom de son dossier n'est pas vide
UPDATE CLIENT_O c
SET c.NOM = 'Telfort',
    c.Email = 'amarie.durand@gmail.com'
WHERE c.CLIENTNO = 
(
    SELECT d.REFCLIENT.CLIENTNO
    FROM DOSSIER_O d
    WHERE d.REFCLIENT.CLIENTNO = 2 and d.Nom is not null
);
/

-- Modification de l'adresse et de l'email du notaire numéro 5 s'il a au moins un dossier
UPDATE NOTAIRE_O n
SET n.ADRESSE = adresse_t(890, 'Rue Magloire', 75000, 'Paris'),
    n.EMAIL = 'natgiraud@gmail.com' 
WHERE n.NOTAIRENO = 5
  AND EXISTS (
      SELECT 1
      FROM DOSSIER_O d
      WHERE d.REFNOTAIRE = REF(n)
  );
/

--============================================================================================================
--=== Requête de modification impliquant plus de deux tables.===----------------
-- Modification du montant de paiement d'un dossier dont le type du document nommé Document légal pour un notaire dont son numéro est 5
UPDATE PAIEMENT_O p
SET p.MONTANT = 780
WHERE p.RefDossier IN (
    SELECT REF(d)
    FROM DOSSIER_O d
    JOIN DOCUMENT_O doc ON doc.RefDossier = REF(d)
    WHERE d.refnotaire.notaireno = 5 and doc.TYPE_DOC = 'Document officiel'
);
/

-- Modification de la date de rendez-vous du dossier du client numéro 7
UPDATE RENDEZVOUS_O r
SET r.DATE_RDV = TO_DATE('2024-10-05', 'YYYY-MM-DD')
WHERE r.RefDossier IN (
    SELECT REF(d)
    FROM DOSSIER_O d
    WHERE d.REFCLIENT.CLIENTNO = 7
);
/

--=============================================================================================================
--=== Requête de suppression impliquant une table.===------------------------------
-- Suppression du client numéro 1
DELETE FROM CLIENT_O 
WHERE clientno = 1;
/

-- Suppression du notaire numéro 3;
DELETE FROM NOTAIRE_O 
WHERE notaireno = 3;
/

--=== Requête de suppression impliquant 2 tables. ===------------------------------
-- Suppression du client identifié au numéro 2 si le nom de son dossier n'est pas vide
DELETE FROM CLIENT_O c
WHERE c.CLIENTNO = 
(
    SELECT d.REFCLIENT.CLIENTNO
    FROM DOSSIER_O d
    WHERE d.REFCLIENT.CLIENTNO = 2 and d.Nom is not null
);
/

-- Suppression du notaire numéro 5 s'il a au moins un dossier.
DELETE FROM NOTAIRE_O n
WHERE n.NOTAIRENO = 5
  AND EXISTS (
      SELECT 1
      FROM DOSSIER_O d
      WHERE d.REFNOTAIRE = REF(n)
  );
/

--=== Requête de suppression impliquant plus de deux tables. ===------------------
-- Suppression des paiements de dossier dont le type du document nommé 'Document légal' pour un notaire dont son numéro est 5
DELETE FROM PAIEMENT_O p
WHERE p.RefDossier IN (
    SELECT REF(d)
    FROM DOSSIER_O d
    JOIN DOCUMENT_O doc ON doc.RefDossier = REF(d)
    WHERE d.refnotaire.notaireno = 5 and doc.TYPE_DOC = 'Document officiel'
);
/

-- Suppression de rendez-vous du dossier du client numéro 7
DELETE FROM RENDEZVOUS_O r
WHERE r.RefDossier IN (
    SELECT REF(d)
    FROM DOSSIER_O d
    WHERE d.REFCLIENT.CLIENTNO = 7
);
/

--===============================================================================================-----
--=== Requête de consultations impliquant une table. ===--
-- Requête affichant le no client, le nom, le prenom, l'adresse, le téléphone et l'email de tous les clients.
SELECT 
    Clientno, 
    Nom, 
    Prenom, 
    Adresse, 
    Telephone, 
    Email 
FROM CLIENT_O;
/

-- Requête affichant le nom, le prenom, l'adresse, le(s) téléphone(s), l'email et la spécialité de tous les notaires par ordre décroissant de nom.
SELECT 
    n.Nom,
    n.Prenom,
    n.Adresse,
    n.Telephone,
    n.Email,
    n.Specialite
FROM NOTAIRE_O n
ORDER BY Nom desc;
/

-- Requête affichant la somme totale de paiements par méthode de paiement.
SELECT 
    Methode, 
    SUM(Montant) "Montant Total" 
FROM Paiement_o
GROUP BY Methode;
/

-- Requête affichant le nom, la description, la date d'ouverture, la date de fermeture, 
-- le statut de tous les dossiers du notaire numéro 4
SELECT 
    d.Nom,
    d.Description,
    d.Dateouverture,
    d.Datefermeture,
    d.Statut
FROM DOSSIER_O d 
WHERE d.REFNOTAIRE.Notaireno = 4;
/

-- Requête affichant la liste de tous les documents.
SELECT * FROM DOCUMENT_O;
/

--=== Requête de consultations impliquant deux tables. ===--
-- Requête affichant le no client, le nom, le prenom, l'adresse, le téléphone, l'email, le nom et la description du dossier de tous les clients.
SELECT 
    oc.Clientno, 
    oc.Nom, 
    oc.Prenom, 
    oc.Adresse, 
    oc.Telephone, 
    oc.Email,
    od.Nom  "Nom Dossier",
    od.Description
FROM CLIENT_O oc, DOSSIER_O od
WHERE oc.Clientno = od.Refclient.Clientno;
/

-- Requête affichant le nom, le prenom, l'adresse, le(s) téléphone(s), l'email, la spécialité, le nom et la description des dossiers de tous les notaires par ordre décroissant.
SELECT 
    n.Nom,
    n.Prenom,
    n.Adresse,
    n.Telephone,
    n.Email,
    n.Specialite,
    od.Nom  "Nom Dossier",
    od.Description
FROM NOTAIRE_O n, DOSSIER_O od
WHERE n.Notaireno = od.Refnotaire.Notaireno
ORDER BY Nom desc;
/

-- Requête affichant le nombre de dossiers par notaire.
SELECT 
    n.NOM as Notaire, 
    COUNT(d.DOSSIERNO) "Nombre de dossiers"
FROM NOTAIRE_O n
JOIN DOSSIER_O d ON DEREF(d.REFNOTAIRE).NOTAIRENO = n.NOTAIRENO
GROUP BY n.NOTAIRENO, n.NOM
ORDER BY "Nombre de dossiers" DESC;
/

-- Requête affichant le nom, le(s) prénom(s), le nom et la description, de tous les dossiers du notaire numéro 5
SELECT 
    n.Nom,
    n.Prenom,
    d.Nom "Nom Dossier",
    d.Description,
    d.Dateouverture,
    d.Datefermeture,
    d.Statut
FROM NOTAIRE_O n
JOIN DOSSIER_O d ON DEREF(d.REFNOTAIRE).NOTAIRENO = n.NOTAIRENO
WHERE n.Notaireno = 5;
/

-- Requête affichant la liste de tous les dossiers qui ont au moins un rendez-vous.
SELECT 
    d.DOSSIERNO, 
    d.NOM, 
    d.DESCRIPTION, 
    d.DATEOUVERTURE, 
    d.DATEFERMETURE, 
    d.STATUT,
    r.DATE_RDV,
    r.LIEU
FROM DOSSIER_O d
JOIN RENDEZVOUS_O r ON DEREF(r.REFDOSSIER).DOSSIERNO = d.DOSSIERNO;
/

--=== Requête de consultations impliquant plus de deux tables. ===--
-- Requête affichant le nom, le prenom, l'email, le nom et la description du dossier de tous les clients chez un notaire.
SELECT 
    oc.Nom "Nom Client", 
    oc.Prenom "Prenom Client",
    oc.Email "Email Client",
    od.Nom  "Nom Dossier",
    od.Description,
    n.Nom "Nom Notaire",
    n.Prenom "Prénom Notaire"
FROM DOSSIER_O od
JOIN CLIENT_O oc ON DEREF(od.REFCLIENT).CLIENTNO = oc.CLIENTNO
JOIN NOTAIRE_O n ON DEREF(od.REFNOTAIRE).NOTAIRENO = n.NOTAIRENO;
/

-- Requête affichant le nombre de dossiers payés par notaire.
SELECT 
    n.Nom,
    COUNT(d.DOSSIERNO) "Dossiers Payés"
FROM DOSSIER_O d
JOIN NOTAIRE_O n ON DEREF(d.REFNOTAIRE).NOTAIRENO = n.NOTAIRENO
JOIN PAIEMENT_O p ON DEREF(p.REFDOSSIER).DOSSIERNO = d.DOSSIERNO
GROUP BY n.Nom
ORDER BY Nom desc;
/

-- Requête affichant la somme de dossiers payés par notaire.
SELECT 
    n.NOM, 
    SUM(p.Montant) "Montant de dossiers"
FROM NOTAIRE_O n
JOIN DOSSIER_O d ON DEREF(d.REFNOTAIRE).NOTAIRENO = n.NOTAIRENO
JOIN PAIEMENT_O p ON DEREF(p.REFDOSSIER).DOSSIERNO = d.DOSSIERNO
GROUP BY n.NOM
ORDER BY "Montant de dossiers" DESC;
/

-- Requête affichant le nom, le(s) prénom(s), le nom du dossier, la description, la date et le lieu du rendez-vous de tous les clients. 
SELECT
    c.Nom "Nom Client",
    c.Prenom,
    d.Nom "Nom Dossier",
    d.Description,
    r.Date_RDV,
    r.Lieu
FROM DOSSIER_O d
JOIN CLIENT_O c on DEREF(d.REFCLIENT).CLIENTNO = c.CLIENTNO
LEFT JOIN RENDEZVOUS_O r ON DEREF(r.REFDOSSIER).DOSSIERNO = d.DOSSIERNO;
/

-- Requête affichant la liste de tous les dossiers qui n'ont pas un rendez-vous.
SELECT
    c.Nom "Nom Client",
    c.Prenom,
    d.Nom "Nom Dossier",
    d.Description
FROM DOSSIER_O d
JOIN CLIENT_O c on DEREF(d.REFCLIENT).CLIENTNO = c.CLIENTNO
WHERE d.DOSSIERNO NOT IN(
    SELECT r.REFDOSSIER.DOSSIERNO 
    FROM RENDEZVOUS_O r
);
/ 

--==========================================================================================================----
--======================= Implémentation des méthodes définies sur les types ===============================--

-- Implémentation de la méthode COMPARE du type ADRESSE_T
CREATE OR REPLACE TYPE BODY adresse_t AS 
    ORDER MEMBER FUNCTION compareAdresse (adresse in adresse_t) RETURN NUMBER IS
        position1 NUMBER :=0;	
        position2 NUMBER :=0;	
        concAdr1 VARCHAR2(60) := SELF.ville||SELF.rue||SELF.numero;
        concAdr2 VARCHAR2(60) := adresse.ville|| adresse.rue|| adresse.numero;
    
    
    BEGIN	
        CASE SELF.quartier 
                WHEN 'Nord' THEN position1 := 1;
                WHEN 'Centre' THEN position1 := 2;
                WHEN 'Sud' THEN position1 := 3;
                WHEN 'Est' THEN position1 := 4;
                WHEN 'Ouest' THEN position1 := 5;
        END CASE;
        CASE adresse.quartier 
                WHEN 'Nord' THEN position2 := 1;
                WHEN 'Centre' THEN position2 := 2;
                WHEN 'Sud' THEN position2 := 3;
                WHEN 'Est' THEN position2 := 4;
                WHEN 'Ouest' THEN position2 := 5;
        END CASE;
    
         concAdr1 :=  position1||concAdr1;
         concAdr2 := position2|| concAdr2;
    
        IF concAdr1 = ConcAdr2 	THEN return 0;
        ELSIF concAdr1 > ConcAdr2 	THEN return 1; 
        ELSIF concAdr1 < ConcAdr2 	THEN return -1; 
        END IF;
    
    END;
END;
/

--============================ Implémentation des méthodes du type CLIENT_T ============================--
CREATE OR REPLACE TYPE BODY CLIENT_T
AS
    member procedure addLinkListeDossiers(RefDossier1 REF DOSSIER_T) IS
    BEGIN
        INSERT INTO 
            TABLE(SELECT c.clistrefdossiers  FROM CLIENT_O c WHERE c.CLIENTNO = SELF.CLIENTNO) 
            VALUES (RefDossier1);
            
    EXCEPTION
        WHEN others then
        RAISE;
    END;
    member procedure deleteLinkListeDossiers (RefDossier1 REF DOSSIER_T) IS
    BEGIN
        DELETE FROM
            TABLE(SELECT c.clistrefdossiers  FROM CLIENT_O c WHERE c.CLIENTNO = SELF.CLIENTNO) clf
            WHERE clf.column_value = RefDossier1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure updateLinkListeDossiers(RefDossier1 REF DOSSIER_T, RefDossier2 REF DOSSIER_T) IS
    BEGIN
        UPDATE
            TABLE(SELECT c.clistrefdossiers  FROM CLIENT_O c WHERE c.CLIENTNO = SELF.CLIENTNO) clf
        SET clf.column_value = RefDossier2
        WHERE clf.column_value = RefDossier1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure createClient(client in CLIENT_T) IS
    BEGIN
        INSERT INTO CLIENT_O (CLIENTNO, NOM, PRENOM, ADRESSE, TELEPHONE, EMAIL, clistRefDossiers)
        VALUES (client.CLIENTNO, client.NOM, client.PRENOM, client.ADRESSE, client.TELEPHONE, client.EMAIL, client.clistRefDossiers);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function getClient (clientno1 IN NUMBER) RETURN CLIENT_T IS
        client1 client_t;
    BEGIN
        SELECT VALUE(c) 
        INTO client1 
        FROM CLIENT_O c
        WHERE CLIENTNO = clientno1;

        RETURN client1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Aucun client trouvé avec ce numéro.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erreur inattendue : ' || SQLERRM);
    END;
    member procedure updateClient(client IN CLIENT_T) IS
    BEGIN
        UPDATE CLIENT_O c SET 
            c.NOM = client.Nom,
            c.Prenom = client.Prenom,
            c.Adresse = client.Adresse,
            c.Telephone = client.Telephone,
            c.Email = client.Email,
            c.clistRefDossiers = client.clistRefDossiers
        WHERE c.Clientno = client.Clientno;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deleteClient(clientno1 IN NUMBER) IS
        refclient1 REF client_t;
    BEGIN
        DELETE FROM CLIENT_O c 
        WHERE c.clientno = clientno1 
        RETURNING ref(c) INTO refclient1;
        
        UPDATE DOSSIER_O d 
        SET d.REFCLIENT = null 
        WHERE d.REFCLIENT = refclient1;
        
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchAllClient RETURN listRefclient_t IS
        r_listClients listRefclient_t := listRefclient_t();
    BEGIN
        SELECT REF(c) BULK COLLECT INTO r_listClients FROM CLIENT_O c;
        
        RETURN r_listClients;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;

END;
/
--============================ Implémentation des méthodes du type NOTAIRE_T ============================--
CREATE OR REPLACE TYPE BODY NOTAIRE_T  
AS
    member procedure addLinkListeDossiers(RefDossier1 REF DOSSIER_T) IS
    BEGIN
        INSERT INTO 
            TABLE(SELECT n.nlistRefDossiers  FROM NOTAIRE_O n WHERE n.NOTAIRENO = SELF.NOTAIRENO) 
            VALUES (RefDossier1);
            
    EXCEPTION
        WHEN others then
        RAISE;
    END;
    member procedure deleteLinkListeDossiers (RefDossier1 REF DOSSIER_T) IS
    BEGIN
        DELETE FROM
            TABLE(SELECT n.nlistRefDossiers  FROM NOTAIRE_O n WHERE n.NOTAIRENO = SELF.NOTAIRENO) nlf
            WHERE nlf.column_value = RefDossier1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure updateLinkListeDossiers(RefDossier1 REF DOSSIER_T, RefDossier2 REF DOSSIER_T) IS
    BEGIN
        UPDATE
            TABLE(SELECT n.nlistRefDossiers  FROM NOTAIRE_O n WHERE n.NOTAIRENO = SELF.NOTAIRENO) nlf
        SET nlf.column_value = RefDossier2
        WHERE nlf.column_value = RefDossier1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure createNotaire(notaire IN NOTAIRE_T) IS
    BEGIN
        INSERT INTO NOTAIRE_O (NOTAIRENO, NOM, PRENOM, ADRESSE, TELEPHONE, EMAIL, SPECIALITE, nlistRefDossiers)
        VALUES (notaire.NOTAIRENO, notaire.NOM, notaire.PRENOM, notaire.ADRESSE, notaire.TELEPHONE, notaire.EMAIL, notaire.SPECIALITE, notaire.nlistRefDossiers);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function getNotaire (notaireno1 IN NUMBER) RETURN NOTAIRE_T IS
        notaire1 notaire_t;
    BEGIN
        SELECT VALUE(n) 
        INTO notaire1 
        FROM NOTAIRE_O n
        WHERE n.NOTAIRENO = notaireno1;

        RETURN notaire1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Aucun notaire trouvé avec ce numéro.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erreur inattendue : ' || SQLERRM);
    END;
    member procedure updateNotaire(notaire IN NOTAIRE_T) IS 
    BEGIN
        UPDATE NOTAIRE_O n SET 
            n.NOM = notaire.Nom,
            n.Prenom = notaire.Prenom,
            n.Adresse = notaire.Adresse,
            n.Telephone = notaire.Telephone,
            n.Email = notaire.Email,
            n.Specialite = notaire.Specialite,
            n.nlistRefDossiers = notaire.nlistRefDossiers
        WHERE n.Notaireno = notaire.Notaireno;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deleteNotaire(notaireno1 IN NUMBER) IS
        refnotaire1 ref notaire_t;
    BEGIN
        DELETE FROM NOTAIRE_O n 
        WHERE n.notaireno = notaireno1
        RETURNING ref(n) INTO refnotaire1;
    
        UPDATE DOSSIER_O d 
        SET d.REFNOTAIRE = null 
        WHERE d.REFNOTAIRE = refnotaire1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchAllNotaire RETURN listRefNotaire_t IS
        r_listNotaires listRefNotaire_t := listRefNotaire_t();
    BEGIN
        SELECT REF(n) BULK COLLECT INTO r_listNotaires FROM NOTAIRE_O n;
        
        RETURN r_listNotaires;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;
END;
/

--============================ Implémentation des méthodes du type DOCUMENT_T ============================--
CREATE OR REPLACE TYPE BODY DOCUMENT_T 
AS    
    member procedure createDocument(document IN DOCUMENT_T) IS
    BEGIN
        INSERT INTO DOCUMENT_O (DOCUMENTNO, TITRE, TYPE_DOC, CONTENU, DATECREATION, REFDOSSIER)
        VALUES (document.DOCUMENTNO, document.TITRE, document.TYPE_DOC, document.CONTENU, document.DATECREATION, document.REFDOSSIER);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchDocument(documentno1 IN NUMBER) RETURN DOCUMENT_T IS
        document1 document_t;
    BEGIN
        SELECT VALUE(d) 
        INTO document1 
        FROM DOCUMENT_O d
        WHERE d.DOCUMENTNO = documentno1;

        RETURN document1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Aucun document trouvé avec ce numéro.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erreur inattendue : ' || SQLERRM);
    END;
    member procedure updateDocument(document IN DOCUMENT_T) IS
    BEGIN
        UPDATE DOCUMENT_O d SET 
            d.TITRE = document.TITRE,
            d.TYPE_DOC = document.TYPE_DOC,
            d.CONTENU = document.CONTENU,
            d.DATECREATION = document.DATECREATION,
            d.REFDOSSIER = document.REFDOSSIER
        WHERE d.DOCUMENTNO = document.DOCUMENTNO;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deleteDocument(documentno1 IN NUMBER) IS
    BEGIN
        DELETE FROM DOCUMENT_O d WHERE d.documentno = documentno1;
        
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchAllDocument RETURN listRefDocuments_t IS
        r_listDocuments listRefDocuments_t := listRefDocuments_t();
    BEGIN
        SELECT REF(d) BULK COLLECT INTO r_listDocuments FROM DOCUMENT_O d;
        
        RETURN r_listDocuments;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;
END;
/

--============================ Implémentation des méthodes du type Paiement_t ============================--
CREATE OR REPLACE TYPE BODY PAIEMENT_T 
AS
    member procedure createPaiement(paiement IN PAIEMENT_T) IS
    BEGIN
        INSERT INTO PAIEMENT_O(PAIEMENTNO, MONTANT, METHODE, DESC_PAIEMENT, DATEPAIEMENT, REFDOSSIER)
        VALUES (paiement.PAIEMENTNO, paiement.MONTANT, paiement.METHODE, paiement.DESC_PAIEMENT, paiement.DATEPAIEMENT, paiement.REFDOSSIER);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchPaiement(paiementno1 IN NUMBER) RETURN PAIEMENT_T IS
        paiement1 paiement_t;
    BEGIN
        -- Limiter à une seule ligne avec ROWNUM
        SELECT VALUE(p) 
        INTO paiement1 
        FROM PAIEMENT_O p
        WHERE p.PAIEMENTNO = paiementno1;

        RETURN paiement1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Aucun rendez-vous trouvé avec ce numéro.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erreur inattendue : ' || SQLERRM);
    END;
    member procedure updatePaiement(paiement IN PAIEMENT_T) IS
    BEGIN
        UPDATE PAIEMENT_O p SET 
            p.MONTANT = paiement.MONTANT,
            p.METHODE = paiement.METHODE,
            p.DESC_PAIEMENT = paiement.DESC_PAIEMENT,
            p.DATEPAIEMENT = paiement.DATEPAIEMENT,
            p.REFDOSSIER = paiement.REFDOSSIER
        WHERE p.PAIEMENTNO = paiement.PAIEMENTNO;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deletePaiement(paiementno1 IN NUMBER) IS
    BEGIN
        DELETE FROM PAIEMENT_O p WHERE p.paiementno = paiementno1;
    END;
    static function searchAllPaiement RETURN listRefPaiements_t IS
        r_listPaiements listRefPaiements_t := listRefPaiements_t();
    BEGIN
        SELECT REF(p) BULK COLLECT INTO r_listPaiements FROM PAIEMENT_O p;
        
        RETURN r_listPaiements;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;
END;
/

--============================ Implémentation des méthodes du type RENDEZVOUS_T ============================--
CREATE OR REPLACE TYPE BODY RENDEZVOUS_T 
AS  
    member procedure createRendezvous(rendezvous IN RENDEZVOUS_T) IS
    BEGIN
        INSERT INTO RENDEZVOUS_O (RENDEZVOUSNO, DATE_RDV, HEURE, LIEU, DESCRIPTION, REFDOSSIER)
        VALUES (rendezvous.RENDEZVOUSNO, rendezvous.DATE_RDV, rendezvous.HEURE, rendezvous.LIEU, rendezvous.DESCRIPTION, rendezvous.REFDOSSIER);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchRendezvous(rendezvousno1 IN NUMBER) RETURN RENDEZVOUS_T IS
        rendezvous1 rendezvous_t;
    BEGIN
        SELECT VALUE(r) 
        INTO rendezvous1 
        FROM RENDEZVOUS_O r
        WHERE RENDEZVOUSNO = rendezvousno1;

        RETURN rendezvous1;
    END;
    member procedure updateRendezvous(rendezvous IN RENDEZVOUS_T) IS
    BEGIN
        UPDATE RENDEZVOUS_O r SET 
            r.DATE_RDV = rendezvous.DATE_RDV,
            r.HEURE = rendezvous.HEURE,
            r.LIEU = rendezvous.LIEU,
            r.DESCRIPTION = rendezvous.DESCRIPTION,
            r.REFDOSSIER = rendezvous.REFDOSSIER
        WHERE r.RENDEZVOUSNO = rendezvous.RENDEZVOUSNO;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deleteRendezvous(rendezvousno1 IN NUMBER) IS
    BEGIN
        DELETE FROM RENDEZVOUS_O r WHERE r.RENDEZVOUSNO = rendezvousno1;
        
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchAllRendezvous RETURN listRefRendevous_t IS
        r_listRendezvous listRefRendevous_t := listRefRendevous_t();
    BEGIN
        SELECT REF(r) BULK COLLECT INTO r_listRendezvous FROM RENDEZVOUS_O r;
        
        RETURN r_listRendezvous;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;
END;
/

--============================ Implémentation des méthodes du type Dossier_t ============================--
CREATE OR REPLACE TYPE BODY Dossier_t
AS
    member procedure addLinkListeDocuments(RefDocument REF DOCUMENT_T) IS
    BEGIN
        INSERT INTO 
            TABLE(SELECT d.dListRefDocuments  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) 
            VALUES (RefDocument);
            
    EXCEPTION
        WHEN others then
        RAISE;
    END;
    member procedure deleteLinkListeDocuments (RefDocument REF DOCUMENT_T) IS
    BEGIN
        DELETE FROM
            TABLE(SELECT d.dListRefDocuments  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
            WHERE dlf.column_value = RefDocument;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure updateLinkListeDocuments(RefDocument1 REF DOCUMENT_T, RefDocument2 REF DOCUMENT_T) IS
    BEGIN
        UPDATE
            TABLE(SELECT d.dListRefDocuments  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
        SET dlf.column_value = RefDocument2
        WHERE dlf.column_value = RefDocument1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure addLinkListePaiements(RefPaiement REF PAIEMENT_T) IS
    BEGIN
        INSERT INTO 
            TABLE(SELECT d.pListRefPaiements  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) 
            VALUES (RefPaiement);
            
    EXCEPTION
        WHEN others then
        RAISE;
    END;
    member procedure deleteLinkListePaiements (RefPaiement REF PAIEMENT_T) IS
    BEGIN
        DELETE FROM
            TABLE(SELECT d.pListRefPaiements  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
            WHERE dlf.column_value = RefPaiement;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure updateLinkListePaiements(RefPaiement1 REF PAIEMENT_T, RefPaiement2 REF PAIEMENT_T) IS
    BEGIN
        UPDATE
            TABLE(SELECT d.pListRefPaiements  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
        SET dlf.column_value = RefPaiement2
        WHERE dlf.column_value = RefPaiement1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure addLinkListeRendezvous(RefRendezvous REF RENDEZVOUS_T) IS
    BEGIN
        INSERT INTO 
            TABLE(SELECT d.rListRefRendezvous  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) 
            VALUES (RefRendezvous);
            
    EXCEPTION
        WHEN others then
        RAISE;
    END;
    member procedure deleteLinkListeRendezvous (RefRendezvous REF RENDEZVOUS_T) IS
    BEGIN
        DELETE FROM
            TABLE(SELECT d.rListRefRendezvous  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
            WHERE dlf.column_value = RefRendezvous;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure updateLinkListeRendezvous(RefRendezvous1 REF RENDEZVOUS_T, RefRendezvous2 REF RENDEZVOUS_T) IS
    BEGIN
        UPDATE
            TABLE(SELECT d.rListRefRendezvous  FROM DOSSIER_O d WHERE d.DOSSIERNO = SELF.DOSSIERNO) dlf
        SET dlf.column_value = RefRendezvous2
        WHERE dlf.column_value = RefRendezvous1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure createDossier(dossier IN DOSSIER_T) IS
    BEGIN
        INSERT INTO DOSSIER_O (DOSSIERNO, NOM, DESCRIPTION, DATEOUVERTURE, DATEFERMETURE, STATUT, REFCLIENT, REFNOTAIRE, dListRefDocuments, pListRefPaiements, rListRefRendezvous)
        VALUES (dossier.DOSSIERNO, dossier.NOM, dossier.DESCRIPTION, dossier.DATEOUVERTURE, dossier.DATEFERMETURE, dossier.STATUT, dossier.REFCLIENT, dossier.REFNOTAIRE, dossier.dListRefDocuments, dossier.pListRefPaiements, dossier.rListRefRendezvous);
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function getDossier (dossierno1 IN NUMBER) RETURN DOSSIER_T IS
        dossier1 dossier_t;
    BEGIN
        SELECT VALUE(d) 
        INTO dossier1 
        FROM DOSSIER_O d
        WHERE d.DOSSIERNO = dossierno1;

        RETURN dossier1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Aucun client trouvé avec ce numéro.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erreur inattendue : ' || SQLERRM);
    END;
    member procedure updateDossier(dossier IN DOSSIER_T) IS
    BEGIN
        UPDATE DOSSIER_O d SET 
            d.NOM = dossier.Nom,
            d.DESCRIPTION = dossier.DESCRIPTION,
            d.DATEOUVERTURE = dossier.DATEOUVERTURE,
            d.DATEFERMETURE = dossier.DATEFERMETURE,
            d.STATUT = dossier.STATUT,
            d.REFCLIENT = dossier.REFCLIENT,
            d.REFNOTAIRE = dossier.REFNOTAIRE,
            d.dListRefDocuments = dossier.dListRefDocuments,
            d.pListRefPaiements = dossier.pListRefPaiements,
            d.rListRefRendezvous = dossier.rListRefRendezvous
        WHERE d.DOSSIERNO = dossier.DOSSIERNO;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    member procedure deleteDossier(dossierno1 IN NUMBER) IS
        refdossier1 REF dossier_t;
    BEGIN
        DELETE FROM DOSSIER_O d 
        WHERE d.dossierno = dossierno1 
        RETURNING REF(d) INTO refdossier1;
        
        UPDATE DOCUMENT_O dc
        SET dc.RefDossier = null 
        WHERE dc.RefDossier = refdossier1;
        
        UPDATE PAIEMENT_O p
        SET p.RefDossier = null 
        WHERE p.RefDossier = refdossier1;
        
        UPDATE RENDEZVOUS_O r
        SET r.RefDossier = null 
        WHERE r.RefDossier = refdossier1;
    EXCEPTION
        WHEN OTHERS THEN
        RAISE;
    END;
    static function searchAllDossier RETURN listRefDossiers_t IS
        r_listDossiers listRefDossiers_t := listRefDossiers_t();
    BEGIN
        SELECT REF(d) BULK COLLECT INTO r_listDossiers FROM DOSSIER_O d;
        
        RETURN r_listDossiers;
    EXCEPTION
        WHEN no_data_found THEN
            raise;
        WHEN others THEN
            raise;
    END;
END;
/
--======================================================================================--
--============= Tester chaque méthode pour le type CLIENT_T =======================--
--==============================Tester la méthode AddLinkListeDossiers=================================
SET SERVEROUTPUT ON;

DECLARE
    dossier2  dossier_t := DOSSIER_T(16, 'Donation', 'Donation d''une voiture', TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 'Clos', null, null, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t());

--- ajouter un dossier à un client
    client3    client_t;
    refdossier4 REF dossier_t;
    refclient4 REF client_t;
BEGIN
    -- Récupère le client et sa référence
    SELECT value(oc), ref(oc)
    INTO client3, refclient4
    FROM client_o oc
    WHERE oc.clientno = 10;

    -- Insère le dossier et récupère la référence du dossier inséré
    INSERT INTO dossier_o od 
    VALUES (dossier2) 
    RETURNING ref(od) INTO refdossier4;

    -- Ajoute le lien entre le client et le dossier
    client3.addLinkListeDossiers(refdossier4);
    
    DBMS_OUTPUT.PUT_LINE('Dossier ajouté avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/

COMMIT;

--============================================ Tester la méthode updateLinkListeDossiers =====================================================
SET SERVEROUTPUT ON;
DECLARE
    client3    CLIENT_T;
    refclient4 REF CLIENT_T;
    refDossier1 REF DOSSIER_T;
    refDossier2 REF DOSSIER_T;
BEGIN
    -- Récupère le client et sa référence
    SELECT value(c), ref(c)
    INTO client3, refclient4
    FROM CLIENT_O c
    WHERE c.CLIENTNO = 10;
    
    -- Récupère la référence du premier dossier (RefDossier1)
    SELECT ref(d)
    INTO refDossier1
    FROM DOSSIER_O d
    WHERE d.DOSSIERNO = 16;

    -- Récupère la référence du deuxième dossier (RefDossier2)
    SELECT ref(d)
    INTO refDossier2
    FROM DOSSIER_O d
    WHERE d.DOSSIERNO = 6;

    -- Appel de la méthode pour mettre à jour le lien du dossier
    client3.updateLinkListeDossiers(refDossier1, refDossier2);

    DBMS_OUTPUT.PUT_LINE('Lien mis à jour avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/

--============================================ Tester la méthode deleteLinkListeDossiers =====================================================
DECLARE
    client3    CLIENT_T;
    refclient4 REF CLIENT_T;
    refDossier1 REF DOSSIER_T;
BEGIN
    -- Récupérer le client et sa référence
    SELECT value(c), ref(c)
    INTO client3, refclient4
    FROM CLIENT_O c
    WHERE c.CLIENTNO = 10;  -- Remplace 10 par le numéro de client approprié

    -- Récupérer la référence du dossier à supprimer (RefDossier1)
    SELECT ref(d)
    INTO refDossier1
    FROM DOSSIER_O d
    WHERE d.DOSSIERNO = 16;  -- Remplace 1 par le numéro de dossier approprié

    -- Appel de la méthode pour supprimer le lien du dossier
    client3.deleteLinkListeDossiers(refDossier1);

    DBMS_OUTPUT.PUT_LINE('Lien supprimé avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
--============================================ Tester la méthode createClient =====================================================
DECLARE
    newClient CLIENT_T;
BEGIN
    -- Création d'un nouveau client
    newClient := CLIENT_T(11,  'Joseph', tabPrenoms_t('Marie', 'Shemica'),  adresse_t(456, '123 Rue de Paris', 75001, 'Paris', 'Nord'),
            tabTelephones_t('0600000001', '0140000001'), 'joseph.mshemica@example.com',  listRefDossiers_t()
    );

    -- Appel de la méthode pour créer le client
    newClient.createClient(newClient);

    DBMS_OUTPUT.PUT_LINE('Client créé avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
COMMIT;
--============================================ Tester la méthode updateClient =====================================================
DECLARE
    -- Nouveau client avec des informations mises à jour
    updatedClient CLIENT_T;
BEGIN
    updatedClient := CLIENT_T(11, 'Dupont', tabPrenoms_t('Jean', 'Paul'), adresse_t(456, '123 Rue de Paris', 75001, 'Paris', 'Nord'), tabTelephones_t('0600000234', '0140000456'),
        'joseph.mshemica@example.com', listRefDossiers_t()
    );
    
    -- 2. Appel de la méthode updateClient pour mettre à jour les informations du client
    updatedClient.updateClient(updatedClient);

    DBMS_OUTPUT.PUT_LINE('Client mis à jour avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de la mise à jour du client : ' || SQLERRM);
END;
/

--============================================ Tester la méthode getClient =====================================================
set serveroutput on;
DECLARE
clientno1 client_o.clientno%type := 11;
v_client  client_t;
BEGIN
    v_client := client_t.getClient(clientno1);
    IF v_client.prenom.count > 2 THEN
        dbms_output.put_line('Nom: '|| v_client.Nom || ' ' || 'Prénom: ' ||  v_client.prenom(1) || ' ' ||  v_client.prenom(2) || ' ' || v_client.prenom(3) || ' ' || 'Email: '|| v_client.Email);
    END IF; 
    IF v_client.prenom.count = 2 THEN
        dbms_output.put_line('Nom: '|| v_client.Nom || ' ' || 'Prénom: ' ||  v_client.prenom(1) || ' ' ||  v_client.prenom(2) || ' ' || 'Email: '|| v_client.Email);
    END IF;
    IF v_client.prenom.count < 2 THEN
        dbms_output.put_line('Nom: '|| v_client.Nom || ' ' || 'Prénom: ' ||  v_client.prenom(1) || ' ' || 'Email: '|| v_client.Email);
    END IF;    
EXCEPTION 
        WHEN no_data_found THEN
         dbms_output.put_line('le client numero :'||clientno1|| ' n''existe pas');
         dbms_output.put_line('code error : '||sqlcode);
         dbms_output.put_line('error message  : '||sqlerrm);
        WHEN OTHERS THEN
         dbms_output.put_line('error generale');
         dbms_output.put_line(' code error : '||sqlcode);
         dbms_output.put_line(' error message  : '||sqlerrm);
END;
/
--============================================= Tester la méthode searchAllClient =================================================
SET SERVEROUTPUT ON;
DECLARE
    r_listClients listRefclient_t;  -- Liste des références de clients
    r_client CLIENT_T;              -- Variable pour stocker l'objet client déréférencé
    c_prenom VARCHAR2(100);
BEGIN
    -- Appel de la méthode et récupération des références de clients
    r_listClients := CLIENT_T.searchAllClient;

    -- Parcourir la collection de références et déréférencer chaque client
    FOR i IN 1 .. r_listClients.count LOOP
        -- Déréférencer la référence pour obtenir l'objet client
        SELECT DEREF(r_listClients(i)) INTO r_client FROM dual;
        -- Afficher le nom du client déréférencé
        IF r_client.prenom.count > 2 THEN
            dbms_output.put_line('Nom: ' || r_client.nom || '| ' || 'Prenom: ' || r_client.prenom(1) || ' ' ||  r_client.prenom(2) || ' ' ||  r_client.prenom(3) || '| ' || 'Email: ' || r_client.email);
        END IF;    
        IF r_client.prenom.count > 1 THEN
            dbms_output.put_line('Nom: ' || r_client.nom || '| ' || 'Prenom: ' || r_client.prenom(1) || ' ' ||  r_client.prenom(2) || '| ' || 'Email: ' || r_client.email);
        END IF;    
        IF r_client.prenom.count = 1 THEN
            dbms_output.put_line('Nom: ' || r_client.nom || '| ' || 'Prenom: ' || r_client.prenom(1) || '| ' || 'Email: ' || r_client.email);
        END IF;
        
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Liste vide');
        dbms_output.put_line('Code erreur: ' || sqlcode);
        dbms_output.put_line('Message d''erreur: ' || sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('Erreur générale');
        dbms_output.put_line('Code erreur: ' || sqlcode);
        dbms_output.put_line('Message d''erreur: ' || sqlerrm);
END;
/
--=======================================================================================================================================
--============= Tester chaque méthode pour le type NOTAIRE_T =======================--
SET SERVEROUTPUT ON;
DECLARE
    -- Déclaration des variables de type notaire_t et ref notaire_t
    v_notaire    NOTAIRE_T;
    v_refNotaire REF NOTAIRE_T;
    v_notaireSearch NOTAIRE_T;
    
    -- Variables pour les dossiers
    v_dossier1   REF DOSSIER_T;
    v_dossier2   REF DOSSIER_T;
    v_listNotaires LISTREFNOTAIRE_T;
    
    -- Variable pour parcourir les prénoms
    v_prenom VARCHAR2(100);
    
BEGIN
    -- 1. Créer un nouveau notaire
    v_notaire := NOTAIRE_T(6, 'Fabrice', tabPrenoms_t('Alex'), adresse_t(321, '123 Rue Forge de Paris', 75002, 'Paris', 'Ouest'), tabTelephones_t('0123456789'),
            'fabrice.alex@example.com',  'Droit Immobilier',  listRefDossiers_t());
    
    v_notaire.createNotaire(v_notaire);
    DBMS_OUTPUT.PUT_LINE('Notaire créé avec succès.');
    
    COMMIT;

    -- 2. Ajouter des dossiers dans la liste des dossiers du notaire
    -- On suppose ici que les dossiers existent déjà dans la table DOSSIER_O
    SELECT REF(d) INTO v_dossier1 FROM DOSSIER_O d WHERE d.DOSSIERNO = 16;
    SELECT REF(d) INTO v_dossier2 FROM DOSSIER_O d WHERE d.DOSSIERNO = 15;
    
    v_notaire.addLinkListeDossiers(v_dossier1);
    --v_notaire.addLinkListeDossiers(v_dossier2);
    DBMS_OUTPUT.PUT_LINE('Dossiers ajoutés à la liste du notaire.');

    -- 3. Rechercher un notaire par son numéro
    v_notaireSearch := NOTAIRE_T.getNotaire(6);
    
    IF v_notaireSearch.prenom.count > 2 THEN
        dbms_output.put_line('Nom: '|| v_notaireSearch.Nom || ' ' || 'Prénom: ' ||  v_notaireSearch.prenom(1) || ' ' ||  v_notaireSearch.prenom(2) || ' ' || v_notaireSearch.prenom(3) || ' ' || 'Email: '|| v_notaireSearch.Email);
    END IF; 
    IF v_notaireSearch.prenom.count = 2 THEN
        dbms_output.put_line('Nom: '|| v_notaireSearch.Nom || ' ' || 'Prénom: ' ||  v_notaireSearch.prenom(1) || ' ' ||  v_notaireSearch.prenom(2) || ' ' || 'Email: '|| v_notaireSearch.Email);
    END IF;
    IF v_notaireSearch.prenom.count < 2 THEN
        dbms_output.put_line('Nom: '|| v_notaireSearch.Nom || ' ' || 'Prénom: ' ||  v_notaireSearch.prenom(1) || ' ' || 'Email: '|| v_notaireSearch.Email);
    END IF; 

    -- 4. Mettre à jour les informations du notaire
    v_notaireSearch.NOM := 'Martin';
    v_notaireSearch.PRENOM := tabPrenoms_t('Jacques');
    v_notaireSearch.updateNotaire(v_notaireSearch);
    DBMS_OUTPUT.PUT_LINE('Notaire mis à jour avec succès.');

    -- 5. Mettre à jour un lien dans la liste des dossiers
    v_notaireSearch.updateLinkListeDossiers(v_dossier1, v_dossier2);
    DBMS_OUTPUT.PUT_LINE('Lien de dossier mis à jour avec succès.');

    -- 6. Supprimer un lien de la liste des dossiers
    v_notaireSearch.deleteLinkListeDossiers(v_dossier2);
    DBMS_OUTPUT.PUT_LINE('Lien de dossier supprimé avec succès.');

    -- 7. Supprimer le notaire
    v_notaireSearch.deleteNotaire(6);
    DBMS_OUTPUT.PUT_LINE('Notaire supprimé avec succès.');

    ROLLBACK;
    
    -- 8. Rechercher tous les notaires
    v_listNotaires := NOTAIRE_T.searchAllNotaire;
    -- Parcourir la collection de références et déréférencer chaque notaire
    FOR i IN 1 .. v_listNotaires.count LOOP
        -- Déréférencer la référence pour obtenir l'objet notaire
        SELECT DEREF(v_listNotaires(i)) INTO v_notaire FROM dual;
        -- Afficher les informations du notaire déréférencé
        IF v_notaire.prenom.count > 2 THEN
            dbms_output.put_line('Nom: ' || v_notaire.nom || '| ' || 'Prenom: ' || v_notaire.prenom(1) || ' ' ||  v_notaire.prenom(2) || ' ' ||  v_notaire.prenom(3) || '| ' || 'Email: ' || v_notaire.email);
        END IF;    
        IF v_notaire.prenom.count > 1 THEN
            dbms_output.put_line('Nom: ' || v_notaire.nom || '| ' || 'Prenom: ' || v_notaire.prenom(1) || ' ' ||  v_notaire.prenom(2) || '| ' || 'Email: ' || v_notaire.email);
        END IF;    
        IF v_notaire.prenom.count = 1 THEN
            dbms_output.put_line('Nom: ' || v_notaire.nom || '| ' || 'Prenom: ' || v_notaire.prenom(1) || '| ' || 'Email: ' || v_notaire.email);
        END IF;
        
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/
--=============================================================================================================================
--============= Tester chaque méthode pour le type DOCUMENT_T =======================--
DECLARE
    document_ref DOCUMENT_T;
    new_document DOCUMENT_T;
    dossier_ref REF DOSSIER_T;
    v_listDocuments LISTREFDOCUMENTS_T;
BEGIN
    -- Tester la méthode createDocument
    SELECT REF(d) INTO dossier_ref FROM DOSSIER_O d WHERE d.DOSSIERNO = 16; -- Sélectionner un dossier existant
    new_document := DOCUMENT_T(16, 'Contrat de vente', 'PDF', 'Contenu du contrat...', SYSDATE, dossier_ref);
    new_document.createDocument(new_document);
    
    DBMS_OUTPUT.PUT_LINE('Document créé avec succès.');
    
    COMMIT;
    
    -- Tester la méthode searchDocument
    document_ref := DOCUMENT_T.searchDocument(16);
    IF document_ref IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Document trouvé : ' || document_ref.TITRE || ' ' || document_ref.TYPE_DOC);
    END IF;

    -- Tester la méthode updateDocument
    new_document := DOCUMENT_T(16, 'Contrat de location', 'DOCX', 'Nouveau contenu...', SYSDATE, dossier_ref);
    document_ref.updateDocument(new_document);
    DBMS_OUTPUT.PUT_LINE('Document mis à jour avec succès.');
    
    COMMIT;

    -- Tester la méthode deleteDocument
    document_ref.deleteDocument(16);
    DBMS_OUTPUT.PUT_LINE('Document supprimé avec succès.');

    ROLLBACK;
    
    -- Tester la méthode searchAllDocument
    v_listDocuments := DOCUMENT_T.searchAllDocument;
    
    -- Parcourir la collection de références et déréférencer chaque document
    FOR i IN 1 .. v_listDocuments.count LOOP
        -- Déréférencer la référence pour obtenir l'objet document
        SELECT DEREF(v_listDocuments(i)) INTO document_ref FROM dual;
        -- Afficher les informations du Document déréférencé
        DBMS_OUTPUT.PUT_LINE('Titre Document : ' || document_ref.TITRE || ', ' || 'Type Document : ' || document_ref.TYPE_DOC);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
--==========================================================================================================================================
--============= Tester chaque méthode pour le type RENDEZVOUS_T =======================--
DECLARE
    rendezvous_ref RENDEZVOUS_T;
    new_rendezvous RENDEZVOUS_T;
    dossier_ref REF DOSSIER_T;
    v_listRendezvous listRefRendevous_t;
BEGIN
    -- Tester la méthode createRendezvous
    SELECT REF(d) INTO dossier_ref FROM DOSSIER_O d WHERE d.DOSSIERNO = 16; -- Sélectionner un dossier existant
    new_rendezvous := RENDEZVOUS_T(11, TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('10:00', 'HH24:MI'), 'Paris', 'Réunion d''affaires', dossier_ref);
    new_rendezvous.createRendezvous(new_rendezvous);
    DBMS_OUTPUT.PUT_LINE('Rendez-vous créé avec succès.');
    
    COMMIT;

    -- Tester la méthode searchRendezvous
    rendezvous_ref := RENDEZVOUS_T.searchRendezvous(11);
    IF rendezvous_ref IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Rendez-vous trouvé : ' || rendezvous_ref.DESCRIPTION || ' à ' || rendezvous_ref.LIEU);
    END IF;

    -- Tester la méthode updateRendezvous
    new_rendezvous := RENDEZVOUS_T(11, TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('11:00', 'HH24:MI'), 'Lyon', 'Réunion modifiée', dossier_ref);
    rendezvous_ref.updateRendezvous(new_rendezvous);
    DBMS_OUTPUT.PUT_LINE('Rendez-vous mis à jour avec succès.');
    
    COMMIT;
    
    -- Tester la méthode deleteRendezvous
    rendezvous_ref.deleteRendezvous(11);
    DBMS_OUTPUT.PUT_LINE('Rendez-vous supprimé avec succès.');
    
    ROLLBACK;
    
    -- Tester la méthode searchAllRendezvous
    v_listRendezvous := RENDEZVOUS_T.searchAllRendezvous;
    -- Parcourir la collection de références et déréférencer chaque rendezvous
    FOR i IN 1 .. v_listRendezvous.count LOOP
        -- Déréférencer la référence pour obtenir l'objet document
        SELECT DEREF(v_listRendezvous(i)) INTO rendezvous_ref FROM dual;
        -- Afficher les informations du Rendezvous déréférencé
        DBMS_OUTPUT.PUT_LINE('Description : ' || rendezvous_ref.DESCRIPTION || ', ' || 'Lieu : ' || rendezvous_ref.LIEU);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
--==============================================================================================================================================
--============= Tester chaque méthode pour le type PAIEMENT_T =======================--
DECLARE
    paiement_ref PAIEMENT_T;
    new_paiement PAIEMENT_T;
    dossier_ref REF DOSSIER_T;
    v_listPaiements listRefPaiements_t;
BEGIN
    -- Tester la méthode createPaiement
    SELECT REF(d) INTO dossier_ref FROM DOSSIER_O d WHERE d.DOSSIERNO = 16; -- Sélectionner un dossier existant
    new_paiement := PAIEMENT_T(16, 150.75, 'Carte de crédit', 'Paiement pour consultation', SYSDATE, dossier_ref);
    new_paiement.createPaiement(new_paiement);
    DBMS_OUTPUT.PUT_LINE('Paiement créé avec succès.');
    
    COMMIT;

    -- Tester la méthode searchPaiement
    paiement_ref := PAIEMENT_T.searchPaiement(16);
    IF paiement_ref IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Paiement trouvé : ' || paiement_ref.METHODE || ' ' || paiement_ref.MONTANT);
    END IF;

    -- Tester la méthode updatePaiement
    new_paiement := PAIEMENT_T(16, 200.50, 'Virement bancaire', 'Paiement modifié', SYSDATE, dossier_ref);
    paiement_ref.updatePaiement(new_paiement);
    DBMS_OUTPUT.PUT_LINE('Paiement mis à jour avec succès.');
    
    COMMIT;

    -- Tester la méthode deletePaiement
    paiement_ref.deletePaiement(16);
    DBMS_OUTPUT.PUT_LINE('Paiement supprimé avec succès.');
    
    ROLLBACK;

    -- Tester la méthode searchAllPaiement
    v_listPaiements := PAIEMENT_T.searchAllPaiement;
    -- Parcourir la collection de références et déréférencer chaque paiement
    FOR i IN 1 .. v_listPaiements.count LOOP
        -- Déréférencer la référence pour obtenir l'objet paiement
        SELECT DEREF(v_listPaiements(i)) INTO paiement_ref FROM dual;
        -- Afficher les informations du Paiement déréférencé
        DBMS_OUTPUT.PUT_LINE('METHODE : ' || paiement_ref.METHODE || ', ' || 'DESC PAIEMENT : ' || paiement_ref.DESC_PAIEMENT);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
--===============================================================================================================================
--============= Tester chaque méthode pour le type DOSSIER_T =======================--
DECLARE
    dossier_ref DOSSIER_T;
    client_ref REF CLIENT_T;
    notaire_ref REF NOTAIRE_T;
    document_ref REF DOCUMENT_T;
    paiement_ref REF PAIEMENT_T;
    rendezvous_ref REF RENDEZVOUS_T;
    new_dossier DOSSIER_T;
    dossier_num NUMBER := 16; -- Numéro du dossier à tester
    v_listDossiers listRefDossiers_t;
BEGIN
    -- Tester la méthode createDossier
    SELECT REF(c) INTO client_ref FROM CLIENT_O c WHERE c.CLIENTNO = 11; -- Sélectionner un client existant
    SELECT REF(n) INTO notaire_ref FROM NOTAIRE_O n WHERE n.NOTAIRENO = 6; -- Sélectionner un notaire existant
    SELECT REF(d) INTO document_ref FROM DOCUMENT_O d WHERE d.DOCUMENTNO = 16; -- Sélectionner un document existant
    SELECT REF(p) INTO paiement_ref FROM PAIEMENT_O p WHERE p.PAIEMENTNO = 16; -- Sélectionner un paiement existant
    SELECT REF(r) INTO rendezvous_ref FROM RENDEZVOUS_O r WHERE r.RENDEZVOUSNO = 11; -- Sélectionner un rendezvous existant
    
    new_dossier := DOSSIER_T(dossier_num, 'Dossier de vente', 'Partenariat commercial', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'En cours', client_ref, notaire_ref, listRefDocuments_t(), listRefPaiements_t(), listRefRendevous_t());
    new_dossier.updateDossier(new_dossier);
    
    DBMS_OUTPUT.PUT_LINE('Dossier créé avec succès.');
    
    COMMIT;

    -- Tester la méthode getDossier
    dossier_ref := DOSSIER_T.getDossier(dossier_num);
    IF dossier_ref IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Dossier trouvé : ' || dossier_ref.NOM || ' ' || dossier_ref.DESCRIPTION);
    END IF;

    -- Tester la méthode addLinkListeDocuments
    dossier_ref.addLinkListeDocuments(document_ref);
    DBMS_OUTPUT.PUT_LINE('Document ajouté au dossier.');
    
    -- Tester la méthode addLinkListePaiements
    dossier_ref.addLinkListePaiements(paiement_ref);
    DBMS_OUTPUT.PUT_LINE('Paiement ajouté au dossier.');
    
    -- Tester la méthode addLinkListeRendezvous
    dossier_ref.addLinkListeRendezvous(rendezvous_ref);
    DBMS_OUTPUT.PUT_LINE('Rendez-vous ajouté au dossier.');

    COMMIT;
    
    -- Tester la méthode deleteLinkListeDocuments
    dossier_ref.deleteLinkListeDocuments(document_ref);
    DBMS_OUTPUT.PUT_LINE('Document supprimé du dossier.');
    
    -- Tester la méthode deleteLinkListePaiements
    dossier_ref.deleteLinkListePaiements(paiement_ref);
    DBMS_OUTPUT.PUT_LINE('Paiement supprimé du dossier.');
    
    -- Tester la méthode deleteLinkListeRendezvous
    dossier_ref.deleteLinkListeRendezvous(rendezvous_ref);
    DBMS_OUTPUT.PUT_LINE('Rendez-vous supprimé du dossier.');
    
    -- Tester la méthode deleteDossier
    dossier_ref.deleteDossier(dossier_num);
    DBMS_OUTPUT.PUT_LINE('Dossier supprimé avec succès.');

    ROLLBACK;

    -- Tester la méthode searchAllDossier
    v_listDossiers := DOSSIER_T.searchAllDossier;
    -- Parcourir la collection de références et déréférencer chaque dossier
    FOR i IN 1 .. v_listDossiers.count LOOP
        -- Déréférencer la référence pour obtenir l'objet dossier
        SELECT DEREF(v_listDossiers(i)) INTO dossier_ref FROM dual;
        -- Afficher les informations du dossier déréférencé
        DBMS_OUTPUT.PUT_LINE('Nom : ' || dossier_ref.NOM || ', ' || 'Description : ' || dossier_ref.DESCRIPTION);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/