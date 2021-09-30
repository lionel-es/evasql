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
VALUES (1, 'lalaciné'), (2; 'lalacomplexe'), (3,'lalacinécam');

            --------------------------------

INSERT INTO cinema (id, adress, city, administrateur_id, complexe_id)
VALUES (1, 'rue du plomb', 'Raymondville', 3, 2);

INSERT INTO cinema (id, adress, city, administrateur_id, complexe_id)
VALUES (2, 'rue du fer', 'Doudouville', 1, 1);

INSERT INTO cinema (id, adress, city, administrateur_id, complexe_id)
VALUES (3, 'rue étain', 'Grosville',  2, 3);




