package test;

import models.Client;
import oracle.sql.ARRAY;

import java.io.IOException;
import java.sql.SQLException;

import static oracle.jdbc.OracleTypes.ARRAY;

public class ClientTest {
    public static void main(String[] args) throws SQLException, IOException {
        // Création d'un client pour le test
        Client client = new Client();
        client.setClientNo(1);
        client.setNom("Dupont");
        client.setEmail("jean.dupont@example.com");

        // Affichage des informations du client
        System.out.println("*************************** TEST CLIENT ***************************************");
        client.display();
    }
}
