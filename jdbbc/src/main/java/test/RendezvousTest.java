package test;

import models.Rendezvous;

import java.sql.Date;

public class RendezvousTest {
    public static void main(String[] args) {
        // Création d'un rendez-vous pour le test
        Rendezvous rendezvous = new Rendezvous();
        rendezvous.setRendezvousNo(1);
        rendezvous.setDateRDV((Date) new java.util.Date());
        rendezvous.setHeure((Date) new java.util.Date());
        rendezvous.setLieu("Bureau");

        // Affichage des informations du rendez-vous
        System.out.println("*************************** TEST RENDEZVOUS ***************************************");
        rendezvous.display();
    }
}
