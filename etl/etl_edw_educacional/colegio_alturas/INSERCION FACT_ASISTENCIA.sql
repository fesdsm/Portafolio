USE [RAW_DATA_ALTURAS]
GO

-- Limpieza inicial idempotente para habilitar ejecuciones repetitivas en desarrollo
TRUNCATE TABLE [dbo].[FACT_ASISTENCIA];
GO

-- Capa 1: Preparación matricial y cálculo seguro de llaves de cursos
WITH Generacion_Base AS (
    SELECT 
        Dim_Alumno.ALUMNO_KEY,
        -- SOLUCIÓN AL ERROR 547: Reemplazamos la división por aritmética modular.
        -- Esto asegura que las llaves resultantes oscilen estrictamente entre 1 y 12.
        CAST(((Dim_Alumno.ALUMNO_KEY - 1) % 12) + 1 AS INT) AS CURSO_KEY, 
        Dim_Calendario.CALENDARIO_KEY,
        Dim_Calendario.FECHA_COMPLETA
    FROM [dbo].[DIM_ALUMNO] AS Dim_Alumno
    CROSS JOIN [dbo].[DIM_CALENDARIO] AS Dim_Calendario
    WHERE Dim_Calendario.ES_DIA_HABIL = 1 
      AND Dim_Calendario.FECHA_COMPLETA BETWEEN '2025-03-01' AND '2025-07-15' -- Semestre 1 completo
),

-- Capa 2: Evaluación perimetral de estados analíticos basada en el perfil del Alumno
Calculo_Estados AS (
    SELECT 
        Generacion_Base.ALUMNO_KEY,
        Generacion_Base.CURSO_KEY,
        Generacion_Base.CALENDARIO_KEY,
        Generacion_Base.FECHA_COMPLETA,
        
        -- PERFILES DE ASISTENCIA
        CASE 
            WHEN Generacion_Base.ALUMNO_KEY % 20 = 0 THEN 
                CASE WHEN DAY(Generacion_Base.FECHA_COMPLETA) % 5 = 0 THEN 0 ELSE 1 END -- Ausente recurrente
            WHEN Generacion_Base.ALUMNO_KEY % 30 = 5 THEN 0                                 -- Desertor (100% ausente)
            ELSE 1                                                                         -- Asistencia estándar
        END AS PRESENTE,
        
        -- PERFILES DE JUSTIFICACIÓN
        CASE 
            WHEN Generacion_Base.ALUMNO_KEY % 20 = 0 AND DAY(Generacion_Base.FECHA_COMPLETA) % 5 = 0 THEN 1 
            ELSE 0 
        END AS JUSTIFICADO
    FROM Generacion_Base
)

-- Inserción explícita en la tabla de hechos omitiendo el campo IDENTITY autónomo
INSERT INTO [dbo].[FACT_ASISTENCIA] (
    [ALUMNO_KEY], 
    [CURSO_KEY], 
    [CALENDARIO_KEY], 
    [HORA_ENTRADA], 
    [PRESENTE], 
    [JUSTIFICADO]
)
SELECT 
    Calculo_Estados.ALUMNO_KEY AS ALUMNO_KEY,
    Calculo_Estados.CURSO_KEY AS CURSO_KEY,
    Calculo_Estados.CALENDARIO_KEY AS CALENDARIO_KEY,
    
    -- LÓGICA DE HORARIOS: Evita inconsistencias forzando '00:00:00' en las ausencias
    CAST(CASE 
        WHEN Calculo_Estados.PRESENTE = 0 THEN '00:00:00'
        WHEN Calculo_Estados.ALUMNO_KEY % 15 = 7 THEN '08:25:00' -- Perfil: Atrasado Crónico
        WHEN Calculo_Estados.ALUMNO_KEY % 15 = 1 THEN '07:45:00' -- Perfil: Madrugador
        ELSE '08:00:00'                                         -- Perfil: Puntual
    END AS TIME) AS HORA_ENTRADA,
    
    Calculo_Estados.PRESENTE AS PRESENTE,
    Calculo_Estados.JUSTIFICADO AS JUSTIFICADO
FROM 
    Calculo_Estados;
GO