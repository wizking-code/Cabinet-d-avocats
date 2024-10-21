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
import java.util.ArrayList;
import org.bson.conversions.Bson;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.client.model.UpdateOptions;

public class Notaire { 
   private MongoDatabase database;
   private String dbName="cabinet";
   private String hostName="localhost";
   private int port=27017;
   private String userName="ucabinet";
   private String passWord="UcabinetPass";
   private String notaireCollectionName="notaire";
   private String dossierCollectionName="dossier";
   
   private String notairesFilePath="C:\\Users\\inorgaisse\\Desktop\\MongoData\\";

   
   public static void main( String args[] ) {  
    try{
		Notaire notaire = new Notaire();

		// TC1b : inserer un puis plusieurs notaires depuis des variables Java
		System.out.println("\n\n Insertion de plusieurs notaires ...");

		//notaire.testinsertOneNotaire();
		//notaire.testInsertManynotaires();

		// TC2a: Afficher un notaire connaissant son numero
		System.out.println("\n\n  Affichage du Notaire numero 10 ...");
		notaire.getnotaireById(notaire.notaireCollectionName, 10);

		
		// 
		// TC2b: Afficher tous les notaires sans tri ni projection
		System.out.println("\n\n Affichage de tous les notaires sans tri ni projection ...");

		notaire.getnotaires(
			notaire.notaireCollectionName, 
			new Document(), 
			new Document(),
			new Document());
		
		
		// TC3 : Afficher tous les notaires trie en ordre decroissant sur le nom
		System.out.println("\n\n  Afficher tous les notaires trie en ordre decroissant sur le nom ...");

		notaire.getnotaires(notaire.notaireCollectionName, 
			new Document(),
			new Document(),
			new Document("nom", -1)
		);	
		
		// TC4 : Modifier  le nom et le prenom d'un notaire connaissant son nr		
			System.out.println("\n\n Modifier  le nom et le prenom du notaire nr 1003 ...");
		
	
		// notaire.updatenotaires(notaire.notaireCollectionName, 
			// new Document("_id", 1003), 
			// new Document ("$set", new Document("nom", "Stérile").append("prenom","Jeffking")),
			// new UpdateOptions()
		// );
		
		
		//notaire.deletenotaires(notaire.notaireCollectionName, new Document());		
		//notaire.deletenotaires(notaire.notaireCollectionName, new Document("_id", 1009));		
	
		notaire.joinLocalAndforeignCollections(
			notaire.notaireCollectionName, 
			notaire.dossierCollectionName, 
			"_id",
			"notaireid",
			new Document("_id", 10)
		);
		
		notaire.afficherNombreNotairesParVille(notaire.notaireCollectionName);

		
	}catch(Exception e){
		e.printStackTrace();
	}	
   } 
 

   /**
	FC1 : Constructeur notaire.
	Dans ce constructeur sont effectuees les activites suivantes:
	- Creation d'une instance du notaire MongoClient
	- Creation d'une BD Mongo appele Cabinet
	- Creation d'un utilisateur appele 
	- Chargement du pointeur vers la base Cabinet
   */
   Notaire(){
		// Creating a Mongo notaire
		
		MongoClient mongonotaire = new MongoClient( hostName , port ); 

		// Creating Credentials
		MongoCredential credential; 
		credential = MongoCredential.createCredential(userName, dbName, 
		 passWord.toCharArray()); 
		System.out.println("Connected to the database successfully"); 	  
		System.out.println("Credentials ::"+ credential);  
		// Accessing the database 
		database = mongonotaire.getDatabase(dbName); 
   }

   /**
	FC4 : Cette fonction permet d'inserer un notaire dans une collection.
   */
   
   public void insertOneNotaire(String nomCollection, Document notaire){
		//Drop a collection 
		MongoCollection<Document> colnotaires=database.getCollection(nomCollection);
		colnotaires.insertOne(notaire); 
		System.out.println("Document inserted successfully");     
   }


   /**
	FC5 : Cette fonction permet de tester la methode insertOneNotaire.
   */

   public void testinsertOneNotaire(){
		
		Document notaire = new Document("_id", 1001)
		.append ("nom", "Bond")
		.append("prenom", Arrays.asList("James").toString())
		.append("telephone", "673212293")
		.append("email","bondjames@gmail.com")
		.append("adresse", new Document( "numero", 20)
			.append("rue", "queens avenue")
			.append("codepostal",  "EC4R 2SU")
			.append("ville",  "Londres")
		)
		.append("specialite", "Fiscalité");
		this.insertOneNotaire(this.notaireCollectionName, notaire);
		System.out.println("Document inserted successfully");     
   }

   /**
	FC6 : Cette fonction permet d'inserer plusieurs notaires dans une collection
   */

   public void insertManynotaires(String nomCollection, List<Document> notaires){
		//Drop a collection 
		MongoCollection<Document> colnotaires=database.getCollection(nomCollection);
		colnotaires.insertMany(notaires); 
		System.out.println("Many Documents inserted successfully");     
   }

   /**
	FC7 : Cette fonction permet de tester la fonction insertManynotaires
   */

   public void testInsertManynotaires(){
		List<Document> notaires = Arrays.asList(
		new Document("_id", 1002)
		   .append("nom",  "Calixte")
		   .append("prenom", Arrays.asList("Joseph", "Junior").toString())
		   .append("telephone", "673212284")
		   .append("email", "cjosephjunior@gmail.com")
		   .append("adresse",  new Document("numero",  11)
					  .append("rue", "Allee Cavendish")
					  .append("codepostal",  "06000")
					  .append("ville",  "Nice")
				  )
		   .append("specialite", "Successions"),

	   new Document("_id",  1003)
	   .append("nom",  "Bernard")
	   .append("prenom",  Arrays.asList("Jackson").toString())
	   .append("telephone", "673212285")
	   .append("email", "bjackson")
	   .append("adresse", 
				new Document("numero",  12)
				  .append("rue", "Allee de la Chapelle Saint-Pierre")
				  .append("codepostal",  "06000")
				  .append("ville",  "Nice")
			  )
	   .append("specialite", "Droit des affaires"),

	   new Document("_id",  1004)
	   .append("nom",  "Dubois")
	   .append("prenom", Arrays.asList("Marie", "Chantalle").toString())
	   .append("telephone", "673212286")
	   .append("email", "chantallem@gmail.com")
	   .append("adresse", new Document("numero",  13)
				  .append("rue", "Rue la Fontaine aux Oiseaux")
				  .append("codepostal",  "06000")
				  .append("ville",  "Nice")
			  )
	   .append("specialite", "Droit des affaires"),

	   new Document("_id",  1005)
	   .append("nom",  "Thomas")
	   .append("prenom", Arrays.asList("Frandy").toString())
	   .append("telephone", "673212287")
	   .append("email", "thomaj@example.com")
	   .append("adresse", new Document("numero",  14)
				  .append("rue", "Rue La Palmeraie")
				  .append("codepostal",  "France")
				  .append("ville",  "Nice")
			   )
	   .append("specialite", "Fiscalité"),

	   new Document("_id",  1006)
	   .append("nom",  "Walter")
	   .append("prenom", Arrays.asList("Samuel").toString())
	   .append("telephone", "673212288")
	   .append("email", "wsamuel@example.com")
	   .append("adresse",  new Document("numero",  15)
				  .append("rue", "Rue de la Resistance")
				  .append("codepostal",  "10001")
				  .append("ville",  "New-york")
			   )
	   .append("specialite", "Fiscalité"),

	   new Document("_id",  1007)
	   .append("nom",  "Richard")
	   .append("prenom", Arrays.asList("Emmanuella", "Labonté").toString())
	   .append("telephone", "673212289")
	   .append("email", "remmanuella@example.com")
	   .append("adresse", new Document("numero",  16)
				  .append("rue", "Allee des Citronniers")
				  .append("codepostal",  "75001")
				  .append("ville",  "Paris")
			  )
	   .append("specialite", "Fiscalité"),

	   new Document("_id",  1008)
	   .append("nom",  "Labonté")
	   .append("prenom", Arrays.asList("Sénatus", "Junior").toString())
	   .append("telephone", "673212290")
	   .append("email", "jsenatus@gmail.com")
	   .append("adresse",  new Document("numero",  17)
				  .append("rue", "Allee des Faunes")
				  .append("codepostal",  "69001")
				  .append("ville",  "Lyon")
			   )
	   .append("specialite", "Successions"),

	   new Document("_id",  1009)
	   .append("nom",  "Aristide")
	   .append("prenom", Arrays.asList("Francklin", "Achille").toString())
	   .append("telephone", "673212291")
	   .append("email", "faristide@gmail.com")
	   .append("adresse",  new Document("numero",  18)
				  .append("rue", "Rue des Isnards")
				  .append("codepostal",  "75001")
				  .append("ville",  "Paris")
			   )
	   .append("specialite", "Immobilier"),

	   new Document("_id",  1010)
	   .append("nom",  "Marc")
	   .append("prenom", Arrays.asList("Jude", "André").toString())
	   .append("telephone", "673212292")
	   .append("email", "marcandre@example.com")
	   .append("adresse",  new Document("numero",  19)
				  .append("rue", "Rue des Lucioles")
				  .append("codepostal",  "13001")
				  .append("ville",  "Marseille")
			   )
	   .append("specialite", "Immobilier"));
	   
		this.insertManynotaires(this.notaireCollectionName, notaires);
   }

   /**
	FC8 : Cette fonction permet de rechercher un notaire dans une collection
	connaissant son id.
   */
   public void getnotaireById(String nomCollection, Integer notaireId){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getnotaireById *****************");   

		MongoCollection<Document> colnotaires=database.getCollection(nomCollection);

		//BasicDBObject whereQuery = new BasicDBObject();
		Document whereQuery = new Document();

		whereQuery.put("_id", notaireId );
		//DBCursor cursor = colnotaires.find(whereQuery);
		FindIterable<Document> listnotaire=colnotaires.find(whereQuery);

		// Getting the iterator 
		Iterator it = listnotaire.iterator();
		while(it.hasNext()) {
				System.out.println(it.next());
		}		
   }   
   
    /**
	FC9 : Cette fonction permet de rechercher des notaires dans une collection.
   */   
   public void getnotaires(String nomCollection, 
	Document whereQuery, 
	Document projectionFields,
	Document sortFields){
		//Drop a collection 
		System.out.println("\n\n\n*********** dans getnotaires *****************");   

		MongoCollection<Document> colnotaires=null;

		colnotaires=database.getCollection(nomCollection);

		FindIterable<Document> listnotaire=colnotaires.find(whereQuery).sort(sortFields).projection(projectionFields);   
		
		// Getting the iterator 
		Iterator it = listnotaire.iterator();
		while(it.hasNext()) {
				System.out.println("Dans getnotaires 2.3 *****************");   

				System.out.println(it.next());
		}		
   } 


    /**
	FC10 : Cette fonction permet de modifier des notaires dans une collection.
   */
   public void updatenotaires(String nomCollection, 
	Document whereQuery, 
	Document updateExpressions,
	UpdateOptions updateOptions
	){
		MongoCollection<Document> colNotaires = null;

		colNotaires = database.getCollection(nomCollection);
		
		try {
            // Mise à jour d'un document correspondant à la whereQuery
            UpdateResult result = colNotaires.updateMany(whereQuery, updateExpressions, updateOptions);

            // Vérifie combien de documents ont été modifiés
            System.out.println(result.getModifiedCount() + " document(s) modifié(s)");
        } catch (Exception e) {
            // Gestion d'erreurs
            System.err.println("Erreur lors de la mise à jour des documents : " + e.getMessage());
        } 

   }


   /**
	FC11 : Cette fonction permet de supprimer des notaires dans une collection.
	Le parametre filters : permet de passer des conditions de recherche des employes a supprimer
   */	    
   public void deletenotaires(String nomCollection, Document filters){
		FindIterable<Document> listNotaires;
		Iterator it;
		MongoCollection<Document> colNotaires = database.getCollection(nomCollection);
		
		listNotaires = colNotaires.find(filters).sort(new Document("_id", 1));
		it = listNotaires.iterator();// Getting the iterator
		this.displayIterator(it, "Dans deletenotaires: avant suppression");

		colNotaires.deleteMany(filters);
		listNotaires = colNotaires.find(filters).sort(new Document("_id", 1));
		it = listNotaires.iterator();// Getting the iterator
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
   .6.4 Afficher les informations sur 1 notaire et son dossier
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
	
	public void afficherNombreNotairesParVille(String nomCollection) {
		System.out.println("\n\n\n*********** Nombre de notaire par ville *****************");
		MongoCollection<Document> colNotaires = database.getCollection(nomCollection);

		// Pipeline d'agrégation
		AggregateIterable<Document> result = colNotaires.aggregate(Arrays.asList(
			// Grouper par le champ "adresse.ville" et compter les notaires
			new Document("$group", new Document("_id", "$adresse.ville")
				.append("nombreNotaires", new Document("$sum", 1)))
		));

		// Affichage des résultats
		for (Document doc : result) {
			String ville = doc.getString("_id");  // Ville
			int nbreNotaires = doc.getInteger("nombreNotaires");
			System.out.println("Ville: " + ville + " - Nombre de notaire: " + nbreNotaires);
		}
	}
}

