SELECT
    name AS NombreIndice,
    is_disabled AS Deshabilitado
FROM sys.indexes
WHERE object_id = OBJECT_ID('dbo.Ventas')
  AND name IN (
      'IX_Ventas_Pendientes',
      'UX_Ventas_NumeroFactura',
      'IX_Ventas_Cliente_Fecha'
  );