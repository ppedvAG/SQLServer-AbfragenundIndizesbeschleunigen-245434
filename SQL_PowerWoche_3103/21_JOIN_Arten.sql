/*
	SQL Server versucht aus einer Reihe von Ausf�hrungspl�nen,
	die er vorarb ermittelt, den g�nstigsten herauszufinden

	Meist stimmt das, aber es k�nnen "Auff�lligkeiten" entdeckt werden

		- unter anderen taucht ein ORDER BY auf, obwohl wir garkein Sortieroperator genutzt
		haben

	inner hash join:
	- es wird ein Hashtabelle zu ermitteln der �bereinstimmenden JOIN Spalten der Tabelle
	Gilt bei gro�en Tabellen, leicht parallelisierbar sind, kein Index vorhanden

	inner merge join:
	- beide Tabellen werden jeweils einmal gleichzeitig durchsucht
	das kann nur dann funktionierten, wenn sortiert

	inner loop join:
	- kleine Tabellen wird zeilenweise durchlaufen pro Zeile,
	wird in der gr��eren Tabelle nach dem Wert gesucht
	=> gut, wenn eine Tabelle bzw (WHERE) Ergebnis sehr klein ist
*/

SELECT * FROM Customers
INNER HASH JOIN Orders on Customers.CustomerID = Orders.CustomerID


SELECT * FROM Customers
INNER MERGE JOIN Orders on Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers
INNER LOOP JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers CROSS JOIN Orders -- (95 x 830)