
USE Northwind

-- CREATE / ALTER / DROP -- DDL (Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ProductID INT NOT NULL
)

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID:
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zur bestehenden Tabelle:
ALTER TABLE PurchasingOrders
ADD TestDaten INT

ALTER TABLE PurchasingOrders
ADD NeueSpalte INT NOT NULL

-- Spalte aus einer bestehenden Tabelle l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

SELECT * FROM PurchasingOrders

-- Spalte nach Datentyp �ndern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT NULL

-- INSERT - Hinzuf�gen von Datens�tzen in bestehender Table

-- Alle Spalten befuellen:
INSERT INTO PurchasingOrders
VALUES (GETDATE(), 2, 20.34)

-- Explizit Spalten bef�llen:
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES(GETDATE(), 1)

-- Ergebnis einer SELECT-Abfrage in einen INSERT nutzen
-- Geht nur wenn: Datentyp kompatibel & Spaltenanzahl gleich sein
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, NULL

-- DELETE - L�schen von Datens�tzen in einer bestehenden Tabelle

SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne WHERE Filter werden ALLE Datens�tze gel�scht
DELETE FROM PurchasingOrders
WHERE ID = 7

-- Primaer-/Fremdschluesselbeziehungen verhindert das loeschen von Datensaetzen, weil sonst die Daten
-- ins Leere laufen wuerden
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

SELECT * FROM Customers
SELECT * FROM Orders

-- UPDATE - �ndern von Spaltenwerten in einem vorhanden Datensatz

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET OrderDate = '13.05.2021'
WHERE ID = 6

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 2

-- Transactions

BEGIN TRANSACTION -- => Absicherung f�r WICHTIG: 1 Befehl

UPDATE PurchasingOrders
SET TestDaten = 20

COMMIT		-- => �nderungen werden �bernommen
ROLLBACK	-- => �nderungen werden zur�ckgesetzt auf den vorherigen Stand
-- Nach einem Rollback/Commit wird die Transaction beendet!

SELECT * FROM PurchasingOrders


-- 1. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
-- LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
-- HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo
INSERT INTO Employees
(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo)
VALUES
('Philipp', 'Libowicz', 'Trainer', 'Mr', '13.02.2005', '01.09.2023', 'Burghausen', 'Bayern', '84489', 'Germany', '12312312321', 2)

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist
UPDATE Employees
SET LastName = 'Max'
WHERE EmployeeID = 10

SELECT * FROM Employees
