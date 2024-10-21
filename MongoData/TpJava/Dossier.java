package TpJava;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase; 
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential; 
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase; 
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential; 
import com.mongodb.DBObject;  
import com.mongodb.BasicDBObject; 
import com.mongodb.DBCollection; 
import com.mongodb.DBCursor;
import com.mongodb.DB; 
import org.bson.Document;  
import java.util.Arrays;
import java.util.List;
import com.mongodb.client.FindIterable; 
import java.util.Iterator; 
import java.util.ArrayList;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.bson.conversions.Bson;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.client.model.UpdateOptions;

public class Dossier { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String notaireCollectionName="notaire";
   private String clientCollectionName="client";
   private String dossierCollectionName="dossier";
   private String paiementCollectionName="paiement";
   
   private String notairesFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		Dossier dossier = new Dossier();
		// TC1b : inserer un puis plusieurs dossiers depuis des variables Java
		System.out.println("\n\n Inserer un puis plusieurs dossiers ...");

		//dossier.testInsertOneDossier();
		//dossier.testInsertManyDossiers();

		// TC2a: Afficher un dossier connaissant son numero
		System.out.println("\n\n Afficher le dossier numero 10 ...");
		dossier.getDossierById(dossier.dossierCollectionName, 10);

		
		// 
		// TC2b: Afficher tous les dossiers sans tri ni projection
		System.out.println("\n\n Afficher tous les dossiers sans tri ni projection ...");

		dossier.getDossiers(
			dossier.dossierCollectionName, 
			new Document(), 
			new Document(),
			new Document()
		);
		
		
		// TC3 : Afficher tous les dossiers trie en ordre decroissant sur le nom
		System.out.println("\n\n TC3 ...");

		dossier.getDossiers(dossier.dossierCollectionName, 
			new Document(),
			new Document(),
			new Document("nom", -1)
		);	
		
		// TC4 : Modifier le nom et le statut d'un dossier connaissant son nr		
		System.out.println("\n\n Modifier le nom et le statut d'un dossier connaissant son nr ...");
		
	
		// dossier.updateDossiers(dossier.dossierCollectionName, 
			// new Document("_id", 8), 
			// new Document ("$set", new Document("nom", "Vente immobilière").append("statut", "Ouvert")),
			// new UpdateOptions()
		// );
		
		
		//dossier.deleteDossiers(dossier.dossierCollectionName, new Document());		
		//dossier.deleteDossiers(dossier.dossierCollectionName, new Document("_id", 1002));		
		
		System.out.println("\n\n Afficher un dossier avec les informations du client connaissant son nr ...");
		
		dossier.joinLocalAndforeignCollections(
			dossier.dossierCollectionName,
			dossier.clientCollectionName, 
			"clientid",
			"_id",
			new Document("_id", 1)
		);
		
		System.out.println("\n\n Afficher un dossier avec les informations du notaire connaissant son nr ...");
		
		dossier.joinLocalAndforeignCollections(
			dossier.dossierCollectionName,
			dossier.notaireCollectionName, 
			"notaireid",
			"_id",
			new Document("_id", 1)
		);
		
		dossier.NbreDossierParNotaire(dossier.dossierCollectionName);
		
		dossier.afficherNombreDossiersPayesParNotaire(dossier.paiementCollectionName, dossier.dossierCollectionName);
		
	}catch(Exception e){
		e.printStackTrace();
	}	
   } 
 

   /**
	FC1 : Constructeur Client.
	Dans ce constructeur sont effectuees les activites suivantes:
	- Creation d'une instance du client MongoClient
	- Creation d'une BD Mongo appele RH
	- Creation d'un utilisateur appele 
	- Chargement du pointeur vers la base RH
   */
   Dossier(){
		// Creating a Mongo client
		
		MongoClient mongoClient = new MongoClient( hostName , port ); 

		// Creating Credentials
		MongoCredential credential; 
		credential = MongoCredential.createCredential(userName, dbName, 
		 passWord.toCharArray()); 
		System.out.println("Connected to the database successfully"); 	  
		System.out.println("Credentials ::"+ credential);  
		// Accessing the database 
		database = mongoClient.getDatabase(dbName); 
   }

   /**
	FC4 : Cette fonction permet d'inserer un dossier dans une collection.
   */
   
   public void insertOneDossier(String nomCollection, Document dossier){
		//Drop a collection 
		MongoCollection<Document> colDossiers = database.getCollection(nomCollection);
		colDossiers.insertOne(dossier); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOneDossier.
   */

   public void testInsertOneDossier(){
	   Document  dossier = new Document("_id", 1001)
		.append ("nom", "Rénovation immobilière")
		.append("description", "Projet de rénovation")
		.append("dateouverture", "2023-10-23")
		.append("datefermeture", "2023-11-23")
		.append("statut","En cours")
		.append("clientid", 1001)
		.append("notaireid", 1001);
		this.insertOneDossier(this.dossierCollectionName, dossier);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs dossiers dans une collection
   */

   public void insertManyDossiers(String nomCollection, List<Document> dossiers){
		//Drop a collection 
		MongoCollection<Document> colDossiers = database.getCollection(nomCollection);
		colDossiers.insertMany(dossiers); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManyClients
   */

   public void testInsertManyDossiers(){
	   List<Document> dossiers = Arrays.asList(
			new Document("_id", 1002)
			.append ("nom", "Rénovation immobilière")
			.append("description", "Projet de rénovation")
			.append("dateouverture", "2023-10-23")
			.append("datefermeture", "2023-11-23")
			.append("statut","En cours")
			.append("clientid", 1001)
			.append("notaireid", 1001),

		   new Document("_id", 1003)
			.append ("nom", "Donation")
			.append("description", "Donation d'une propriété")
			.append("dateouverture", "2023-10-23")
			.append("datefermeture", "2023-11-23")
			.append("statut","En cours")
			.append("clientid", 1002)
			.append("notaireid", 1001),

		   new Document("_id", 1004)
			.append ("nom", "Prêt immobilier")
			.append("description", "Demande de prêt bancaire")
			.append("dateouverture", "2023-10-23")
			.append("datefermeture", "2023-11-23")
			.append("statut","En cours")
			.append("clientid", 1003)
			.append("notaireid", 1001),

		   new Document("_id", 1005)
			.append ("nom", "Acte de vente")
			.append("description", "Vente d'un appartement")
			.append("dateouverture", "2023-10-23")
			.append("datefermeture", "2023-11-23")
			.append("statut","En cours")
			.append("clientid", 1006)
			.append("notaireid", 1002),

		   new Document("_id", 1006)
			.append ("nom", "Testament")
			.append("description", "Rédaction du testament")
			.append("dateouverture", "2023-10-23")
			.append("datefermeture", "2023-11-23")
			.append("statut","En cours")
			.append("clientid", 1007)
			.append("notaireid", 1002)
		);
		this.insertManyDossiers(this.dossierCollectionName, dossiers);
   }

   /**
	FC8 : Cette fonction permet de rechercher un client dans une collection
	connaissant son id.
   */
   public void getDossierById(String nomCollection, Integer DossierId){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getDossierById *****************");   

		MongoCollection<Document> colDossiers = database.getCollection(nomCollection);

		//BasicDBObject whereQuery = new BasicDBObject();
		Document whereQuery = new Document();

		whereQuery.put("_id", DossierId);
		//DBCursor cursor = colClients.find(whereQuery);
		FindIterable<Document> listDossier = colDossiers.find(whereQuery);

		// Getting the iterator 
		Iterator it = listDossier.iterator();
		while(it.hasNext()) {
				System.out.println(it.next());
		}		
   } 
   
   
    /**
	FC9 : Cette fonction permet de rechercher des dossiers dans une collection.
	Le parametre whereQuery : permet de passer des conditions de rechercher
	Le parametre projectionFields : permet d'indiquer les champs a afficher
	Le parametre sortFields : permet d'indiquer les champs de tri.
   */   
   public void getDossiers(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getDossiers *****************");   

		MongoCollection<Document> colDossiers = null;
		System.out.println("Dans getDossiers 2.1 *****************"+colDossiers);   
		System.out.println("Dans getDossiers 2.2 : database:"+database);

		colDossiers = database.getCollection(nomCollection);
		System.out.println("Dans getDossiers 2.1 *****************"+colDossiers);   

		FindIterable<Document> listDossier = colDossiers.find(whereQuery).sort(sortFields).projection(projectionFields);
		//System.out.println("colClients.count():"+colClients.count());
		// Getting the iterator 
		Iterator it = listDossier.iterator();
		System.out.println("Dans getDossiers 2.1 *****************");   

		while(it.hasNext()) {
				System.out.println("Dans getDossiers 2.3 *****************");   

				System.out.println(it.next());
		}		
   } 


    /**
	FC10 : Cette fonction permet de modifier des clients dans une collection.
	Le parametre whereQuery : permet de passer des conditions de recherche
	Le parametre updateExpressions : permet d'indiquer les champs a modifier
	Le parametre UpdateOptions : permet d'indiquer les options de mise a jour :
		.upSert : insere si le document n'existe pas
   */
   public void updateDossiers(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans updateDossiers *****************");   

		MongoCollection<Document> colDossiers = null;

		colDossiers = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colDossiers.updateMany(whereQuery, updateExpressions, updateOptions);

            // Vérifie combien de documents ont été modifiés
            System.out.println(result.getModifiedCount() + " document(s) modifié(s)");
        } catch (Exception e) {
            // Gestion d'erreurs
            System.err.println("Erreur lors de la mise à jour des documents : " + e.getMessage());
        } 

   }


   /**
	FC11 : Cette fonction permet de supprimer des clients dans une collection.
	Le parametre filters : permet de passer des conditions de recherche des employes a supprimer
   */	    
   public void deleteDossiers(String nomCollection, Document filters){
		
		System.out.println("\n\n\n*********** dans deleteClients *****************");   
		FindIterable<Document> listDossier;
		Iterator it;
		MongoCollection<Document> colDossiers = database.getCollection(nomCollection);
		
		listDossier = colDossiers.find(filters).sort(new Document("_id", 1));
		it = listDossier.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deletenotaires: avant suppression");

		colDossiers.deleteMany(filters);
		listDossier = colDossiers.find(filters).sort(new Document("_id", 1));
		it = listDossier.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deletenotaires: Apres suppression");
   } 	
   
   /**
	FC12 : Parcours un iterateur et affiche les documents qui s'y trouvent
   */
   public void displayIterator(Iterator it, String message){
	System.out.println(" \n #### "+ message + " ################################");
	while(it.hasNext()) {
		System.out.println(it.next());
	}		
   }
   

   
   /**FC13 : 
   .6.4 Afficher les informations sur 1 dossier ainsi que les informations du client et du notaire
	Trouver les bons parametres.
   */
   public void joinLocalAndforeignCollections(
	String localCollectionName, 
	String foreignCollectionName, 
	String localColJoinFieldName,
	String foreigColJoinFieldName,
	Document whereQuery
	){

		System.out.println("\n\n\n*********** dans joinTwoCollections *****************");   
		// Récupérer la collection locale (dossiers)
		MongoCollection<Document> localCollection = database.getCollection(localCollectionName);

		// Construire l'opération d'agrégation pour la jointure
		List<Bson> aggregationPipeline = Arrays.asList(
			// Étape 1: Filtrer la collection locale par le critère `whereQuery`
			Aggregates.match(whereQuery),

			// Étape 2: Jointure avec la collection étrangère (clients ou notaires)
			Aggregates.lookup(
				foreignCollectionName,
				localColJoinFieldName,
				foreigColJoinFieldName,
				"joinedData"
			)
		);

		// Exécuter l'agrégation
		AggregateIterable<Document> results = localCollection.aggregate(aggregationPipeline);

		// Affichage des résultats
		for (Document result : results) {
			System.out.println(result.toJson());
		}
	}

	public void NbreDossierParNotaire(String nomCollection) {
		System.out.println("\n\n\n*********** Nombre de dossiers par Notaire *****************");
		MongoCollection<Document> colDossiers = database.getCollection(nomCollection);

		// Création de la requête d'agrégation pour compter les dossiers par notaire
		AggregateIterable<Document> result = colDossiers.aggregate(Arrays.asList(
			new Document("$group", new Document("_id", "$notaireid")  // Regrouper par le champ "notaireid"
								  .append("nombre_dossiers", new Document("$sum", 1)))  // Compter le nombre de dossiers
		));

		// Affichage du résultat
		for (Document doc : result) {
			Object notaireId = doc.get("_id");  // Récupérer l'ID du notaire (peut être Integer ou String)

			// Afficher le nombre de dossiers
			System.out.println("Notaire ID : " + notaireId + " " + "Nombre de dossiers: " + doc.getInteger("nombre_dossiers"));
		}
	}
	
	public void afficherNombreDossiersPayesParNotaire(String nomCollectionPaiement, String nomCollectionDossier) {
		System.out.println("\n\n\n*********** Nombre de dossiers payés par Notaire *****************");
		MongoCollection<Document> colPaiements = database.getCollection(nomCollectionPaiement);
		MongoCollection<Document> colDossiers = database.getCollection(nomCollectionDossier);

		// Pipeline d'agrégation
		AggregateIterable<Document> result = colPaiements.aggregate(Arrays.asList(
			// Étape 1: Jointure entre "paiement" et "dossier" via "dossierid"
			new Document("$lookup", new Document("from", nomCollectionDossier)
											.append("localField", "dossierid")
											.append("foreignField", "_id")
											.append("as", "dossier_info")),
			
			// Étape 2: Déconstruire le tableau résultant de la jointure
			new Document("$unwind", "$dossier_info"),
			
			// Étape 3: Grouper par notaireid (qui est dans la collection dossier)
			new Document("$group", new Document("_id", "$dossier_info.notaireid")
				.append("nombreDossiersPayes", new Document("$sum", 1)))
		));

		// Affichage des résultats
		for (Document doc : result) {
			Object notaireId = doc.get("_id");  // ID du notaire
			int nombreDossiersPayes = doc.getInteger("nombreDossiersPayes");
			System.out.println("Notaire ID: " + notaireId + " - Nombre de dossiers payés: " + nombreDossiersPayes);
		}
	}

	
}

