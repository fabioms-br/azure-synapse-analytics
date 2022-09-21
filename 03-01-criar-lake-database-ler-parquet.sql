-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://fabiomsdatalake.dfs.core.windows.net/fabiomsfilesys/ibge-municipios.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
