--- Exo 2 ---
SELECT * FROM Client WHERE localite='Namur';

SELECT * FROM Client WHERE localite='Lille' AND compte>0;

SELECT nom,adresse FROM Client WHERE cat='C1';

SELECT ncom,strftime('%Y', datecom) AS annee FROM Commande;

SELECT npro,(prix*qstock) AS prixstock FROM Produit;

SELECT SUM(prix*qstock) AS prixtot FROM Produit;

--- Exo 3 ---
SELECT DISTINCT C.nom, C.adresse FROM Client C, Commande Co WHERE C.ncli = Co.ncli;

SELECT DISTINCT P.npro, P.libelle FROM Produit P, Client C, Commande Co, Detail D
WHERE C.nom = 'Ferard' AND Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro;

SELECT DISTINCT P.npro, P.libelle, Co.datecom FROM Produit P, Client C, Commande Co, Detail D
WHERE C.nom = 'Ferard' AND Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro;

SELECT DISTINCT Co.ncom, SUM(D.qcom*P.prix) AS prixcom FROM Produit P, Client C, Commande Co, Detail D
WHERE C.nom = 'Ferard' AND Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro  GROUP BY Co.ncom;

SELECT DISTINCT SUM(D.qcom*P.prix) AS prixtot FROM Produit P, Client C, Commande Co, Detail D
WHERE C.nom = 'Ferard' AND Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro;

SELECT C.ncli, C.nom, SUM(D.qcom*P.prix) AS `total du` FROM Produit P, Client C, Commande Co, Detail D
WHERE Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro GROUP BY C.ncli;

SELECT C.ncli, C.nom, SUM(D.qcom*P.prix) AS `total du` FROM Produit P, Client C, Commande Co, Detail D
WHERE Co.ncli = C.ncli AND Co.ncom = D.ncom AND P.npro = D.npro GROUP BY C.ncli
ORDER BY `total du` DESC;

--- Exo 4 ---
ALTER TABLE Client ADD planete TEXT DEFAULT 'Terre';

UPDATE Client SET nom='Skywalker', planete='Tatooine' WHERE nom='Mercier';

DELETE FROM Client WHERE nom='Skywalker';


