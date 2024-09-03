-- Erstellen Sie eine Liste von Mitgliedern,  
-- die am seltensten Bücher ausgeliehen haben. 

SELECT m.Email
FROM Ausleihung AS a
LEFT JOIN (SELECT MitgliedsID, Email FROM Mitglieder) AS m
  ON a.MitgliedsID = m.MitgliedsID
GROUP BY a.MitgliedsID
HAVING COUNT(a.MitgliedsID) < AVG((SELECT COUNT(*)
                                    FROM Ausleihung
                                    GROUP BY MitgliedsID
                                  )
                                  )
ORDER BY COUNT(a.MitgliedsID)
;
