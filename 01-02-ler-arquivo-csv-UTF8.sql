-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://fabiomsdatalake.dfs.core.windows.net/fabiomsfilesys/OnlineRetail.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    )     
    WITH (

        StockCode VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
        [Description] VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
        Country VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8,
        Quantity FLOAT

    )    
    AS [result]
