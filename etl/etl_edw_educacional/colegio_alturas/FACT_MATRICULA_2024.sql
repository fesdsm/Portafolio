USE [RAW_DATA_ALTURAS]
GO

-- 1. Vaciamos la tabla de matrículas para cargar desde cero
TRUNCATE TABLE [dbo].[FACT_MATRICULA];
GO

-- 2. Inserción limpia de alumnos 1 al 401 (Colegio Alturas)
WITH Fechas2024 AS (
    -- Generamos un pool de días hábiles de matrícula 2024 (10 Feb a 20 Abr)
    SELECT CALENDARIO_KEY, ROW_NUMBER() OVER (ORDER BY NEWID()) AS Fila
    FROM [dbo].[DIM_CALENDARIO]
    WHERE ANIO = 2024 
      AND ES_DIA_HABIL = 1 
      AND (
          (MES_NUMERO = 2 AND DIA_MES >= 10) OR 
          (MES_NUMERO = 3) OR 
          (MES_NUMERO = 4 AND DIA_MES <= 20)
      )
)
INSERT INTO [dbo].[FACT_MATRICULA] (
    COLEGIO_KEY, 
    ALUMNO_KEY, 
    CURSO_KEY, 
    CALENDARIO_KEY, 
    MONTO_MATRICULA
)
SELECT 
    2 AS COLEGIO_KEY, -- Lo puse en 2 asumiendo que Alturas es el colegio 2 (déjalo en 1 si cada colegio en su DB usa el ID 1)
    ALUMNO_KEY,
    
    -- Esta fórmula agrupa a los alumnos en bloques de 28.
    -- Alumnos 1-28 -> Curso 1 | ... | Alumnos 393-401 -> Curso 15
    ((ALUMNO_KEY - 1) / 28) + 1 AS CURSO_KEY,
    
    -- Asignamos una fecha pseudo-aleatoria del pool de fechas generadas
    (SELECT TOP 1 CALENDARIO_KEY FROM Fechas2024 WHERE Fila = (ALUMNO_KEY % 50) + 1) AS CALENDARIO_KEY,
    
    15000.00 AS MONTO_MATRICULA
FROM [dbo].[DIM_ALUMNO]
WHERE ALUMNO_KEY BETWEEN 1 AND 401; -- Límite exacto hasta el ID 401 (Fabiola Macarena)
GO

-- =======================================================
-- VERIFICACIÓN DE LA CARGA
-- =======================================================
SELECT 
    CURSO_KEY, 
    COUNT(ALUMNO_KEY) AS TOTAL_ALUMNOS,
    MIN(ALUMNO_KEY) AS DESDE_ALUMNO_KEY,
    MAX(ALUMNO_KEY) AS HASTA_ALUMNO_KEY
FROM [dbo].[FACT_MATRICULA]
GROUP BY CURSO_KEY
ORDER BY CURSO_KEY;