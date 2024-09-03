-- Leihen Sie die Bücher „The Picture of Dorian Gray“ 
--  und „Great Expectations“ an Jack Vaan aus. 
-- Das Ausleihdatum ist der 25. August 2022  
--  und die Ausleihfrist endet am 8. September.

WITH Kundennummer AS(
SELECT MitgliedsID
FROM Mitglieder
WHERE Vorname = 'Jack' AND Nachname = 'Vaan'
),
VerlieheneBuecher AS(
SELECT b.BuchID, a.RueckgabeDatum
FROM Buecher AS b
JOIN Ausleihung AS a
  ON b.BuchID = a.BuchID
WHERE (b.Titel = 'The Picture of Dorian Gray' 
  OR b.Titel = 'Great Expectations')
  AND a.RueckgabeDatum IS NULL
),
Buchnummer1 AS(
SELECT BuchID
FROM Buecher
WHERE Titel = 'The Picture of Dorian Gray'
  AND BuchID NOT IN (SELECT BuchID
                      FROM VerlieheneBuecher
                    )
LIMIT 1
),
Buchnummer2 AS(
SELECT BuchID
FROM Buecher
WHERE Titel = 'Great Expectations'
  AND BuchID NOT IN (SELECT BuchID
                      FROM VerlieheneBuecher
                    )
LIMIT 1
)

INSERT INTO Ausleihung(BuchID, MitgliedsID, Ausleihdatum, Rueckgabefrist)
VALUES ((SELECT BuchID FROM Buchnummer1),
         (SELECT MitgliedsID FROM Kundennummer), 
         '2022-08-25', '2022-09-08'),
        ((SELECT BuchID FROM Buchnummer2),
          (SELECT MitgliedsID FROM Kundennummer),
         '2022-08-25', '2022-09-08')
;

SELECT a.AusleihID, a.MitgliedsID, a.Ausleihdatum, b.Titel
FROM Ausleihung AS a
JOIN (SELECT BuchID, Titel FROM Buecher) AS b
  ON a.BuchID = b.BuchID 
WHERE a.MitgliedsID = (SELECT MitgliedsID
                      FROM Mitglieder
                      WHERE Vorname = 'Jack' 
                      AND Nachname = 'Vaan'
                    )
  AND a.Ausleihdatum = '2022-08-25'
;