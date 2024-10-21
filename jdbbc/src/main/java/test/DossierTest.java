package test;

import models.Dossier;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class DossierTest {
    public static void main(String[] args) throws SQLException, IOException {
        // Création d'un dossier pour le test
        Dossier dossier = new Dossier();
        dossier.setDossierNo(1);
        dossier.setNom("Dossier A");
        dossier.setDescription("Description du dossier A");
        dossier.setDateOuverture((Date) new java.util.Date());

        // Affichage des informations du dossier
        System.out.println("*************************** TEST DOSSIER ***************************************");
        dossier.display();
    }
}
