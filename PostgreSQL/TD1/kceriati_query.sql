-- Requête 1 --

SELECT Nom, Prenom, Adresse, ville
FROM Employe
WHERE Nom LIKE 'D%'
	AND (Ville = 'Seattle' OR  Ville = 'London')
ORDER BY Nom ASC 

-- Requête 2 --

SELECT Nom, Prenom, 'Est Chef' AS TYPE
FROM Employe
WHERE SuperieurHierarchique ISNULL

--  Requête 3 --

SELECT CommandeID, TO_CHAR(DateCommande, 'DD-MM-YYYY') AS DateCommande, FraisPorts *1/1.2 AS FraisPorts
FROM Commande


--  Requête 4 --

SELECT e.Nom, e.Prenom, e.Fonction, e2.Nom AS NomSuperieur, e2.Prenom AS PrenomSuperieur, e2.Fonction AS FonctionSuperieur
FROM Employe e
	JOIN Employe e2 ON e2.EmployeID = e.SuperieurHierarchique

--  Requête 5 --

SELECT e.Nom, e.Prenom, TO_CHAR(e.DateNaissance, 'DD-MM-YYYY'), e.DateNaissance, e2.Nom AS NomSuperieur, e2.Prenom AS PrenomSuperieur, e2.DateNaissance AS DateNaissanceSuperieur
FROM Employe AS e
JOIN Employe e2 ON e2.EmployeID = e.SuperieurHierarchique
WHERE e.DateNaissance < e2.DateNaissance

-- Requête 6 --

SELECT DISTINCT Client.NomSociete
FROM Client
	JOIN Commande ON Client.ClientID = Commande.ClientID
	JOIN LignesCommande ON Commande.CommandeID = LignesCommande.CommandeID
	JOIN Produit ON LignesCommande.ProduitID = Produit.ProduitID
	JOIN Fournisseur ON Produit.FournisseurID = Fournisseur.FournisseurID
WHERE NomFournisseur = 'Exotic Liquids'

-- Requête 7 --

SELECT cat.nomcategorie,pro.nomproduit 
FROM Produit AS pro
        JOIN Categorie AS cat ON pro.categorieID = cat.categorieID
ORDER BY cat.nomcategorie

-- Requête 8 --

SELECT ter.nomterritoire, emp.nom
FROM Territoire AS ter
        LEFT JOIN TerritoireEmploye AS terr ON ter.territoireid = terr.territoireid
        LEFT JOIN Employe AS emp ON emp.employeid = terr.employeid

-- Requête 9 --

SELECT count(horscatalogue) AS "Nb pdts hors catalogue"
FROM produit 

-- Requête 10 --

SELECT cat.nomcategorie,AVG(pro.prixunitaire)
FROM Produit AS pro
        JOIN Categorie AS cat ON pro.categorieID = cat.categorieID
GROUP BY cat.nomcategorie
ORDER BY cat.nomcategorie


-- Requête 11 --

SELECT f.fournisseurid, nomfournisseur
FROM produit as p
        JOIN Fournisseur as f ON f.fournisseurid = p.fournisseurid 
GROUP BY f.FournisseurID
HAVING Count(f.fournisseurid) >3
ORDER BY f.fournisseurid

-- Requête 12 --

 SELECT emp.employeid,emp.nom,SUM(lig.prixunitaire*lig.quantite*(1-lig.remise)) AS "total ventes"
 FROM employe AS emp
        JOIN COMMANDE AS com ON com.employeid = emp.employeid
        JOIN LignesCommande AS lig ON lig.commandeid = com.commandeid
 GROUP BY emp.employeid
 ORDER BY emp.employeid

-- Requête 13 --

 SELECT emp.nom ,emp.prenom
 FROM employe AS emp
        LEFT JOIN COMMANDE AS com ON com.employeid = emp.employeid
        LEFT JOIN LignesCommande AS lig ON lig.commandeid = com.commandeid
        LEFT JOIN Produit AS pro ON pro.produitid = lig.produitid
 GROUP BY emp.employeid
 HAVING Count(DISTINCT pro.fournisseurid) >7
 ORDER BY emp.nom

-- Requête 14 --

-- NOT IN --
SELECT P.NomProduit
FROM Produit AS P
WHERE P.ProduitID NOT IN (SELECT ProduitID
				  FROM LignesCommande)

-- NOT EXISTS --
SELECT P.NomProduit
FROM Produit AS P
WHERE NOT EXISTS
	(SELECT LC.ProduitID
	FROM LignesCommande AS LC
			WHERE P.ProduitID = LC.ProduitID)

-- Requête 15 --

-- IN / OR --
	SELECT PRO.nomproduit
	FROM Produit AS PRO
		WHERE PRO.FournisseurID IN (SELECT F.FournisseurID
					    FROM Fournisseur AS F
					    WHERE F.Ville = 'London')

		OR PRO.produitid IN (SELECT LC.ProduitID
					    FROM LignesCommande AS LC
					    JOIN Commande AS COM ON COM.CommandeID = LC.CommandeID
					    JOIN Client AS CLI ON CLI.ClientID = COM.ClientID
					    WHERE CLI.Ville = 'London')

-- UNION --





