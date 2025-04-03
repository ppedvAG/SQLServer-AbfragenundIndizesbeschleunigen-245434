USE Northwind

-- Aggregatfunktionen: F�hrt eine Berechnung auf einer Menge von Werten durch und gibt einen einzigen Wert zur�ck

-- COUNT(Spalte) z�hlt die Datens�tze in einer Tabelle, bsp: Customers => 91 Datens�tze => Ergebnis = 91
-- COUNT(*) ignoriert keine NULL Werte
SELECT * FROM Orders

--           323             830
SELECT COUNT(ShipRegion), COUNT(*) FROM Orders

-- 5 Grunds�tzliche Aggregatfunktionen
SELECT
SUM(Freight) as Summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) AS Durchschnitt,
COUNT(ShippedDate) as Z�hleSpalte, COUNT(*) as Z�hleAlles
FROM Orders

-- AVG Selber berechnen:
SELECT SUM(Freight) / COUNT(*) FROM Orders


SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

-- L�sung => GROUP BY
SELECT CustomerID, SUM(Freight) FROM Orders
ORDER BY CustomerID

SELECT CustomerID, SUM(Freight) FROM Orders -- 89 Zeilen => 2 Kunden die keine Bestellung haben
GROUP BY CustomerID
ORDER BY CustomerID

SELECT * FROM Customers -- 91 Zeilen


-- Quantity Summe Pro ProductID
SELECT ProductID, SUM(Quantity) as SummeQuantity FROM [Order Details]
GROUP BY ProductID

-- Prozessreihenfolge
SELECT CustomerID as ID, Country, City FROM Customers
ORDER BY 2

-- Verkaufte Stueckzahlen pro Produkt, aber nur �ber 1000
-- So Geht das nicht
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) >= 1000
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- HAVING funktioniert 1zu1 wie das WHERE, kann gruppierte/aggregierte Werte filtern
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) >= 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckzahl DESC