package models;

import java.sql.*;
import oracle.sql.REF;

public class Rendezvous implements SQLData {
    private String sql_type;
    private int rendezvousNo;
    private Date dateRDV;
    private Date heure;
    private String lieu;
    private String description;
    private REF refDossier; // REF to Dossier

    public Rendezvous() {}

    public Rendezvous(String sql_type, int rendezvousNo, Date dateRDV, Date heure, String lieu, String description, REF refDossier) {
        this.sql_type = sql_type;
        this.rendezvousNo = rendezvousNo;
        this.dateRDV = dateRDV;
        this.heure = heure;
        this.lieu = lieu;
        this.description = description;
        this.refDossier = refDossier;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        rendezvousNo = stream.readInt();
        dateRDV = stream.readDate();
        heure = stream.readDate();
        lieu = stream.readString();
        description = stream.readString();
        setRefDossier((REF) stream.readRef());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(rendezvousNo);
        stream.writeDate(dateRDV);
        stream.writeDate(heure);
        stream.writeString(lieu);
        stream.writeString(description);
        stream.writeRef(getRefDossier());
    }

    // Getters and setters
    public int getRendezvousNo() { return rendezvousNo; }
    public void setRendezvousNo(int rendezvousNo) { this.rendezvousNo = rendezvousNo; }
    public Date getDateRDV() { return dateRDV; }
    public void setDateRDV(Date dateRDV) { this.dateRDV = dateRDV; }
    public Date getHeure() { return heure; }
    public void setHeure(Date heure) { this.heure = heure; }
    public String getLieu() { return lieu; }
    public void setLieu(String lieu) { this.lieu = lieu; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public REF getRefDossier() { return refDossier; }
    public void setRefDossier(REF refDossier) { this.refDossier = refDossier; }

    public void display() {
        System.out.println("");
        System.out.println("{");
        System.out.println("rendezvousNo = " + this.getRendezvousNo());
        System.out.println("dateRDV = " + this.getDateRDV());
        System.out.println("heure = " + this.getHeure());
        System.out.println("lieu = " + this.getLieu());
        System.out.println("description = " + this.getDescription());
        System.out.println("}");
        System.out.println("");
    }
}

