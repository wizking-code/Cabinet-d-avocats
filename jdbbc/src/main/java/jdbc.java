import models.*;
import oracle.ons.Cli;
import oracle.sql.ARRAY;

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
               Client client = (Client) resultsetClient.getObject(1, mapOraObjType); //,map);
                client.display();
            }


// Affichage des Notaires
            String sqlNotaire = "SELECT * FROM NOTAIRE_O";
            ResultSet resultsetNotaire = stmt.executeQuery(sqlNotaire);
            System.out.println("***************************INFOS Notaire***************************************");
            while (resultsetNotaire.next()) {
                Notaire notaire = (Notaire) resultsetNotaire.getObject(1, mapOraObjType);
                notaire.display();
            }

// Affichage des Documents
            String sqlDocument = "SELECT * FROM DOCUMENT_O";
            ResultSet resultsetDocument = stmt.executeQuery(sqlDocument);
            System.out.println("***************************INFOS Document***************************************");
            while (resultsetDocument.next()) {
                Document document = (Document) resultsetDocument.getObject(1, mapOraObjType);
                document.display();
            }

// Affichage des Paiements
            String sqlPaiement = "SELECT * FROM PAIEMENT_O";
            ResultSet resultsetPaiement = stmt.executeQuery(sqlPaiement);
            System.out.println("***************************INFOS Paiement***************************************");
            while (resultsetPaiement.next()) {
                Paiement paiement = (Paiement) resultsetPaiement.getObject(1, mapOraObjType);
                paiement.display();
            }

// Affichage des Rendezvous
            String sqlRendezvous = "SELECT * FROM RENDEZVOUS_O";
            ResultSet resultsetRendezvous = stmt.executeQuery(sqlRendezvous);
            System.out.println("***************************INFOS Rendezvous***************************************");
            while (resultsetRendezvous.next()) {
                Rendezvous rendezvous = (Rendezvous) resultsetRendezvous.getObject(1, mapOraObjType);
                rendezvous.display();
            }

// Affichage des Dossiers
            String sqlDossier = "SELECT * FROM DOSSIER_O";
            ResultSet resultsetDossier = stmt.executeQuery(sqlDossier);
            System.out.println("***************************INFOS Dossier***************************************");
            while (resultsetDossier.next()) {
                Dossier dossier = (Dossier) resultsetDossier.getObject(1, mapOraObjType);
                dossier.display();
            }



        }catch (Exception e ){
            e.printStackTrace();
        }

    }
}
