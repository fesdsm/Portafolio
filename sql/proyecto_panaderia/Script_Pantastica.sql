-- Eliminar esquema si ya existe

DROP SCHEMA IF EXISTS pantastica; 

-- 1 Crear el esquema, utf8mb4: permitir tildes, ñ's; COLLATE utf8mb4_0900_ai_ci: no distinguir entre mayúsculas y minúsculas

CREATE SCHEMA pantastica CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci; 

-- 2 Usar el esquema

USE pantastica; 

-- 3 Crear tablas

-- 3.1 Crear tabla categorías, agrupa productos

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE, -- Nombre categoría único y no-nulo
    descripcion VARCHAR(255), -- Opcional, detalle o descripción de categoría
    estado ENUM('activo','inactivo') DEFAULT 'activo', -- Estado de categoría
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Fecha creación de categoría
);


-- 3.2 Crear tabla producto, detalla producto perteneciente a una o más categorías

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_producto VARCHAR(150) NOT NULL, -- Nombre producto no-nulo
    descripcion VARCHAR(255), -- Opcional, detalle o descripción de producto, alérgenos u otros 
    precio DECIMAL(10,2) NOT NULL, -- Precio producto
    stock INT DEFAULT 0, -- Stock disponible
    unidad_medida VARCHAR(50), -- Unidad de medida, ej: kg, unidad, paquete, litro
    id_categoria INT NOT NULL, -- Relación productos:categorías (1:*)
    estado ENUM('activo','inactivo') DEFAULT 'activo', -- Estado producto
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) -- Clave foránea para unir tabla con categoría
);


-- 3.3 Crear tabla proveedores, detalla proveedores de la tienda, desde donde se obtienen los productos, insumos u otros bienes

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_proveedor VARCHAR(150) NOT NULL, -- Nombre de proveedor
    contacto VARCHAR(100), -- Encargado o medio de contacto
    telefono VARCHAR(20), -- Teléfono proveedor
    email VARCHAR(100), -- Correo proveedor
    direccion VARCHAR(255), -- Dirección proveedor
    estado ENUM('activo','inactivo') DEFAULT 'activo' -- Estado de proveedor
);


-- 3.4 Crear tabla clientes, detalla registros para pedidos especializados o masivos
-- Ventas al paso no requieren registro en la tabla

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_cliente VARCHAR(150) NOT NULL, -- Nombre cliente
    telefono VARCHAR(20), -- Teléfono cliente
    email VARCHAR(100), -- Correo cliente
    direccion VARCHAR(255), -- Dirección cliente
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha registro cliente
    estado ENUM('activo','inactivo') DEFAULT 'activo' -- Estado cliente
);


-- 3.5 Crear tabla ventas, registra ventas realizadas y clientes

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    id_cliente INT, -- opcional, para pedidos especiales/masivos
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP, -- Registro de venta
    total DECIMAL(10,2) NOT NULL, -- Total venta
    metodo_pago ENUM('efectivo','tarjeta','transferencia') DEFAULT 'efectivo', -- Método de pago usado
    estado ENUM('completa','anulada') DEFAULT 'completa', -- Estado venta
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) -- Clave foránea para unir tabla con clients, solo para clientes registrados
);


-- 3.6 Crear tabla detalle_ventas, detalla los productos, unión *:* entre venta y producto

CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    id_venta INT NOT NULL, -- Identificador de venta
    id_producto INT NOT NULL, -- Identificador producto vendido
    cantidad INT NOT NULL, -- Número de unidades del producto vendido
    precio_unitario DECIMAL(10,2) NOT NULL, -- Precio unitario al momento de la venta
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED, -- Total por línea, columna generada al ingresar el detalle, el valor se guarda en la tabla

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta), -- Clave foránea para unir tabla con venta
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) -- Clave foránea para unir tabla con clients
);


-- 3.7 Crear tabla compras, los registros representan compras realizadas a proveedores

CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    id_proveedor INT NOT NULL, -- Identificador proveedor de compra
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha de compra
    total DECIMAL(10,2) NOT NULL, -- Total de compra
    estado ENUM('completa','anulada') DEFAULT 'completa', -- Estado de compra
    metodo_pago ENUM('efectivo','transferencia','credito') DEFAULT 'efectivo', -- Forma de pago

    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) -- Clave foránea para unir tabla con proveedores
);


-- 3.8 Crear tabla detalle_compras, detalla los productos adquiridos en cada compra, relación *:* entre compras y productos

CREATE TABLE detalle_compras (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    id_compra INT NOT NULL, -- Identificador compra
    id_producto INT NOT NULL, -- Producto comprado
    cantidad INT NOT NULL, -- Cantidad de unidades compradas
    precio_unitario DECIMAL(10,2) NOT NULL, -- Precio por unidad en la compra
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED, -- Total por línea, columna generada al ingresar el detalle de compra, el valor se guarda en la tabla

    FOREIGN KEY (id_compra) REFERENCES compras(id_compra), -- Clave foránea para unir tabla con compra
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) -- Clave foránea para unir tabla con producto
);


-- 3.9 Crear tabla roles, permisos que tendrá cada usuario

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_rol VARCHAR(50) NOT NULL UNIQUE, -- Ej: 'admin', 'analista'
    descripcion VARCHAR(255) -- Descripción y/o permisos del rol
);


-- 3.10 Crear tabla usuarios, usuarios del sistema asociados a un rol

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único y autoincremental, clave primaria
    nombre_usuario VARCHAR(100) NOT NULL UNIQUE, -- Nombre de usuario
    contrasena VARCHAR(255) NOT NULL, -- Contraseña predefinida (se requiere cambio al iniciar)
    id_rol INT NOT NULL, -- Identificador de rol
    estado ENUM('activo','inactivo') DEFAULT 'activo', -- Estado usuario
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación de usuario
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) -- Clave foránea para unir tabla con roles
);


-- 4 Inserción de datos

-- 4.1 Ingresar datos de categorías

INSERT INTO categorias (id_categoria, nombre_categoria) VALUES

(1, 'Panadería'),
(2, 'Pastelería'),
(3, 'Envasados'),
(4, 'Abarrotes'),
(5, 'Lácteos'),
(6, 'Cecinas'),
(7, 'Snacks y Bebidas');


-- 4.2 Ingresar los productos disponibles

INSERT INTO productos (nombre_producto, descripcion, precio, stock, unidad_medida, id_categoria, estado) VALUES

  ('Pan Amasado', 'Panadería fresco o envasado', 2338, 31, 'kg', 1, 'activo'),
  ('Marraqueta (Pan Francés)', 'Panadería fresco o envasado', 1908, 50, 'kg', 1, 'activo'),
  ('Hallulla', 'Panadería fresco o envasado', 2083, 41, 'kg', 1, 'activo'),
  ('Pan Ciabatta', 'Panadería fresco o envasado', 2046, 72, 'kg', 1, 'activo'),
  ('Pan de Molde Blanco', 'Panadería fresco o envasado', 2406, 82, 'kg', 1, 'activo'),
  ('Pan de Molde Integral', 'Panadería fresco o envasado', 2364, 81, 'kg', 1, 'activo'),
  ('Pan de Centeno', 'Panadería fresco o envasado', 2515, 47, 'kg', 1, 'activo'),
  ('Pan de Avena', 'Panadería fresco o envasado', 1951, 71, 'kg', 1, 'activo'),
  ('Pan Multigrano', 'Panadería fresco o envasado', 2185, 27, 'kg', 1, 'activo'),
  ('Pan con Semillas de Sésamo', 'Panadería fresco o envasado', 1911, 41, 'kg', 1, 'activo'),
  ('Pan con Semillas de Linaza', 'Panadería fresco o envasado', 2043, 68, 'kg', 1, 'activo'),
  ('Pan de Masa Madre', 'Panadería fresco o envasado', 2244, 20, 'kg', 1, 'activo'),
  ('Baguette', 'Panadería fresco o envasado', 1909, 69, 'kg', 1, 'activo'),
  ('Pan de Cebolla y Queso', 'Panadería fresco o envasado', 2029, 53, 'kg', 1, 'activo'),
  ('Pan de Zanahoria', 'Panadería fresco o envasado', 2345, 78, 'kg', 1, 'activo'),
  ('Pan de Maíz', 'Panadería fresco o envasado', 2271, 56, 'kg', 1, 'activo'),
  ('Pan de Leche', 'Panadería fresco o envasado', 2044, 74, 'kg', 1, 'activo'),
  ('Pan de Queso', 'Panadería fresco o envasado', 2302, 91, 'kg', 1, 'activo'),
  ('Pan de Aceitunas', 'Panadería fresco o envasado', 2457, 82, 'kg', 1, 'activo'),
  ('Pan de Nuez', 'Panadería fresco o envasado', 1895, 39, 'kg', 1, 'activo'),
  ('Pan de Pasas', 'Panadería fresco o envasado', 2454, 44, 'kg', 1, 'activo'),
  ('Pan con Orégano', 'Panadería fresco o envasado', 2379, 57, 'kg', 1, 'activo'),
  ('Pan de Papa', 'Panadería fresco o envasado', 2128, 47, 'kg', 1, 'activo'),
  ('Pan de Calabaza', 'Panadería fresco o envasado', 1999, 27, 'kg', 1, 'activo'),
  ('Pan con Ajo', 'Panadería fresco o envasado', 2560, 94, 'kg', 1, 'activo'),
  ('Pan de Orégano y Tomate Seco', 'Panadería fresco o envasado', 2126, 89, 'kg', 1, 'activo'),
  ('Pan de Trigo Sarraceno', 'Panadería fresco o envasado', 1955, 27, 'kg', 1, 'activo'),
  ('Pan con Chía', 'Panadería fresco o envasado', 1958, 60, 'kg', 1, 'activo'),
  ('Pan de Molde de Avena', 'Panadería fresco o envasado', 2483, 27, 'kg', 1, 'activo'),
  ('Pan de Molde de Centeno', 'Panadería fresco o envasado', 2313, 26, 'kg', 1, 'activo'),
  ('Pan de Molde Multigrano', 'Panadería fresco o envasado', 2455, 94, 'kg', 1, 'activo'),
  ('Pan Pita', 'Panadería fresco o envasado', 2401, 81, 'kg', 1, 'activo'),
  ('Pan Árabe', 'Panadería fresco o envasado', 2265, 84, 'kg', 1, 'activo'),
  ('Focaccia', 'Panadería fresco o envasado', 2571, 87, 'kg', 1, 'activo'),
  ('Rosquillas de Pan Dulce', 'Panadería fresco o envasado', 2155, 40, 'kg', 1, 'activo'),
  ('Pan de Hamburguesa', 'Panadería fresco o envasado', 2276, 27, 'kg', 1, 'activo'),
  ('Pan de Hot Dog', 'Panadería fresco o envasado', 2471, 85, 'kg', 1, 'activo'),
  ('Pan para Sándwich', 'Panadería fresco o envasado', 2323, 30, 'kg', 1, 'activo'),
  ('Palitos de Pan (Grisines)', 'Panadería fresco o envasado', 2493, 43, 'kg', 1, 'activo'),
  ('Tostadas de Pan', 'Panadería fresco o envasado', 2294, 28, 'kg', 1, 'activo'),
  ('Conejo (pan con crema pastelera)', 'Pastelería fresco o envasado', 1505, 96, 'un', 2, 'activo'),
  ('Berlín con Manjar', 'Pastelería fresco o envasado', 846, 28, 'un', 2, 'activo'),
  ('Berlín con Crema Pastelera', 'Pastelería fresco o envasado', 1028, 50, 'un', 2, 'activo'),
  ('Berlines con Mermelada', 'Pastelería fresco o envasado', 1089, 71, 'un', 2, 'activo'),
  ('Alfajor de Maicena', 'Pastelería fresco o envasado', 880, 35, 'un', 2, 'activo'),
  ('Alfajor de Chocolate', 'Pastelería fresco o envasado', 1033, 92, 'un', 2, 'activo'),
  ('Tartaleta de Frutas', 'Pastelería fresco o envasado', 901, 51, 'un', 2, 'activo'),
  ('Tartaleta de Nuez', 'Pastelería fresco o envasado', 1078, 94, 'un', 2, 'activo'),
  ('Kuchen de Manzana', 'Pastelería fresco o envasado', 1436, 96, 'un', 2, 'activo'),
  ('Kuchen de Frambuesa', 'Pastelería fresco o envasado', 1165, 25, 'un', 2, 'activo'),
  ('Pie de Limón', 'Pastelería fresco o envasado', 1170, 99, 'un', 2, 'activo'),
  ('Pie de Maracuyá', 'Pastelería fresco o envasado', 1010, 30, 'un', 2, 'activo'),
  ('Brownie', 'Pastelería fresco o envasado', 1067, 73, 'un', 2, 'activo'),
  ('Muffin de Chocolate', 'Pastelería fresco o envasado', 1737, 94, 'un', 2, 'activo'),
  ('Muffin de Arándanos', 'Pastelería fresco o envasado', 1448, 92, 'un', 2, 'activo'),
  ('Magdalena de Vainilla', 'Pastelería fresco o envasado', 1409, 86, 'un', 2, 'activo'),
  ('Donut Glaseado', 'Pastelería fresco o envasado', 971, 60, 'un', 2, 'activo'),
  ('Donut de Chocolate', 'Pastelería fresco o envasado', 1529, 53, 'un', 2, 'activo'),
  ('Panqueque de Naranja', 'Pastelería fresco o envasado', 963, 46, 'un', 2, 'activo'),
  ('Brazo de Reina', 'Pastelería fresco o envasado', 1179, 60, 'un', 2, 'activo'),
  ('Hojarasca Rellena', 'Pastelería fresco o envasado', 1790, 50, 'un', 2, 'activo'),
  ('Empolvado', 'Pastelería fresco o envasado', 1440, 53, 'un', 2, 'activo'),
  ('Cachito de Crema', 'Pastelería fresco o envasado', 1357, 70, 'un', 2, 'activo'),
  ('Cola de Mono (durante temporada)', 'Pastelería fresco o envasado', 1485, 36, 'un', 2, 'activo'),
  ('Milhojas', 'Pastelería fresco o envasado', 1643, 58, 'un', 2, 'activo'),
  ('Galletas de Avena', 'Pastelería fresco o envasado', 1576, 78, 'un', 2, 'activo'),
  ('Galletas de Mantequilla', 'Pastelería fresco o envasado', 1029, 60, 'un', 2, 'activo'),
  ('Galletas de Chocolate', 'Pastelería fresco o envasado', 832, 29, 'un', 2, 'activo'),
  ('Merengue', 'Pastelería fresco o envasado', 1115, 21, 'un', 2, 'activo'),
  ('Eclair de Chocolate', 'Pastelería fresco o envasado', 1068, 78, 'un', 2, 'activo'),
  ('Torta Panqueque de Naranja', 'Pastelería fresco o envasado', 14743, 99, 'un', 2, 'activo'),
  ('Torta Milhojas con Manjar', 'Pastelería fresco o envasado', 24258, 92, 'un', 2, 'activo'),
  ('Torta de Bizcocho con Crema', 'Pastelería fresco o envasado', 23393, 32, 'un', 2, 'activo'),
  ('Torta de Selva Negra', 'Pastelería fresco o envasado', 16091, 29, 'un', 2, 'activo'),
  ('Torta de Tres Leches', 'Pastelería fresco o envasado', 20521, 88, 'un', 2, 'activo'),
  ('Torta de Merengue con Frutas', 'Pastelería fresco o envasado', 17143, 47, 'un', 2, 'activo'),
  ('Torta de Panqueque de Chocolate', 'Pastelería fresco o envasado', 23889, 84, 'un', 2, 'activo'),
  ('Torta de Zanahoria', 'Pastelería fresco o envasado', 17965, 53, 'un', 2, 'activo'),
  ('Torta de Manjar-Lúcuma', 'Pastelería fresco o envasado', 15443, 36, 'un', 2, 'activo'),
  ('Torta de Durazno y Crema', 'Pastelería fresco o envasado', 15206, 64, 'un', 2, 'activo'),
  ('Torta de Moca', 'Pastelería fresco o envasado', 19298, 28, 'un', 2, 'activo'),
  ('Torta de Queso (Cheesecake) con Berries', 'Pastelería fresco o envasado', 15416, 51, 'un', 2, 'activo'),
  ('Torta de Chocolate Húmeda', 'Pastelería fresco o envasado', 19600, 67, 'un', 2, 'activo'),
  ('Torta de Hoja y Crema', 'Pastelería fresco o envasado', 23672, 56, 'un', 2, 'activo'),
  ('Porción de Torta de Panqueque', 'Pastelería fresco o envasado', 2599, 40, 'un', 2, 'activo'),
  ('Porción de Torta de Milhojas', 'Pastelería fresco o envasado', 2329, 76, 'un', 2, 'activo'),
  ('Porción de Torta de Tres Leches', 'Pastelería fresco o envasado', 3496, 89, 'un', 2, 'activo'),
  ('Porción de Torta de Chocolate', 'Pastelería fresco o envasado', 2764, 58, 'un', 2, 'activo'),
  ('Porción de Torta de Selva Negra', 'Pastelería fresco o envasado', 2136, 98, 'un', 2, 'activo'),
  ('Porción de Pie de Limón', 'Pastelería fresco o envasado', 2071, 87, 'un', 2, 'activo'),
  ('Negrita', 'Envasados fresco o envasado', 843, 21, 'un', 3, 'activo'),
  ('Gansito', 'Envasados fresco o envasado', 1516, 90, 'un', 3, 'activo'),
  ('Pingüinos', 'Envasados fresco o envasado', 1730, 58, 'un', 3, 'activo'),
  ('Choco Krispis', 'Envasados fresco o envasado', 1249, 33, 'un', 3, 'activo'),
  ('Barritas', 'Envasados fresco o envasado', 783, 37, 'un', 3, 'activo'),
  ('Quequitos', 'Envasados fresco o envasado', 1196, 53, 'un', 3, 'activo'),
  ('Brownies', 'Envasados fresco o envasado', 1995, 34, 'un', 3, 'activo'),
  ('Donas', 'Envasados fresco o envasado', 1388, 33, 'un', 3, 'activo'),
  ('Galletas con chispas de chocolate', 'Envasados fresco o envasado', 1962, 90, 'un', 3, 'activo'),
  ('Marinela Snack', 'Envasados fresco o envasado', 1819, 39, 'un', 3, 'activo'),
  ('Harina sin polvos de hornear', 'Abarrotes fresco o envasado', 1017, 54, 'kg', 4, 'activo'),
  ('Harina con polvos de hornear', 'Abarrotes fresco o envasado', 2081, 56, 'kg', 4, 'activo'),
  ('Harina de Avena', 'Abarrotes fresco o envasado', 2023, 97, 'kg', 4, 'activo'),
  ('Harina de Centeno', 'Abarrotes fresco o envasado', 1805, 46, 'kg', 4, 'activo'),
  ('Harina Integral', 'Abarrotes fresco o envasado', 1400, 63, 'kg', 4, 'activo'),
  ('Harina de Arroz', 'Abarrotes fresco o envasado', 1961, 46, 'kg', 4, 'activo'),
  ('Almidón de Maíz (Maicena)', 'Abarrotes fresco o envasado', 1167, 53, 'kg', 4, 'activo'),
  ('Harina de Almendra', 'Abarrotes fresco o envasado', 1652, 84, 'kg', 4, 'activo'),
  ('Harina de Coco', 'Abarrotes fresco o envasado', 1681, 82, 'kg', 4, 'activo'),
  ('Polvos de Hornear', 'Abarrotes fresco o envasado', 2431, 52, 'kg', 4, 'activo'),
  ('Mermelada de Damasco', 'Abarrotes fresco o envasado', 2601, 26, 'un', 4, 'activo'),
  ('Mermelada de Frambuesa', 'Abarrotes fresco o envasado', 1621, 31, 'un', 4, 'activo'),
  ('Mermelada de Frutilla', 'Abarrotes fresco o envasado', 2001, 74, 'un', 4, 'activo'),
  ('Mermelada de Mora', 'Abarrotes fresco o envasado', 1486, 55, 'un', 4, 'activo'),
  ('Mermelada de Durazno', 'Abarrotes fresco o envasado', 2660, 25, 'un', 4, 'activo'),
  ('Mermelada de Naranja', 'Abarrotes fresco o envasado', 2593, 20, 'un', 4, 'activo'),
  ('Mermelada de Higo', 'Abarrotes fresco o envasado', 1678, 62, 'un', 4, 'activo'),
  ('Mermelada de Ciruela', 'Abarrotes fresco o envasado', 2222, 36, 'un', 4, 'activo'),
  ('Mermelada de Pera', 'Abarrotes fresco o envasado', 2174, 53, 'un', 4, 'activo'),
  ('Mermelada de Arándano', 'Abarrotes fresco o envasado', 1445, 40, 'un', 4, 'activo'),
  ('Leche Entera (1 Litro)', 'Lácteos fresco o envasado', 4860, 76, 'un', 5, 'activo'),
  ('Leche Descremada (1 Litro)', 'Lácteos fresco o envasado', 3789, 90, 'un', 5, 'activo'),
  ('Leche sin Lactosa (1 Litro)', 'Lácteos fresco o envasado', 4937, 74, 'un', 5, 'activo'),
  ('Yogurt Natural', 'Lácteos fresco o envasado', 3746, 91, 'un', 5, 'activo'),
  ('Yogurt de Sabores', 'Lácteos fresco o envasado', 1203, 21, 'un', 5, 'activo'),
  ('Mantequilla', 'Lácteos fresco o envasado', 2756, 34, 'un', 5, 'activo'),
  ('Margarina', 'Lácteos fresco o envasado', 1293, 29, 'un', 5, 'activo'),
  ('Queso Crema', 'Lácteos fresco o envasado', 5660, 39, 'un', 5, 'activo'),
  ('Queso Laminado', 'Lácteos fresco o envasado', 5418, 89, 'un', 5, 'activo'),
  ('Queso Fresco', 'Lácteos fresco o envasado', 5192, 24, 'un', 5, 'activo'),
  ('Jamón de Pierna', 'Cecinas fresco o envasado', 2115, 67, 'un', 6, 'activo'),
  ('Jamón de Pavo', 'Cecinas fresco o envasado', 1616, 94, 'un', 6, 'activo'),
  ('Salame', 'Cecinas fresco o envasado', 3256, 90, 'un', 6, 'activo'),
  ('Mortadela', 'Cecinas fresco o envasado', 3394, 38, 'un', 6, 'activo'),
  ('Chorizo', 'Cecinas fresco o envasado', 1671, 75, 'un', 6, 'activo'),
  ('Paté', 'Cecinas fresco o envasado', 2472, 36, 'un', 6, 'activo'),
  ('Vienesas', 'Cecinas fresco o envasado', 1638, 25, 'un', 6, 'activo'),
  ('Queso de Cabeza', 'Cecinas fresco o envasado', 3021, 59, 'un', 6, 'activo'),
  ('Lomo Ahumado', 'Cecinas fresco o envasado', 3032, 66, 'un', 6, 'activo'),
  ('Jamón Serrano', 'Cecinas fresco o envasado', 1757, 25, 'un', 6, 'activo'),
  ('Café en grano', 'Snacks y Bebidas fresco o envasado', 1461, 65, 'un', 7, 'activo'),
  ('Café molido', 'Snacks y Bebidas fresco o envasado', 1564, 46, 'un', 7, 'activo'),
  ('Té en bolsas', 'Snacks y Bebidas fresco o envasado', 1168, 51, 'un', 7, 'activo'),
  ('Té en hojas', 'Snacks y Bebidas fresco o envasado', 2013, 33, 'un', 7, 'activo'),
  ('Chocolate caliente en polvo', 'Snacks y Bebidas fresco o envasado', 1388, 65, 'un', 7, 'activo'),
  ('Jugo de Naranja', 'Snacks y Bebidas fresco o envasado', 1094, 91, 'un', 7, 'activo'),
  ('Jugo de Manzana', 'Snacks y Bebidas fresco o envasado', 1550, 72, 'un', 7, 'activo'),
  ('Bebida Gaseosa', 'Snacks y Bebidas fresco o envasado', 1815, 99, 'un', 7, 'activo'),
  ('Agua Mineral', 'Snacks y Bebidas fresco o envasado', 1080, 39, 'un', 7, 'activo'),
  ('Agua con Gas', 'Snacks y Bebidas fresco o envasado', 1233, 50, 'un', 7, 'activo'),
  ('Leche con Chocolate', 'Snacks y Bebidas fresco o envasado', 2183, 40, 'un', 7, 'activo'),
  ('Galletas Saladas', 'Snacks y Bebidas fresco o envasado', 1703, 42, 'un', 7, 'activo'),
  ('Papas Fritas de bolsa', 'Snacks y Bebidas fresco o envasado', 1409, 72, 'un', 7, 'activo'),
  ('Snacks de maíz', 'Snacks y Bebidas fresco o envasado', 1519, 23, 'un', 7, 'activo'),
  ('Huevos', 'Abarrotes fresco o envasado', 1671, 42, 'un', 4, 'activo'),
  ('Azúcar', 'Abarrotes fresco o envasado', 2418, 62, 'un', 4, 'activo'),
  ('Endulzante', 'Abarrotes fresco o envasado', 3234, 72, 'un', 4, 'activo'),
  ('Levadura', 'Abarrotes fresco o envasado', 5036, 51, 'un', 4, 'activo'),
  ('Manjar en pote', 'Abarrotes fresco o envasado', 2457, 54, 'un', 4, 'activo'),
  ('Dulce de Membrillo', 'Abarrotes fresco o envasado', 2386, 40, 'un', 4, 'activo'),
  ('Aceite de Oliva', 'Abarrotes fresco o envasado', 1311, 33, 'un', 4, 'activo'),
  ('Vinagre Balsámico', 'Abarrotes fresco o envasado', 5344, 68, 'un', 4, 'activo'),
  ('Pan Rallado', 'Abarrotes fresco o envasado', 2448, 24, 'un', 4, 'activo'),
  ('Miel', 'Abarrotes fresco o envasado', 7319, 80, 'un', 4, 'activo'),
  ('Crema para Batir', 'Abarrotes fresco o envasado', 6989, 48, 'un', 4, 'activo'),
  ('Mermelada de Tomate', 'Abarrotes fresco o envasado', 1310, 45, 'un', 4, 'activo'),
  ('Mayonesa', 'Abarrotes fresco o envasado', 2514, 78, 'un', 4, 'activo'),
  ('Kétchup', 'Abarrotes fresco o envasado', 5617, 64, 'un', 4, 'activo'),
  ('Mostaza', 'Abarrotes fresco o envasado', 2343, 59, 'un', 4, 'activo'),
  ('Sal', 'Abarrotes fresco o envasado', 1753, 49, 'un', 4, 'activo'),
  ('Pan de hot dog', 'Panadería fresco o envasado', 2545, 48, 'kg', 1, 'activo'),
  ('Pan de pascua (temporada)', 'Panadería fresco o envasado', 2290, 23, 'kg', 1, 'activo'),
  ('Tortilla de huevo', 'Panadería fresco o envasado', 2221, 44, 'kg', 1, 'activo'),
  ('Torta de yogur', 'Panadería fresco o envasado', 2439, 71, 'kg', 1, 'activo'),
  ('Torta de frutilla', 'Panadería fresco o envasado', 2455, 62, 'kg', 1, 'activo'),
  ('Porción de torta de frutilla', 'Panadería fresco o envasado', 2023, 55, 'kg', 1, 'activo'),
  ('Queque de plátano', 'Panadería fresco o envasado', 1958, 28, 'kg', 1, 'activo'),
  ('Queque de limón', 'Panadería fresco o envasado', 2192, 55, 'kg', 1, 'activo'),
  ('Galletas de jengibre', 'Panadería fresco o envasado', 2187, 64, 'kg', 1, 'activo'),
  ('Pan de bono', 'Panadería fresco o envasado', 2217, 85, 'kg', 1, 'activo'),
  ('Pan de yuca', 'Panadería fresco o envasado', 2400, 71, 'kg', 1, 'activo'),
  ('Pan de coco', 'Panadería fresco o envasado', 2361, 88, 'kg', 1, 'activo'),
  ('Pan de chicharrones', 'Panadería fresco o envasado', 2579, 62, 'kg', 1, 'activo'),
  ('Pan de huevo', 'Panadería fresco o envasado', 1959, 23, 'kg', 1, 'activo'),
  ('Pan de queso crema', 'Panadería fresco o envasado', 2172, 34, 'kg', 1, 'activo'),
  ('Pan con semillas de amapola', 'Panadería fresco o envasado', 2128, 53, 'kg', 1, 'activo'),
  ('Torta fría de vainilla', 'Panadería fresco o envasado', 2493, 42, 'kg', 1, 'activo'),
  ('Torta de castañas', 'Panadería fresco o envasado', 2064, 94, 'kg', 1, 'activo'),
  ('Mermelada de ruibarbo', 'Panadería fresco o envasado', 2023, 53, 'kg', 1, 'activo'),
  ('Galletas de avena y pasas', 'Panadería fresco o envasado', 2204, 24, 'kg', 1, 'activo'),
  ('Mantequilla de maní', 'Panadería fresco o envasado', 2185, 33, 'kg', 1, 'activo'),
  ('Alfajor de chocolate blanco', 'Panadería fresco o envasado', 2085, 96, 'kg', 1, 'activo'),
  ('Mini empanadas de pino', 'Panadería fresco o envasado', 2065, 75, 'kg', 1, 'activo'),
  ('Mini quiches', 'Panadería fresco o envasado', 2536, 64, 'kg', 1, 'activo'),
  ('Palitos de queso', 'Panadería fresco o envasado', 2200, 60, 'kg', 1, 'activo'),
  ('Donas rellenas de manjar', 'Panadería fresco o envasado', 2493, 75, 'kg', 1, 'activo'),
  ('Donas rellenas de crema', 'Panadería fresco o envasado', 2275, 97, 'kg', 1, 'activo'),
  ('Berlines con crema pastelera y manjar', 'Panadería fresco o envasado', 1925, 85, 'kg', 1, 'activo'),
  ('Pan con linaza y chía', 'Panadería fresco o envasado', 2589, 34, 'kg', 1, 'activo'),
  ('Pan con espinaca y queso', 'Panadería fresco o envasado', 2475, 69, 'kg', 1, 'activo');


-- 4.3 Insertar datos de prueba en clientes

INSERT INTO clientes (nombre_cliente, telefono, email, direccion, estado) VALUES

('Juan Pérez', '912345678', 'juan.perez@mail.com', 'Av. Principal 123, Santiago', 'activo'),
('María González', '987654321', 'maria.gonzalez@mail.com', 'Calle Secundaria 456, Santiago', 'activo'),
('Pedro Ramírez', '912233445', 'pedro.ramirez@mail.com', 'Pasaje Central 789, Santiago', 'activo');


-- 4.4 Ingresar datos de proveedores

INSERT INTO proveedores (nombre_proveedor, contacto, telefono, email, direccion, estado) VALUES

('Harinas Chile S.A.', 'Carlos Muñoz', '912345678', 'contacto@harinaschile.cl', 'Av. Industrial 123, Santiago', 'activo'),
('Lácteos del Sur', 'Ana Torres', '987654321', 'ventas@lacteosdelsur.cl', 'Calle Lechera 456, Santiago', 'activo'),
('SnackFoods Ltda.', 'Pedro Rojas', '912233445', 'info@snackfoods.cl', 'Pasaje Comercial 789, Santiago', 'activo'),
('Distribuidora Dulces y Más', 'María Gómez', '912112233', 'contacto@dulcesymas.cl', 'Av. Comercio 1010, Santiago', 'activo'),
('Bebidas y Jugos S.A.', 'Jorge Valdés', '987778899', 'ventas@bebidasyjugos.cl', 'Calle Bebidas 321, Santiago', 'activo'),
('Cecinas y Quesos Ltda.', 'Laura Pérez', '912556677', 'info@cecinasyquesos.cl', 'Pasaje Alimenticio 555, Santiago', 'activo');


-- 4.5 Ingresar datos de roles

INSERT INTO roles (nombre_rol, descripcion) VALUES

('admin', 'Administrador del sistema, acceso completo a todas las funcionalidades'),
('vendedor', 'Encargado de registrar ventas y gestionar clientes'),
('bodeguero', 'Encargado de registrar compras y controlar stock de productos'),
('contabilidad', 'Acceso a reportes financieros y totales de ventas/compras'),
('analista', 'Acceso a reportes y consultas para análisis de datos');


-- 4.6 Ingresar datos de compra

INSERT INTO compras (id_proveedor, total, metodo_pago) VALUES

(1, 1046400.00, 'transferencia'), -- Harinas Chile S.A.
(2, 3323350.00, 'transferencia'), -- Lácteos del Sur
(3, 1741610.00, 'efectivo'), -- SnackFoods Ltda. 
(4, 2881589.00, 'credito'), -- Distribuidora Dulces y Más
(5, 2251620.00, 'credito'), -- Bebidas y Jugos S.A.
(6, 1360665.00, 'efectivo'); -- Cecinas y Quesos Ltda


-- 4.7 Ingresar datos de detalles de compras (concordantes con los totales de compras, valores estimados de las compras reales)

-- Proveedor 1:

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES

(1, 101, 120, 720.00),   -- Harina sin polvos: 120 * 720 = 86.400
(1, 102, 80, 1560.00),   -- Harina con polvos: 80 * 1.560 = 124.800
(1, 103, 60, 1520.00),   -- Harina de Avena: 60 * 1.520 = 91.200
(1, 104, 45, 1250.00),   -- Harina de Centeno: 45 * 1.250 = 56.250
(1, 105, 100, 1050.00),  -- Harina Integral: 100 * 1.050 = 105.000
(1, 106, 35, 1450.00),   -- Harina de Arroz: 35 * 1.450 = 50.750
(1, 107, 70, 850.00),    -- Maicena: 70 * 850 = 59.500
(1, 108, 20, 1250.00),   -- Harina de Almendra: 20 * 1.250 = 25.000
(1, 109, 15, 1200.00),   -- Harina de Coco: 15 * 1.200 = 18.000
(1, 110, 40, 1850.00),   -- Polvos de Hornear: 40 * 1.850 = 74.000
(1, 158, 90, 3950.00);   -- Levadura: 90 * 3.950 = 355.500
-- Suma de subtotales: 86.400 + 124.800 + 91.200 + 56.250 + 105.000 + 50.750 + 59.500 + 25.000 + 18.000 + 74.000 + 355.500 = 1.046.400


-- Proveedor 2:

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES
(2, 121, 180, 3650.00),  -- Leche Entera: 180 * 3.650 = 657.000
(2, 122, 150, 2840.00),  -- Leche Descremada: 150 * 2.840 = 426.000
(2, 123, 120, 3700.00),  -- Leche sin Lactosa: 120 * 3.700 = 444.000
(2, 124, 100, 2810.00),  -- Yogurt Natural: 100 * 2.810 = 281.000
(2, 125, 250, 902.00),   -- Yogurt Sabores: 250 * 902 = 225.500
(2, 126, 120, 2067.00),  -- Mantequilla: 120 * 2.067 = 248.040
(2, 127, 150, 969.00),   -- Margarina: 150 * 969 = 145.350
(2, 128, 70, 4245.00),   -- Queso Crema: 70 * 4.245 = 297.150
(2, 129, 90, 4063.00),   -- Queso Laminado: 90 * 4.063 = 365.670
(2, 130, 60, 3894.00);   -- Queso Fresco: 60 * 3.894 = 233.640
-- Suma de subtotales = 3.323.350


-- Proveedor 3:

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES
(3, 91, 200, 632.00),    -- Negrita: 200 * 632 = 126.400
(3, 92, 150, 1137.00),   -- Gansito: 150 * 1.137 = 170.550
(3, 93, 120, 1297.00),   -- Pingüinos: 120 * 1.297 = 155.640
(3, 94, 180, 937.00),    -- Choco Krispis: 180 * 937 = 168.660
(3, 95, 250, 587.00),    -- Barritas: 250 * 587 = 146.750
(3, 96, 160, 897.00),    -- Quequitos: 160 * 897 = 143.520
(3, 97, 130, 1496.00),   -- Brownies: 130 * 1.496 = 194.480
(3, 98, 190, 1041.00),   -- Donas: 190 * 1.041 = 197.790
(3, 99, 140, 1471.00),   -- Galletas chispas: 140 * 1.471 = 205.940
(3, 100, 170, 1364.00);  -- Marinela Snack: 170 * 1.364 = 231.880
-- Suma de subtotales = 1.741.610


-- Proveedor 4:

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES

(4, 111, 40, 1950.00),   -- Mermelada Damasco: 40 * 1.950 = 78.000
(4, 112, 55, 1215.00),   -- Mermelada Frambuesa: 55 * 1.215 = 66.825
(4, 113, 85, 1500.00),   -- Mermelada Frutilla: 85 * 1.500 = 127.500
(4, 114, 60, 1114.00),   -- Mermelada Mora: 60 * 1.114 = 66.840
(4, 115, 35, 1995.00),   -- Mermelada Durazno: 35 * 1.995 = 69.825
(4, 116, 30, 1945.00),   -- Mermelada Naranja: 30 * 1.945 = 58.350
(4, 117, 70, 1258.00),   -- Mermelada Higo: 70 * 1.258 = 88.060
(4, 118, 50, 1666.00),   -- Mermelada Ciruela: 50 * 1.666 = 83.300
(4, 119, 65, 1630.00),   -- Mermelada Pera: 65 * 1.630 = 105.950
(4, 120, 45, 1083.00),   -- Mermelada Arándano: 45 * 1.083 = 48.735
(4, 155, 400, 1253.00),  -- Huevos: 400 * 1.253 = 501.200
(4, 156, 200, 1813.00),  -- Azúcar: 200 * 1.813 = 362.600
(4, 157, 80, 2425.00),   -- Endulzante: 80 * 2.425 = 194.000
(4, 159, 75, 1842.00),   -- Manjar: 75 * 1.842 = 138.150
(4, 160, 60, 1789.00),   -- Dulce Membrillo: 60 * 1.789 = 107.340
(4, 161, 70, 983.00),    -- Aceite Oliva: 70 * 983 = 68.810
(4, 162, 25, 4008.00),   -- Vinagre Balsámico: 25 * 4.008 = 100.200
(4, 163, 45, 1836.00),   -- Pan Rallado: 45 * 1.836 = 82.620
(4, 164, 15, 5489.00),   -- Miel: 15 * 5.489 = 82.335
(4, 165, 20, 5241.00),   -- Crema Batir: 20 * 5.241 = 104.820
(4, 166, 60, 982.00),    -- Mermelada Tomate: 60 * 982 = 58.920
(4, 167, 100, 1885.00),  -- Mayonesa: 100 * 1.885 = 188.500
(4, 168, 30, 4212.00),   -- Kétchup: 30 * 4.212 = 126.360
(4, 169, 80, 1757.00),   -- Mostaza: 80 * 1.757 = 140.560
(4, 170, 150, 1314.00);  -- Sal: 150 * 1.314 = 197.100
-- Suma de subtotales = 2.881.589


-- Proveedor 5:

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES
(5, 141, 100, 1095.00),  -- Café grano: 100 * 1.095 = 109.500
(5, 142, 120, 1173.00),  -- Café molido: 120 * 1.173 = 140.760
(5, 143, 150, 876.00),   -- Té bolsas: 150 * 876 = 131.400
(5, 144, 80, 1509.00),   -- Té hojas: 80 * 1.509 = 120.720
(5, 145, 130, 1041.00),  -- Chocolate polvo: 130 * 1.041 = 135.330
(5, 146, 160, 820.00),   -- Jugo Naranja: 160 * 820 = 131.200
(5, 147, 140, 1162.00),  -- Jugo Manzana: 140 * 1.162 = 162.680
(5, 148, 200, 1361.00),  -- Bebida Gaseosa: 200 * 1.361 = 272.200
(5, 149, 180, 810.00),   -- Agua Mineral: 180 * 810 = 145.800
(5, 150, 150, 925.00),   -- Agua con Gas: 150 * 925 = 138.750
(5, 151, 110, 1637.00),  -- Leche Chocolate: 110 * 1.637 = 180.070
(5, 152, 130, 1277.00),  -- Galletas Saladas: 130 * 1.277 = 166.010
(5, 153, 170, 1056.00),  -- Papas Fritas: 170 * 1.056 = 179.520
(5, 154, 120, 1139.00);  -- Snacks maíz: 120 * 1.139 = 136.680
-- Suma de subtotales = 2.251.620


-- Proveedor 6: 

INSERT INTO detalle_compras (id_compra, id_producto, cantidad, precio_unitario) VALUES
(6, 131, 90, 1586.00),   -- Jamón Pierna: 90 * 1.586 = 142.740
(6, 132, 110, 1212.00),  -- Jamón Pavo: 110 * 1.212 = 133.320
(6, 133, 65, 2442.00),   -- Salame: 65 * 2.442 = 158.730
(6, 134, 75, 2545.00),   -- Mortadela: 75 * 2.545 = 190.875
(6, 135, 100, 1253.00),  -- Chorizo: 100 * 1.253 = 125.300
(6, 136, 70, 1854.00),   -- Paté: 70 * 1.854 = 129.780
(6, 137, 130, 1228.00),  -- Vienesas: 130 * 1.228 = 159.640
(6, 138, 55, 2265.00),   -- Queso Cabeza: 55 * 2.265 = 124.575
(6, 139, 60, 2274.00),   -- Lomo Ahumado: 60 * 2.274 = 136.440
(6, 140, 45, 1317.00);   -- Jamón Serrano: 45 * 1.317 = 59.265
-- Suma de subtotales = 1.360.665


-- 4.8 Ingresar datos de ventas

INSERT INTO ventas (id_cliente,fecha_venta, total, metodo_pago, estado) VALUES

(1, '2025-08-30 10:30:00', 8480.00, 'tarjeta', 'completa'),   -- Venta 1 (cliente Juan Pérez)
(2, '2025-08-30 11:15:00', 13360.00, 'efectivo', 'completa'), -- Venta 2 (cliente María González)
(NULL, '2025-08-30 12:00:00', 17880.00, 'tarjeta', 'completa'), -- Venta sin cliente registrado
(NULL, '2025-08-30 12:45:00', 22100.00, 'efectivo', 'completa'), -- Venta sin cliente registrado
(NULL, '2025-08-30 13:30:00', 9030.00, 'tarjeta', 'completa'); -- Venta sin cliente registrado


-- 4.9 Ingresr datos de detalle de ventas

INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES

(1, 170, 3, 1750.00), -- detalle venta 1
(1, 157, 1, 3230.00), -- detalle venta 1
(2, 121, 1, 4860.00), -- detalle venta 2
(2, 126, 1, 2750.00), -- detalle venta 2
(2, 155, 2, 1670.00), -- detalle venta 2
(2, 156, 1, 2410.00), -- detalle venta 2
(3, 1, 2, 2330.00), -- detalle venta 3
(3, 2, 3, 1900.00), -- detalle venta 3
(3, 131, 1, 2110.00), -- detalle venta 3
(3, 129, 1, 5410.00), -- detalle venta 3
(4, 71, 1, 14740.00), -- detalle venta 4
(4, 85, 2, 2590.00), -- detalle venta 4
(4, 151, 1, 2180.00), -- detalle venta 4
(5, 91, 5, 840.00), -- detalle venta 5
(5, 92, 2, 1510.00), -- detalle venta 5
(5, 148, 1, 1810.00); -- detalle venta 5


-- 4.10 Ingresar datos de usuarios

INSERT INTO usuarios (nombre_usuario, contrasena, id_rol, estado) VALUES

('franco_admin', '1234admin', 1, 'activo'),
('maria_vendedor', 'v3nd3d0r', 2, 'activo'),
('juan_bodega', 'b0d3gu3r0', 3, 'activo'),
('ana_conta', 'c0ntab1lidad', 4, 'activo'),
('luis_analista', 'an4l1s1s', 5, 'activo');


-- 5 Creación de procesos almacenados

-- 5.1 Buscar producto por nombre o parte del nombre

DELIMITER //

CREATE PROCEDURE sp_buscar_producto(IN nombre_producto VARCHAR(150))
BEGIN
    SELECT 
        p.id_producto,
        p.nombre_producto,
        c.nombre_categoria AS categoria,
        p.precio,
        p.stock,
        p.unidad_medida,
        p.estado
    FROM productos p
    JOIN categorias c ON p.id_categoria = c.id_categoria
    WHERE p.nombre_producto LIKE CONCAT('%', nombre_producto, '%');
END //

DELIMITER ;

-- Llamada de procetimiento buscar producto

CALL sp_buscar_producto('Pan'); -- Cambiar 'Pan' por la búsqueda a realizar, ej: mermelada


-- 5.2 Consultar stock de un producto

DELIMITER //

CREATE PROCEDURE sp_consultar_stock(IN p_id_producto INT)
BEGIN
    SELECT 
        id_producto,
        nombre_producto,
        stock,
        unidad_medida,
        estado
    FROM productos
    WHERE id_producto = p_id_producto;
END //

DELIMITER ; 

-- Llamada de procedimiento consultar stock

CALL sp_consultar_stock(1);  -- Reemplazar 1 por el id del producto buscado


-- 5.3 Consultar ventas por cliente

DELIMITER //
CREATE PROCEDURE sp_consultar_ventas_cliente(IN p_id_cliente INT)
BEGIN
    SELECT v.id_venta, v.fecha_venta, v.total, v.metodo_pago, v.estado
    FROM ventas v
    WHERE v.id_cliente = p_id_cliente;
END //
DELIMITER ;

-- Llamada de procedimiento consultar ventas por cliente

CALL sp_consultar_ventas_cliente(1); -- Reemplazar 1 por id de cliente

-- 6. Gestión de usuarios a nivel de base de datos

-- Usuario administrador

CREATE USER 'franco_admin'@'localhost' IDENTIFIED BY '1234admin';

-- Usuario vendedor

CREATE USER 'maria_vendedor'@'localhost' IDENTIFIED BY 'v3nd3d0r';

-- Usuario de bodega

CREATE USER 'juan_bodega'@'localhost' IDENTIFIED BY 'b0d3gu3r0';

-- Usuario de contabilidad

CREATE USER 'ana_conta'@'localhost' IDENTIFIED BY 'c0ntab1lidad';

-- Usuario analista

CREATE USER 'luis_analista'@'localhost' IDENTIFIED BY 'an4l1s1s';

-- Opcional: Listar los usuarios de la bd

-- SELECT user, host FROM mysql.user;

-- 7. Asignación y administración de permisos

-- 7.1 Asignación de permisos

-- Permisos para administrador (acceso total)

GRANT ALL PRIVILEGES ON pantastica.* TO 'franco_admin'@'localhost' WITH GRANT OPTION;

-- Permisos para vendedor (solo ventas y clientes)

GRANT SELECT, INSERT, UPDATE ON pantastica.ventas TO 'maria_vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON pantastica.detalle_ventas TO 'maria_vendedor'@'localhost';
GRANT SELECT ON pantastica.clientes TO 'maria_vendedor'@'localhost';

-- Permisos para bodeguero (solo compras y productos)

GRANT SELECT, INSERT, UPDATE ON pantastica.compras TO 'juan_bodega'@'localhost';
GRANT SELECT, INSERT, UPDATE ON pantastica.detalle_compras TO 'juan_bodega'@'localhost';
GRANT SELECT, INSERT, UPDATE ON pantastica.productos TO 'juan_bodega'@'localhost';

-- Permisos para contabilidad (solo lectura de ventas y compras)

GRANT SELECT ON pantastica.ventas TO 'ana_conta'@'localhost';
GRANT SELECT ON pantastica.detalle_ventas TO 'ana_conta'@'localhost';
GRANT SELECT ON pantastica.compras TO 'ana_conta'@'localhost';
GRANT SELECT ON pantastica.detalle_compras TO 'ana_conta'@'localhost';

-- Permisos para analista (solo lectura de productos y ventas)

GRANT SELECT ON pantastica.productos TO 'luis_analista'@'localhost';
GRANT SELECT ON pantastica.ventas TO 'luis_analista'@'localhost';
GRANT SELECT ON pantastica.detalle_ventas TO 'luis_analista'@'localhost';

FLUSH PRIVILEGES; -- Recargar permisos para asegurarse que tengan efecto


-- 7.2 Forzar cambio de contraseña en el primer ingreso

ALTER USER 'franco_admin'@'localhost' PASSWORD EXPIRE;
ALTER USER 'maria_vendedor'@'localhost' PASSWORD EXPIRE;
ALTER USER 'juan_bodega'@'localhost' PASSWORD EXPIRE;
ALTER USER 'ana_conta'@'localhost' PASSWORD EXPIRE;
ALTER USER 'luis_analista'@'localhost' PASSWORD EXPIRE;



