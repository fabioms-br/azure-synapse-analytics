IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'ParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [ParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

CREATE EXTERNAL TABLE IBGE_Municipios (
	[id] nvarchar(4000),
	[nome] nvarchar(4000),
	[microrregiao_id] nvarchar(4000),
	[microrregiao_nome] nvarchar(4000),
	[microrregiao_mesorregiao_id] nvarchar(4000),
	[microrregiao_mesorregiao_nome] nvarchar(4000),
	[microrregiao_mesorregiao_UF_id] nvarchar(4000),
	[microrregiao_mesorregiao_UF_sigla] nvarchar(4000),
	[microrregiao_mesorregiao_UF_nome] nvarchar(4000),
	[microrregiao_mesorregiao_UF_regiao_id] nvarchar(4000),
	[microrregiao_mesorregiao_UF_regiao_sigla] nvarchar(4000),
	[microrregiao_mesorregiao_UF_regiao_nome] nvarchar(4000),
	[regiao-imediata_id] nvarchar(4000),
	[regiao-imediata_nome] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_id] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_nome] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_id] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_sigla] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_nome] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_regiao_id] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_regiao_sigla] nvarchar(4000),
	[regiao-imediata_regiao-intermediaria_UF_regiao_nome] nvarchar(4000)
	)
	WITH (
	LOCATION = 'ibge-municipios.parquet',
	DATA_SOURCE = [dsDatalake],
	FILE_FORMAT = [ParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.IBGE_Municipios
GO