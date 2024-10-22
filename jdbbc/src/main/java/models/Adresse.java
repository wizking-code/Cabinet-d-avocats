package models;
import java.sql.*;

public class Adresse implements SQLData {
    private String sql_type;
    private int numero;
    private String rue;
    private int codePostal;
    private String ville;
    private String quartier;

    public Adresse() {}

    public Adresse(String sql_type, int numero, String rue, int codePostal, String ville, String quartier) {
        this.sql_type = sql_type;
        this.numero = numero;
        this.rue = rue;
        this.codePostal = codePostal;
        this.ville = ville;
        this.quartier = quartier;
    }

    // Getters and setters
    public int getNumero() { return numero; }
    public void setNumero(int numero) { this.numero = numero; }
    public String getRue() { return rue; }
    public void setRue(String rue) { this.rue = rue; }
    public int getCodePostal() { return codePostal; }
    public void setCodePostal(int codePostal) { this.codePostal = codePostal; }
    public String getVille() { return ville; }
    public void setVille(String ville) { this.ville = ville; }
    public String getQuartier() { return quartier; }
    public void setQuartier(String quartier) { this.quartier = quartier; }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        sql_type = typeName;
        numero = stream.readInt();
        rue = stream.readString();
        codePostal = stream.readInt();
        ville = stream.readString();
        quartier = stream.readString();
    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(numero);
        stream.writeString(rue);
        stream.writeInt(codePostal);
        stream.writeString(ville);
        stream.writeString(quartier);
    }


}
