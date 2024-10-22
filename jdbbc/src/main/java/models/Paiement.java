package models;

import java.math.BigDecimal;
import java.sql.*;
import oracle.sql.REF;

public class Paiement implements SQLData {
    private String sql_type;
    private int paiementNo;
    private BigDecimal montant;
    private String methode;
    private String descPaiement;
    private Date datePaiement;
    private REF refDossier; // REF to Dossier

    public Paiement() {}

    public Paiement(String sql_type, int paiementNo, double montant, String methode, String descPaiement, Date datePaiement, REF refDossier) {
        this.sql_type = sql_type;
        this.paiementNo = paiementNo;
        this.montant = BigDecimal.valueOf(montant);
        this.methode = methode;
        this.descPaiement = descPaiement;
        this.datePaiement = datePaiement;
        this.refDossier = refDossier;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        paiementNo = stream.readInt();
        montant = BigDecimal.valueOf(stream.readDouble());
        methode = stream.readString();
        descPaiement = stream.readString();
        datePaiement = stream.readDate();
        setRefDossier((REF) stream.readRef());
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(paiementNo);
        stream.writeBigDecimal(montant);
        stream.writeString(methode);
        stream.writeString(descPaiement);
        stream.writeDate(datePaiement);
        stream.writeRef(getRefDossier());
    }

    // Getters and setters
    public int getPaiementNo() { return paiementNo; }
    public void setPaiementNo(int paiementNo) { this.paiementNo = paiementNo; }
    public BigDecimal getMontant() { return montant; }
    public void setMontant(BigDecimal montant) { this.montant = montant; }
    public String getMethode() { return methode; }
    public void setMethode(String methode) { this.methode = methode; }
    public String getDescPaiement() { return descPaiement; }
    public void setDescPaiement(String descPaiement) { this.descPaiement = descPaiement; }
    public Date getDatePaiement() { return datePaiement; }
    public void setDatePaiement(Date datePaiement) { this.datePaiement = datePaiement; }
    public REF getRefDossier() { return refDossier; }
    public void setRefDossier(REF refDossier) { this.refDossier = refDossier; }


    public void display() {
        System.out.println("");
        System.out.println("{");
        System.out.println("paiementNo = " + this.getPaiementNo());
        System.out.println("montant = " + this.getMontant());
        System.out.println("methode = " + this.getMethode());
        System.out.println("descPaiement = " + this.getDescPaiement());
        System.out.println("datePaiement = " + this.getDatePaiement());
        System.out.println("}");
        System.out.println("");
    }
}

