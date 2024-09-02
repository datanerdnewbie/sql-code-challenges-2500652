-- Fügen Sie folgende Bücher in die Datenbank hinzu
-- und stellen diese zum Ausleihen bereit.

/*
- Titel: Dracula  
- Autor: Bram Stoker 
- Jahr: 1897
- Neue ID: 4819277482

- Titel: Gulliver’s Travels into Several Remote Nations of the World
- Autor: Jonathan Swift
- Jahr: 1729
- Neue ID: 4899254401 */

INSERT INTO Buecher (Titel, AutorIn, Erscheinungsdatum, Barcode)
VALUES ('Dracula', 'Bram Stoker', 1897, 4819277482),
        ('Gullivers Travel''s into Several Remote Nations of the World',
         'Jonathan Swift', 1729, 4899254401)
;

SELECT * FROM Buecher Order BY BuchID DESC Limit 4;
