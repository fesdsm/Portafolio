USE [RAW_DATA_ALTURAS]
GO

TRUNCATE TABLE [dbo].[FACT_MATRICULA];

-- 1. Asignamos a los 401 alumnos originales a su curso base del 2025.
WITH Alumnos2025 AS (
    SELECT 
        ALUMNO_KEY,
        CASE 
            WHEN ALUMNO_KEY <= 29 THEN 1  -- 1°A (29)
            WHEN ALUMNO_KEY <= 60 THEN 2  -- 1°B (31)
            WHEN ALUMNO_KEY <= 95 THEN 3  -- 1°C (35)
            WHEN ALUMNO_KEY <= 123 THEN 4 -- 2°A (28)
            WHEN ALUMNO_KEY <= 163 THEN 5 -- 2°B (40)
            WHEN ALUMNO_KEY <= 193 THEN 6 -- 2°C (30)
            WHEN ALUMNO_KEY <= 225 THEN 7 -- 3°A (32)
            WHEN ALUMNO_KEY <= 261 THEN 8 -- 3°B (36)
            WHEN ALUMNO_KEY <= 302 THEN 9 -- 3°C (41)
            WHEN ALUMNO_KEY <= 335 THEN 10 -- 4°A (33)
            WHEN ALUMNO_KEY <= 373 THEN 11 -- 4°B (38)
            WHEN ALUMNO_KEY <= 401 THEN 12 -- 4°C (28)
        END AS CURSO_KEY_25
    FROM [dbo].[DIM_ALUMNO]
    WHERE ALUMNO_KEY <= 401
),
-- 2. Definimos a los "Repitentes" (AQUÍ ESTABA EL ERROR, faltaba llamar a CURSO_KEY_25)
Repitentes AS (
    SELECT 
        ALUMNO_KEY, 
        CURSO_KEY_25 -- ¡Corregido! Ahora guardamos el curso para usarlo abajo
    FROM Alumnos2025 
    WHERE CURSO_KEY_25 >= 4    -- Solo repiten los que están en 2do, 3ro o 4to
      AND ALUMNO_KEY % 13 = 0  -- Múltiplos de 13 para agarrar un grupo aleatorio pero constante
)

-- =======================================================
-- INSERCIÓN AÑO 2025
-- =======================================================
INSERT INTO [dbo].[FACT_MATRICULA] (COLEGIO_KEY, ALUMNO_KEY, CURSO_KEY, CALENDARIO_KEY, MONTO_MATRICULA)
SELECT 
    1 AS COLEGIO_KEY, 
    ALUMNO_KEY, 
    CURSO_KEY_25, 
    20250301 AS CALENDARIO_KEY, 
    15000.00 AS MONTO_MATRICULA
FROM Alumnos2025

UNION ALL

-- =======================================================
-- INSERCIÓN AÑO 2024
-- =======================================================

-- A) Los Promovidos (Retrocedemos 1 nivel a los regulares de 2025)
SELECT 
    1 AS COLEGIO_KEY,
    ALUMNO_KEY, 
    (CURSO_KEY_25 - 3) AS CURSO_KEY, -- Restar 3 cambia el nivel (Ej: de 2°A [4] pasa a 1°A [1])
    20240301 AS CALENDARIO_KEY, 
    15000.00 AS MONTO_MATRICULA
FROM Alumnos2025 
WHERE CURSO_KEY_25 >= 4  -- Excluimos a los de 1° Medio 2025 (porque en 2024 estaban en 8vo)
  AND ALUMNO_KEY NOT IN (SELECT ALUMNO_KEY FROM Repitentes)

UNION ALL

-- B) Los Repitentes (Se mantienen en el mismo curso en 2024 y 2025)
SELECT 
    1 AS COLEGIO_KEY,
    ALUMNO_KEY, 
    CURSO_KEY_25 AS CURSO_KEY, -- Ahora sí existe esta columna
    20240301 AS CALENDARIO_KEY, 
    15000.00 AS MONTO_MATRICULA
FROM Repitentes

UNION ALL

-- C) Promoción 2024 (Los 15 Egresados) -> ALUMNO_KEY del 402 al 416
SELECT 
    1 AS COLEGIO_KEY,
    ALUMNO_KEY, 
    10 + (ALUMNO_KEY % 3) AS CURSO_KEY, -- Repartidos entre 4°A(10), 4°B(11) y 4°C(12)
    20240301 AS CALENDARIO_KEY, 
    15000.00 AS MONTO_MATRICULA
FROM [dbo].[DIM_ALUMNO] 
WHERE ALUMNO_KEY BETWEEN 402 AND 416

UNION ALL

-- D) Fugas / Retirados 2024 (Los 5 alumnos) -> ALUMNO_KEY >= 417
SELECT 
    1 AS COLEGIO_KEY,
    ALUMNO_KEY, 
    1 + (ALUMNO_KEY % 9) AS CURSO_KEY, -- Repartidos entre 1ro, 2do y 3ro medio (Cursos 1 al 9)
    20240301 AS CALENDARIO_KEY, 
    15000.00 AS MONTO_MATRICULA
FROM [dbo].[DIM_ALUMNO] 
WHERE ALUMNO_KEY >= 417;
GO

-- 3. Verificación de Carga
SELECT 
    LEFT(CALENDARIO_KEY, 4) AS ANIO_ACADEMICO, 
    COUNT(*) AS TOTAL_MATRICULAS,
    SUM(MONTO_MATRICULA) AS INGRESOS_MATRICULA
FROM FACT_MATRICULA 
GROUP BY LEFT(CALENDARIO_KEY, 4)
ORDER BY ANIO_ACADEMICO DESC;