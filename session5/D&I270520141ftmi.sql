--f

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
);

CREATE TRIGGER Verwijdering (
	AFTER DELETE ON Boek
	FOR EACH ROW
	BEGIN
		DELETE FROM Exemplaar
		WHERE old.isbn = isbn
	END
);	

--g

CREATE TABLE Bestelling (
isbn Integer NOT NULL,
aantal Integer NOT NULL
);

CREATE TRIGGER Bestelling (
	BEFORE INSERT ON Boek
	FOR EACH STATEMENT
	WHEN NOT EXISTS(SELECT auteur FROM Boek WHERE auteur = NEW.auteur)
	BEGIN
		INSERT INTO bestelling
		Values (NEW.isbn, 1)
	END
);

--h (bonus)

ALTER TABLE Bestelling (
ADD CHECK COUNT(SELECT massa FROM Boek b, Bestelling o WHERE b.isbn = o.isbn) > 2000
);

--i (bonus) -- check of er geen kast bestaat die geen boeken heeft van 10 verschillende schrijvers

CREATE ASSERTION assert  
CHECK (NOT EXISTS
			(SELECT kast FROM Boek WHERE NOT EXISTS{			
            SELECT COUNT(DISTINCT auteur)  
              FROM Boek b, Exemplaar e
			  WHERE e.isbn = b.isbn
             GROUP 
                BY kast
            HAVING COUNT(*) >= 10
           )));
