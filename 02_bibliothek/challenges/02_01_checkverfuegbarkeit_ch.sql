-- Finden Sie heraus wie viele Kopien von 
-- „Dracula“ im Moment verfügbar sind.

WITH GesamtAnzahlExemplare AS(
SELECT Titel, BuchID, COUNT(*) AS AnzahlGesamt
FROM Buecher
WHERE Titel = 'Dracula'
GROUP BY Titel
)

SELECT (SELECT Titel 
        FROM GesamtAnzahlExemplare) AS Buchtitel,
        (SELECT AnzahlGesamt 
          FROM GesamtAnzahlExemplare) - COUNT(*) AS VerfügbareExemplare
FROM Ausleihung 
WHERE BuchID = (SELECT BuchID FROM GesamtAnzahlExemplare)
 AND RueckgabeDatum IS NULL
;