-- USE Datenbankname => wechselt damit unsere angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Men� richtige DB ausw�hlen

USE Northwind

-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentar
*/

-- SELECT: w�hlt Spalten aus, die im Ergebnisfenster angezeigt werden soll

SELECT * FROM Customers -- * alle Spalten raus in der angesprochenen Tabelle

SELECT * FROM Customers

-- "Custom"- Werte und mathematische Operationen verwenden

SELECT 100

SELECT 'Hallo!' -- Zeichenketten werden in Hochkommas geschrieben

SELECT 100 + 30, 7 * 8

SELECT CompanyName, Country FROM Customers

--SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons ben�tigt
SeLEcT			CouNtRY,
		ComPanYnAmE
FrOm	Customers


----------------------------------------------------
-- Sortieren mit ORDER BY
SELECT Country, City FROM Customers
ORDER BY City 

-- ORDER BY immer syntaktisch am Ende ist
-- ASC = Ascending = aufsteigend (standard)
-- DESC = Descending = absteigend

SELECT Country, City FROM Customers
ORDER BY City DESC

-- Auch mehrere Spalten gleichzeitig m�glich
SELECT * FROM Customers
ORDER BY City DESC, CompanyName DESC

-----------------------------------
-- TOP X gibt nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch prozentual
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers

-- Funktioniert das wirklich so?: Gibts nicht
--SELECT BOTTOM 10 * FROM Customers

-- Die 20 kleinsten Frachtwerte haben
SELECT TOP 20 * FROM Orders
ORDER BY Freight

-- Die 20 gr��ten Frachtwerte haben
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC
-------------------------------------------

-- Duplikate "filtern" mit SELECT Distinct
-- Filtert alle Ergebnise/Datens�tze deren Werte exakt gleich sind

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

----------------------- 
-- Spalten umbenennen �ber Aliase bzw. "as"
SELECT Country as Land, City as Stadt from Customers