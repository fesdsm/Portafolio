USE [RAW_DATA_ALTURAS]
GO

TRUNCATE TABLE [dbo].[FACT_CALIFICACION];

-- 1. Definimos los hitos evaluativos (5 notas para el 1er Semestre 2025)
WITH Evaluaciones AS (
    -- Mes, Día, Ponderación y Semestre (Key 3 = Primer Semestre 2025)
    SELECT 3 AS Mes, 15 AS Dia, 0.15 AS POND, 3 AS SEM UNION 
    SELECT 4, 20, 0.15, 3 UNION               
    SELECT 5, 25, 0.20, 3 UNION               
    SELECT 6, 15, 0.20, 3 UNION               
    SELECT 7, 05, 0.30, 3                     
),
-- 2. Mapeo de Asignaturas con Docentes de Alturas
MapeoAcademico AS (
    SELECT 1 AS ASIG, 1 AS DOC UNION  -- Matemática -> Hugo Zamora
    SELECT 2, 4  UNION                -- Lenguaje -> Maria Eugenia Larrain
    SELECT 3, 10 UNION                -- Inglés -> Marisol Villagra
    SELECT 4, 7  UNION                -- Biología -> Luis Gutierrez
    SELECT 5, 8  UNION                -- Química -> Silvia Quinteros
    SELECT 6, 9  UNION                -- Física -> Oscar Vargas
    SELECT 7, 12 UNION                -- Historia -> Ana Luisa Correa
    SELECT 8, 13 UNION                -- Ed. Ciudadana -> Victor Concha
    SELECT 9, 18 UNION                -- Filosofía -> Gustavo Becerra
    SELECT 10, 16 UNION               -- Artes -> Cecilia Matte
    SELECT 11, 17 UNION               -- Música -> Ricardo Donoso
    SELECT 12, 14 UNION               -- Ed. Física -> Marco Solis
    SELECT 13, 19                     -- Tecnología -> Marta Urrutia
),
-- 3. Universo de Calificaciones y Perfiles
Universo AS (
    SELECT 
        A.ALUMNO_KEY,
        M.DOC,
        M.ASIG,
        E.SEM,
        C.CALENDARIO_KEY,
        E.POND,
        -- Lógica dinámica de perfiles académicos
        CASE 
            WHEN A.ALUMNO_KEY % 10 = 1 THEN 6.4 -- PERFIL: Alumno Brillante
            WHEN A.ALUMNO_KEY % 14 = 0 THEN 3.1 -- PERFIL: Alumno en Riesgo
            WHEN M.ASIG IN (10,11,12) AND A.ALUMNO_KEY % 4 = 0 THEN 6.8 -- PERFIL: Talento Artístico/Deportivo
            WHEN M.ASIG IN (1,5,6) AND A.ALUMNO_KEY % 5 = 0 THEN 3.6    -- PERFIL: Dificultad en Ciencias Exactas
            ELSE 5.2 -- PERFIL: Promedio General del colegio
        END AS NotaBase,
        -- Ruido estadístico (-0.5 a +0.9) para dar naturalidad a las curvas
        (CAST(ABS(CHECKSUM(NEWID())) % 15 AS FLOAT) - 5) / 10.0 AS Ruido
    FROM [dbo].[DIM_ALUMNO] A
    CROSS JOIN MapeoAcademico M
    CROSS JOIN Evaluaciones E
    INNER JOIN [dbo].[DIM_CALENDARIO] C 
        ON MONTH(C.FECHA_COMPLETA) = E.Mes 
        AND DAY(C.FECHA_COMPLETA) = E.Dia
        AND YEAR(C.FECHA_COMPLETA) = 2025
)
INSERT INTO [dbo].[FACT_CALIFICACION] 
    ([ALUMNO_KEY], [DOCENTE_KEY], [ASIGNATURA_KEY], [SEMESTRE_KEY], [CALENDARIO_KEY], [NOTA], [PONDERACION])
SELECT 
    ALUMNO_KEY, 
    DOC, 
    ASIG, 
    SEM, 
    CALENDARIO_KEY,
    -- Aseguramos que la nota no rompa la escala de 1.0 a 7.0
    CASE 
        WHEN (NotaBase + Ruido) > 7.0 THEN 7.0
        WHEN (NotaBase + Ruido) < 1.0 THEN 1.0
        ELSE (NotaBase + Ruido)
    END AS NOTA,
    POND
FROM Universo;
GO

