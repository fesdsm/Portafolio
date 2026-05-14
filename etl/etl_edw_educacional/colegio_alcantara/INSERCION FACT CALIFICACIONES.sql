USE [RAW_DATA_ALCANTARA]
GO

TRUNCATE TABLE [dbo].[FACT_CALIFICACION];

-- 1. Definimos los hitos evaluativos (5 notas por semestre)
WITH Evaluaciones AS (
    SELECT 3 AS Mes, 15 AS Dia, 0.15 AS POND UNION -- Control 1 (Marzo)
    SELECT 4, 20, 0.15 AS POND UNION                -- Control 2 (Abril)
    SELECT 5, 25, 0.20 AS POND UNION                -- Prueba Parcial (Mayo)
    SELECT 6, 15, 0.20 AS POND UNION                -- Prueba Semestral (Junio)
    SELECT 7, 05, 0.30 AS POND                      -- Examen Final (Julio)
),
-- 2. Mapeo Real de Asignatura con el Docente correspondiente
MapeoAcademico AS (
    SELECT 1 AS ASIG, 1 AS DOC UNION  -- Matematica -> Ricardo Tapia
    SELECT 2, 4  UNION                -- Lenguaje -> Elsa Valenzuela
    SELECT 3, 10 UNION                -- Ingles -> Claudia Fuentes
    SELECT 4, 7  UNION                -- Biologia -> Roberto Venegas
    SELECT 5, 8  UNION                -- Quimica -> Maria Jara
    SELECT 6, 9  UNION                -- Fisica -> Hernan Poblete
    SELECT 7, 12 UNION                -- Historia -> Lorena Figueroa
    SELECT 8, 13 UNION                -- Ed. Ciudadana -> Felipe Cortes
    SELECT 9, 18 UNION                -- Filosofia -> Esteban Lagos
    SELECT 10, 16 UNION               -- Artes -> Gabriela Aldunate
    SELECT 11, 17 UNION               -- Musica -> Jaime Ruz
    SELECT 12, 14 UNION               -- Ed. Fisica -> Cristian Villalobos
    SELECT 13, 19                     -- Tecnologia -> Andrea Miranda
),
-- 3. Generamos el Universo de Calificaciones
Universo AS (
    SELECT 
        A.ALUMNO_KEY,
        M.DOC,
        M.ASIG,
        3 AS SEMESTRE, -- Primer Semestre 2025
        C.CALENDARIO_KEY,
        E.POND,
        -- Lógica de Perfiles para la Nota Base
        CASE 
            WHEN A.ALUMNO_KEY % 12 = 1 THEN 6.2 -- PERFIL: Alumno Excelencia
            WHEN A.ALUMNO_KEY % 15 = 0 THEN 3.2 -- PERFIL: Alumno en Riesgo (reprobando)
            WHEN M.ASIG IN (10,11,12) AND A.ALUMNO_KEY % 3 = 0 THEN 6.8 -- PERFIL: El Artista/Deportista
            WHEN M.ASIG IN (1,6) AND A.ALUMNO_KEY % 4 = 0 THEN 3.0      -- PERFIL: Dificultad con Números
            ELSE 4.8 -- PERFIL: Promedio General
        END AS NotaBase,
        -- Ruido aleatorio pequeño (-0.5 a +0.5) para que no sea una nota plana
        (CAST(ABS(CHECKSUM(NEWID())) % 11 AS FLOAT) - 5) / 10.0 AS Ruido
    FROM [dbo].[DIM_ALUMNO] A
    CROSS JOIN MapeoAcademico M
    CROSS JOIN Evaluaciones E
    INNER JOIN [dbo].[DIM_CALENDARIO] C ON MONTH(C.FECHA_COMPLETA) = E.Mes 
                                      AND DAY(C.FECHA_COMPLETA) = E.Dia
                                      AND C.ANIO = 2025
)
INSERT INTO [dbo].[FACT_CALIFICACION] 
    ([ALUMNO_KEY], [DOCENTE_KEY], [ASIGNATURA_KEY], [SEMESTRE_KEY], [CALENDARIO_KEY], [NOTA], [PONDERACION])
SELECT 
    ALUMNO_KEY,
    DOC,
    ASIG,
    SEMESTRE,
    CALENDARIO_KEY,
    -- Limitar nota entre 1.0 y 7.0
    CASE 
        WHEN (NotaBase + Ruido) > 7.0 THEN 7.0
        WHEN (NotaBase + Ruido) < 1.0 THEN 1.0
        ELSE (NotaBase + Ruido)
    END AS NOTA,
    POND
FROM Universo;

GO