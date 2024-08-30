-- Erstellen Sie eine Reservierung für einen Kunden, 
-- dessen Daten eventuell schon in unserer Datenbank sind - oder auch nicht.

-- Die Reservierung ist für:
-- Sam McAdams (smac@kinetecoinc.com), 5 Personen
-- August 12, 2022 @ 6PM (18:00)
-- Telefon: 555-555-1212

SELECT *
From Kunden
WHERE Email = 'smac@kinetecoinc.com'
;

Insert Into Kunden(Vorname, Nachname, Email, Telefon)
Values ('Sam', 'McAdams', 'smac@kinetecoinc.com', '555-555-1212')
;

Insert Into Reservierung (KundenID, Datum, PartyGroesse)
Values ((SELECT KundenID FROM Kunden WHERE Email = 'smac@kinetecoinc.com'),
        '2022-08-12 18:00:00',
        5)
;

SELECT *
From Reservierung 
WHERE KundenID = (SELECT KundenID FROM Kunden WHERE Email = 'smac@kinetecoinc.com')
;