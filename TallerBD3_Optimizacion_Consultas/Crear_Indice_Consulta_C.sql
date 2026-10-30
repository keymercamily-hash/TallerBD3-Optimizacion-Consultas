CREATE NONCLUSTERED INDEX IX_Ventas_Cliente_Fecha
ON dbo.Ventas (ClienteId, FechaVenta DESC)
INCLUDE (Monto, Estado);