package TpJava;

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
import org.bson.conversions.Bson;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.client.model.UpdateOptions;

public class Client { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String clientCollectionName="client";
   private String dossierCollectionName="dossier";
   
   private String clientsFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		Client client = new Client();
		// TC1b : inserer un puis plusieurs clients depuis des variables Java
		System.out.println("\n\n Insertion de plusieurs clients ...");

		//client.testInsertOneClient();
		//client.testInsertManyClients();

		// TC2a: Afficher un client connaissant son numero
		System.out.println("\n\n Affichage du client numero 10 ...");
		client.getClientById(client.clientCollectionName, 10);

		
		// 
		// TC2b: Afficher tous les clients sans tri ni projection
		System.out.println("\n\n Afficher tous les clients sans tri ni projection ...\n\n");

		client.getClients(
			client.clientCollectionName, 
			new Document(), 
			new Document(),
			new Document()
		);
		
		
		// TC3 : Afficher tous les clients trie en ordre decroissant sur le nom
		System.out.println("\n\n Afficher tous les clients trie en ordre decroissant sur le nom ...");

		client.getClients(client.clientCollectionName, 
			new Document(),
			new Document(),
			new Document("nom", -1)
		);	
		
		// TC4 : Modifier  le nom et le telephone du client nr 11
		
		System.out.println("\n\n Modifier  le nom et le telephone du client nr 1003 ...");
	
		// client.updateClients(client.clientCollectionName, 
			// new Document("_id", 1003), 
			// new Document ("$set", new Document("nom", "Jean-Maxo").append("prenom", "Cyprien")),
			// new UpdateOptions()
		// );
		
		
		//client.deleteClients(client.clientCollectionName, new Document());		
		//client.deleteClients(client.clientCollectionName, new Document("_id", 1001));		
	
		client.joinLocalAndforeignCollections(
			client.clientCollectionName, 
			client.dossierCollectionName, 
			"_id",
			"clientid",
			new Document("_id", 3)
		);
			
		client.afficherNombreClientsParVille(client.clientCollectionName);
		
	}catch(Exception e){
		e.printStackTrace();
	}	
} 
 

   /**
	FC1 : Constructeur Client.
   */
   Client(){
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
	FC4 : Cette fonction permet d'inserer un client dans une collection.
   */
   
   public void insertOneClient(String nomCollection, Document client){
		//Drop a collection 
		MongoCollection<Document> colClients=database.getCollection(nomCollection);
		colClients.insertOne(client); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOneClient.
   */

   public void testInsertOneClient(){
		
		Document  client = new Document("_id", 1001)
		.append ("nom", "Norgaisse")
		.append("prenom", "Ivionel")
		.append("telephone", "673212293")
		.append("email","norivio89@gmail.com")
		.append("adresse", new Document( "numero", 24)
			.append("rue", "milien")
			.append("codePostal",  "HT6124")
			.append("ville",  "Tabarre")
		);
		this.insertOneClient(this.clientCollectionName, client);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs clients dans une collection
   */

   public void insertManyClients(String nomCollection, List<Document> clients){
		//Drop a collection 
		MongoCollection<Document> colClients=database.getCollection(nomCollection);
		colClients.insertMany(clients); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManyClients
   */

   public void testInsertManyClients(){
		List<Document> clients = Arrays.asList(
		new Document("_id", 1002)
		   .append("nom",  "Martin")
		   .append("prenom", Arrays.asList("Aaron", "Frida").toString())
		   .append("telephone", "673212284")
		   .append("email", "mafrida@gmail.com")
		   .append("adresse",  new Document("numero",  11)
					  .append("rue", "Allee Cavendish")
					  .append("codePostal",  "06000")
					  .append("ville",  "Nice")
				  ),

	   new Document("_id",  1003)
	   .append("nom",  "Bernard")
	   .append("prenom",  Arrays.asList("Abel").toString())
	   .append("telephone", "673212285")
	   .append("email", "babel@gmail.com")
	   .append("adresse", 
				new Document("numero",  12)
				  .append("rue", "Allee de la Chapelle Saint-Pierre")
				  .append("codePostal",  "06000")
				  .append("ville",  "Nice")
			  ),

	   new Document("_id",  1004)
	   .append("nom",  "Dubois")
	   .append("prenom", Arrays.asList("Abella", "Mehdi").toString())
	   .append("telephone", "673212286")
	   .append("email", "dabella@gmail.com")
	   .append("adresse", new Document("numero",  13)
				  .append("rue", "Rue la Fontaine aux Oiseaux")
				  .append("codePostal",  "06000")
				  .append("ville",  "Nice")
			  ),

	   new Document("_id",  1005)
	   .append("nom",  "Thomas")
	   .append("prenom", Arrays.asList("Abelard").toString())
	   .append("telephone", "673212287")
	   .append("email", "tabelard@gmail.com")
	   .append("adresse", new Document("numero",  14)
				  .append("rue", "Rue La Palmeraie")
				  .append("codePostal",  "04782")
				  .append("ville",  "Nice")
			   ),

	   new Document("_id",  1006)
	   .append("nom",  "Walter")
	   .append("prenom", Arrays.asList("Robert").toString())
	   .append("telephone", "673212288")
	   .append("email", "wrobert@gmail.com")
	   .append("adresse",  new Document("numero",  15)
				  .append("rue", "Rue de la Resistance")
				  .append("codePostal",  "34536")
				  .append("ville",  "New-york")
			   ),

	   new Document("_id",  1007)
	   .append("nom",  "Richard")
	   .append("prenom", Arrays.asList("Maria", "Abondance").toString())
	   .append("telephone", "673212289")
	   .append("email", "mabondance")
	   .append("adresse", new Document("numero",  16)
				  .append("rue", "Allee des Citronniers")
				  .append("codePostal",  "75001")
				  .append("ville",  "Paris")
			  ),

	   new Document("_id",  1008)
	   .append("nom",  "Petit")
	   .append("prenom", Arrays.asList("Abraham", "Leonard").toString())
	   .append("telephone", "673212290")
	   .append("email", "paleonard@gmail.com")
	   .append("adresse",  new Document("numero",  17)
				  .append("rue", "Allee des Faunes")
				  .append("codePostal",  "69001")
				  .append("ville",  "Lyon")
			   ),

	   new Document("_id",  1009)
	   .append("nom",  "Durand")
	   .append("prenom", Arrays.asList("Mari", "Achille").toString())
	   .append("telephone", "673212291")
	   .append("email", "damari@gmail.com")
	   .append("adresse",  new Document("numero",  18)
				  .append("rue", "Rue des Isnards")
				  .append("codePostal",  "75001")
				  .append("ville",  "Paris")
			   ),

	   new Document("_id",  1010)
	   .append("nom",  "Leroy")
	   .append("prenom", Arrays.asList("Ada", "Mousse").toString())
	   .append("telephone", "673212292")
	   .append("email", "lamousse@gmail.com")
	   .append("adresse",  new Document("numero",  19)
				  .append("rue", "Rue des Lucioles")
				  .append("codePostal",  "13001")
				  .append("ville",  "Marseille")
			   )
	   );
		this.insertManyClients(this.clientCollectionName, clients);
   }

   /**
	FC8 : Cette fonction permet de rechercher un client dans une collection
	connaissant son id.
   */
   public void getClientById(String nomCollection, Integer ClientId){
		MongoCollection<Document> colClients = database.getCollection(nomCollection);

		//BasicDBObject whereQuery = new BasicDBObject();
		Document whereQuery = new Document();

		whereQuery.put("_id", ClientId );
		//DBCursor cursor = colClients.find(whereQuery);
		FindIterable<Document> listClient=colClients.find(whereQuery);

		// Getting the iterator 
		Iterator it = listClient.iterator();
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
   public void getClients(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		MongoCollection<Document> colClients=null;

		colClients=database.getCollection(nomCollection);   

		FindIterable<Document> listClient = colClients.find(whereQuery).sort(sortFields).projection(projectionFields);
		//System.out.println("colClients.count():"+colClients.count());
		// Getting the iterator 
		Iterator it = listClient.iterator();  

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
   public void updateClients(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		//Drop a collection 
		MongoCollection<Document> colClients = null;

		colClients = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colClients.updateMany(whereQuery, updateExpressions, updateOptions);

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
   public void deleteClients(String nomCollection, Document filters){
		
		System.out.println("\n\n\n*********** dans deleteClients *****************");   
		
		FindIterable<Document> listClients;
		Iterator it;
		MongoCollection<Document> colClients = database.getCollection(nomCollection);
		
		listClients = colClients.find(filters).sort(new Document("_id", 1));
		it = listClients.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteClients: avant suppression");

		colClients.deleteMany(filters);
		listClients = colClients.find(filters).sort(new Document("_id", 1));
		it = listClients.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deleteClients: Apres suppression");
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
   .6.4 Afficher les informations sur 1 client ainsi que ses dossiers
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

			// Étape 2: Jointure avec la collection étrangère (dossiers)
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
	
	public void afficherNombreClientsParVille(String nomCollection) {
		System.out.println("\n\n\n*********** Nombre de clients par ville *****************");
		MongoCollection<Document> colClients = database.getCollection(nomCollection);

		// Pipeline d'agrégation
		AggregateIterable<Document> result = colClients.aggregate(Arrays.asList(
			// Grouper par le champ "adresse.ville" et compter les clients
			new Document("$group", new Document("_id", "$adresse.ville")
				.append("nombreClients", new Document("$sum", 1)))
		));

		// Affichage des résultats
		for (Document doc : result) {
			String ville = doc.getString("_id");  // Ville
			int nombreClients = doc.getInteger("nombreClients");
			System.out.println("Ville: " + ville + " - Nombre de clients: " + nombreClients);
		}
	}

}