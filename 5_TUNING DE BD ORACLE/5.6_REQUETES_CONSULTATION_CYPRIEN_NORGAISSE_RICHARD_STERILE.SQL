
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
    n.NOM, 
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