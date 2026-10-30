USE TallerBD3;
GO


CREATE NONCLUSTERED INDEX IX_Ventas_Pendientes
ON dbo.Ventas (FechaVenta)
INCLUDE (ClienteId, Monto, Estado, NumeroFactura, Comentario)
WHERE Estado = 'P';
GO


SELECT *
FROM dbo.Ventas
WHERE FechaVenta >= '20250301'
  AND FechaVenta < '20250401'
  AND Estado = 'P';
GO