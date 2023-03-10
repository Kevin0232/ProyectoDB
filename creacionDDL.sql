-- DROP DATABASE IF EXISTS test1;
-- CREATE DATABASE test1 CHARACTER SET utf8mb4;
SET GLOBAL max_allowed_packet=1073741824;
USE test1;


-- -----------------------------------------------------
-- Table original_language
-- -----------------------------------------------------
DROP TABLE IF EXISTS original_language;
CREATE TABLE original_language(
    idOringLang INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name_original_language VARCHAR(2) NOT NULL
);


-- -----------------------------------------------------
-- Table Status
-- -----------------------------------------------------
DROP TABLE IF EXISTS Status;
CREATE TABLE Status(
    idStatus INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nameStatus VARCHAR(15) NOT NULL
);


-- -----------------------------------------------------
-- Table Movie
-- -----------------------------------------------------
DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie(
    idMovie INT PRIMARY KEY NOT NULL,
    `index` INT NOT NULL ,
    budget BIGINT NOT NULL,
    homepage VARCHAR(255),
    keywords VARCHAR(255),
    idOrigLang INT NOT NULL,
    original_title VARCHAR(255) NOT NULL,
    overview TEXT,
    popularity DOUBLE NOT NULL,
    release_date DATE,
    revenue BIGINT NOT NULL,
    runtime DOUBLE,
    idStatus INT NOT NULL,
    tagline VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    vote_average DOUBLE NOT NULL,
    vote_count INT NOT NULL,
    FOREIGN KEY (idOrigLang) REFERENCES original_language(idOringLang),
    FOREIGN KEY (idStatus) REFERENCES status(idStatus)
);


-- -----------------------------------------------------
-- Table Genre
-- -----------------------------------------------------
DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre(
    idGenre int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameGenre VARCHAR(100)
);



-- -----------------------------------------------------
-- Table production_countries
-- -----------------------------------------------------
DROP TABLE IF EXISTS production_countries;
CREATE TABLE production_countries(
    iso_3166_1 VARCHAR(10) PRIMARY KEY NOT NULL,
    pCountryName VARCHAR(255) NOT NULL
);



-- -----------------------------------------------------
-- Table production_companies
-- -----------------------------------------------------
DROP TABLE IF EXISTS production_companies;
CREATE TABLE production_companies(
    pCompanyId INT PRIMARY KEY NOT NULL,
    pCompanyName VARCHAR(255) NOT NULL
);



-- -----------------------------------------------------
-- Table spoken_language
-- -----------------------------------------------------
DROP TABLE IF EXISTS spoken_language;
CREATE TABLE spoken_language(
    iso_639_1 VARCHAR(2) PRIMARY KEY NOT NULL,
    nameSLang VARCHAR(255) NOT NULL
);


-- -----------------------------------------------------
-- Table Persona
-- -----------------------------------------------------
DROP TABLE IF EXISTS Persona;
CREATE TABLE Persona(
    idPerson INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    gender INT
);


-- -----------------------------------------------------
-- Table Movie_genres
-- -----------------------------------------------------
DROP TABLE IF EXISTS Movie_genres;
CREATE TABLE Movie_genres(
    idMovie INT NOT NULL,
    idGenre INT NOT NULL,
    PRIMARY KEY (idMovie, idGenre),
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (idGenre) REFERENCES Genre(idGenre)
);

-- -----------------------------------------------------
-- Table Movie_production_countries
-- -----------------------------------------------------
DROP TABLE IF EXISTS Movie_production_countries;
CREATE TABLE Movie_production_countries(
    idMovie INT NOT NULL,
    iso_3166_1 VARCHAR(255) NOT NULL,
    PRIMARY KEY (idMovie, iso_3166_1),
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (iso_3166_1) REFERENCES production_countries(iso_3166_1)
);

-- -----------------------------------------------------
-- Table Movie_production_companies
-- -----------------------------------------------------
DROP TABLE IF EXISTS Movie_production_companies;
CREATE TABLE Movie_production_companies(
    idMovie INT NOT NULL,
    pCompanyId INT NOT NULL,
    PRIMARY KEY (idMovie, pCompanyId),
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (pCompanyId) REFERENCES production_companies(pCompanyId)
);


-- -----------------------------------------------------
-- Table Movie_spoken_languages
-- -----------------------------------------------------
DROP TABLE IF EXISTS Movie_spoken_languages;
CREATE TABLE Movie_spoken_languages(
    idMovie INT NOT NULL,
    iso_639_1 VARCHAR(2) NOT NULL,
    PRIMARY KEY (idMovie, iso_639_1),
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (iso_639_1) REFERENCES spoken_language(iso_639_1)
);


-- -----------------------------------------------------
-- Table Crew
-- -----------------------------------------------------
DROP TABLE IF EXISTS Crew;
CREATE TABLE Crew (
    idMovie INT NOT NULL,
    idPerson INT NOT NULL,
    job VARCHAR(255) NOT NULL,
    department VARCHAR(255),
    credit_id VARCHAR(255),
    PRIMARY KEY (idMovie, idPerson, job),
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (idPerson) REFERENCES Persona(idPerson)
);

-- -----------------------------------------------------
-- Table Director
-- -----------------------------------------------------
DROP TABLE IF EXISTS Director;
CREATE TABLE Director (
    idMovie INT NOT NULL,
    idPerson INT NOT NULL,
    FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
    FOREIGN KEY (idPerson) REFERENCES Persona(idPerson)
);