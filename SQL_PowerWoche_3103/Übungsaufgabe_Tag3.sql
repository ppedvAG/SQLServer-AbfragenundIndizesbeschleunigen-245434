-- Erstelle eine Prozedur, der man als Parameter eine OrderID �bergeben KANN
-- Bei der Ausf�hrung soll der Rechnungsbetrag dieser Order ausgegeben werden
-- SUM(Quantity + UnitPrice + Freight) = RechnungsSumme

CREATE PROCEDURE sp_RechnungsSumme @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID  = @OrderID
GROUP BY Orders.OrderID
GO

EXEC sp_RechnungsSumme 10248