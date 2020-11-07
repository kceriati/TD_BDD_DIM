/*==================   BDD - TD3    ===================*/

/*==============================================================*/
/* Question 3                                                   */
/*==============================================================*/

Update client set etat_client='NA'
where id_client NOT IN (
select p.id_client
from participation p
join sortie s on p.id_sortie=s.id_sortie
where s.date_sortie > current_date - interval '2 years' 
                  );


/*==============================================================*/
/* Question 4                                                   */
/*==============================================================*/

select CONCAT(i.id_sommet, ' - ', s.nom_sommet) AS Sommet, CONCAT(i.id_itineraire, ' - ', i.nom) AS Itineraire, 
CASE 
WHEN i.difficulte='F' or difficulte='PD-' or difficulte='PD' THEN 'Tout public'
WHEN difficulte='PD+' or difficulte='AD-' or difficulte='AD' THEN 'Activité sportive occasionnelle'
WHEN difficulte='AD+' or difficulte='D' THEN 'Sporti confirmé'
END AS "public"
from itineraire i
JOIN SOMMET s ON s.id_sommet = i.id_sommet 


/*==============================================================*/
/* Question 5                                                   */
/*==============================================================*/

 DROP TABLE if exists sommet_carte;

CREATE TABLE sommet_carte AS
SELECT id_sommet, nom_sommet, altitude, reference_ign, titre as titre_carte
FROM sommet s
JOIN carte c ON s.id_carte=c.id_carte;

SELECT * FROM sommet_carte;

// => Aucune contrainte créée (FK, PK, CK, NOT NULL) hormis bien sûr les contraintes de domaine de type de données.