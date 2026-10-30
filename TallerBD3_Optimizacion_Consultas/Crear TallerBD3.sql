IF DB_ID('TallerBD3') IS NULL CREATE DATABASE TallerBD3;
GO
USE TallerBD3;
GO
DROP TABLE IF EXISTS dbo.Ventas, dbo.VentasHeap;

CREATE TABLE dbo.Ventas(
    VentaId       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Ventas PRIMARY KEY CLUSTERED,
    ClienteId     INT           NOT NULL,
    FechaVenta    DATE          NOT NULL,
    Monto         DECIMAL(12,2) NOT NULL,
    Estado        CHAR(1)       NOT NULL,   -- C=completada (98%), P=pendiente (1%), A=anulada (1%)
    NumeroFactura VARCHAR(10)   NOT NULL,   -- "número" guardado como texto, a propósito
    Comentario    NVARCHAR(200) NOT NULL    -- relleno para que las filas pesen como en producción
);

WITH n AS (
    SELECT TOP (500000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
    FROM sys.all_objects a CROSS JOIN sys.all_objects b
)
INSERT dbo.Ventas WITH (TABLOCK) (ClienteId, FechaVenta, Monto, Estado, NumeroFactura, Comentario)
SELECT ABS(CHECKSUM(NEWID())) % 10000 + 1,
       DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 1369, '20230101'),     -- 2023-01-01 a 2026-09-30
       CAST(ABS(CHECKSUM(NEWID())) % 100000 / 100.0 + 1 AS DECIMAL(12,2)),
       CASE WHEN i % 100 = 0 THEN 'P' WHEN i % 50 = 0 THEN 'A' ELSE 'C' END,
       RIGHT(CONCAT('0000000000', i), 10),
       REPLICATE(N'x', 100)
FROM n;

SELECT * INTO dbo.VentasHeap FROM dbo.Ventas;   -- copia sin índice clustered (heap) para el Demo 2