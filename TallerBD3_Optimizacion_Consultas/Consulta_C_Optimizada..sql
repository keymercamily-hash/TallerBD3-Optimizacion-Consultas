SELECT FechaVenta, Monto, Estado
FROM dbo.Ventas
WHERE ClienteId = 4321
ORDER BY FechaVenta DESC;