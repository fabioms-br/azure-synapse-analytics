IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'CsvTextFormat') 
	CREATE EXTERNAL FILE FORMAT [CsvTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ';',
			 STRING_DELIMITER = '"',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'dsDatalake') 
	CREATE EXTERNAL DATA SOURCE [dsDatalake] 
	WITH (
		LOCATION = 'abfss://fabiomsfilesys@fabiomsdatalake.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE BCB_COTACOES (
	[DATA] VARCHAR(10) COLLATE Latin1_General_100_BIN2_UTF8,
    MOEDA_COD VARCHAR(5) COLLATE Latin1_General_100_BIN2_UTF8,
    TIPO VARCHAR(2) COLLATE Latin1_General_100_BIN2_UTF8,
    SIGLA VARCHAR(3) COLLATE Latin1_General_100_BIN2_UTF8,
    VALOR VARCHAR(255) COLLATE Latin1_General_100_BIN2_UTF8
	)
	WITH (
	LOCATION = 'bcb-dolar-cotacoes.csv',
	DATA_SOURCE = [dsDatalake],
	FILE_FORMAT = [CsvTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.BCB_COTACOES
GO