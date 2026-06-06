DECLARE @sql NVARCHAR(MAX) = N'';

-- Genera un comando DROP CONSTRAINT por cada llave foránea que encuentre
SELECT @sql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) 
             + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) 
             + ' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.foreign_keys;

-- Ejecuta el comando
EXEC sp_executesql @sql;

PRINT 'Todas las llaves foráneas han sido eliminadas.';
GO