USE [RAW_DATA_ALTURAS]
GO

TRUNCATE TABLE [dbo].[FACT_ASISTENCIA];

-- 1. Preparamos la base de datos con los cruces necesarios
WITH UniversoAsistencia AS (
    SELECT 
        A.ALUMNO_KEY,
        -- Lógica para asignar curso según los bloques de IDs que enviaste
        CASE 
            WHEN A.ALUMNO_KEY <= 401 THEN ((A.ALUMNO_KEY - 1) / 34) + 1  -- Bloque 1 (Cursos 1-12)
            ELSE ((A.ALUMNO_KEY - 1002) / 34) + 1002                   -- Bloque 2 (Cursos 1002-1013)
        END AS CURSO_KEY,
        C.CALENDARIO_KEY,
        C.FECHA_COMPLETA,
        -- Generamos un número aleatorio por cada fila (0 a 99) para decidir el destino
        ABS(CHECKSUM(NEWID())) % 100 AS ProbabilidadFila
    FROM [dbo].[DIM_ALUMNO] A
    CROSS JOIN [dbo].[DIM_CALENDARIO] C
    WHERE C.ES_DIA_HABIL = 1 
      AND C.FECHA_COMPLETA BETWEEN '2025-03-01' AND '2025-06-30' -- Semestre académico
)
INSERT INTO [dbo].[FACT_ASISTENCIA] ([ALUMNO_KEY], [CURSO_KEY], [CALENDARIO_KEY], [HORA_ENTRADA], [PRESENTE], [JUSTIFICADO])
SELECT 
    ALUMNO_KEY,
    CURSO_KEY,
    CALENDARIO_KEY,
    
    -- 1. LÓGICA DE HORA DE ENTRADA (DINÁMICA)
    CASE 
        -- PERFIL: "Los impuntuales frecuentes" (Alumnos ID terminados en 3 o 8)
        -- Tienen un 70% de probabilidad de llegar tarde, pero un 30% llegan a tiempo.
        WHEN ALUMNO_KEY % 5 = 3 AND ProbabilidadFila < 70 
             THEN DATEADD(MINUTE, (ProbabilidadFila % 25) + 5, '08:00:00') -- Llegan entre 5 y 30 min tarde
             
        -- PERFIL: "Los madrugadores" (Alumnos ID terminados en 0)
        -- Llegan siempre entre 10 y 20 minutos antes.
        WHEN ALUMNO_KEY % 10 = 0 
             THEN DATEADD(MINUTE, - (ProbabilidadFila % 15 + 5), '08:00:00')
             
        -- RESTO: Puntualidad normal (variación de +/- 5 minutos)
        ELSE DATEADD(MINUTE, (ProbabilidadFila % 10 - 5), '08:00:00')
    END AS HORA_ENTRADA,

    -- 2. LÓGICA DE PRESENCIA (DINÁMICA)
    CASE 
        -- PERFIL: "Salud Delicada" (Alumnos ID múltiplos de 12)
        -- Faltan el 20% de las veces, pero casi siempre justifican (ver lógica abajo).
        WHEN ALUMNO_KEY % 12 = 0 AND ProbabilidadFila < 20 THEN 0
        
        -- PERFIL: "Riesgo de Deserción" (Alumnos ID terminados en 66 o 99)
        -- Tienen un 60% de inasistencia.
        WHEN ALUMNO_KEY % 50 = 6 AND ProbabilidadFila < 60 THEN 0
        
        -- Falta aleatoria técnica (1% para cualquier alumno por imprevistos)
        WHEN ProbabilidadFila = 99 THEN 0
        
        ELSE 1 
    END AS PRESENTE,

    -- 3. LÓGICA DE JUSTIFICACIÓN
    CASE 
        -- Si el alumno no está presente y es del perfil "Salud Delicada", justifica el 90% de las veces.
        WHEN ALUMNO_KEY % 12 = 0 AND ProbabilidadFila < 20 THEN 1
        
        -- El resto de los mortales solo justifica el 10% de sus faltas.
        WHEN ProbabilidadFila < 10 THEN 1 
        
        ELSE 0 
    END AS JUSTIFICADO
FROM UniversoAsistencia;