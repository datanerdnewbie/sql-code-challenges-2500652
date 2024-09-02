-- Erstellen Sie eine Liste von Kundinnen/Kunden,
-- die die meisten Bestellungen abgegeben haben,
-- sodass wir ihnen einen Coupon schenken können.

-- Geben Sie die Anzahl der Bestellungen, 
-- den Vornamen, Nachnamen sowie die Email-Adresse an.

-- Liste an Kunden dessen Bestellungsrang < 15 ist
WITH AnzahlBestellungen AS(
SELECT KundenID, 
        COUNT(*) AS Anzahl,
        RANK() OVER(ORDER BY COUNT(*) DESC) AS Rang
FROM Bestellungen
GROUP BY KundenID
)

SELECT k.Vorname, k.Nachname, k.Email, ab.Anzahl 
FROM Kunden AS k
JOIN AnzahlBestellungen AS ab
 ON k.KundenID = ab.KundenID
WHERE ab.Rang <= 15
;