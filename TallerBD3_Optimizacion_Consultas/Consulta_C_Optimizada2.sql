USE TallerBD3;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT FechaVenta, Monto, Estado
FROM dbo.Ventas
WHERE ClienteId = 4321
ORDER BY FechaVenta DESC;