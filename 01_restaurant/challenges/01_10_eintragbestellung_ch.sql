-- Fuegen Sie die Bestellung einer Kundin in unsere Datenbank ein
-- und stellen Sie ihr die Gesamtkosten bereit

-- Bestellungsinformationen sind:
-- Für: Loretta Hundey, 6939 Elka Place, 
-- Im Einkaufskorb: 1 House Salad, 1 Mini Cheeseburgers, 1 Tropical Blue Smoothie,
-- Lieferdatum und Zeit: September 20, 2022, @2PM (14:00)

-- Bestellung in Bestellungen erstellen
Insert Into Bestellungen(KundenID, BestellungsDatum)
Values((SELECT KundenID
        FROM Kunden
        WHERE Vorname = 'Loretta'
        AND Nachname = 'Hundey'
        AND Adresse = '6939 Elka Place'
        ),
        '2022-09-20 14:00:00'
        )
;

-- Die Bestellung in BestellungSpeise erstellen
WITH Bestellung AS(
SELECT BestellungsID
FROM Bestellungen
WHERE BestellungsDatum = '2022-09-20 14:00:00'
  AND KundenID = (SELECT KundenID
                  FROM Kunden
                  WHERE Vorname = 'Loretta'
                    AND Nachname = 'Hundey'
                    AND Adresse = '6939 Elka Place')
)
INSERT INTO BestellungSpeise(BestellungsID, SpeiseID)
Values((SELECT BestellungsID
        FROM Bestellung),
        (SELECT SpeiseID
         FROM Speise
         WHERE Name = 'House Salad')
      ),((SELECT BestellungsID
          FROM Bestellung),
          (SELECT SpeiseID
            FROM Speise
            WHERE Name = 'Mini Cheeseburgers')
        ),((SELECT BestellungsID
            FROM Bestellung),
            (SELECT SpeiseID
              FROM Speise
              WHERE Name = 'Tropical Blue Smoothie')
          )
;

-- Abfrage der Gesamtkosten mit CTE
WITH BestellteSpeisen AS(
SELECT SpeiseID
FROM BestellungSpeise
WHERE BestellungsID = (SELECT BestellungsID
                      FROM Bestellungen
                      WHERE BestellungsDatum = '2022-09-20 14:00:00'
                      AND KundenID = (SELECT KundenID
                                      FROM Kunden
                                      WHERE Vorname = 'Loretta'
                                      AND Nachname = 'Hundey'
                                      AND Adresse = '6939 Elka Place')
                      )
)

SELECT SUM(Preis) AS Gesamtkosten
FROM Speise
WHERE SpeiseID IN (SELECT * FROM BestellteSpeisen)
;



