package test;

import models.Adresse;
import models.Dossier;
import models.Notaire;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class NotaireTest {
    public static void main(String[] args) throws SQLException, IOException {
        String url = "jdbc:oracle:thin:@//localhost:1521/cabinetpdb"; // Update with your DB details
        String user = "jscabinet";
        String password = "solutions";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // Create arrays for first names and telephones
            String[] prenomsArray = {"Jean", "Pierre"};
            ARRAY prenomArray = new ARRAY(ArrayDescriptor.createDescriptor("TABPRENOMS_T", conn), conn, prenomsArray);

            String[] telephonesArray = {"0123456789", "0987654321"};
            ARRAY telephoneArray = new ARRAY(ArrayDescriptor.createDescriptor("TABTELEPHONES_T", conn), conn, telephonesArray);

            // Create an address object

           // Adresse adresse = new Adresse(123, "Rue Example", 75000, "Paris", "Centre");

            // Create a Notaire object
   /*         Notaire notaire = new Notaire("Notaire_t", 1, "Dupont", prenomArray, adresse, telephoneArray,
                    "dupont@example.com", "Notaire spécialisé");
*/

            // Prepare SQL for inserting Notaire
            String sql = "INSERT INTO notaire_o (notaireNo, nom, prenom, telephone, email, specialite) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, 11);
                pstmt.setString(2, "Dupont");
                pstmt.setArray(3, prenomArray);
              //  pstmt.setObject(4,adresse); // Assuming Adresse implements SQLData
                pstmt.setArray(4, telephoneArray);
                pstmt.setString(5, "dupont@example.com");
                pstmt.setString(6, "Notaire spécialisé");
              //  pstmt.setObject(8, notaire.getListRefDossiers()); // Set listRefDossiers if initialized

                pstmt.executeUpdate();
                System.out.println("Notaire inséré avec succès !");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
