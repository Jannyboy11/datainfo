--a

CREATE TABLE Boek (
isbn Integer PRIMARY KEY,
titel Varchar(50) NOT NULL,
auteur varchar(20) NOT NULL
);

CREATE TABLE Exemplaar (
isbn Integer PRIMARY KEY,
volgnummer Integer PRIMARY KEY,
massa Integer NOT NULL,
kast Varchar(3)
CONSTRAINT fkisbn FOREIGN KEY (isbn) REFERENCES Boek(isbn) ON DELETE CASCADE ON UPDATE CASCADE
);

--b

INSERT INTO Boek ((isbn, titel, auteur)
VALUES (5485464897954, "YOLO", "PIETJE")
);

INSERT INTO Boek ((isbn, titel, auteur)
VALUES (5485464897954, "THE MEANING OF LIFE", "SJAKIE")
);

--c

INSERT INTO Exemplaar ((isbn, volgnummer, massa, kast) 
VALUES (5485464897954, 1, 500, "3a")
);

INSERT INTO Exemplaar ((isbn, volgnummer, massa, kast)
VALUES (5485464897954, 1, 500, "3a")
);

--d

UPDATE Boek(
SET isbn=3884665148645
WHERE isbn=5485464897954
);

--e

UDATE BOEK(
DELETE isbn
WHERE isbn=3884665148645
);
