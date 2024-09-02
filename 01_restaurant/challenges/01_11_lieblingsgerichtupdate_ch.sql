-- Updaten Sie die Informationen in der Datenbank.

-- Tragen Sie Cleo Goldwaters Lieblingsgericht 
-- als "Quinoa Salmon Salad" ein.

--Tabelle Kunden aktualiesieren
UPDATE Kunden
SET Lieblingsgericht = (SELECT SpeiseID
                        FROM Speise
                        WHERE Name = 'Quinoa Salmon Salad')
WHERE Vorname = 'Cleo' AND Nachname = 'Goldwater'
;

-- Kontrolle
SELECT k.Vorname, k.Nachname, sp.Name AS Lieblingsgericht
FROM Kunden AS k
JOIN (SELECT SpeiseID, Name FROM Speise) AS sp
  ON k.Lieblingsgericht = sp.SpeiseID 
WHERE k.Vorname = 'Cleo' AND k.Nachname = 'Goldwater'
;