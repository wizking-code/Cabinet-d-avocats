package models;

import java.io.IOException;
import java.sql.*;

import oracle.sql.ARRAY;


public class Client implements SQLData {
    private String sql_type;
    private int clientNo;
    private String nom;
    private ARRAY prenom; // tabPrenoms_t
    private Adresse adresse;
    private ARRAY telephone; // tabTelephones_t
    private String email;
    private ARRAY listRefDossiers; // listRefDossiers_t

    public Client() {}

    public Client(String sql_type, int clientNo, String nom, ARRAY prenom, Adresse adresse, ARRAY telephone, String email, ARRAY listRefDossiers) {
        this.sql_type = sql_type;
        this.clientNo = clientNo;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.telephone = telephone;
        this.email = email;
        this.listRefDossiers = listRefDossiers;
    }



    // Getters and setters
    public int getClientNo() { return clientNo; }
    public void setClientNo(int clientNo) { this.clientNo = clientNo; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public ARRAY getPrenom() { return prenom; }
    public void setPrenom(ARRAY prenom) { this.prenom = prenom; }
    public Adresse getAdresse() { return adresse; }
    public void setAdresse(Adresse adresse) { this.adresse = adresse; }
    public ARRAY getTelephone() { return telephone; }
    public void setTelephone(ARRAY telephone) { this.telephone = telephone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public ARRAY getListRefDossiers() { return listRefDossiers; }
    public void setListRefDossiers(ARRAY listRefDossiers) { this.listRefDossiers = listRefDossiers; }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }


    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        clientNo = stream.readInt();
        nom = stream.readString();
        prenom =(ARRAY) stream.readArray();
        adresse = (Adresse) stream.readObject();
        telephone = (ARRAY) stream.readArray();
        email = stream.readString();
        listRefDossiers = (ARRAY) stream.readArray();
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(clientNo);
        stream.writeString(nom);
        stream.writeArray(prenom);
        stream.writeObject(adresse);
        stream.writeArray(telephone);
        stream.writeString(email);
        stream.writeArray(listRefDossiers);
    }



    public void display() throws SQLException, IOException {
        System.out.println("");
        System.out.println("{");
        System.out.println("clientNo = " + this.getClientNo());
        System.out.println("nom = " + this.getNom());
        this.displayPrenoms();
        this.displayAdresse();
        this.displayTelephones();
        System.out.println("}");
        System.out.println("");
    }

    public void displayPrenoms() throws SQLException {
        // Displaying first names
        String[] lesPrenoms = (String[]) this.getPrenom().getArray();
        for (int i = 0; i < lesPrenoms.length; i++) {
            System.out.println("Prenom[" + i + "] = " + lesPrenoms[i]);
        }
    }

    public void displayAdresse() {
        // Displaying address details
        if (this.getAdresse() != null) {
            System.out.println("Adresse:");
            System.out.println("  Numero = " + this.getAdresse().getNumero());
            System.out.println("  Rue = " + this.getAdresse().getRue());
            System.out.println("  Code Postal = " + this.getAdresse().getCodePostal());
            System.out.println("  Ville = " + this.getAdresse().getVille());
            System.out.println("  Quartier = " + this.getAdresse().getQuartier());
        } else {
            System.out.println("Adresse: Not available");
        }
    }

    public void displayTelephones() throws SQLException {
        // Displaying telephone numbers
        String[] lesTelephones = (String[]) this.getTelephone().getArray();
        for (int i = 0; i < lesTelephones.length; i++) {
            System.out.println("Telephone[" + i + "] = " + lesTelephones[i]);
        }
    }
}



