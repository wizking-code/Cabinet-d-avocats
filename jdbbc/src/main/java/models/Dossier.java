package models;


import java.io.IOException;
import java.sql.*;
import oracle.sql.ARRAY;
import oracle.sql.REF;

public class Dossier implements SQLData {
    private String sql_type;
    private int dossierNo;
    private String nom;
    private String description;
    private Date dateOuverture;
    private Date dateFermeture;
    private String statut;
    private REF refClient; // REF Client_t
    private REF refNotaire; // REF Notaire_t
    private ARRAY listRefDocuments; // listRefDocuments_t
    private ARRAY listRefPaiements; // listRefPaiements_t
    private ARRAY listRefRendezvous; // listRefRendezvous_t

    public Dossier() {}

    public Dossier(String sql_type, int dossierNo, String nom, String description, Date dateOuverture, Date dateFermeture, String statut, REF refClient, REF refNotaire, ARRAY listRefDocuments, ARRAY listRefPaiements, ARRAY listRefRendezvous) {
        this.sql_type = sql_type;
        this.dossierNo = dossierNo;
        this.nom = nom;
        this.description = description;
        this.dateOuverture = dateOuverture;
        this.dateFermeture = dateFermeture;
        this.statut = statut;
        this.refClient = refClient;
        this.refNotaire = refNotaire;
        this.listRefDocuments = listRefDocuments;
        this.listRefPaiements = listRefPaiements;
        this.listRefRendezvous = listRefRendezvous;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        dossierNo = stream.readInt();
        nom = stream.readString();
        description = stream.readString();
        dateOuverture = stream.readDate();
        dateFermeture = stream.readDate();
        statut = stream.readString();
        setRefNotaire((REF)stream.readRef());
        setRefClient((REF)stream.readRef());
        listRefDocuments = (ARRAY) stream.readArray();
        listRefPaiements = (ARRAY) stream.readArray();
        listRefRendezvous = (ARRAY) stream.readArray();
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(dossierNo);
        stream.writeString(nom);
        stream.writeString(description);
        stream.writeDate(dateOuverture);
        stream.writeDate(dateFermeture);
        stream.writeString(statut);
        stream.writeRef(getRefClient());
        stream.writeRef(getRefNotaire());
        stream.writeArray(listRefDocuments);
        stream.writeArray(listRefPaiements);
        stream.writeArray(listRefRendezvous);
    }

    // Getters and setters
    public int getDossierNo() { return dossierNo; }
    public void setDossierNo(int dossierNo) { this.dossierNo = dossierNo; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getDateOuverture() { return dateOuverture; }
    public void setDateOuverture(Date dateOuverture) { this.dateOuverture = dateOuverture; }
    public Date getDateFermeture() { return dateFermeture; }
    public void setDateFermeture(Date dateFermeture) { this.dateFermeture = dateFermeture; }
    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }
    public REF getRefClient() { return refClient; }
    public void setRefClient(REF refClient) { this.refClient = refClient; }
    public REF getRefNotaire() { return refNotaire; }
    public void setRefNotaire(REF refNotaire) { this.refNotaire = refNotaire; }
    public ARRAY getListRefDocuments() { return listRefDocuments; }
    public void setListRefDocuments(ARRAY listRefDocuments) { this.listRefDocuments = listRefDocuments; }
    public ARRAY getListRefPaiements() { return listRefPaiements; }
    public void setListRefPaiements(ARRAY listRefPaiements) { this.listRefPaiements = listRefPaiements; }
    public ARRAY getListRefRendezvous() { return listRefRendezvous; }
    public void setListRefRendezvous(ARRAY listRefRendezvous) { this.listRefRendezvous = listRefRendezvous; }


    public void display() throws SQLException, IOException {
        System.out.println("");
        System.out.println("{");
        System.out.println("dossierNo = " + this.getDossierNo());
        System.out.println("nom = " + this.getNom());
        System.out.println("description = " + this.getDescription());
        System.out.println("dateOuverture = " + this.getDateOuverture());
        System.out.println("dateFermeture = " + this.getDateFermeture());
        System.out.println("statut = " + this.getStatut());
        this.displayDocuments();
        this.displayPaiements();
        this.displayRendezvous();
        System.out.println("}");
        System.out.println("");
    }

    public void displayDocuments() throws SQLException, IOException {
        System.out.println("<Documents:");
        Ref[] lesRefDocuments = (Ref[]) this.getListRefDocuments().getArray();
        for (Ref refDocument : lesRefDocuments) {
            Document document = (Document) refDocument.getObject();
            document.display();
        }
        System.out.println(">");
    }

    public void displayPaiements() throws SQLException {
        System.out.println("<Paiements:");
        Ref[] lesRefPaiements = (Ref[]) this.getListRefPaiements().getArray();
        for (Ref refPaiement : lesRefPaiements) {
            Paiement paiement = (Paiement) refPaiement.getObject();
            paiement.display();
        }
        System.out.println(">");
    }

    public void displayRendezvous() throws SQLException {
        System.out.println("<Rendezvous:");
        Ref[] lesRefRendezvous = (Ref[]) this.getListRefPaiements().getArray();
        for (Ref refRendezvous : lesRefRendezvous) {
            Rendezvous rendezvous = (Rendezvous) refRendezvous.getObject();
            rendezvous.display();
        }
        System.out.println(">");
    }
}

