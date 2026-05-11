USE [RAW_DATA_ALCANTARA]
GO

TRUNCATE TABLE [dbo].[FACT_ASISTENCIA];

-- Usamos un CTE para preparar los datos antes del INSERT
WITH BaseAsistencia AS (
    SELECT 
        A.ALUMNO_KEY,
        ((A.ALUMNO_KEY - 1) / 28) + 1 AS CURSO_KEY, -- Agrupación exacta de 28 alumnos por curso
        C.CALENDARIO_KEY,
        C.FECHA_COMPLETA
    FROM [dbo].[DIM_ALUMNO] A
    CROSS JOIN [dbo].[DIM_CALENDARIO] C
    WHERE C.ES_DIA_HABIL = 1 
      AND C.FECHA_COMPLETA BETWEEN '2025-03-01' AND '2025-07-15' -- Semestre 1 completo
)
INSERT INTO [dbo].[FACT_ASISTENCIA] ([ALUMNO_KEY], [CURSO_KEY], [CALENDARIO_KEY], [HORA_ENTRADA], [PRESENTE], [JUSTIFICADO])
SELECT 
    ALUMNO_KEY,
    CURSO_KEY,
    CALENDARIO_KEY,
    -- 1. LÓGICA DE HORARIOS (PERFILES)
    CASE 
        WHEN ALUMNO_KEY % 15 = 7 THEN '08:25:00' -- PERFIL: El "Atrasado Crónico" (Llega siempre 25 min tarde)
        WHEN ALUMNO_KEY % 15 = 1 THEN '07:45:00' -- PERFIL: El "Madrugador" (Llega siempre 15 min antes)
        ELSE '08:00:00'                         -- PERFIL: El resto (Puntual)
    END AS HORA_ENTRADA,

    -- 2. LÓGICA DE PRESENCIA (PERFILES)
    CASE 
        WHEN ALUMNO_KEY % 20 = 0 THEN 
            CASE WHEN DAY(FECHA_COMPLETA) % 5 = 0 THEN 0 ELSE 1 END -- PERFIL: El que falta todos los viernes o días específicos
        WHEN ALUMNO_KEY % 30 = 5 THEN 0                             -- PERFIL: El que abandonó el colegio (Ausente 100%)
        ELSE 1                                                      -- PERFIL: Asistencia normal
    END AS PRESENTE,

    -- 3. LÓGICA DE JUSTIFICACIÓN
    CASE 
        WHEN ALUMNO_KEY % 20 = 0 AND DAY(FECHA_COMPLETA) % 5 = 0 THEN 1 -- Sus faltas son justificadas
        ELSE 0 
    END AS JUSTIFICADO
FROM BaseAsistencia;

GO