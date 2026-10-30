USE TallerBD3;
GO

-- Crear índice para buscar facturas
CREATE NONCLUSTERED INDEX UX_Ventas_NumeroFactura
ON dbo.Ventas (NumeroFactura)
INCLUDE (Monto, Estado);
GO

-- CONSULTA B: OPTIMIZADA

SELECT VentaId, Monto, Estado
FROM dbo.Ventas
WHERE NumeroFactura = '0000123456';
GO