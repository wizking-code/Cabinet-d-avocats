package test;

import models.Notaire;

import java.io.IOException;
import java.sql.SQLException;

public class NotaireTest {
    public static void main(String[] args) throws SQLException, IOException {
        // Création d'un notaire pour le test
        Notaire notaire = new Notaire();
        notaire.setNotaireNo(1);
        notaire.setNom("Martin");
        notaire.setEmail("sophie.martin@example.com");

        // Affichage des informations du notaire
        System.out.println("*************************** TEST NOTAIRE ***************************************");
        notaire.display();
    }
}
