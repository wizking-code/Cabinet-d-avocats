package test;

import models.Client;
import models.Dossier;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClientTest {
    public static void main(String[] args) throws SQLException, IOException {
        String url = "jdbc:oracle:thin:@//localhost:1521/cabinetpdb"; // Modifie avec tes infos
        String user = "jscabinet";
        String password = "solutions";

        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/cabinetpdb","jscabinet","solutions")) {
            // Créer l'ARRAY pour les prénoms
            String[] prenomsArray = { "JeanBoss", "PierreBoss" };
            ARRAY prenomArray = new ARRAY(ArrayDescriptor.createDescriptor("TABPRENOMS_T", conn), conn, prenomsArray);

            // Créer l'ARRAY pour les téléphones
            String[] telephonesArray = { "0123456289", "0987654421" };
            ARRAY telephoneArray = new ARRAY(ArrayDescriptor.createDescriptor("TABTELEPHONES_T", conn), conn, telephonesArray);
            Dossier dossier1 = new Dossier("Dossier_t", 1, "Dossier 1", "Description 1",
                    new java.sql.Date(System.currentTimeMillis()),
                    null, "Open", null, null, null, null, null);
            Dossier dossier2 = new Dossier("Dossier_t", 2, "Dossier 2", "Description 2",
                    new java.sql.Date(System.currentTimeMillis()),
                    null, "Closed", null, null, null, null, null);

            // Create an array of Dossier objects
            Dossier[] dossiersArray = {dossier1, dossier2};
            // Préparer l'insertion
            String sql = "INSERT INTO client_o (ClientNO, NOM, PRENOM, TELEPHONE, EMAIL) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                // Valeurs d'exemple
                pstmt.setInt(1, 15); // ClientNO
                pstmt.setString(2, "Dupontss"); // NOM
                pstmt.setObject(3, prenomArray); // PRENOM
                pstmt.setObject(4, telephoneArray); // TELEPHONE
                pstmt.setString(5, "dupontw@example.com"); // EMAIL

                // Exécution de l'insertion
                pstmt.executeUpdate();
                System.out.println("Client inséré avec succès !");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
