-- ==============================================================================
-- CARGA DE DATOS RAW: COLEGIO ALCÁNTARA (ETL STAGE)
-- Total registros generados: 336 (Distribuidos en 12 cursos virtuales)
-- Nivel Educacional: 1° a 4° Medio (Colegio Mixto)
-- ==============================================================================

-- ==========================================================
-- 1° MEDIO A (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('23456789-0', 'Valentina', 'González', 'Muñoz', '2010-05-14', 'Femenino'),
('23567890-1', '  Tomás Ignacio ', 'Rojas', 'Díaz', '14-05-2010', 'M'),
('23678901-2', 'isidora paz', 'Pérez', NULL, '2010-06-22', 'Mujer'),
('23789012-3', 'SOFIA ANTONIA', 'Soto', 'Contreras', '1900-01-01 00:00:00.000', 'f'),
('23890123-4', 'Matias Alonso', 'Silva', 'Martínez', '2010-08-11', 'Masculino'),
('23901234-5', 'Florencia Antonia', 'Sepúlveda', 'Morales', '11-08-2010', 'F'),
('24012345-6', 'Joaquin Andrés', 'Rodríguez', 'Gómez', '?', 'M'),
('24123456-7', 'Catalina Ignacia', 'López', '?', '03-09-2010', 'Femenino'),
('24234567-8', 'Diego Armando', 'Cabrera', 'Reyes', '2010-10-15', 'Hombre'),
('24345678-9', '  María de los Ángeles  ', 'Cruz', 'Herrera', '15-10-2010', 'F'),
('24456789-K', 'Benjamín Arturo', NULL, 'Araya', '2010-11-20', 'Masculino'),
('24567890-0', 'Constanza Andrea', 'Molina', 'Castro', '2010-12-05', 'F'),
('24678901-1', 'paula belén', 'Ortiz', 'Rubio', '05-12-2010', 'Mujer'),
('24789012-2', 'Daniel Esteban', 'Vargas', 'Ramos', '2010-01-18', 'm'), 
('24890123-3', 'Romina Andrea del Pilar', 'Gutiérrez', NULL, '18-01-2010', 'Femenino'),
('24901234-4', 'Renata paz', 'Navarro', 'Salazar', '2010-02-25', 'F'),
('25012345-5', 'Amalia', 'Figueroa', 'Vera', '25-02-2010', 'Femenino'),
('25123456-6', 'Vicente patricio', 'Vergara', 'Pizarro', '1900-01-01 00:00:00.000', 'Hombre'),
('25234567-7', 'Maite Antonia Paz', '?', 'Bravo', '2010-04-10', 'F'),
('25345678-8', 'Lucas Mateo', 'Valdés', 'Cáceres', '10-04-2010', 'M'),
('25456789-9', 'Amanda', 'Pino', 'Lagos', '2010-07-07', 'F'),
('25567890-K', 'Ignacio José', 'Zúñiga', 'Méndez', '2010/07/07', 'Masculino'), 
('25678901-0', 'Victoria Eugenia de la Cruz', 'Acuña', 'Fuentes', '2010-08-30', 'Femenino'),
('25789012-1', 'Maximiliano Alejandro', 'Salinas', 'Pardo', '30-08-2010', 'Hombre'),
('25890123-2', 'Emilia', 'Orellana', NULL, '?', 'F'),
('25901234-3', 'Pascuala Ignacia', 'Carrasco', 'Osorio', '2010-11-12', 'Femenino'),
('26012345-4', 'Antonella Mía', 'Bustamante', 'Ponce', '12-11-2010', 'F'),
('26123456-5', 'Martín Elías', 'Mancilla', 'San Martín', '2010-12-28', 'M');

-- ==========================================================
-- 1° MEDIO B (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('26234567-3', 'Luz María', 'Sánchez', 'Tapia', '2010-01-05', 'F'),
('26345678-1', ' Mía antonia', 'Garrido', 'Cárdenas', '05-01-2010', 'Mujer'),
('26456789-K', 'Sebastián Andrés', NULL, 'Aguilar', '2010-02-14', 'Masculino'),
('26567890-3', 'Isabella Sofía', 'Sanhueza', 'Espinoza', '1900-01-01 00:00:00.000', 'F'),
('26678901-1', 'Nicolás Ignacio', 'Urrutia', 'Vidal', '2010-03-22', 'Masculino'), 
('26789012-K', 'Julieta', 'Arriagada', 'Peña', '22-03-2010', 'F'),
('26890123-8', 'Laura Paz', 'Cerda', '?', '2010-04-30', 'Femenino'),
('27001234-6', 'GABRIEL OMAR', 'Alvarado', 'Santibáñez', '30-04-2010', 'Hombre'),
('27112345-4', 'Magdalena', 'Cortes', 'Venegas', '2010-05-18', 'F'),
('27223456-2', 'Consuelo de los Ángeles', 'Valenzuela', 'Maldonado', '2010-06-25', 'Femenino'),
('27334567-0', 'Felipe Antonio', 'Céspedes', 'Arancibia', '25-06-2010', 'M'),
('27445678-9', 'macarena paz', 'Escobar', 'Arias', '2010-07-14', 'f'),
('27556789-7', 'Dominga', 'Paredes', 'Leal', '14-07-2010', 'Femenino'),
('27667890-5', 'Clara Inés', 'Navarrete', NULL, '2010-08-09', 'Mujer'),
('27778901-3', 'Cristóbal Alonso', 'Ruiz', 'Becerra', '1900-01-01 00:00:00.000', 'M'),
('27889012-1', 'Blanca Estela', 'Pacheco', 'Castillo', '2010-09-02', 'Femenino'),
('27990123-K', 'Ángela', 'Cárdenas', 'Galdames', '02-09-2010', 'F'),
('28101234-8', 'Arturo Prat', '?', 'Cisternas', '2010-10-11', 'Masculino'),
('28212345-6', 'Amparo del Carmen', 'Olivares', 'Riquelme', '11-10-2010', 'Mujer'),
('28323456-4', 'Paz', 'Gallardo', 'Mesa', '2010-11-08', 'F'),
('28434567-2', '  Sofia Leonor', 'Álvarez', 'Araya', '2010-12-16', 'Femenino'),
('28545678-0', 'Guillermo Enrique', 'Toledo', 'Zamorano', '16-12-2010', 'Hombre'),
('28656789-9', 'Celeste Trinidad', 'Godoy', 'Saavedra', '2010-01-28', 'F'), 
('28767890-7', 'Ema Lucía', 'Miranda', 'Parra', '28-01-2010', 'Femenino'),
('28878901-5', 'Agustina del Pilar', 'Carmona', 'Mora', '2010-02-04', 'Mujer'),
('28989012-3', 'Belen Andrea', 'Oyarzún', 'Marín', '04-02-2010', 'F'),
('29090123-1', 'Emilio José', 'Guzmán', NULL, '2010-03-15', 'M'),
('29201234-K', 'Gracia', 'Correa', 'Salazar', '15-03-2010', 'F');

-- ==========================================================
-- 1° MEDIO C (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('23811111-0', 'Isabel Margarita', 'Donoso', 'Montes', '2010-05-09', 'Femenino'),
('23822222-1', 'CAROLINA ANDREA', 'Lira', 'Baeza', '09-05-2010', 'F'),
('23833333-2', 'Bruno Marcelo', 'Poblete', 'Alarcón', '2010-06-17', 'Hombre'),
('23844444-3', 'Ana', 'Rivera', 'Castañeda', '?', 'F'),
('23855555-4', 'Loreto Paz', '?', 'Lagos', '2010-08-05', 'Femenino'),
('23866666-5', 'Alejandro Magno', 'Maldonado', 'Fuenzalida', '05-08-2010', 'Masculino'),
('23877777-6', 'Natalia del Carmen', 'Valdés', 'Ríos', '2010-09-14', 'Femenino'), 
('23888888-7', 'Melissa', 'Alarcón', 'San Martín', '14-09-2010', 'Femenino'),
('23899999-8', 'Simón Pedro', 'Cáceres', NULL, '1900-01-01 00:00:00.000', 'M'),
('23911111-9', 'Samantha', 'Garrido', 'Soto', '2010-11-02', 'Mujer'),
('23922222-K', 'Alison Marie', 'Pérez', 'Pérez', '02-11-2010', 'Femenino'),
('23933333-0', 'Dania Javiera', 'González', 'González', '2010-12-21', 'F'),
('23944444-1', '  Pedro Pablo', 'Díaz', 'Díaz', '21-12-2010', 'M'), 
('23955555-2', 'tania lorenza', 'Rojas', 'Muñoz', '2010-01-10', 'Femenino'),
('23966666-3', 'Karla Patricia', 'Muñoz', 'Rojas', '10-01-2010', 'F'),
('23977777-4', 'Alonso Mateo', 'Silva', 'Tapia', '2010-02-19', 'Hombre'),
('23988888-5', 'Tatiana', 'Soto', '?', '19-02-2010', 'Femenino'),
('23999999-6', 'Fabiola Macarena', 'Contreras', 'Vergara', '2010-03-31', 'F'),
('24011111-7', 'Yasna provoste', 'Martínez', 'Zúñiga', '31-03-2010', 'Femenino'),
('24022222-8', 'Ignacio José de la Cruz', 'Sepúlveda', 'Pino', '1900-01-01 00:00:00.000', 'M'),
('24033333-9', 'Marcela', NULL, 'Acuña', '2010-05-13', 'Mujer'),
('24044444-0', 'Claudia Andrea', 'Morales', 'Cabrera', '13-05-2010', 'Femenino'),
('24055555-1', 'Andrea Paz', 'Rodríguez', 'Navarro', '2010-06-08', 'F'),
('24066666-2', 'Pablo Andrés', 'López', 'Figueroa', '08-06-2010', 'm'), 
('24077777-3', 'Ximena del Pilar', 'Gómez', 'Reyes', '2010-07-27', 'Femenino'),
('24088888-4', 'Verónica Isabel', 'Herrera', 'Orellana', '27-07-2010', 'F'),
('24099999-5', 'Cecilia', 'Araya', 'Cortes', '2010-08-15', 'Mujer'),
('24111111-6', 'Hugo Boss', 'Castro', NULL, '15-08-2010', 'M');

-- ==========================================================
-- 2° MEDIO A (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('22456789-0', 'Antonia Belén', 'Pérez', 'García', '2009-05-14', 'Femenino'),
('22567890-1', ' Catalina Paz ', 'González', 'Martínez', '14-05-2009', 'F'),
('22678901-2', 'isidora ignacia', 'Muñoz', NULL, '2009-06-22', 'Mujer'),
('22789012-3', 'SOFIA ANTONIA', 'Rojas', 'Díaz', '1900-01-01 00:00:00.000', 'f'),
('22890123-4', 'Martina Jesús', 'Díaz', 'Pérez', '2009-08-11', 'Femenino'),
('22901234-5', 'Florencia de los Ángeles', 'Soto', 'Soto', '11-08-2009', 'F'),
('23012345-6', 'Camila Andrea', 'Contreras', 'Contreras', '2009-09-03', 'Femenino'), 
('23123456-7', 'Valentina', 'Silva', '?', '03-09-2009', 'Femenino'),
('23234567-8', 'Javiera Paz', 'Martínez', 'Silva', '2009-10-15', 'Mujer'),
('23345678-9', '  Maximiliano Andrés  ', 'Sepúlveda', 'Sepúlveda', '15-10-2009', 'M'),
('23456789-X', 'Fernanda Luisa', NULL, 'López', '2009-11-20', 'Femenino'),
('23567890-0', 'Constanza del Pilar', 'Morales', 'Cabrera', '2009-12-05', 'F'),
('23678901-1', 'paula', 'Gómez', 'Reyes', '05-12-2009', 'Mujer'),
('23789012-2', 'Daniela Carolina', 'López', 'Herrera', '2009-01-18', 'F'), 
('23890123-3', 'Romina Paz', 'Cabrera', NULL, '18-01-2009', 'Femenino'),
('23901234-4', 'Renata Catalina', 'Reyes', 'Araya', '2009-02-25', 'F'),
('24012345-5', 'Amalia Inés', 'Herrera', 'Castro', '25-02-2009', 'Femenino'),
('24123456-6', 'Trinidad María', 'Araya', 'Rubio', '1900-01-01 00:00:00.000', 'Mujer'),
('24234567-7', 'Maite Alejandra', '?', 'Ramos', '2009-04-10', 'F'),
('24345678-8', 'Josefa', 'Rubio', 'Gutiérrez', '10-04-2009', 'Femenino'),
('24456789-9', 'Amanda Isabel', 'Ramos', 'Salazar', '2009-07-07', 'F'),
('24567890-K', 'Ignacia Francisca', 'Gutiérrez', 'Vera', '2009/07/07', 'F'), 
('24678901-0', 'Jorge Luis', 'Salazar', 'Pizarro', '2009-08-30', 'Masculino'),
('24789012-1', 'Bárbara Sofía', 'Vera', 'Bravo', '30-08-2009', 'Mujer'),
('24890123-2', 'Emilia Victoria', 'Pizarro', NULL, '?', 'F'),
('24901234-3', 'Pascuala Valentina', 'Bravo', 'Cáceres', '2009-11-12', 'Femenino'),
('25012345-4', 'Antonella del Carmen Paz', 'Cáceres', 'Lagos', '12-11-2009', 'F'),
('25123456-5', 'Rocío', 'Lagos', 'Méndez', '2009-12-28', 'Femenino');

-- ==========================================================
-- 2° MEDIO B (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('21123456-0', 'Esteban Arturo', 'Méndez', 'Fuentes', '2009-01-05', 'Masculino'),
('21234567-1', ' Mía isabella', 'Fuentes', 'Pardo', '05-01-2009', 'Mujer'),
('21345678-2', 'Elena Beatriz', NULL, 'Orellana', '2009-02-14', 'Femenino'),
('21456789-3', 'Isabella Victoria', 'Pardo', 'Osorio', '1900-01-01 00:00:00.000', 'F'),
('21567890-4', 'Colomba', 'Orellana', 'Ponce', '2009-03-22', 'F'), 
('21678901-5', 'Julieta Andrea', 'Osorio', 'San Martín', '22-03-2009', 'F'),
('21789012-6', 'Laura', 'Ponce', '?', '2009-04-30', 'Femenino'),
('21890123-7', 'SAMANTHA IGNACIA', 'San Martín', 'Tapia', '30-04-2009', 'Mujer'),
('21901234-8', 'Magdalena Sofía', 'Sánchez', 'Cárdenas', '2009-05-18', 'F'),
('22012345-9', 'Consuelo', 'Tapia', 'Aguilar', '2009-06-25', 'Femenino'),
('22123456-K', 'Pía Ignacia', 'Cárdenas', 'Espinoza', '25-06-2009', 'F'),
('22234567-0', 'macarena paz', 'Aguilar', 'Vidal', '2009-07-14', 'Femenino'), 
('22345678-1', 'Dominga Antonella', 'Espinoza', 'Peña', '14-07-2009', 'Femenino'),
('22456789-2', 'Rodrigo Andrés', 'Vidal', NULL, '2009-08-09', 'Hombre'),
('22567890-3', 'Leonor de la Cruz', 'Peña', 'Santibáñez', '1900-01-01 00:00:00.000', 'F'),
('22678901-4', 'Blanca Nieves', 'Alvarado', 'Venegas', '2009-09-02', 'Femenino'),
('22789012-5', 'Ángela Patricia', 'Santibáñez', 'Maldonado', '02-09-2009', 'F'),
('22890123-6', 'Rosario Macarena', '?', 'Arancibia', '2009-10-11', 'Femenino'),
('23001234-7', 'Amparo', 'Maldonado', 'Arias', '11-10-2009', 'Mujer'),
('23112345-8', 'Paz Belén', 'Arancibia', 'Leal', '2009-11-08', 'F'),
('23223456-9', '  Sofia Esperanza', 'Arias', 'Becerra', '2009-12-16', 'Femenino'),
('23334567-K', 'Guillermina del Carmen', 'Leal', 'Castillo', '16-12-2009', 'F'),
('23445678-0', 'Celeste', 'Becerra', 'Galdames', '2009-01-28', 'Femenino'), 
('23556789-1', 'Ema Catalina', 'Castillo', 'Cisternas', '28-01-2009', 'Femenino'),
('23667890-2', 'Agustina del Pilar', 'Galdames', 'Riquelme', '2009-02-04', 'Mujer'),
('23778901-3', 'Mauricio Alejandro', 'Cisternas', 'Mesa', '04-02-2009', 'M'),
('23889012-4', 'Esperanza', 'Riquelme', NULL, '2009-03-15', 'Femenino'),
('23990123-5', 'Gracia María', 'Mesa', 'Araya', '15-03-2009', 'F');

-- ==========================================================
-- 2° MEDIO C (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('21000001-1', 'Alejandro Magno', 'Zamorano', 'Saavedra', '2009-05-09', 'Masculino'),
('21000002-2', 'CAROLINA ANDREA', 'Álvarez', 'Parra', '09-05-2009', 'F'),
('21000003-3', 'Beatriz Isabel', 'Zamorano', 'Mora', '2009-06-17', 'Mujer'),
('21000004-4', 'Ana Paula', 'Saavedra', 'Marín', '?', 'F'),
('21000005-5', 'Loreto', '?', 'Salazar', '2009-08-05', 'Femenino'),
('21000006-6', 'Alejandra del Pilar', 'Mora', 'Villegas', '05-08-2009', 'F'),
('21000007-7', 'Natalia Carolina', 'Marín', 'Montes', '2009-09-14', 'Femenino'), 
('21000008-8', 'Melissa Andrea', 'Guzmán', 'Baeza', '14-09-2009', 'Femenino'),
('21000009-9', 'Vanessa', 'Salazar', NULL, '1900-01-01 00:00:00.000', 'F'),
('21000010-0', 'Samantha Belén', 'Correa', 'Alarcón', '2009-11-02', 'Mujer'),
('21000011-1', 'Alison Marie', 'Villegas', 'Castañeda', '02-11-2009', 'Femenino'),
('21000012-2', 'Dania Javiera', 'Medina', 'Lagos', '2009-12-21', 'F'),
('21000013-3', '  Paula Francisca', 'Montes', 'Fuenzalida', '21-12-2009', 'Femenino'), 
('21000014-4', 'tania', 'Vidal', 'Ríos', '2009-01-10', 'Femenino'),
('21000015-5', 'Karla Patricia', 'Baeza', 'San Martín', '10-01-2009', 'F'),
('21000016-6', 'Karen Andrea', 'Donoso', 'Soto', '2009-02-19', 'Mujer'),
('21000017-7', 'Tatiana', 'Alarcón', '?', '19-02-2009', 'Femenino'),
('21000018-8', 'Fabiola Macarena', 'Lira', 'Pérez', '2009-03-31', 'F'),
('21000019-9', 'Luis Alberto', 'Castañeda', 'González', '31-03-2009', 'Hombre'),
('21000020-0', 'Jocelyn de las Mercedes', 'Poblete', 'Díaz', '1900-01-01 00:00:00.000', 'F'),
('21000021-1', 'Marcela', NULL, 'Muñoz', '2009-05-13', 'Mujer'),
('21000022-2', 'Claudia Andrea', 'Rivera', 'Rojas', '13-05-2009', 'Femenino'),
('21000023-3', 'Andrea de la Luz Paz', 'Fuenzalida', 'Tapia', '2009-06-08', 'F'),
('21000024-4', 'Pamela', 'Ríos', 'Vergara', '08-06-2009', 'Femenino'), 
('21000025-5', 'Ximena del Pilar', 'San Martín', 'Zúñiga', '2009-07-27', 'Femenino'),
('21000026-6', 'Víctor Manuel', 'Cáceres', 'Pino', '27-07-2009', 'm'),
('21000027-7', 'Cecilia Andrea', 'Garrido', 'Acuña', '2009-08-15', 'Mujer'),
('21000028-8', 'Margarita Rosa', 'Soto', NULL, '15-08-2009', 'Femenino');

-- ==========================================================
-- 3° MEDIO A (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('20123456-0', 'Antonia Belén', 'Pérez', 'García', '2008-05-14', 'Femenino'),
('20234567-1', ' Catalina de los Reyes ', 'González', 'Martínez', '14-05-2008', 'F'),
('20345678-2', 'isidora', 'Muñoz', NULL, '2008-06-22', 'Mujer'),
('20456789-3', 'SOFIA ANTONIA', 'Rojas', 'Díaz', '1900-01-01 00:00:00.000', 'f'),
('20567890-4', 'Martina Jesús', 'Díaz', 'Pérez', '2008-08-11', 'Femenino'),
('20678901-5', 'Florencia del Carmen', 'Soto', 'Soto', '11-08-2008', 'F'),
('20789012-6', 'Cristian', 'Contreras', 'Contreras', '2008-09-03', 'M'), 
('20890123-7', 'Valentina', 'Silva', '?', '03-09-2008', 'Femenino'),
('20901234-8', 'Javiera Ignacia', 'Martínez', 'Silva', '2008-10-15', 'Mujer'),
('21012345-9', '  Eduardo Andrés  ', 'Sepúlveda', 'Sepúlveda', '15-10-2008', 'Masculino'),
('21123456-X', 'Fernanda Luisa', NULL, 'López', '2008-11-20', 'Femenino'),
('21234567-0', 'Constanza Andrea', 'Morales', 'Cabrera', '2008-12-05', 'F'),
('21345678-1', 'paula', 'Gómez', 'Reyes', '05-12-2008', 'Mujer'),
('21456789-2', 'Daniela Paz', 'López', 'Herrera', '2008-01-18', 'Femenino'), 
('21567890-3', 'Romina', 'Cabrera', NULL, '18-01-2008', 'Femenino'),
('21678901-4', 'Renata del Pilar', 'Reyes', 'Araya', '2008-02-25', 'F'),
('21789012-5', 'Amalia Inés', 'Herrera', 'Castro', '25-02-2008', 'Femenino'),
('21890123-6', 'Trinidad María', 'Araya', 'Rubio', '1900-01-01 00:00:00.000', 'Mujer'),
('21901234-7', 'Maite Alejandra', '?', 'Ramos', '2008-04-10', 'F'),
('22012345-8', 'Josefa Ignacia', 'Rubio', 'Gutiérrez', '10-04-2008', 'Femenino'),
('22123456-9', 'Rafael Ángel', 'Ramos', 'Salazar', '2008-07-07', 'Hombre'),
('22234567-K', 'Ignacia Francisca', 'Gutiérrez', 'Vera', '2008/07/07', 'F'), 
('22345678-0', 'Victoria Eugenia', 'Salazar', 'Pizarro', '2008-08-30', 'Femenino'),
('22456789-1', 'Bárbara', 'Vera', 'Bravo', '30-08-2008', 'Mujer'),
('22567890-2', 'Emilia Victoria', 'Pizarro', NULL, '?', 'F'),
('22678901-3', 'Pascuala Valentina', 'Bravo', 'Cáceres', '2008-11-12', 'Femenino'),
('22789012-4', 'Antonella del Carmen', 'Cáceres', 'Lagos', '12-11-2008', 'F'),
('22890123-5', 'Rocío', 'Lagos', 'Méndez', '2008-12-28', 'Femenino');

-- ==========================================================
-- 3° MEDIO B (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('20001234-0', 'Luz María', 'Méndez', 'Fuentes', '2008-01-05', 'F'),
('20002345-1', ' Mía isabella', 'Fuentes', 'Pardo', '05-01-2008', 'Mujer'),
('20003456-2', 'Elena Beatriz', NULL, 'Orellana', '2008-02-14', 'Femenino'),
('20004567-3', 'Isabella', 'Pardo', 'Osorio', '1900-01-01 00:00:00.000', 'F'),
('20005678-4', 'Colomba Paz', 'Orellana', 'Ponce', '2008-03-22', 'F'), 
('20006789-5', 'Julieta Andrea', 'Osorio', 'San Martín', '22-03-2008', 'F'),
('20007890-6', 'Laura', 'Ponce', '?', '2008-04-30', 'Femenino'),
('20008901-7', 'SAMANTHA IGNACIA', 'San Martín', 'Tapia', '30-04-2008', 'Mujer'),
('20009012-8', 'Magdalena', 'Sánchez', 'Cárdenas', '2008-05-18', 'F'),
('20010123-9', 'Consuelo de los Ángeles', 'Tapia', 'Aguilar', '2008-06-25', 'Femenino'),
('20011234-K', 'Pía Ignacia', 'Cárdenas', 'Espinoza', '25-06-2008', 'F'),
('20012345-0', 'macarena paz', 'Aguilar', 'Vidal', '2008-07-14', 'Femenino'), 
('20013456-1', 'Dominga Antonella', 'Espinoza', 'Peña', '14-07-2008', 'Femenino'),
('20014567-2', 'Andrés Ignacio', 'Vidal', NULL, '2008-08-09', 'Masculino'),
('20015678-3', 'Leonor de la Cruz', 'Peña', 'Santibáñez', '1900-01-01 00:00:00.000', 'F'),
('20016789-4', 'Blanca Nieves', 'Alvarado', 'Venegas', '2008-09-02', 'Femenino'),
('20017890-5', 'Ángela Patricia', 'Santibáñez', 'Maldonado', '02-09-2008', 'F'),
('20018901-6', 'Rosario Macarena', '?', 'Arancibia', '2008-10-11', 'Femenino'),
('20020012-7', 'Amparo', 'Maldonado', 'Arias', '11-10-2008', 'Mujer'),
('20021123-8', 'Paz Belén', 'Arancibia', 'Leal', '2008-11-08', 'F'),
('20022234-9', '  Sofia Esperanza', 'Arias', 'Becerra', '2008-12-16', 'Femenino'),
('20023345-K', 'Guillermina del Carmen', 'Leal', 'Castillo', '16-12-2008', 'F'),
('20024456-0', 'Celeste', 'Becerra', 'Galdames', '2008-01-28', 'Femenino'), 
('20025567-1', 'Ema Catalina', 'Castillo', 'Cisternas', '28-01-2008', 'Femenino'),
('20026678-2', 'Agustina', 'Galdames', 'Riquelme', '2008-02-04', 'Mujer'),
('20027789-3', 'Belen Andrea', 'Cisternas', 'Mesa', '04-02-2008', 'F'),
('20028890-4', 'Esperanza', 'Riquelme', NULL, '2008-03-15', 'Femenino'),
('20029901-5', 'Gracia María', 'Mesa', 'Araya', '15-03-2008', 'F');

-- ==========================================================
-- 3° MEDIO C (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('20111001-1', 'Isabel Margarita', 'Zamorano', 'Saavedra', '2008-05-09', 'Femenino'),
('20111002-2', 'CAROLINA ANDREA', 'Álvarez', 'Parra', '09-05-2008', 'F'),
('20111003-3', 'Beatriz Isabel', 'Zamorano', 'Mora', '2008-06-17', 'Mujer'),
('20111004-4', 'Ana Paula', 'Saavedra', 'Marín', '?', 'F'),
('20111005-5', 'Loreto Paz', '?', 'Salazar', '2008-08-05', 'Femenino'),
('20111006-6', 'Alejandra', 'Mora', 'Villegas', '05-08-2008', 'F'),
('20111007-7', 'Natalia Carolina', 'Marín', 'Montes', '2008-09-14', 'Femenino'), 
('20111008-8', 'Melissa Andrea', 'Guzmán', 'Baeza', '14-09-2008', 'Femenino'),
('20111009-9', 'Vanessa', 'Salazar', NULL, '1900-01-01 00:00:00.000', 'F'),
('20111010-0', 'Samantha Belén', 'Correa', 'Alarcón', '2008-11-02', 'Mujer'),
('20111011-1', 'Alison Marie', 'Villegas', 'Castañeda', '02-11-2008', 'Femenino'),
('20111012-2', 'Dania Javiera', 'Medina', 'Lagos', '2008-12-21', 'F'),
('20111013-3', '  Paula Francisca', 'Montes', 'Fuenzalida', '21-12-2008', 'Femenino'), 
('20111014-4', 'tania lorenza', 'Vidal', 'Ríos', '2008-01-10', 'Femenino'),
('20111015-5', 'Karla Patricia', 'Baeza', 'San Martín', '10-01-2008', 'F'),
('20111016-6', 'Karen Andrea', 'Donoso', 'Soto', '2008-02-19', 'Mujer'),
('20111017-7', 'Tatiana', 'Alarcón', '?', '19-02-2008', 'Femenino'),
('20111018-8', 'Fabiola Macarena', 'Lira', 'Pérez', '2008-03-31', 'F'),
('20111019-9', 'Héctor Manuel', 'Castañeda', 'González', '31-03-2008', 'Hombre'),
('20111020-0', 'Jocelyn de las Mercedes', 'Poblete', 'Díaz', '1900-01-01 00:00:00.000', 'F'),
('20111021-1', 'Marcela', NULL, 'Muñoz', '2008-05-13', 'Mujer'),
('20111022-2', 'Claudia Andrea', 'Rivera', 'Rojas', '13-05-2008', 'Femenino'),
('20111023-3', 'Andrea Paz', 'Fuenzalida', 'Tapia', '2008-06-08', 'F'),
('20111024-4', 'Pamela', 'Ríos', 'Vergara', '08-06-2008', 'Femenino'), 
('20111025-5', 'Ximena del Pilar', 'San Martín', 'Zúñiga', '2008-07-27', 'Femenino'),
('20111026-6', 'Verónica Isabel', 'Cáceres', 'Pino', '27-07-2008', 'F'),
('20111027-7', 'Cecilia Andrea', 'Garrido', 'Acuña', '2008-08-15', 'Mujer'),
('20111028-8', 'Margarita Rosa', 'Soto', NULL, '15-08-2008', 'Femenino');

-- ==========================================================
-- 4° MEDIO A (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('19123456-0', 'Antonia Belén', 'Pérez', 'García', '2007-05-14', 'Femenino'),
('19234567-1', ' Catalina Paz ', 'González', 'Martínez', '14-05-2007', 'F'),
('19345678-2', 'isidora', 'Muñoz', NULL, '2007-06-22', 'Mujer'),
('19456789-3', 'SOFIA ANTONIA', 'Rojas', 'Díaz', '1900-01-01 00:00:00.000', 'f'),
('19567890-4', 'Martina Jesús', 'Díaz', 'Pérez', '2007-08-11', 'Femenino'),
('19678901-5', 'Florencia de los Ángeles', 'Soto', 'Soto', '11-08-2007', 'F'),
('19789012-6', 'Oscar Rodrigo', 'Contreras', 'Contreras', '2007-09-03', 'M'), 
('19890123-7', 'Valentina', 'Silva', '?', '03-09-2007', 'Femenino'),
('19901234-8', 'Javiera Ignacia', 'Martínez', 'Silva', '2007-10-15', 'Mujer'),
('19012345-9', '  María José  ', 'Sepúlveda', 'Sepúlveda', '15-10-2007', 'F'),
('19123456-X', 'Fernanda Luisa', NULL, 'López', '2007-11-20', 'Femenino'),
('19234567-0', 'Constanza Andrea', 'Morales', 'Cabrera', '2007-12-05', 'F'),
('19345678-1', 'paula belén', 'Gómez', 'Reyes', '05-12-2007', 'Mujer'),
('19456789-2', 'Daniela Carolina', 'López', 'Herrera', '2007-01-18', 'Femenino'), 
('19567890-3', 'Romina Paz', 'Cabrera', NULL, '18-01-2007', 'Femenino'),
('19678901-4', 'Renata Catalina', 'Reyes', 'Araya', '2007-02-25', 'F'),
('19789012-5', 'Amalia Inés', 'Herrera', 'Castro', '25-02-2007', 'Femenino'),
('19890123-6', 'Trinidad María', 'Araya', 'Rubio', '1900-01-01 00:00:00.000', 'Mujer'),
('19901234-7', 'Maite Alejandra', '?', 'Ramos', '2007-04-10', 'F'),
('19012345-8', 'Josefa', 'Rubio', 'Gutiérrez', '10-04-2007', 'Femenino'),
('19123456-9', 'Amanda Isabel', 'Ramos', 'Salazar', '2007-07-07', 'F'),
('19234567-K', 'Ignacia Francisca', 'Gutiérrez', 'Vera', '2007/07/07', 'F'), 
('19345678-0', 'Victoria Eugenia', 'Salazar', 'Pizarro', '2007-08-30', 'Femenino'),
('19456789-1', 'Bárbara Sofía', 'Vera', 'Bravo', '30-08-2007', 'Mujer'),
('19567890-2', 'Gonzalo Esteban', 'Pizarro', NULL, '?', 'Hombre'),
('19678901-3', 'Pascuala Valentina', 'Bravo', 'Cáceres', '2007-11-12', 'Femenino'),
('19789012-4', 'Antonella del Carmen Paz', 'Cáceres', 'Lagos', '12-11-2007', 'F'),
('19890123-5', 'Rocío', 'Lagos', 'Méndez', '2007-12-28', 'Femenino');

-- ==========================================================
-- 4° MEDIO B (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('19111234-0', 'Luz María', 'Méndez', 'Fuentes', '2007-01-05', 'F'),
('19112345-1', ' Mía isabella', 'Fuentes', 'Pardo', '05-01-2007', 'Mujer'),
('19113456-2', 'Elena Beatriz', NULL, 'Orellana', '2007-02-14', 'Femenino'),
('19114567-3', 'Isabella Victoria', 'Pardo', 'Osorio', '1900-01-01 00:00:00.000', 'F'),
('19115678-4', 'Colomba Paz', 'Orellana', 'Ponce', '2007-03-22', 'F'), 
('19116789-5', 'Julieta Andrea', 'Osorio', 'San Martín', '22-03-2007', 'F'),
('19117890-6', 'Laura', 'Ponce', '?', '2007-04-30', 'Femenino'),
('19118901-7', 'SAMANTHA IGNACIA', 'San Martín', 'Tapia', '30-04-2007', 'Mujer'),
('19119012-8', 'Magdalena Sofía', 'Sánchez', 'Cárdenas', '2007-05-18', 'F'),
('19120123-9', 'Consuelo', 'Tapia', 'Aguilar', '2007-06-25', 'Femenino'),
('19121234-K', 'Pía Ignacia', 'Cárdenas', 'Espinoza', '25-06-2007', 'F'),
('19122345-0', 'macarena paz', 'Aguilar', 'Vidal', '2007-07-14', 'Femenino'), 
('19123456-1', 'Dominga Antonella', 'Espinoza', 'Peña', '14-07-2007', 'Femenino'),
('19124567-2', 'Clara Inés', 'Vidal', NULL, '2007-08-09', 'Mujer'),
('19125678-3', 'Leonor de la Cruz', 'Peña', 'Santibáñez', '1900-01-01 00:00:00.000', 'F'),
('19126789-4', 'Blanca Nieves', 'Alvarado', 'Venegas', '2007-09-02', 'Femenino'),
('19127890-5', 'Ángela Patricia', 'Santibáñez', 'Maldonado', '02-09-2007', 'F'),
('19128901-6', 'Iván Zamorano', '?', 'Arancibia', '2007-10-11', 'M'),
('19130012-7', 'Amparo', 'Maldonado', 'Arias', '11-10-2007', 'Mujer'),
('19131123-8', 'Paz Belén', 'Arancibia', 'Leal', '2007-11-08', 'F'),
('19132234-9', '  Sofia Esperanza', 'Arias', 'Becerra', '2007-12-16', 'Femenino'),
('19133345-K', 'Guillermina del Carmen', 'Leal', 'Castillo', '16-12-2007', 'F'),
('19134456-0', 'Celeste', 'Becerra', 'Galdames', '2007-01-28', 'Femenino'), 
('19135567-1', 'Ema Catalina', 'Castillo', 'Cisternas', '28-01-2007', 'Femenino'),
('19136678-2', 'Agustina del Pilar', 'Galdames', 'Riquelme', '2007-02-04', 'Mujer'),
('19137789-3', 'Belen', 'Cisternas', 'Mesa', '04-02-2007', 'F'),
('19138890-4', 'Esperanza', 'Riquelme', NULL, '2007-03-15', 'Femenino'),
('19139901-5', 'Gracia María', 'Mesa', 'Araya', '15-03-2007', 'F');

-- ==========================================================
-- 4° MEDIO C (28 alumnos)
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('19222001-1', 'Isabel Margarita', 'Zamorano', 'Saavedra', '2007-05-09', 'Femenino'),
('19222002-2', 'CAROLINA ANDREA', 'Álvarez', 'Parra', '09-05-2007', 'F'),
('19222003-3', 'Beatriz Isabel', 'Zamorano', 'Mora', '2007-06-17', 'Mujer'),
('19222004-4', 'Ana Paula', 'Saavedra', 'Marín', '?', 'F'),
('19222005-5', 'Loreto Paz', '?', 'Salazar', '2007-08-05', 'Femenino'),
('19222006-6', 'Alejandra del Pilar', 'Mora', 'Villegas', '05-08-2007', 'F'),
('19222007-7', 'Natalia Carolina', 'Marín', 'Montes', '2007-09-14', 'Femenino'), 
('19222008-8', 'Melissa', 'Guzmán', 'Baeza', '14-09-2007', 'Femenino'),
('19222009-9', 'Vanessa', 'Salazar', NULL, '1900-01-01 00:00:00.000', 'F'),
('19222010-0', 'Samantha Belén', 'Correa', 'Alarcón', '2007-11-02', 'Mujer'),
('19222011-1', 'Alison Marie', 'Villegas', 'Castañeda', '02-11-2007', 'Femenino'),
('19222012-2', 'Dania Javiera', 'Medina', 'Lagos', '2007-12-21', 'F'),
('19222013-3', '  Paula Francisca', 'Montes', 'Fuenzalida', '21-12-2007', 'Femenino'), 
('19222014-4', 'tania', 'Vidal', 'Ríos', '2007-01-10', 'Femenino'),
('19222015-5', 'Karla Patricia', 'Baeza', 'San Martín', '10-01-2007', 'F'),
('19222016-6', 'Karen Andrea', 'Donoso', 'Soto', '2007-02-19', 'Mujer'),
('19222017-7', 'Tatiana', 'Alarcón', '?', '19-02-2007', 'Femenino'),
('19222018-8', 'Fabiola Macarena', 'Lira', 'Pérez', '2007-03-31', 'F'),
('19222019-9', 'Yasna Provoste', 'Castañeda', 'González', '31-03-2007', 'Femenino'),
('19222020-0', 'Jocelyn de las Mercedes', 'Poblete', 'Díaz', '1900-01-01 00:00:00.000', 'F'),
('19222021-1', 'Marcela', NULL, 'Muñoz', '2007-05-13', 'Mujer'),
('19222022-2', 'Claudia Andrea', 'Rivera', 'Rojas', '13-05-2007', 'Femenino'),
('19222023-3', 'Marcelo Alejandro', 'Fuenzalida', 'Tapia', '2007-06-08', 'Masculino'),
('19222024-4', 'Pamela', 'Ríos', 'Vergara', '08-06-2007', 'Femenino'), 
('19222025-5', 'Ximena del Pilar', 'San Martín', 'Zúñiga', '2007-07-27', 'Femenino'),
('19222026-6', 'Verónica Isabel', 'Cáceres', 'Pino', '27-07-2007', 'F'),
('19222027-7', 'Mario Alberto', 'Garrido', 'Acuña', '2007-08-15', 'm'),
('19222028-8', 'Margarita Rosa', 'Soto', NULL, '15-08-2007', 'Femenino');


USE [RAW_DATA_ALCANTARA]
GO

-- ==============================================================================
-- ACTUALIZACIÓN HISTÓRICA: ALUMNOS EXCLUSIVOS DEL AÑO 2024 (ALCANTARA)
-- ==============================================================================

-- ==========================================================
-- PROMOCIÓN 2024 (Ex 4° Medio A, B y C - Egresados)
-- Nacidos aprox en 2006. 18 alumnos de muestra. RUTs 30.xxx.xxx
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('30000001-K', 'Martín Andrés', 'Villarroel', 'Guzmán', '2006-03-15', 'Hombre'),
('30000002-8', 'Sofía Ignacia', 'Valdés', 'Ríos', '2006-05-20', 'Mujer'),
('30000003-6', 'Joaquín Ignacio', 'Salazar', 'Méndez', '2006-08-11', 'Masculino'),
('30000004-4', 'Valentina Paz', 'Orellana', 'Pino', '2006-11-05', 'Femenino'),
('30000005-2', 'Matías Alonso', 'Cabrera', 'Navarro', '2006-01-22', 'Hombre'),
('30000006-0', 'Isidora Antonia', 'Molina', 'Castro', '2006-04-18', 'Mujer'),
('30000007-9', 'Tomás Agustín', 'Ortiz', 'Rubio', '2006-07-09', 'Masculino'),
('30000008-7', 'Catalina Belén', 'Vargas', 'Ramos', '2006-09-25', 'Femenino'),
('30000009-5', 'Lucas Mateo', 'Gutiérrez', 'Soto', '2006-12-14', 'Hombre'),
('30000010-9', 'Florencia Jesús', 'Figueroa', 'Vera', '2006-02-08', 'Mujer'),
('30000011-7', 'Benjamín Arturo', 'Vergara', 'Pizarro', '2006-06-19', 'Masculino'),
('30000012-5', 'Constanza Andrea', 'Bravo', 'Cáceres', '2006-08-30', 'Femenino'),
('30000013-3', 'Felipe Ignacio', 'Zúñiga', 'Méndez', '2006-10-12', 'Hombre'),
('30000014-1', 'Julieta Paz', 'Acuña', 'Fuentes', '2006-12-01', 'Mujer'),
('30000015-K', 'Diego Armando', 'Salinas', 'Pardo', '2006-05-04', 'Masculino'),
('30000016-8', 'Renata Catalina', 'Carrasco', 'Osorio', '2006-07-28', 'Femenino'),
('30000017-6', 'Vicente Patricio', 'Bustamante', 'Ponce', '2006-09-17', 'Hombre'),
('30000018-4', 'Amalia Inés', 'Mancilla', 'San Martín', '2006-11-29', 'Mujer');

-- ==========================================================
-- FUGAS / RETIRADOS 2024 (Estuvieron en 2024, se fueron en 2025)
-- Nacidos entre 2007 y 2009. 5 alumnos. RUTs 31.xxx.xxx
-- ==========================================================
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('31000001-K', 'Sebastián Elías', 'Paredes', 'Leal', '2008-04-11', 'Hombre'), 
('31000002-8', 'Laura Inés', 'Navarrete', 'Ruiz', '2009-07-22', 'Mujer'),   
('31000003-6', 'Gabriel Omar', 'Pacheco', 'Castillo', '2007-09-05', 'Masculino'), 
('31000004-4', 'Magdalena Sofía', 'Cárdenas', 'Galdames', '2008-11-19', 'Femenino'), 
('31000005-2', 'Cristóbal Alonso', 'Cisternas', 'Olivares', '2009-01-30', 'M');


-- ==========================================================
-- CARGA DE 1° MEDIOS 2025 - COLEGIO ALCÁNTARA (95 alumnos)
-- RUTs serie 32.xxx.xxx
-- ==========================================================

-- 1° MEDIO A (32 alumnos)
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('32000001-K', 'Felipe', 'Araya', 'Soto', '2010-03-01', 'Masculino'), ('32000002-8', 'Camila', 'Bravo', 'Mendez', '2010-03-02', 'Mujer'),
('32000003-6', 'Diego', 'Cisternas', 'Pardo', '2010-03-03', 'Masculino'), ('32000004-4', 'Sofía', 'Diaz', 'Orellana', '2010-03-04', 'Femenino'),
('32000005-2', 'Nicolás', 'Espinoza', 'Ponce', '2010-03-05', 'Masculino'), ('32000006-0', 'Martina', 'Fuentes', 'San Martin', '2010-03-06', 'Femenino'),
('32000007-9', 'Benjamín', 'Galdames', 'Tapia', '2010-03-07', 'Masculino'), ('32000008-7', 'Antonia', 'Guzman', 'Cardenas', '2010-03-08', 'Femenino'),
('32000009-5', 'Sebastián', 'Herrera', 'Aguilar', '2010-03-09', 'Masculino'), ('32000010-9', 'Florencia', 'Ibañez', 'Espinoza', '2010-03-10', 'Femenino'),
('32000011-7', 'Diego', 'Jara', 'Vidal', '2010-03-11', 'Masculino'), ('32000012-5', 'Javiera', 'Leal', 'Peña', '2010-03-12', 'Femenino'),
('32000013-3', 'Cristóbal', 'Maldonado', 'Santibañez', '2010-03-13', 'Masculino'), ('32000014-1', 'Isidora', 'Miranda', 'Venegas', '2010-03-14', 'Femenino'),
('32000015-K', 'Ignacio', 'Navarrete', 'Maldonado', '2010-03-15', 'Masculino'), ('32000016-8', 'Maite', 'Olivares', 'Arancibia', '2010-03-16', 'Femenino'),
('32000017-6', 'Joaquín', 'Pacheco', 'Arias', '2010-03-17', 'Masculino'), ('32000018-4', 'Amalia', 'Quinteros', 'Leal', '2010-03-18', 'Femenino'),
('32000019-2', 'Felipe', 'Riquelme', 'Becerra', '2010-03-19', 'Masculino'), ('32000020-6', 'Emilia', 'Saavedra', 'Castillo', '2010-03-20', 'Femenino'),
('32000021-4', 'Agustín', 'Tapia', 'Galdames', '2010-03-21', 'Masculino'), ('32000022-2', 'Renata', 'Urrutia', 'Cisternas', '2010-03-22', 'Femenino'),
('32000023-0', 'Tomás', 'Vidal', 'Riquelme', '2010-03-23', 'Masculino'), ('32000024-9', 'Antonella', 'Zamorano', 'Mesa', '2010-03-24', 'Femenino'),
('32000025-7', 'Vicente', 'Alvarez', 'Araya', '2010-03-25', 'Masculino'), ('32000026-5', 'Camila', 'Baeza', 'Saavedra', '2010-03-26', 'Femenino'),
('32000027-3', 'Lucas', 'Castañeda', 'Parra', '2010-03-27', 'Masculino'), ('32000028-1', 'Amanda', 'Donoso', 'Mora', '2010-03-28', 'Femenino'),
('32000029-K', 'Alonso', 'Fuenzalida', 'Marín', '2010-03-29', 'Masculino'), ('32000030-3', 'Trinidad', 'Garrido', 'Salazar', '2010-03-30', 'Femenino'),
('32000031-4', 'Maximiliano', 'Mancilla', 'Díaz', '2010-03-31', 'Masculino'), ('32000032-2', 'Josefa', 'Sánchez', 'García', '2010-04-01', 'Femenino');

-- 1° MEDIO B (33 alumnos)
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('32100001-K', 'Agustín', 'Quesada', 'Acuña', '2010-04-09', 'Masculino'), ('32100002-8', 'Javiera', 'Rivera', 'Cabrera', '2010-04-10', 'Femenino'),
('32100003-6', 'Sebastián', 'Sepulveda', 'Navarro', '2010-04-11', 'Masculino'), ('32100004-4', 'Valentina', 'Tapia', 'Figueroa', '2010-04-12', 'Femenino'),
('32100005-2', 'Bastián', 'Urrutia', 'Reyes', '2010-04-13', 'Masculino'), ('32100006-0', 'Francisca', 'Valenzuela', 'Orellana', '2010-04-14', 'Femenino'),
('32100007-9', 'Martín', 'Winkler', 'Araya', '2010-04-15', 'Masculino'), ('32100008-7', 'Camila', 'Ximenez', 'Cortes', '2010-04-16', 'Femenino'),
('32100009-5', 'Alonso', 'Yañez', 'Maldonado', '2010-04-17', 'Masculino'), ('32100010-9', 'Antonia', 'Zamorano', 'Arancibia', '2010-04-18', 'Femenino'),
('32100011-7', 'Nicolás', 'Aguilera', 'Leal', '2010-04-19', 'Masculino'), ('32100012-5', 'Sofía', 'Barra', 'Becerra', '2010-04-20', 'Femenino'),
('32100013-3', 'Matías', 'Castillo', 'Castillo', '2010-04-21', 'Masculino'), ('32100014-1', 'Isidora', 'Duran', 'Galdames', '2010-04-22', 'Femenino'),
('32100015-K', 'Joaquín', 'Escobar', 'Cisternas', '2010-04-23', 'Masculino'), ('32100016-8', 'Florencia', 'Fuentes', 'Riquelme', '2010-04-24', 'Femenino'),
('32100017-6', 'Vicente', 'Gomez', 'Mesa', '2010-04-25', 'Masculino'), ('32100018-4', 'Renata', 'Hurtado', 'Araya', '2010-04-26', 'Femenino'),
('32100019-2', 'Alonso', 'Ibarra', 'Zamorano', '2010-04-27', 'Masculino'), ('32100020-6', 'Josefa', 'Jara', 'Saavedra', '2010-04-28', 'Femenino'),
('32100021-4', 'Sebastián', 'Kast', 'Mora', '2010-04-29', 'Masculino'), ('32100022-2', 'Valentina', 'Lagos', 'Marín', '2010-04-30', 'Femenino'),
('32100023-0', 'Bastián', 'Muñoz', 'Salazar', '2010-05-01', 'Masculino'), ('32100024-9', 'Catalina', 'Nuñez', 'Alarcon', '2010-05-02', 'Femenino'),
('32100025-7', 'Diego', 'Ortiz', 'Villegas', '2010-05-03', 'Masculino'), ('32100026-5', 'Martina', 'Perez', 'Castañeda', '2010-05-04', 'Femenino'),
('32100027-3', 'Cristóbal', 'Quiroz', 'Medina', '2010-05-05', 'Masculino'), ('32100028-1', 'Javiera', 'Rojas', 'Montes', '2010-05-06', 'Femenino'),
('32100029-K', 'Benjamín', 'Soto', 'Fuenzalida', '2010-05-07', 'Masculino'), ('32100030-3', 'Isidora', 'Torres', 'Ríos', '2010-05-08', 'Femenino'),
('32100031-1', 'Ignacio', 'Urrutia', 'Baeza', '2010-05-09', 'Masculino'), ('32100032-K', 'Maite', 'Velasco', 'Donoso', '2010-05-10', 'Femenino'),
('32100033-8', 'Joaquín', 'Winkler', 'Alarcon', '2010-05-11', 'Masculino');

-- 1° MEDIO C (30 alumnos)
INSERT INTO DIM_ALUMNO (RUT_ALUMNO, NOMBRES, APELLIDO_PATERNO, APELLIDO_MATERNO, FECHA_NACIMIENTO, GENERO) VALUES
('32200001-K', 'Mateo', 'Castillo', 'Rios', '2010-05-17', 'Masculino'), ('32200002-8', 'Valentina', 'Duran', 'San Martin', '2010-05-18', 'Femenino'),
('32200003-6', 'Simón', 'Escobar', 'Caceres', '2010-05-19', 'Masculino'), ('32200004-4', 'Isidora', 'Fuentes', 'Pino', '2010-05-20', 'Femenino'),
('32200005-2', 'Sebastián', 'Gomez', 'Garrido', '2010-05-21', 'Masculino'), ('32200006-0', 'Florencia', 'Hurtado', 'Soto', '2010-05-22', 'Femenino'),
('32200007-9', 'Martín', 'Ibarra', 'Perez', '2010-05-23', 'Masculino'), ('32200008-7', 'Julieta', 'Jorquera', 'Garcia', '2010-05-24', 'Femenino'),
('32200009-5', 'Bruno', 'Kast', 'Montes', '2010-05-25', 'Masculino'), ('32200010-9', 'Agustina', 'Lagos', 'Guzman', '2010-05-26', 'Femenino'),
('32200011-7', 'Alonso', 'Muñoz', 'Correa', '2010-05-27', 'Masculino'), ('32200012-5', 'Paz', 'Nuñez', 'Villegas', '2010-05-28', 'Femenino'),
('32200013-3', 'Damián', 'Ortiz', 'Medina', '2010-05-29', 'Masculino'), ('32200014-1', 'Belén', 'Perez', 'Montes', '2010-05-30', 'Femenino'),
('32200015-K', 'Vicente', 'Quiroz', 'Baeza', '2010-05-31', 'Masculino'), ('32200016-8', 'Constanza', 'Rojas', 'Donoso', '2010-06-01', 'Femenino'),
('32200017-6', 'Tomás', 'Soto', 'Alarcon', '2010-06-02', 'Masculino'), ('32200018-4', 'Gracia', 'Torres', 'Lira', '2010-06-03', 'Femenino'),
('32200019-2', 'Felipe', 'Urrutia', 'Castañeda', '2010-06-04', 'Masculino'), ('32200020-6', 'Ema', 'Velasco', 'Poblete', '2010-06-05', 'Femenino'),
('32200021-4', 'Francisco', 'Winkler', 'Rivera', '2010-06-06', 'Masculino'), ('32200022-2', 'Victoria', 'Ximenez', 'Fuenzalida', '2010-06-07', 'Femenino'),
('32200023-0', 'Lucas', 'Yañez', 'Ríos', '2010-06-08', 'Masculino'), ('32200024-9', 'Emilia', 'Zamorano', 'San Martin', '2010-06-09', 'Femenino'),
('32200025-7', 'Pablo', 'Aguilera', 'Caceres', '2010-06-10', 'Masculino'), ('32200026-5', 'Antonia', 'Barra', 'Garrido', '2010-06-11', 'Femenino'),
('32200027-3', 'Daniel', 'Castillo', 'Soto', '2010-06-12', 'Masculino'), ('32200028-1', 'Bárbara', 'Duran', 'Perez', '2010-06-13', 'Femenino'),
('32200029-K', 'Julián', 'Escobar', 'González', '2010-06-14', 'Masculino'), ('32200030-3', 'Magdalena', 'Fuentes', 'Muñoz', '2010-06-15', 'Femenino');