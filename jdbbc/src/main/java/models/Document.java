package models;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.*;

import oracle.sql.CLOB;
import oracle.sql.REF;

public class Document implements SQLData {
    private String sql_type;
    private int documentNo;
    private String titre;
    private String typeDoc;
    private Clob contenu;
    private Date dateCreation;
    private REF refDossier; // REF to Dossier

    public Document() {}

    public Document(String sql_type, int documentNo, String titre, String typeDoc, CLOB contenu, Date dateCreation, REF refDossier) {
        this.sql_type = sql_type;
        this.documentNo = documentNo;
        this.titre = titre;
        this.typeDoc = typeDoc;
        this.contenu = contenu;
        this.dateCreation = dateCreation;
        this.refDossier = refDossier;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        documentNo = stream.readInt();
        titre = stream.readString();
        typeDoc = stream.readString();
        contenu = stream.readClob();
        dateCreation = stream.readDate();
        setRefDossier((REF) stream.readRef());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(documentNo);
        stream.writeString(titre);
        stream.writeString(typeDoc);
        stream.writeClob(contenu);
        stream.writeDate(dateCreation);
        stream.writeRef(getRefDossier());
    }

    // Getters and setters
    public int getDocumentNo() { return documentNo; }
    public void setDocumentNo(int documentNo) { this.documentNo = documentNo; }
    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }
    public String getTypeDoc() { return typeDoc; }
    public void setTypeDoc(String typeDoc) { this.typeDoc = typeDoc; }
    public Clob getContenu() { return contenu; }
    public void setContenu(CLOB contenu) { this.contenu = contenu; }
    public Date getDateCreation() { return dateCreation; }
    public void setDateCreation(Date dateCreation) { this.dateCreation = dateCreation; }
    public REF getRefDossier() { return refDossier; }
    public void setRefDossier(REF refDossier) { this.refDossier = refDossier; }


    public void display() throws SQLException, IOException {
        System.out.println("");
        System.out.println("{");
        System.out.println("documentNo = " + this.getDocumentNo());
        System.out.println("titre = " + this.getTitre());
        System.out.println("typeDoc = " + this.getTypeDoc());
        this.displayContenu();
        this.displayRefDossier();
        System.out.println("}");
        System.out.println("");
    }

    public void displayContenu() throws SQLException, IOException {
        if (this.getContenu() != null){
            BufferedReader clobReader = new BufferedReader(this.getContenu().getCharacterStream());
            String ligne;
            System.out.println("[ Contenu: ");
            while ((ligne = clobReader.readLine()) != null) {
                System.out.println("   " + ligne);
            }
            System.out.println("] ");
        }else {
            System.out.println("Pas de contenu");
        }
    }
    public void displayRefDossier() throws SQLException {
        if (this.getRefDossier() != null) {
            // Obtenir l'objet Dossier référencé
            Object dossierObject = this.getRefDossier().getValue();
            if (dossierObject instanceof Dossier) { // Assurez-vous d'avoir une classe Dossier
                Dossier dossier = (Dossier) dossierObject;
                System.out.println("Référence Dossier:");
                System.out.println("  Dossier No = " + dossier.getDossierNo()); // Suppose que Dossier a un getter pour le numéro
                System.out.println("  Dossier Titre = " + dossier.getDescription()); // Exemple de champ dans Dossier
            } else {
                System.out.println("Référence Dossier: Type inattendu");
            }
       } else {
            System.out.println("Référence Dossier: Not available");
        }
    }

}

