package models;


import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

import oracle.sql.ARRAY;
import oracle.sql.REF;
import oracle.sql.STRUCT;

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
        this.displayListRefDossiers();
        this.displayDossiersValues();
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

    public void displayListRefDossiers() throws SQLException {
        // Affichage des références de dossiers
        if (this.getListRefDossiers() != null) {
            Object[] dossiersArray = (Object[]) this.getListRefDossiers().getArray();
            System.out.println("Liste des Dossiers Référencés (Références):");
            for (Object dossierRef : dossiersArray) {
                REF dossierRefObj = (REF) dossierRef; // Cast en REF
                System.out.println("Dossier Ref: " + dossierRefObj);
            }
        } else {
            System.out.println("Liste des Dossiers Référencés: Not available");
        }
    }

    public void displayDossiersValues() throws SQLException {
        // Affichage des valeurs des dossiers
        if (this.getListRefDossiers() != null) {
            Object[] dossiersArray = (Object[]) this.getListRefDossiers().getArray();
            System.out.println("Liste des Dossiers Référencés (Valeurs):");
            for (Object dossierRef : dossiersArray) {
                REF dossierRefObj = (REF) dossierRef; // Cast en REF
                STRUCT dossierStruct = (STRUCT) dossierRefObj.getValue(); // Récupérer l'objet STRUCT à partir du REF

                Object[] dossierAttributes = dossierStruct.getAttributes();

                // Supposons que Dossier a les attributs suivants : dossierno, nom, description
                Integer dossierNo = ((BigDecimal) dossierAttributes[0]).intValue();
                String dossierNom = (String) dossierAttributes[1];
                String dossierDescription = (String) dossierAttributes[2];

                System.out.println("Dossier No: " + dossierNo);
                System.out.println("Nom: " + dossierNom);
                System.out.println("Description: " + dossierDescription);
            }
        } else {
            System.out.println("Liste des Dossiers Référencés: Not available");
        }
    }


}

