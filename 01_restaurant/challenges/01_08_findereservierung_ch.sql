-- Finden Sie die Reservierung eines Kunden, 
-- dessen Namen wir nicht genau buchstabieren können.

-- Der Name hat unter anderem folgenede Variationen:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant
-- Heute ist der 14.Juni.

Select CONCAT(k.Vorname, ' ' ,k.Nachname) AS Name,
        r.Datum,
        r.PartyGroesse
FROM Reservierung AS r
JOIN Kunden AS k
  ON k.KundenID = r.KundenID
WHERE k.Nachname LIKE ('St%')
Order By r.Datum DESC;