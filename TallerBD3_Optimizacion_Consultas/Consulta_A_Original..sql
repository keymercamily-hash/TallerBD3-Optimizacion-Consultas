SELECT *
FROM dbo.Ventas
WHERE YEAR(FechaVenta) = 2025
  AND MONTH(FechaVenta) = 3
  AND Estado = 'P';