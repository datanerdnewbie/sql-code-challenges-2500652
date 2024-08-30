-- Entfernen Sie eine ungueltige Reservierung aus der Datenbank.

-- Ein Kunde namens Norby hat uns informiert, dass er seine Reservierung
-- für Freitag stornieren moechte. Heute ist der 24.Juli 2022.

SELECT * 
FROM Reservierung
WHERE KundenID = (SELECT KundenID
                  FROM Kunden
                  WHERE Vorname = 'Norby');

SELECT *
FROM Reservierung
WHERE Datum >= '2022-07-24';