USE RAW_DATA_ALCANTARA
GO

SET LANGUAGE Spanish;
SET DATEFIRST 1; -- Lunes = 1, Domingo = 7

-- 2. Definimos el rango exacto: 2024 y 2025
DECLARE @FECHA_INICIO DATE = '2024-01-01';
DECLARE @FECHA_FIN DATE = '2025-12-31';
DECLARE @FECHA_PROCESO DATE = @FECHA_INICIO;

WHILE @FECHA_PROCESO <= @FECHA_FIN
BEGIN
    -- 3. Cálculo de componentes de la fecha
    DECLARE @CALENDARIO_KEY INT = CAST(CONVERT(VARCHAR(8), @FECHA_PROCESO, 112) AS INT);
    DECLARE @DIA_SEMANA_NOMBRE VARCHAR(20) = UPPER(DATENAME(WEEKDAY, @FECHA_PROCESO));
    DECLARE @MES_NOMBRE VARCHAR(20) = UPPER(DATENAME(MONTH, @FECHA_PROCESO));
    
    -- Columnas numéricas (Cruciales para filtros y orden)
    DECLARE @DIA_MES INT = DAY(@FECHA_PROCESO);
    DECLARE @MES_NUMERO INT = MONTH(@FECHA_PROCESO);
    DECLARE @ANIO INT = YEAR(@FECHA_PROCESO);

    DECLARE @ES_FERIADO BIT = 0;
    DECLARE @ES_DIA_HABIL BIT = 1;

    -- 4. Lógica de Feriados básicos
    IF (MONTH(@FECHA_PROCESO) = 1 AND DAY(@FECHA_PROCESO) = 1)   -- Año Nuevo
       OR (MONTH(@FECHA_PROCESO) = 5 AND DAY(@FECHA_PROCESO) = 1) -- Día del Trabajo
       OR (MONTH(@FECHA_PROCESO) = 9 AND DAY(@FECHA_PROCESO) IN (18, 19)) -- Fiestas Patrias
       OR (MONTH(@FECHA_PROCESO) = 12 AND DAY(@FECHA_PROCESO) = 25) -- Navidad
    BEGIN
        SET @ES_FERIADO = 1;
    END

    -- 5. Lógica de Día Hábil (Lunes a Viernes y que no sea feriado)
    IF DATEPART(WEEKDAY, @FECHA_PROCESO) IN (6, 7) OR @ES_FERIADO = 1 
    BEGIN
        SET @ES_DIA_HABIL = 0;
    END

    -- 6. INSERT con todas las columnas integradas
    INSERT INTO [dbo].[DIM_CALENDARIO] (
          [CALENDARIO_KEY]
        , [FECHA_COMPLETA]
        , [DIA_SEMANA]
        , [DIA_MES]
        , [MES_NOMBRE]
        , [MES_NUMERO]
        , [ANIO]
        , [ES_DIA_HABIL]
        , [ES_FERIADO]
    ) VALUES (
          @CALENDARIO_KEY
        , @FECHA_PROCESO
        , @DIA_SEMANA_NOMBRE
        , @DIA_MES
        , @MES_NOMBRE
        , @MES_NUMERO
        , @ANIO
        , @ES_DIA_HABIL
        , @ES_FERIADO
    );

    SET @FECHA_PROCESO = DATEADD(DAY, 1, @FECHA_PROCESO);
END
GO
