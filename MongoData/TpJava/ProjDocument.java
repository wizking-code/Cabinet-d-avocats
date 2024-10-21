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

public class ProjDocument { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String documentCollectionName="document";
   private String dossierCollectionName="dossier";
   
   private String documentsFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		ProjDocument projDocument = new ProjDocument();
		// TC1b : inserer un puis plusieurs documents depuis des variables Java
		System.out.println("\n\n Inserer un puis plusieurs documents ...");

		// projDocument.testInsertOneDocument();
		// projDocument.testinsertManyDocuments();

		// TC2a: Afficher un document connaissant son numero
		System.out.println("\n\n Afficher un document connaissant son numero ...");
		projDocument.getDocumentById(projDocument.documentCollectionName, 9);

		
		// 
		// TC2b: Afficher tous les documents sans tri ni projection
		System.out.println("\n\n Afficher tous les documents sans tri ni projection ...");

		projDocument.getDocuments(
			projDocument.documentCollectionName, 
			new Document(), 
			new Document(),
			new Document()
		);
		
		
		// TC3 : Afficher tous les documents trie en ordre decroissant sur le titre
		System.out.println("\n\n Afficher tous les documents trie en ordre decroissant sur le titre ...");

		projDocument.getDocuments(projDocument.documentCollectionName, 
			new Document(),
			new Document(),
			new Document("titre", -1)
		);	
		
		// TC4 : Modifier  le titre et la description d'un document connaissant son nr		
		System.out.println("\n\n Modifier  le titre et le type d'un document connaissant son nr ...");
		
	
		// projDocument.updateDocuments(projDocument.documentCollectionName, 
			// new Document("_id", 8), 
			// new Document ("$set", new Document("titre", "Rapport d'expert").append("type_doc", "Expertise")),
			// new UpdateOptions()
		// );
		
		
		//projDocument.deleteDocuments(projDocument.documentCollectionName, new Document());		
		//projDocument.deleteDocuments(projDocument.documentCollectionName, new Document("_id", 1003));		
	
		projDocument.joinLocalAndforeignCollections(
			projDocument.documentCollectionName, 
			projDocument.dossierCollectionName, 
			"dossierid",
			"_id",
			new Document("_id", 7)
		);		
	}catch(Exception e){
		e.printStackTrace();
	}	
   } 
 

   ProjDocument(){
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
	FC4 : Cette fonction permet d'inserer un document dans une collection.
   */
   
   public void insertOneDocument(String nomCollection, Document document){
		//Drop a collection 
		MongoCollection<Document> colDocuments = database.getCollection(nomCollection);
		colDocuments.insertOne(document); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOneDocument.
   */

   public void testInsertOneDocument(){
	   Document projDoc = new Document("_id", 1001)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1001);
		this.insertOneDocument(this.documentCollectionName, projDoc);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs documents dans une collection
   */

   public void insertManyDocuments(String nomCollection, List<Document> documents){
		//Drop a collection 
		MongoCollection<Document> colDocuments = database.getCollection(nomCollection);
		colDocuments.insertMany(documents); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManyDocuments
   */

   public void testinsertManyDocuments(){
	   List<Document> projDocs = Arrays.asList(
		new Document("_id", 1002)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1002),

	   new Document("_id", 1003)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1003),

	   new Document("_id", 1004)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1004),

	   new Document("_id", 1005)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1005),

	   new Document("_id", 1006)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1006),

	   new Document("_id", 1007)
		.append ("titre", "Contrat de location")
		.append("type_doc", "Contrat")
		.append("datecreation", "2023-10-23")
		.append("dossierid", 1007)
	   );
		this.insertManyDocuments(this.documentCollectionName, projDocs);
   }

   /**
	FC8 : Cette fonction permet de rechercher un document dans une collection
	connaissant son id.
   */
   public void getDocumentById(String nomCollection, Integer DocumentId){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getDocumentById *****************");   

		MongoCollection<Document> colDocuments = database.getCollection(nomCollection);

		Document whereQuery = new Document();

		whereQuery.put("_id", DocumentId);
		FindIterable<Document> listDocument = colDocuments.find(whereQuery);

		// Getting the iterator 
		Iterator it = listDocument.iterator();
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
   public void getDocuments(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getDocuments *****************");   

		MongoCollection<Document> colDocuments = null;
		System.out.println("Dans getDocuments 2.1 *****************"+colDocuments);   
		System.out.println("Dans getDocuments 2.2 : database:"+database);

		colDocuments = database.getCollection(nomCollection);
		System.out.println("Dans getDocuments 2.1 *****************"+colDocuments);   

		FindIterable<Document> listDocument=colDocuments.find(whereQuery).sort(sortFields).projection(projectionFields);
		// Getting the iterator 
		Iterator it = listDocument.iterator();
		System.out.println("Dans getDocuments 2.1 *****************");   

		while(it.hasNext()) {
				System.out.println("Dans getDocuments 2.3 *****************");   

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
   public void updateDocuments(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans updateDocuments *****************");   

		MongoCollection<Document> colDocuments = null;

		colDocuments = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colDocuments.updateMany(whereQuery, updateExpressions, updateOptions);

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
   public void deleteDocuments(String nomCollection, Document filters){
		
		System.out.println("\n\n\n*********** dans deleteDocuments *****************"); 
		FindIterable<Document> listDocument;
		Iterator it;
		MongoCollection<Document> colDocuments = database.getCollection(nomCollection);
		
		listDocument = colDocuments.find(filters).sort(new Document("_id", 1));
		it = listDocument.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteDocuments: avant suppression");

		colDocuments.deleteMany(filters);
		listDocument = colDocuments.find(filters).sort(new Document("_id", 1));
		it = listDocument.iterator();// Getting the iterator
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
   .6.4 Afficher les informations sur 1 client ainsi que ses appreciations
	sur les vols
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

