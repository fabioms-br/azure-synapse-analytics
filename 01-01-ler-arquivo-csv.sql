-- This is auto-generated code
SELECT
    DISTINCT NO_CURSO
FROM
    OPENROWSET(
        BULK 'https://fabiomsdatalake.dfs.core.windows.net/fabiomsfilesys/SUP_CURSO_2019.CSV',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIELDTERMINATOR = '|',
        HEADER_ROW = TRUE
    ) WITH (
    
        [NO_CURSO] VARCHAR(4000) COLLATE Latin1_General_CI_AS

    ) AS [result]
