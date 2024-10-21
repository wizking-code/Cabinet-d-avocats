package test;

import models.Paiement;

import java.sql.Date;

public class PaiementTest {
    public static void main(String[] args) {
        // Création d'un paiement pour le test
        Paiement paiement = new Paiement();
        paiement.setPaiementNo(1);
        paiement.setMontant(new java.math.BigDecimal("150.00"));
        paiement.setMethode("Carte de crédit");
        paiement.setDatePaiement((Date) new java.util.Date());

        // Affichage des informations du paiement
        System.out.println("*************************** TEST PAIEMENT ***************************************");
        paiement.display();
    }
}
