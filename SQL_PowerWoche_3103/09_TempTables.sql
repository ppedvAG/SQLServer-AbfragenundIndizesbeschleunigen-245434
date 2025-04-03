USE Northwind

-- Tempor�re Tabellen

/*
	- SELECT INTO #TableName => Ergebnisse werden in eine Tempor�re Tabelle geschrieben
	- existiert nur innerhalb der Session (Skriptfenster / Abfragefenster)
	- werden in der SystemDb unter tempDB angelegt
	- Unterschied zur View: Ergebnisse werden nur einmal generiert --> TempTables sehr schnell aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/

-- Erstellen
SELECT * INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporaere Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell L�schen
DROP TABLE #TempTable

-- globale Temp Table
SELECT * INTO ##TempT
FROM Customers
WHERE Country = 'Germany'