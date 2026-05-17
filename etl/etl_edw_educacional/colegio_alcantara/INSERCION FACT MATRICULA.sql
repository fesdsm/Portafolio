-- ==============================================================================
-- PIPELINE: TRF_Load_Fact_Matricula_Alcantara_Final_2025
-- DESCRIPCIÓN: Carga masiva de hechos omitiendo la columna IDENTITY nativa.
--              Distribuye de manera homogénea 336 alumnos en 12 cursos
--              y días hábiles reales (Feb - Abr) del ciclo escolar 2025.
-- ==============================================================================

-- Operación de limpieza para asegurar pruebas limpias en el entorno de desarrollo
TRUNCATE TABLE [RAW_DATA_ALCANTARA].[dbo].[FACT_MATRICULA];

WITH Calendario_Valido_2025 AS (
    -- Paso 1: Filtramos rigurosamente los días hábiles del rango solicitado
    SELECT 
        Dim_Calendario.CALENDARIO_KEY,
        -- Generamos un índice secuencial limpio sobre los días hábiles reales
        ROW_NUMBER() OVER (ORDER BY Dim_Calendario.CALENDARIO_KEY) AS Linea_Fecha_Numero
    FROM 
        [RAW_DATA_ALCANTARA].[dbo].[DIM_CALENDARIO] AS Dim_Calendario
    WHERE 
        Dim_Calendario.ANIO = 2025
        AND Dim_Calendario.ES_DIA_HABIL = 1
        AND Dim_Calendario.MES_NOMBRE IN ('FEBRERO', 'MARZO', 'ABRIL')
),

Total_Dias_Disponibles AS (
    -- Paso 2: Contabilizamos dinámicamente los días para la distribución modular
    SELECT COUNT(*) AS Cantidad_Dias_Habiles FROM Calendario_Valido_2025
),

Alumnos_Preparados AS (
    -- Paso 3: Extraemos el universo real de alumnos usando su clave subrogada existente
    SELECT 
        Dim_Alumno.ALUMNO_KEY,
        -- Índice secuencial para asegurar la correcta dispersión cíclica
        ROW_NUMBER() OVER (ORDER BY Dim_Alumno.ALUMNO_KEY) AS Linea_Alumno_Numero
    FROM 
        [RAW_DATA_ALCANTARA].[dbo].[DIM_ALUMNO] AS Dim_Alumno
)

-- NOTA DE DISEÑO: Omitimos por completo la columna [MATRICULA_KEY] 
-- para permitir que el motor auto-genere la secuencia sin conflictos.
INSERT INTO [RAW_DATA_ALCANTARA].[dbo].[FACT_MATRICULA] (
    [COLEGIO_KEY],
    [ALUMNO_KEY],
    [CURSO_KEY],
    [CALENDARIO_KEY],
    [MONTO_MATRICULA]
)
SELECT 
    1 AS COLEGIO_KEY, -- Clave asignada de forma fija para COLEGIO ALCANTARA
    Alumnos_Preparados.ALUMNO_KEY AS ALUMNO_KEY,
    
    -- Distribución Homogénea de Cursos: Al usar el residuo del índice (% 12),
    -- distribuimos con precisión matemática exactamente 28 alumnos por cada uno de los 12 cursos.
    CAST(((Alumnos_Preparados.Linea_Alumno_Numero - 1) % 12) + 1 AS INT) AS CURSO_KEY,
    
    -- Distribución Temporal de Matrículas: Reparte cíclicamente a los alumnos a lo largo
    -- de las fechas hábiles filtradas para evitar concentraciones artificiales de datos.
    Calendario_Valido_2025.CALENDARIO_KEY AS CALENDARIO_KEY,
    
    15000 AS MONTO_MATRICULA -- Tarifa de matrícula estandarizada provisional
FROM 
    Alumnos_Preparados
CROSS JOIN 
    Total_Dias_Disponibles
INNER JOIN 
    Calendario_Valido_2025 
    ON Calendario_Valido_2025.Linea_Fecha_Numero = ((Alumnos_Preparados.Linea_Alumno_Numero - 1) % Total_Dias_Disponibles.Cantidad_Dias_Habiles) + 1;