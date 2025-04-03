USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- Muessen eigenst�ndig fehlerfrei ausf�hrbar sein!
	- K�nnen �berall in eine Abfrage eingebaut (wenn es Sinn macht)
	- Abfragen werden von "innen nach au�en" der Reihe nach ausgef�hrt
*/

-- Zeige mir alle Orders an, deren Freight Wert �er dem Durchschnitt liegen
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- 1. Eine Abfrage, um eine Produktliste
-- (ID, Name, St�ckpreis) mit einem �berdurchschnittlichen St�ckpreis zu erhalten
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)