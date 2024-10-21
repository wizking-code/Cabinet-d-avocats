package models;


import java.io.IOException;
import java.sql.*;

import oracle.sql.ARRAY;

public class Notaire implements SQLData {
    private String sql_type;
    private int notaireNo;
    private String nom;
    private Array prenom; // tabPrenoms_t
    private Adresse adresse;
    private Array telephone; // tabTelephones_t
    private String email;
    private String specialite;
    private ARRAY listRefDossiers; // listRefDossiers_t

    public Notaire() {}

    public Notaire(String sql_type, int notaireNo, String nom, Array prenom, Adresse adresse, Array telephone, String email, String specialite, ARRAY listRefDossiers) {
        this.sql_type = sql_type;
        this.notaireNo = notaireNo;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.telephone = telephone;
        this.email = email;
        this.specialite = specialite;
        this.listRefDossiers = listRefDossiers;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        notaireNo = stream.readInt();
        nom = stream.readString();
        prenom = stream.readArray();
        adresse = (Adresse) stream.readObject();
        telephone = stream.readArray();
        email = stream.readString();
        specialite = stream.readString();
        listRefDossiers =(ARRAY) stream.readArray();
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(notaireNo);
        stream.writeString(nom);
        stream.writeArray(prenom);
        stream.writeObject(adresse);
        stream.writeArray(telephone);
        stream.writeString(email);
        stream.writeString(specialite);
        stream.writeArray(listRefDossiers);
    }

    // Getters and setters
    public int getNotaireNo() { return notaireNo; }
    public void setNotaireNo(int notaireNo) { this.notaireNo = notaireNo; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public Array getPrenom() { return prenom; }
    public void setPrenom(Array prenom) { this.prenom = prenom; }
    public Adresse getAdresse() { return adresse; }
    public void setAdresse(Adresse adresse) { this.adresse = adresse; }
    public Array getTelephone() { return telephone; }
    public void setTelephone(Array telephone) { this.telephone = telephone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getSpecialite() { return specialite; }
    public void setSpecialite(String specialite) { this.specialite = specialite; }
    public ARRAY getListRefDossiers() { return listRefDossiers; }
    public void setListRefDossiers(ARRAY listRefDossiers) { this.listRefDossiers = listRefDossiers; }

    public void display() throws SQLException, IOException {
        System.out.println("");
        System.out.println("{");
        System.out.println("notaireNo = " + this.getNotaireNo());
        System.out.println("nom = " + this.getNom());
        this.displayPrenoms();
        this.displayAdresse();
        this.displayTelephones();
        System.out.println("specialite = " + this.getSpecialite());
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

