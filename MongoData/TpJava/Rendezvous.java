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
import org.bson.types.Decimal128;
import java.math.BigDecimal;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.client.model.UpdateOptions;

public class Rendezvous { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String rendezvousCollectionName="rendezvous";
   private String dossierCollectionName="dossier";
   
   private String documentsFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		Rendezvous rendezvous = new Rendezvous();
		// TC1b : inserer un puis plusieurs rendezvous depuis des variables Java
		System.out.println("\n\n Inserer un puis plusieurs rendezvous ...");

		// rendezvous.testInsertOneRendezvous();
		//rendezvous.testInsertManyRendezvous();

		// TC2a: Afficher un rendezvous connaissant son numero
		System.out.println("\n\n Afficher un rendezvous connaissant son numero ...");
		rendezvous.getRendezvousById(rendezvous.rendezvousCollectionName, 10);

		
		// 
		// TC2b: Afficher tous les rendezvous sans tri ni projection
		System.out.println("\n\n Afficher tous les rendezvous sans tri ni projection ...");

		rendezvous.getRendezvous(
			rendezvous.rendezvousCollectionName, 
			new Document(), 
			new Document(),
			new Document()
		);
		
		
		// TC3 : Afficher tous les rendezvous trie en ordre decroissant sur le nr dossier
		System.out.println("\n\n Afficher tous les rendezvous trie en ordre decroissant ...");

		rendezvous.getRendezvous(rendezvous.rendezvousCollectionName, 
			new Document(),
			new Document(),
			new Document("dossierid", -1)
		);	
		
		// TC4 : Modifier  la date et l'heure d'un rendezvous connaissant son nr		
		System.out.println("\n\n Modifier  la date et l'heure d'un rendezvous connaissant son nr ...");
		
	
		// rendezvous.updateRendezvous(rendezvous.rendezvousCollectionName, 
			// new Document("_id", 28), 
			// new Document ("$set", new Document("date_rdv", "2023-11-09").append("heure", "13:35")),
			// new UpdateOptions()
		// );
		
		
		//rendezvous.deleteRendezvous(rendezvous.rendezvousCollectionName, new Document());		
		//rendezvous.deleteRendezvous(rendezvous.rendezvousCollectionName, new Document("_id", 1002));		
	
		rendezvous.joinLocalAndforeignCollections(
			rendezvous.rendezvousCollectionName, 
			rendezvous.dossierCollectionName, 
			"dossierid",
			"_id",
			new Document("_id", 70)
		);		
	}catch(Exception e){
		e.printStackTrace();
	}	
   } 
 

   /**
	FC1 : Constructeur Rendezvous.
   */
   Rendezvous(){
		// Creating a Mongo client
		
		MongoClient mongoClient = new MongoClient( hostName , port ); 

		// Creating Credentials 
		// RH : Ressources Humaines
		MongoCredential credential; 
		credential = MongoCredential.createCredential(userName, dbName, 
		 passWord.toCharArray()); 
		System.out.println("Connected to the database successfully"); 	  
		System.out.println("Credentials ::"+ credential);  
		// Accessing the database 
		database = mongoClient.getDatabase(dbName); 
   }

   /**
	FC4 : Cette fonction permet d'inserer un rendezvous dans une collection.
   */
   
   public void insertOneRendezvous(String nomCollection, Document rendezvous){
		//Drop a collection 
		MongoCollection<Document> colRendezvous = database.getCollection(nomCollection);
		colRendezvous.insertOne(rendezvous); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOneRendezvous.
   */

   public void testInsertOneRendezvous(){
		Document  rendezvous = new Document("_id", 1001)
		.append ("date_rdv", "2023-09-09")
		.append("heure", "13:00")
		.append("lieu", "Tribunal")
		.append("description", "Affaire légale liée à la propriété")
		.append("dossierid", 1001);
		this.insertOneRendezvous(this.rendezvousCollectionName, rendezvous);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs rendezvous dans une collection
   */

   public void insertManyRendezvous(String nomCollection, List<Document> rendezvous){
		//Drop a collection 
		MongoCollection<Document> colRendezvous=database.getCollection(nomCollection);
		colRendezvous.insertMany(rendezvous); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManyRendezvous
   */

   public void testInsertManyRendezvous(){
		List<Document> rendezvous = Arrays.asList(
		new Document("_id", 1002)
		.append ("date_rdv", "2023-09-09")
		.append("heure", "13:00")
		.append("lieu", "Tribunal")
		.append("description", "Affaire légale liée à la propriété")
		.append("dossierid", 1002),

	   new Document("_id", 1003)
		.append ("date_rdv", "2023-09-09")
		.append("heure", "13:00")
		.append("lieu", "Tribunal")
		.append("description", "Affaire légale liée à la propriété")
		.append("dossierid", 1003),

	   new Document("_id", 1004)
		.append ("date_rdv", "2023-09-09")
		.append("heure", "13:00")
		.append("lieu", "Tribunal")
		.append("description", "Affaire légale liée à la propriété")
		.append("dossierid", 1004),

	   new Document("_id", 1005)
		.append ("date_rdv", "2023-09-09")
		.append("heure", "13:00")
		.append("lieu", "Tribunal")
		.append("description", "Affaire légale liée à la propriété")
		.append("dossierid", 1005)
	   );
		this.insertManyRendezvous(this.rendezvousCollectionName, rendezvous);
   }

   /**
	FC8 : Cette fonction permet de rechercher un client dans une collection
	connaissant son id.
   */
   public void getRendezvousById(String nomCollection, Integer RendezvousId){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getRendezvousById *****************");   

		MongoCollection<Document> colRendezvous = database.getCollection(nomCollection);

		//BasicDBObject whereQuery = new BasicDBObject();
		Document whereQuery = new Document();

		whereQuery.put("_id", RendezvousId);
		//DBCursor cursor = colClients.find(whereQuery);
		FindIterable<Document> listRendezvous = colRendezvous.find(whereQuery);

		// Getting the iterator 
		Iterator it = listRendezvous.iterator();
		while(it.hasNext()) {
				System.out.println(it.next());
		}		
   } 
   
   
    /**
	FC9 : Cette fonction permet de rechercher des clients dans une collection.
	Le parametre whereQuery : permet de passer des conditions de rechercher
	Le parametre projectionFields : permet d'indiquer les champs a afficher
	Le parametre sortFields : permet d'indiquer les champs de tri.
   */   
   public void getRendezvous(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getRendezvous *****************");   

		MongoCollection<Document> colRendezvous = null;

		colRendezvous = database.getCollection(nomCollection);   

		FindIterable<Document> listRendezvous = colRendezvous.find(whereQuery).sort(sortFields).projection(projectionFields);
		// Getting the iterator 
		Iterator it = listRendezvous.iterator();
		System.out.println("Dans getRendezvous 2.1 *****************");   

		while(it.hasNext()) {
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
   public void updateRendezvous(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans updateRendezvous *****************");   

		MongoCollection<Document> colRendezvous = null;

		colRendezvous = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colRendezvous.updateMany(whereQuery, updateExpressions, updateOptions);

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
   public void deleteRendezvous(String nomCollection, Document filters){
		
		System.out.println("\n\n\n*********** dans deleteRendezvous *****************");   
		
		FindIterable<Document> listRendezvous;
		Iterator it;
		MongoCollection<Document> colRendezvous = database.getCollection(nomCollection);
		
		listRendezvous = colRendezvous.find(filters).sort(new Document("_id", 1));
		it = listRendezvous.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteDocuments: avant suppression");

		colRendezvous.deleteMany(filters);
		listRendezvous = colRendezvous.find(filters).sort(new Document("_id", 1));
		it = listRendezvous.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteDocuments: Apres suppression");
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
   .6.4 Afficher les informations sur 1 rendezvous ainsi que son dossier
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
	
}

