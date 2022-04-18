ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--creer ADMINISTRATEUR
CREATE USER ADMININISTRATEUR IDENTIFIED BY ADMIN;

--Accorder les privilèges
grant DBA to ADMINISTRATEUR;

--Connexion de EPOASSUR
conn ADMINISTRATEUR/ADMIN;


CREATE TABLE utilisateurs(
    id_user number(4),
    nom_user varchar(100),
    passwd_user varchar(100),
    mail_user varchar(100),
    PRIMARY KEY (id_user)
);


CREATE TABLE messages(
    id_msg number(4),
    destinataire_msg varchar(100),
    destinateur_msg varchar(100),
    objet_msg varchar(100),
    corps_msg varchar(100),
    PRIMARY KEY (id_msg)
);


CREATE TABLE envoies(
    date_envoie date,
    id_msg number(4),
    id_user number(4),
    PRIMARY KEY (id_msg ,id_user),
    FOREIGN KEY (id_msg) references messages ON DELETE CASCADE,
    FOREIGN KEY (id_user) references utilisateurs ON DELETE CASCADE
);


