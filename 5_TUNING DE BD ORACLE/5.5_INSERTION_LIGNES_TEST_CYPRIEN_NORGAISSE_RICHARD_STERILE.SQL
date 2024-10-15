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
 

