-- Active: 1700158139431@@127.0.0.1@3306@brief
CREATE DATABASE brief1;
-------creation de table-----------------------
CREATE TABLE Departement(
 id int PRIMARY KEY AUTO_INCREMENT,
 nom VARCHAR(30));

CREATE TABLE poste(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30)
);
CREATE TABLE employes(
    id int primary key AUTO_INCREMENT,
    nom text,
    email VARCHAR(255),
    departement_id int,
    poste_id int,
    Foreign Key (departement_id) REFERENCES Departement(id),
    Foreign Key (poste_id) REFERENCES poste(id)
);

CREATE TABLE equipement (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR (255),
    salle_id int
);

CREATE TABLE salle (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR (255),
    capacite int,
    equipement_id int ,
    Foreign Key (equipement_id) REFERENCES equipement(id)
);

CREATE TABLE nombre (
    nb int,
    id_equipement int primary key,
    salle_id int PRIMARY KEY,
    Foreign Key (salle_id) REFERENCES salle(id),
    Foreign Key (id_equipement) REFERENCES equipement(id)
);
 CREATE Table Reservations(
     id int PRIMARY KEY AUTO_INCREMENT,
     salle_id int,
     employes_id int,
     date_debut date,
     date_fin date,
     Foreign Key (salle_id) REFERENCES salle(id),
     Foreign Key (employes_id) REFERENCES employes(id)
 );

------------------------insertion----------------------------------
insert into Departement (id,nom)
VALUES(null,'abdo');
insert into poste (id,nom)
VALUES(null,'yassir'),
      (null,'yassir')

INSERT INTO `employes`(`id`, `nom`, `email`, `departement_id`, `poste_id`) 
VALUES (null,'bilal','dimabarca@gmail.com',1,1), 
        (null,'koudousse','koudouss@gmail.com',2,2)

INSERT INTO `equipement`(`id`, `nom`) 
VALUES (null,'chaise'),
       (null,'[biraux]')

INSERT INTO `salle`(`id`, `nom`, `capacite`)
 VALUES (null,'hamza','0'),
        (null,'[salle-3]','0')


INSERT INTO `nombre`(`id`, `nb`, `id_equipement`, `salle_id`) 
VALUES (null,'20','2','1')

INSERT INTO `reservations`(`id`, `salle_id`, `employes_id`, `date_debut`, `date_fin`) 
VALUES (null,'1','2','2004-01-10','2000-02-11'),
        (null,'2','1','2023-06-10','2023-10-11'),
        (null,'1','2','2000-06-12','2004-10-11')



-------------------------------------selects------------------------------------
SELECT * FROM `equipement` WHERE 1
-----------------------------------update----------------------------------
UPDATE reservations SET date_debut='2005-12-12' WHERE id='3'

UPDATE salle SET nom='salle-1' , capacite='20' WHERE id='1'


---------------------------------delete----------------------
DELETE FROM reservations WHERE 5

---------------------------jointures-----------------------------
SELECT employes.id,employes.email,post.nom
FROM employes
INNER JOIN poste
ON employes.poste_id = poste.id;