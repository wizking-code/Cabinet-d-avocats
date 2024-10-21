package test;

import models.Document;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

public class DocuementTest {
    public static void main(String[] args) throws SQLException, IOException {
        // Création d'un document pour le test
        Document document = new Document();
        document.setDocumentNo(1);
        document.setTitre("Contrat");
        document.setTypeDoc("PDF");
        document.setDateCreation((Date) new java.util.Date());

        // Affichage des informations du document
        System.out.println("*************************** TEST DOCUMENT ***************************************");
        document.display();
    }
}
