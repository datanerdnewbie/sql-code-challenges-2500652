-- Erstellen Sie eine Liste von Büchern, deren Ausleihfrist am 13. Juli 2022 endet. 
-- Diese Liste soll auch den Namen der ausleihenden Person, 
-- sowie deren Email-Adresse enthalten. 

SELECT a.Rueckgabefrist, 
        b.Titel, 
        b.Barcode, 
        CONCAT(m.Vorname, ' ', m.Nachname) AS Name, 
        m.Email
FROM Ausleihung AS a
LEFT JOIN (SELECT MitgliedsID, 
                  Vorname, 
                  Nachname, 
                  Email 
            FROM Mitglieder) AS m
  ON a.MitgliedsID = m.MitgliedsID
LEFT JOIN (SELECT BuchID, 
                  Titel, 
                  Barcode 
            FROM Buecher) AS b
  ON a.BuchID = b.BuchID
WHERE Rueckgabefrist = '2022-07-13'
;