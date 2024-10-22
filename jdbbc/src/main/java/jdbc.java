import models.*;
import oracle.ons.Cli;
import oracle.sql.ARRAY;
import oracle.sql.DATE;
import oracle.sql.REF;
import oracle.sql.STRUCT;

import java.math.BigDecimal;
import java.sql.*;

public class jdbc {
    public static void main(String[] argv) throws SQLException, ClassNotFoundException {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/cabinetpdb","jscabinet","solutions");

            Statement stmt = conn.createStatement();

            java.util.Map  mapOraObjType = conn.getTypeMap();
            mapOraObjType.put((Object)"paiement_t", (Object)Class.forName("models.Paiement" ));
            mapOraObjType.put((Object)"document_t", (Object)Class.forName("models.Document" ));
            mapOraObjType.put((Object)"Dossier_t", (Object)Class.forName("models.Dossier" ));
            mapOraObjType.put((Object)"rendezvous_t", (Object)Class.forName("models.Rendezvous" ));
            mapOraObjType.put((Object)"notaire_t", (Object)Class.forName("models.Notaire" ));
            mapOraObjType.put((Object)"client_t", (Object)Class.forName("models.Client" ));
            String sqlClient = "select * from client_o";

            ResultSet resultsetClient = stmt.executeQuery(sqlClient);
            String jj = "ll";
            System.out.println("***************************INFOS Client***************************************");
            while(resultsetClient.next()){
                Client client = new Client();
                Integer clientNo = resultsetClient.getInt("ClientNO");
                String nom = resultsetClient.getString("NOM");
                ARRAY prenom = (ARRAY) resultsetClient.getObject("PRENOM");
                STRUCT adresseStruct = (STRUCT) resultsetClient.getObject("ADRESSE");

                // Si l'objet STRUCT n'est pas nul, construire l'objet Adresse
                Adresse adresse = null;
                if (adresseStruct != null) {
                    Object[] adresseAttributes = adresseStruct.getAttributes();

                    // Assumons que Adresse a un constructeur qui prend ces valeurs
                    int numero = ((BigDecimal) adresseAttributes[0]).intValue();
                    String rue = (String) adresseAttributes[1];
                    int codePostal = ((BigDecimal) adresseAttributes[2]).intValue();
                    String ville = (String) adresseAttributes[3];
                    String quartier = (String) adresseAttributes[4];

                    // Créer une instance de Adresse
                    adresse = new Adresse("Adress_t",numero, rue, codePostal, ville, quartier);
                }

                // Maintenant, assigner à l'objet Client
                client.setAdresse(adresse);
                //Adresse adresse = (Adresse) resultsetClient.getObject("ADRESSE"); // Assure-toi que c'est bien le type attendu
                ARRAY telephone = (ARRAY) resultsetClient.getObject("TELEPHONE");
                String email = resultsetClient.getString("EMAIL");
                ARRAY listRefDossiers = (ARRAY) resultsetClient.getObject("cListRefDossiers"); // Nom de colonne correct

                // Assignation des valeurs à l'objet Client
                client.setClientNo(clientNo);
                client.setNom(nom);
                client.setPrenom(prenom);
                client.setAdresse(adresse);
                client.setTelephone(telephone);
                client.setEmail(email);
                client.setListRefDossiers(listRefDossiers);
                client.display();
            }


            String sqlNotaire = "select * from notaire_o";

            ResultSet resultsetNotaire = stmt.executeQuery(sqlNotaire);
            System.out.println("***************************INFOS Notaire***************************************");
            while (resultsetNotaire.next()) {
                Notaire notaire = new Notaire();
                Integer notaireNo = resultsetNotaire.getInt("NOTAIRENO");
                String nom = resultsetNotaire.getString("NOM");
                ARRAY prenom = (ARRAY) resultsetNotaire.getObject("PRENOM");
                STRUCT adresseStruct = (STRUCT) resultsetNotaire.getObject("ADRESSE");

                // Si l'objet STRUCT n'est pas nul, construire l'objet Adresse
                Adresse adresse = null;
                if (adresseStruct != null) {
                    Object[] adresseAttributes = adresseStruct.getAttributes();

                    // Assurons-nous que Adresse a un constructeur approprié
                    int numero = ((BigDecimal) adresseAttributes[0]).intValue();
                    String rue = (String) adresseAttributes[1];
                    int codePostal = ((BigDecimal) adresseAttributes[2]).intValue();
                    String ville = (String) adresseAttributes[3];
                    String quartier = (String) adresseAttributes[4];

                    // Créer une instance de Adresse
                    adresse = new Adresse("Adresse_t", numero, rue, codePostal, ville, quartier);
                }

                // Maintenant, assigner à l'objet Notaire
                notaire.setNotaireNo(notaireNo);
                notaire.setNom(nom);
                notaire.setPrenom(prenom);
                notaire.setAdresse(adresse);

                ARRAY telephone = (ARRAY) resultsetNotaire.getObject("TELEPHONE");
                String email = resultsetNotaire.getString("EMAIL");
                String specialite = resultsetNotaire.getString("SPECIALITE");
                ARRAY listRefDossiers = (ARRAY) resultsetNotaire.getObject("nListRefDossiers"); // Nom de colonne correct

                // Assignation des valeurs à l'objet Notaire
                notaire.setTelephone(telephone);
                notaire.setEmail(email);
                notaire.setSpecialite(specialite);
                notaire.setListRefDossiers(listRefDossiers);

                // Afficher les informations du notaire
                notaire.display();
            }


            String sqlDocument = "select * from document_o";

            ResultSet resultsetDocument = stmt.executeQuery(sqlDocument);
            System.out.println("***************************INFOS Document***************************************");
            while (resultsetDocument.next()) {
                Document document = new Document();
                Integer documentNo = resultsetDocument.getInt("DOCUMENTNO");
                String titre = resultsetDocument.getString("TITRE");
                String type = resultsetDocument.getString("type_doc");
                Date dateCreation = resultsetDocument.getDate("datecreation");
                REF listRefDossier = (REF) resultsetDocument.getObject("REFDOSSIER"); // Nom de colonne correct

                // Assignation des valeurs à l'objet Document
                document.setDocumentNo(documentNo);
                document.setTitre(titre);
                document.setTypeDoc(type);
                document.setDateCreation(dateCreation);
                document.setRefDossier(listRefDossier);

                // Afficher les informations du document
                document.display();
            }

            String sqlPaiement = "SELECT * FROM paiement_o";
            ResultSet resultsetPaiement = stmt.executeQuery(sqlPaiement);
            System.out.println("***************************INFOS Paiement***************************************");
            while (resultsetPaiement.next()) {
                Paiement paiement = new Paiement();
                Integer paiementNo = resultsetPaiement.getInt("PAIEMENTNO");
                double montant = resultsetPaiement.getDouble("MONTANT");
                String descPaiement = resultsetPaiement.getString("DESC_PAIEMENT");
                String methode = resultsetPaiement.getString("METHODE");
                Date datePaiement = resultsetPaiement.getDate("DATEPAIEMENT");
                REF refDossier = (REF) resultsetPaiement.getObject("REFDOSSIER"); // Nom de colonne correct

                // Assignation des valeurs à l'objet Paiement
                paiement.setPaiementNo(paiementNo);
                paiement.setMontant(BigDecimal.valueOf(montant));
                paiement.setMethode(methode);
                paiement.setDescPaiement(descPaiement);
                paiement.setDatePaiement(datePaiement);
                paiement.setRefDossier(refDossier);

                // Afficher les informations du paiement
                paiement.display();
            }

            String sqlRendezVous = "SELECT * FROM rendezvous_o";
            ResultSet resultsetRendezVous = stmt.executeQuery(sqlRendezVous);
            System.out.println("***************************INFOS Rendez-vous***************************************");
            while (resultsetRendezVous.next()) {
                Rendezvous rendezVous = new Rendezvous();
                Integer rendezVousNo = resultsetRendezVous.getInt("RENDEZVOUSNO");
                Date dateRendezVous = resultsetRendezVous.getDate("DATE_RDV");
                String lieu = resultsetRendezVous.getString("LIEU");
                String description = resultsetRendezVous.getString("description");
                REF refDossier = (REF) resultsetRendezVous.getObject("REFDOSSIER"); // Nom de colonne correct

                // Assignation des valeurs à l'objet RendezVous
                rendezVous.setRendezvousNo(rendezVousNo);
                rendezVous.setDateRDV(dateRendezVous);
                rendezVous.setDescription(description);
                rendezVous.setLieu(lieu);
                rendezVous.setRefDossier(refDossier);

                // Afficher les informations du rendez-vous
                rendezVous.display();
            }




        }catch (Exception e ){
            e.printStackTrace();
        }

    }
}
