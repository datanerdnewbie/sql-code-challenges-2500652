-- Erstellen Sie zwei Buchstatistiken.

-- Die erste soll zeigen wie viele Bücher pro Jahr veröffentlicht wurden. 
-- Die zweite soll zeigen, welche fünf Bücher am meisten ausgeliehen worden sind.

SELECT Erscheinungsdatum, 
        Count(DISTINCT(Titel)) AS Anzahl
FROM Buecher
Group BY Erscheinungsdatum
ORDER BY Anzahl DESC, Erscheinungsdatum
;

SELECT COUNT(*) AS Anzahl, b.Titel, b.Barcode
FROM Ausleihung as a
JOIN Buecher AS b
 ON a.BuchID = b.BuchID
Group By b.Titel
Order By Anzahl DESC
LIMIT 5
;