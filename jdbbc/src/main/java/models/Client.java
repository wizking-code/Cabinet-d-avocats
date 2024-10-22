package models;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

import oracle.sql.ARRAY;
import oracle.sql.REF;
import oracle.sql.STRUCT;


public class Client implements SQLData {
    private String sql_type;
    private Integer clientNo;
    private String nom;
    private ARRAY prenom; // tabPrenoms_t
    private Adresse adresse;
    private ARRAY telephone; // tabTelephones_t
    private String email;
    private ARRAY listRefDossiers; // listRefDossiers_t

    public Client() {}

    public Client(String sql_type, Integer clientNo, String nom, ARRAY prenom, Adresse adresse, ARRAY telephone, String email, ARRAY listRefDossiers) {
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
    public Integer getClientNo() { return clientNo; }
    public void setClientNo(Integer clientNo) { this.clientNo = clientNo; }
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
        /*sql_type = typeName;
        clientNo = stream.readBigDecimal();
        nom = stream.readString();
        prenom =(ARRAY) stream.readArray();
        adresse = (Adresse) stream.readObject();
        telephone = (ARRAY) stream.readArray();
        email = stream.readString();
        listRefDossiers = (ARRAY) stream.readArray();*/
        sql_type = typeName;
        clientNo = stream.readInt();
        nom = stream.readString();

        Object prenomObj = stream.readArray();
        if (prenomObj instanceof ARRAY) {
            prenom = (ARRAY) prenomObj;
        } else {
            throw new SQLException("Expected ARRAY for prenom but got: " + prenomObj.getClass().getName());
        }

        Object adresseObj = stream.readObject();
        if (adresseObj instanceof Adresse) {
            adresse = (Adresse) adresseObj;
        } else {
            throw new SQLException("Expected Adresse but got: " + adresseObj.getClass().getName());
        }

        Object telephoneObj = stream.readArray();
        if (telephoneObj instanceof ARRAY) {
            telephone = (ARRAY) telephoneObj;
        } else {
            throw new SQLException("Expected ARRAY for telephone but got: " + telephoneObj.getClass().getName());
        }

        email = stream.readString();

        Object listRefDossiersObj = stream.readArray();
        if (listRefDossiersObj instanceof ARRAY) {
            listRefDossiers = (ARRAY) listRefDossiersObj;
        } else {
            throw new SQLException("Expected ARRAY for listRefDossiers but got: " + listRefDossiersObj.getClass().getName());
        }
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
        this.displayListRefDossiers();
        this.displayListRefDossiersWithValue();
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
        // Displaying list of dossier references
        if (this.getListRefDossiers() != null) {
            Object[] dossiersArray = (Object[]) this.getListRefDossiers().getArray();
            System.out.println("Liste des Dossiers Référencés:");
            for (Object dossierRef : dossiersArray) {
                REF refDossier = (REF) dossierRef; // Assurez-vous que c'est bien le type attendu
                System.out.println("Dossier Ref: " + refDossier.getObject().toString()); // Adapté selon ta méthode toString()
            }
        } else {
            System.out.println("Liste des Dossiers Référencés: Not available");
        }
    }

    public void displayListRefDossiersWithValue() throws SQLException {
        // Displaying list of dossier references
        // Displaying list of dossier references
        if (this.getListRefDossiers() != null) {
            Object[] dossiersArray = (Object[]) this.getListRefDossiers().getArray();
            System.out.println("Liste des Dossiers Référencés:");
            for (Object dossierRef : dossiersArray) {
                REF dossierRefObj = (REF) dossierRef; // Cast en REF
                STRUCT dossierStruct = (STRUCT) dossierRefObj.getValue(); // Récupérer l'objet STRUCT à partir du REF

                Object[] dossierAttributes = dossierStruct.getAttributes();

                // Supposons que Dossier a les attributs suivants : dossierno, nom, description
                Integer dossierNo = ((BigDecimal) dossierAttributes[0]).intValue();
                String dossierNom = (String) dossierAttributes[1];
                String dossierDescription = (String) dossierAttributes[2];

                System.out.println("Dossier Ref: ");
                System.out.println("  Dossier No: " + dossierNo);
                System.out.println("  Nom: " + dossierNom);
                System.out.println("  Description: " + dossierDescription);
            }
        } else {
            System.out.println("Liste des Dossiers Référencés: Not available");
        }
    }
}



