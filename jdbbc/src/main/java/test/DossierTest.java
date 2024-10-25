package test;

import models.Dossier;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.REF;

import java.io.IOException;
import java.sql.*;

public class DossierTest {
    public static void main(String[] args) throws SQLException, IOException {

        String url = "jdbc:oracle:thin:@//localhost:1521/cabinetpdb"; // Update with your DB details
        String user = "jscabinet";
        String password = "solutions";
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // Create references and arrays
       //     REF refClient = createClientRef(conn, 1); // Replace with actual client ID
         ///   REF refNotaire = createNotaireRef(conn, 1); // Replace with actual notaire ID

            // Example arrays for documents, paiements, and rendezvous
       /*     ARRAY listRefDocuments = createArray(conn, new String[]{"doc1", "doc2"}, "TABDOCUMENTS_T");
            ARRAY listRefPaiements = createArray(conn, new String[]{"paiement1"}, "TABPAIEMENTS_T");
            ARRAY listRefRendezvous = createArray(conn, new String[]{"rendezvous1"}, "TABRENDEZVOUS_T");
*/
            // Create a Dossier object
         /*   Dossier dossier = new Dossier(
                    "Dossier_t",
                    1, // dossierNo
                    "Test Dossier",
                    "This is a test dossier description.",
                    Date.valueOf("2023-01-01"), // dateOuverture
                    Date.valueOf("2023-12-31"), // dateFermeture
                    "Open", // statut
                    refClient,
                    refNotaire,
                    listRefDocuments,
                    listRefPaiements,
                    listRefRendezvous
            );*/

            // Prepare SQL for inserting Dossier
            String sql = "INSERT INTO dossier_o (dossierNo, nom, description, dateOuverture, dateFermeture, statut) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, 21);
                pstmt.setString(2, "Test Dossier");
                pstmt.setString(3,"This is a test dossier.");
                pstmt.setDate(4, Date.valueOf("2023-01-01"));
                pstmt.setDate(5,Date.valueOf("2023-01-01"));
                pstmt.setString(6, "Clos");
                /*pstmt.setObject(7, dossier.getRefClient());
                pstmt.setObject(8, dossier.getRefNotaire());
                pstmt.setArray(9, dossier.getListRefDocuments());
                pstmt.setArray(10, dossier.getListRefPaiements());
                pstmt.setArray(11, dossier.getListRefRendezvous());*/

                pstmt.executeUpdate();
                System.out.println("Dossier inséré avec succès !");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

/*
    private static REF createClientRef(Connection conn, int clientId) throws SQLException {
        // Assuming "Client_t" is the SQL type for clients
     //   RefDescriptor refDesc = RefDescriptor.createDescriptor("Client_t", conn);
        return conn.createRef(refDesc, clientId);
    }

    private static REF createNotaireRef(Connection conn, int notaireId) throws SQLException {
        // Assuming "Notaire_t" is the SQL type for notaires
        RefDescriptor refDesc = RefDescriptor.createDescriptor("Notaire_t", conn);
        return conn.createRef(refDesc, notaireId);
    }
*/

    private static ARRAY createArray(Connection conn, String[] values, String arrayTypeName) throws SQLException {
        ArrayDescriptor arrayDesc = ArrayDescriptor.createDescriptor(arrayTypeName, conn);
        return new ARRAY(arrayDesc, conn, values);
    }
}
