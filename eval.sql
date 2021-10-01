-- connexion à la base --

mysql -h localhost:8889 -u root -p root

-- afficher les base de données --

SHOW databases;

-- Creation de la base de données --

CREATE DATABASE IF NOT EXISTS eval_cine;

-- on essai de s'y connecter --

USE eval_cine

-- Creation des tables --

CREATE TABLE IF NOT EXISTS cinema(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    adress VARCHAR (250) NOT NULL,
    city VARCHAR (50) NOT NULL,
    cinema_name VARCHAR (50) NOT NULL,
    FOREIGN KEY (administrateur_id) REFERENCES administrateur(id),
    FOREIGN KEY (complexe_id) REFERENCES complexe(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS complexe(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    complexe_name VARCHAR (25) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS administrateur(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    first_name VARCHAR (25) NOT NULL,
    last_name VARCHAR (25) NOT NULL,
    mail VARCHAR (250) NOT NULL UNIQUE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS seance(

    id INT (10) PRIMARY KEY NOT NULL  auto_increment,
    hall INT (10) NOT NULL,
    place INT (10) NOT NULL,
    cinema_id (10) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinema (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS film(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    film_name VARCHAR (50) NOT NULL,
    film_time TIME NOT NULL,
    genre VARCHAR (50) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS resevation(

    id VAR (36) PRIMARY KEY NOT NULL auto_increment,
    start_movie DATETIME,
    cinema_id INT (10) NOT NULL,
    client_id INT (10) NOT NULL,
    film_id INT (10) NOT NULL,
    seance_id INT (10) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinema (id),
    FOREIGN KEY (client_id) REFERENCES client (id),
    FOREIGN KEY (film_id) REFERENCES film (id),
    FOREIGN KEY (seance_id) REFERENCES sceance (id),
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS client(

    id VAR (36) PRIMARY KEY NOT NULL auto_increment,
    last_name VARCHAR (25) NOT NULL,
    first_name VARCHAR (25) NOT NULL,
    age INT (2) NOT NULL,
    email VARCHAR (250) NOT NULL UNIQUE,
    password_client CHAR (60) NOT NULL,
    paiement_id INT (10) NOT NULL,
    tarif_id INT (10) NOT NULL,
    FOREIGN KEY (paiement_id) REFERENCES paiement (id),
    FOREIGN KEY (tarif_id) REFERENCES tarif (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS paiement(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    type_paiement VARCHAR (50) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

            --------------------------------

CREATE TABLE IF NOT EXISTS ticket(

    id INT (10) PRIMARY KEY NOT NULL auto_increment,
    price DECIMAL (2.2) NOT NULL,
    type
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- insertion des scripts factices --

INSERT INTO administrateur (last_name, first_name, email)
VALUES ('Paul', 'Bogart', 'paulbogart@lalamail.com'),('Nadine','Poussin','nadinepoussin@lalamail.com'),('Richard','Lebleu','richardlebleu@lalamail.com');

            --------------------------------

INSERT INTO complexe (id, complexe_name)
VALUES(1, 'Pathé'),(2,'leCinematographe'),(3, 'Universal')
            --------------------------------

INSERT INTO cinema (id, adress, city, cinema_name, administrateur_id, complexe_id)
VALUES (1, 'rue du plomb', 'Raymondville','lalaciné', 3, 2);

INSERT INTO cinema (id, adress, city, administrateur_id, complexe_id)
VALUES (2, 'rue du fer', 'Doudouville','lalacomplexe', 1, 1);

INSERT INTO cinema (id, adress, city, administrateur_id, complexe_id)
VALUES (3, 'rue étain', 'Grosville','lalacinécam',  2, 3);

            --------------------------------

INSERT INTO seance (hall, place, cinema_id)
VALUES (1, 70, 3),(2, 90, 3),(3, 50, 3),(3, 50, 3);

INSERT INTO seance (hall, place, cinema_id)
VALUES (1, 30, 2),(1, 50, 2),(1, 70, 2);

INSERT INTO seance (hall, place, cinema_id)
VALUES (1, 50, 1),(2, 50, 1),(3, 30, 1);

            --------------------------------

INSERT INTO film (film_name, film_time, genre)
VALUES
 ('Cadaver', 1:26:00, 'Mystère'),('The girl on the train', 2:00:00, 'Mystère'),
 ('Wonder Woman', 2:30:00, 'Aventure'),('Justice league', 4:02:00, 'Aventure'),('Godzilla vs kong', 1:53:00, 'Aventure'),
 ('Voyager', 1:48:00, 'science-fiction'),('Skyline',1:50:00, 'science-fiction'),
 ('Nocturne', 1:30:00, 'Horreur'),('Kandisha', 1:25:00, 'Horreur');

            --------------------------------

INSERT INTO tarif (price, type_price)
VALUES (9.20, 'Plein tarif'),  (7.60, 'Tarif étudiant'),(5.90, 'Moins de 14 ans');

INSERT INTO paiement (type_paiement)
VALUES ('Paiement au guichet'),('Paiement en ligne');

            --------------------------------

INSERT INTO client (id, first_name, last_name, age, mail, password_client, paiement_id, tarif_id)
VALUES (UUID(), 'Norbert', 'Boulet', 38, 'nbouletdu04@icimail.com', 'P4S5wOrD', 1, 2);
INSERT INTO client (id, first_name, last_name, age, mail, password_client, paiement_id, tarif_id)
VALUES (UUID(), 'Jodie', 'Joile', 19, 'jjolie@icimail.com', 'P4S5wOrDpA5tr3S"cur"', 2, 2);
INSERT INTO client (id, first_name, last_name, age, mail, password_client, paiement_id, tarif_id)
VALUES (UUID(), 'Docteur', 'Qui', 900, 'doctorwho04@icimail.com', 'P4S5wOrDUnP3uP7Us3cuR3', 1, 1);
INSERT INTO client (id, first_name, last_name, age, mail, password_client, paiement_id, tarif_id)
VALUES (UUID(), 'Kevin', 'Lepape', 12, 'kevinlepape@icimail.com', 'P4S5wOrD1234neJamaisFaireDeMotDePasseCommeCaIlFautLesEncoder', 3, 1);

            --------------------------------

INSERT INTO reservation(id, start_movie, cinema_id, client_id, film_id, seance_id)
VALUES (UUID(), 21-09-2021 21:00:00, 1, '470cf9b2-cdd6-42d4-ac68-1edbc4a626c6', 3, 4);
INSERT INTO reservation(id, start_movie, cinema_id, client_id, film_id, seance_id)
VALUES (UUID(), 21-09-2021 21:00:00, 1, '6c100559-ecae-40d1-b73a-208606c956f4', 6, 8);
INSERT INTO reservation(id, start_movie, cinema_id, client_id, film_id, seance_id)
VALUES (UUID(), 21-09-2021 18:00:00, 3, 'fba71909-e744-465b-a82b-4de77f006c45', 2, 7);
INSERT INTO reservation(id, start_movie, cinema_id, client_id, film_id, seance_id)
VALUES (UUID(), 21-09-2021 15:00:00, 2, '2a26e1e1-2f66-490a-a997-8772c3126628', 1, 4);
INSERT INTO reservation(id, start_movie, cinema_id, client_id, film_id, seance_id)
VALUES (UUID(), 21-09-2021 21:00:00, 2, '4e27452e-0354-463e-b214-3f48f366b26e', 3, 4);

            --------------------------------

-- Requête sql en rapport aux exigence client --

-- connaitre l'administrateur --

SELECT cinema.cinema_name AS 'Nom du complexe', CONCAT(administrateur.last_name,' ', administrateur.first_name) AS 'Nom Prenom'
FROM cinema;
JOIN id ON cinema.id = cinema_id
JOIN administrateur ON infos.administrateur_id = administrateur.id;

-- reservation --

SELECT reservation.reservation_id AS 'Numeros de reservation', film.film_id AS 'Nom du film', cinema.cinema_name AS 'Nom du cinema'
FROM reservation;
JOIN film ON film.id = resevation.film_id
JOIN cinema ON cinema.id = reservation.cinema_id
JOIN cinema ON cinema.seance_id = cinema.id
ORDER BY cinema_name;

-- nombres de sieges restant --

SELECT cinema.cinema_name AS 'Nom du cinema', seance.hall AS 'numéros de salle', 
seance.place AS 'nombre de place', count(reservation.cinema_id) AS 'nombre de reservation', 
seance.place - count(reservation.cinema_id) AS 'Place restante'
FROM reservation;
JOIN seance ON reservation.seance_id = seance.id
JOIN cinema ON seance.cinema_id = cinema.id
GROUP BY seance.id;


-- tarif --

SELECT * FROM tarif;

-- recapitulatif du paiement -- 

SELECT reservation.id AS 'Numeros de resevation', CONCAT(client.last_name, ' ', client.first_name) AS 'Nom et Prenom du client', paiement.type_paiement AS 'Choix du paiement'
FROM reservation;
JOIN client ON reservation.client_id = client.id
JOIN paiment ON reservation.paiement_id = paiement.id;


-- utilitaire de sauvegarde -- 

mysqldump -u root -h localhost:8889 -p root > eval.sql

-- utlitaire de restauration --

mysql -u root -h localhost:8889 -p root eval_cine < eval.sql