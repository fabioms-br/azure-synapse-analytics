CREATE VIEW [dbo].[VW_BCB_COTACOES]
	AS 
	

WITH DATA_VALUES AS (
	
    SELECT *       
    FROM
    [BCB_COTACOES]    

),

/* 03. Converter Tipo de Dados e uso Funções de Janela */
DATA_ANALYSIS AS (

    SELECT  
    *,
    -- Média móvel 50 dias
    AVG([Valor]) -- Definir o cálculo
    OVER(PARTITION BY Sigla ORDER BY [Data] -- Definir Over
        ROWS BETWEEN 49 PRECEDING AND CURRENT ROW)-- Definir Período
    AS dia50_media_movel,

    -- Média móvel 200 dias
    AVG([Valor]) -- Definir o cálculo
    OVER(PARTITION BY Sigla ORDER BY [Data] -- Definir Over
        ROWS BETWEEN 199 PRECEDING AND CURRENT ROW)-- Definir Período
    AS dia200_media_movel

    FROM (
        SELECT 

        SIGLA, 
        -- String para Datetime
        CONVERT(DATETIME, CONCAT(SUBSTRING([DATA],1,2),'-',SUBSTRING([DATA],3,2),'-',SUBSTRING([DATA],5,4)), 103) AS [DATA], --DD-MM-YYYY
        -- String para Numeric    
        CONVERT(NUMERIC(18,4),REPLACE([VALOR],',','.')) AS VALOR

        FROM DATA_VALUES 
    ) AS RS

)
/* 04. Executar a consulta */
SELECT *
FROM DATA_ANALYSIS


