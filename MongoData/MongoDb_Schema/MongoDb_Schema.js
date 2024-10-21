/* Création de la collection Client */
db.createCollection("client", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "nom", "prenom", "adresse.numero", "adresse.ville", "adresse.rue", "telephone", "email"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				nom: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				prenom: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.numero": {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				"adresse.ville": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.codepostal": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.rue": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				telephone: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				email: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				}
			}
		}
	}
});

// Création de la collection Notaire
db.createCollection("notaire", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "nom", "prenom", "adresse.numero", "adresse.ville", "adresse.codepostal", "adresse.rue", "telephone", "email", "specialite"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				nom: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				prenom: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.numero": {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				"adresse.ville": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.codepostal": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				"adresse.rue": {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				telephone: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				email: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				specialite: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				}
			}
		}
	}
});

// Création de la collection Dossier
db.createCollection("dossier", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "nom", "description", "dateouverture", "datefermeture", "statut", "clientid", "notaireid"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				nom: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				description: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				dateouverture: {
					bsonType: "string",
					pattern: "^\\d{4}-\\d{2}-\\d{2}$",					
					description: "La date d'ouverture doit être au format YYYY-MM-DD"
				},
				datefermeture: {
					bsonType: "string", 
					pattern: "^\\d{4}-\\d{2}-\\d{2}$",
					description: "La date d'ouverture doit être au format YYYY-MM-DD"
				},
				statut: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				clientid: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				notaireid: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				}
			}
		}
	}
});

// Création de la collection Document
db.createCollection("document", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "titre", "type_doc", "datecreation", "dossierid"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				titre: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				type_doc: {
					bsonType: "string", 
					description: "Le champs doit être une chaine et doit être renseigné"
				},
				contenu: { bsonType: "string"},
				datecreation: {
					bsonType: "string",
					pattern: "^\\d{4}-\\d{2}-\\d{2}$",					
					description: "La date de création doit être au format YYYY-MM-DD"
				},
				dossierid: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				}
			}
		}
	}
});

// Création de la collection Paiement
db.createCollection("paiement", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "montant", "methode", "desc_paiement", "datepaiement", "dossierid"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				montant: {
					bsonType: "double",
					minimum: 0,          // Valeur minimale autorisée
					maximum: 10000,
					description: "Le champs est requis et doit être de type Decimal128"
				},
				methode: {
					bsonType: "string", 
					description: "Le champs est requis et doit être de type chaine de caractère"
				},
				desc_paiement: {
					bsonType: "string", 
					description: "Le champs est requis et doit être de type chaine de caractère"
				},
				datepaiement: {
					bsonType: "string",
					pattern: "^\\d{4}-\\d{2}-\\d{2}$",
					description: "Le champs est requis et doit être au format YYYY-MM-DD"
				},
				dossierid: {
					bsonType: "number", 
					description: "Le champs est requis et doit être un nombre"
				}
			}
		}
	}
});

// Création de la collection Rendezvous
db.createCollection("rendezvous", {
	validator:{
		$jsonSchema:{
			bsonType: "object",
			additionalProperties: true,
			required: ["_id", "date_rdv", "heure", "lieu", "description", "dossierid"],
			properties: {
				_id: {
					bsonType: "number", 
					description: "Le champs doit être un nombre et doit être renseigné"
				},
				date_rdv: {
					bsonType: "string",
					pattern: "^\\d{4}-\\d{2}-\\d{2}$",
					description: "Le champs est requis et doit être au format ISO : ISODate('1990-03-02T00:00:00Z')"
				},
				heure: {
					bsonType: "string", 
					pattern: "^([01][0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$",
					description: "L'heure est requise et doit être au format HH:MM ou HH:MM:SS."
				},
				lieu: {
					bsonType: "string", 
					description: "Le champs est requis et doit être de type chaine de caractère"
				},
				description: {
					bsonType: "string", 
					description: "Le champs est requis et doit être de type chaine de caractère"
				},
				dossierid: {
					bsonType: "number", 
					description: "Le champs est requis et doit être un nombre"
				}
			}
		}
	}
});

/*========================= Création des index ==========================*/
//Création d'index dans le container Client.
db.client.createIndex({ "email": 1 }, {background:false, unique:true, name:"idx_client_Email" });
db.client.createIndex({ "adresse.ville": 1, "adresse.rue": 1, "adresse.numero": 1 },  {background:false, unique:false, name:"idx_client_Adresse" });

//Création d'index dans le container Notaire.
db.notaire.createIndex({ "email": 1 }, {background:false, unique:true, name:"idx_notaire_Email" });
db.notaire.createIndex({ "adresse.ville": 1, "adresse.rue": 1, "adresse.numero": 1 },  {background:false, unique:false, name:"idx_notaire_Adresse" });

//Création d'index dans le container Dossier.
db.dossier.createIndex({ "nom": 1, "description": 1 }, {background:false, unique:false, name:"idx_dossier_Nom_Description" });
db.dossier.createIndex({ "clientid": 1 },  {background:false, unique:false, name:"idx_dossier_ClientId" });
db.dossier.createIndex({ "notaireid": 1 },  {background:false, unique:false, name:"idx_dossier_NotaireId" });

//Création d'index dans le container Document.
db.document.createIndex({ "titre": 1, "type_doc": 1 }, {background:false, unique:false, name:"idx_document_Titre_Type_Doc" });
db.document.createIndex({ "dossierid": 1 },  {background:false, unique:false, name:"idx_document_DossierId" });

//Création d'index dans le container Paiement.
db.paiement.createIndex({ "montant": 1 }, {background:false, unique:false, name:"idx_paiement_Montant" });
db.paiement.createIndex({ "methode": 1, "desc_paiement": 1 },  {background:false, unique:false, name:"idx_paiement_Methode_Desc_Paiement" });
db.paiement.createIndex({ "dossierid": 1 },  {background:false, unique:false, name:"idx_paiement_DossierId" });

//Création d'index dans le container Rendezvous.
db.rendezvous.createIndex({ "date_rdv": 1, "heure": 1, "lieu": 1 }, {background:false, unique:false, name:"idx_rendezvous_Date_rdv_heure_lieu" });
db.rendezvous.createIndex({ "dossierid": 1 },  {background:false, unique:false, name:"idx_rendezvous_DossierId" });

// Importation de données dans un fichier javascript
//load("chemin/nomfichier.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_clients.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_notaires.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_dossiers.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_documents.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_payments.js")
load("C:/Users/inorgaisse/Desktop/MongoData/JsScript/Script_Import_Collection_rendezvous.js")