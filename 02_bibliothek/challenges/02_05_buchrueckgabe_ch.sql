-- Pflegen Sie die Rückgabe der folgenden Bücher in die Datenbank ein.
-- Nutzen Sie dafür die Barcodes.
-- Rückgabedatum ist der 5. Juli 2022.

-- Buch 1: 6435968624
-- Buch 2: 5677520613
-- Buch 3: 8730298424

UPDATE Ausleihung
SET Rueckgabedatum = '2022-07-05'
WHERE BuchID = (SELECT BuchID 
                FROM Buecher 
                WHERE Barcode IN (6435968624,
                                  5677520613,
                                  8730298424
                                 )
                )
 AND Rueckgabedatum IS NULL
;