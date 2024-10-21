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

public class Paiement { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String paiementCollectionName="paiement";
   private String dossierCollectionName="dossier";
   
   private String documentsFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		Paiement paiement = new Paiement();
		// TC1b : Inserer un puis plusieurs paiements depuis des variables Java
		System.out.println("\n\n Inserer un puis plusieurs paiements depuis des variables Java ...");

		// paiement.testinsertOnePaiement();
		// paiement.testinsertManyPaiements();

		// TC2a: Afficher un paiement connaissant son numero
		System.out.println("\n\n Afficher un paiement connaissant son numero ...");
		paiement.getPaiementById(paiement.paiementCollectionName, 10);

		
		// 
		// TC2b: Afficher tous les paiements sans tri ni projection
		System.out.println("\n\n TC2b ...");

		paiement.getPaiements(
			paiement.paiementCollectionName, 
			new Document(), 
			new Document(),
			new Document()
		);
		
		
		// TC3 : Afficher tous les paiements trie en ordre decroissant sur le nom
		System.out.println("\n\n TC3 ...");

		paiement.getPaiements(paiement.paiementCollectionName, 
			new Document(),
			new Document(),
			new Document("datepaiement", -1)
		);	
		
		// TC4 : Modifier  la methode d'un paiement connaissant son nr		
		System.out.println("\n\n Modifier  la methode d'un paiement connaissant son nr ...");
		
	
		// paiement.updatePaiements(paiement.paiementCollectionName, 
			// new Document("_id", 8), 
			// new Document ("$set", new Document("methode", "Virement")),
			// new UpdateOptions()
		// );
		
		
		//paiement.deletePaiements(paiement.paiementCollectionName, new Document());		
		//paiement.deletePaiements(paiement.paiementCollectionName, new Document("_id", 1001));		
	
		paiement.joinLocalAndforeignCollections(
			paiement.paiementCollectionName, 
			paiement.dossierCollectionName, 
			"dossierid",
			"_id",
			new Document("_id", 9)
		);		
	}catch(Exception e){
		e.printStackTrace();
	}	
   } 
 

   /**
	FC1 : Constructeur Paiement.
	Dans ce constructeur sont effectuees les activites suivantes:
	- Creation d'une instance du client MongoClient
	- Creation d'un utilisateur appele
   */
   Paiement(){
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
	FC4 : Cette fonction permet d'inserer un paiement dans une collection.
   */
   
   public void insertOnePaiement(String nomCollection, Document paiement){
		//Drop a collection 
		MongoCollection<Document> colPaiements = database.getCollection(nomCollection);
		colPaiements.insertOne(paiement); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOnePaiement.
   */

   public void testinsertOnePaiement(){
	   Document  paiement = new Document("_id", 1001)
		.append ("montant", 1200.50)
		.append("methode", "Carte de crédit")
		.append("desc_paiement", "Paiement pour achat immobilier")
		.append("datepaiement", "2023-09-01")
		.append("dossierid",1001);
		this.insertOnePaiement(this.paiementCollectionName, paiement);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs paiements dans une collection
   */

   public void insertManyPaiements(String nomCollection, List<Document> paiements){
		//Drop a collection 
		MongoCollection<Document> colPaiements = database.getCollection(nomCollection);
		colPaiements.insertMany(paiements); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManyPaiements
   */

   public void testinsertManyPaiements(){
		List<Document> paiements = Arrays.asList(
		new Document("_id", 1002)
		.append ("montant", 1300.50)
		.append("methode", "Carte de crédit")
		.append("desc_paiement", "Paiement pour achat immobilier")
		.append("datepaiement", "2023-09-01")
		.append("dossierid",1002),

	   new Document("_id", 1003)
		.append ("montant", 950.15)
		.append("methode", "Carte de crédit")
		.append("desc_paiement", "Paiement pour achat immobilier")
		.append("datepaiement", "2023-09-01")
		.append("dossierid",1003),

	   new Document("_id", 1004)
		.append ("montant", 1100.25)
		.append("methode", "Carte de crédit")
		.append("desc_paiement", "Paiement pour achat immobilier")
		.append("datepaiement", "2023-09-01")
		.append("dossierid",1004),

	   new Document("_id", 1005)
		.append ("montant", 800.05)
		.append("methode", "Carte de crédit")
		.append("desc_paiement", "Paiement pour achat immobilier")
		.append("datepaiement", "2023-09-01")
		.append("dossierid",1005)
	   );
		this.insertManyPaiements(this.paiementCollectionName, paiements);
   }

   /**
	FC8 : Cette fonction permet de rechercher un paiement dans une collection
	connaissant son id.
   */
   public void getPaiementById(String nomCollection, Integer PaiementId){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getPaiementById *****************");   

		MongoCollection<Document> colPaiements = database.getCollection(nomCollection);

		//BasicDBObject whereQuery = new BasicDBObject();
		Document whereQuery = new Document();

		whereQuery.put("_id", PaiementId);
		//DBCursor cursor = colClients.find(whereQuery);
		FindIterable<Document> listPaiement = colPaiements.find(whereQuery);

		// Getting the iterator 
		Iterator it = listPaiement.iterator();
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
   public void getPaiements(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getPaiements *****************");   

		MongoCollection<Document> colPaiements = null;
		System.out.println("Dans getPaiements 2.1 *****************"+colPaiements);   
		System.out.println("Dans getPaiements 2.2 : database:"+database);

		colPaiements = database.getCollection(nomCollection);
		System.out.println("Dans getPaiements 2.1 *****************"+colPaiements);   

		FindIterable<Document> listPaiement = colPaiements.find(whereQuery).sort(sortFields).projection(projectionFields);
		// Getting the iterator 
		Iterator it = listPaiement.iterator();
		System.out.println("Dans getPaiements 2.1 *****************");   

		while(it.hasNext()) {
				System.out.println("Dans getPaiements 2.3 *****************");   

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
   public void updatePaiements(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans updatePaiements *****************");   

		MongoCollection<Document> colPaiements = null;

		colPaiements = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colPaiements.updateMany(whereQuery, updateExpressions, updateOptions);

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
   public void deletePaiements(String nomCollection, Document filters){
		
		System.out.println("\n\n\n*********** dans deletePaiements *****************");   
		
		FindIterable<Document> listPaiement;
		Iterator it;
		MongoCollection<Document> colPaiements = database.getCollection(nomCollection);
		
		listPaiement = colPaiements.find(filters).sort(new Document("_id", 1));
		it = listPaiement.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteDocuments: avant suppression");

		colPaiements.deleteMany(filters);
		listPaiement = colPaiements.find(filters).sort(new Document("_id", 1));
		it = listPaiement.iterator();// Getting the iterator
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

