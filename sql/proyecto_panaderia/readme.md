# 🗄️ Proyecto SQL: Panadería 'Pantástica'

## 📖 Introducción

Este proyecto consiste en la creación de un **modelo de base de datos relacional** para una panadería-pastelería en crecimiento, denominada de manera ficticia **Pantástica**, con el objetivo de registrar productos, proveedores, compras, ventas y usuarios internos.  

⚠️ **Nota:** La información utilizada para el diseño de este modelo fue proporcionada parcialmente por la panadería real con fines de orientación. Todos los nombres de productos, clientes y la estructura de la base de datos han sido modificados para garantizar la **confidencialidad y anonimato** del negocio. Los proveedores, así como los rangos de precios y volúmenes de venta, fueron estimados con base en observaciones generales del crecimiento reciente de la panadería y representan **valores aproximados**, consistentes con la información disponible públicamente o proporcionada de manera no confidencial.

---

## 🎯 Objetivos

- Diseñar un **modelo relacional completo** para la gestión de productos, compras y ventas.  
- Implementar relaciones **1:M y M:M** entre tablas.  
- Crear **usuarios, roles y procedimientos almacenados** para automatizar tareas.  
- Mantener la **confidencialidad** de datos sensibles, usando información simulada o aproximada cuando corresponde.
- Diseñar un modelo relacional que permita futuras ampliaciones sin reestructurar la base de datos.

---

## 🛠️ Motor usado

- **Motor:** MySQL Workbench 8.0 CE  
- **Cliente:** MySQL Workbench  

---

## 🗂️ Esquema de la base de datos


<img width="952" height="820" alt="esquema pantastica" src="https://github.com/user-attachments/assets/7cdcdc0d-6b4c-4cf7-94ca-31c9ee0f06d9" />

*Fuente: Elaboración propia.*


La base de datos contiene **10 tablas**  
1. `categorias`  
2. `productos`  
3. `proveedores`  
4. `clientes` (para pedidos especiales/masivos)  
5. `ventas`  
6. `detalle_ventas`  
7. `compras`  
8. `detalle_compras`  
9. `roles`  
10. `usuarios`  

Cada tabla incluye sus claves primarias y relaciones con otras tablas según la metodología de diseño relacional.

---

## 🔄 Flujo de trabajo / Metodología

1. **Creación de modelo** → creación del modelo principal para la base de datos.  
2. **Definición de tablas** → creación de cada entidad con sus atributos y tipos de datos.  
3. **Relaciones entre tablas** → 1:M y M:M entre productos, compras, ventas y proveedores.  
4. **Carga de datos simulados** → se ingresaron aproximadamente 200 productos, con rangos de precios y volúmenes estimados según observación, además de datos en cada una de las tablas.  
5. **Usuarios y roles** → creación de permisos para administrar la base de datos.  
6. **Procedimientos almacenados** → para operaciones frecuentes como `cambiar_precio` y `buscar_producto`.  
7. **Asignación de permisos** → se otorgaron los permisos correspondientes según función del trabajador.


---

## 🧰 Técnicas y herramientas usadas

- Diseño de **modelo relacional**.  
- Creación de **procedimientos almacenados** y claves foráneas.  
- Uso de **MySQL Workbench** para desarrollo y pruebas.
- Uso de **Reverse engineer** para generar el esquema. 
- Aplicación de **tipos de datos, constraints y ENUMs** para control de valores válidos.  

---

## 💻 Consultas realizadas

Durante el desarrollo del proyecto, se realizaron **consultas de verificación y pruebas** para asegurar la correcta implementación del modelo relacional, los procedimientos almacenados, las claves primarias y foráneas, así como la correcta asignación de permisos y roles.  

- Se comprobaron **inserciones y actualizaciones** en todas las tablas, incluyendo productos, ventas y compras.  
- Se ejecutaron procedimientos almacenados de prueba, como la búsqueda de productos y el cálculo de totales de ventas, para validar su correcto funcionamiento.  
- Se realizaron consultas de control sobre usuarios y roles para verificar que los **permisos y políticas de contraseñas** se aplicaran correctamente.  

> Nota: Dado que los datos fueron ingresados de manera simulada, estas consultas no buscan análisis estadístico, sino **garantizar la integridad y funcionamiento de la base de datos**.
> 
---

## 📊 Hallazgos

- La panadería ha experimentado un **crecimiento significativo**: duplicó las ventas en los últimos dos años y aumentó la cantidad de productos, compras a proveedores y personal.  
- La gestión manual de la información se vuelve cada vez más compleja; por ello, se evidencia la **necesidad de contar con una base de datos sólida y centralizada**.  
- La correcta administración de roles, permisos y procedimientos almacenados permite **mantener la seguridad y consistencia** de los datos sensibles, especialmente información de clientes y proveedores.  
- Una base de datos bien estructurada facilita la **automatización de tareas recurrentes**, como cálculo de totales de ventas, control de inventario y gestión de precios.

---

## 📝 Conclusiones

- La construcción de la base de datos **Pantástica** garantiza un manejo estructurado y seguro de la información, evitando errores comunes de duplicidad y pérdida de datos.  
- La implementación de procedimientos almacenados y la correcta gestión de usuarios y permisos es esencial para mantener la **integridad y seguridad** de los datos internos.  
- Este proyecto demuestra que, a medida que un negocio crece, **la centralización y profesionalización de la información mediante SQL es indispensable** para un manejo eficiente.  
- Se recomienda que la panadería cuente con **un encargado de base de datos o administrador de SQL**, capaz de mantener y actualizar el sistema conforme la empresa continúe expandiéndose.

---

## 🚀 Cómo replicar este proyecto

### ⚠️ Requisitos y excepciones

- Tener instalado **MySQL Workbench 8.0 CE**.
- La base de datos **Pantástica** fue diseñada con datos simulados; no refleja cifras reales exactas.  
- Para replicar con datos propios, reemplazar los registros de productos, proveedores y clientes por información válida.

### 📝 Pasos para replicar

1. **Descargar el archivo SQL:** Clonar o descargar el repositorio desde GitHub y ubicar el archivo principal, por ejemplo `pantastica.sql`.  
2. **Abrir MySQL Workbench:** Conectarse al servidor local o remoto donde se desea crear la base de datos.  
3. **Ejecutar el script SQL:** Abrir `pantastica.sql` en MySQL Workbench y ejecutar todo el script. Esto realizará automáticamente:  
   - Eliminación del esquema si existe (`DROP SCHEMA IF EXISTS pantastica;`)  
   - Creación del esquema con codificación UTF8 (`CREATE SCHEMA pantastica CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;`)  
   - Selección del esquema (`USE pantastica;`)  
   - Creación de todas las tablas con sus claves primarias y foráneas  
   - Inserción de datos de prueba en todas las tablas  
   - Creación de procedimientos almacenados  
   - Configuración de usuarios, roles y permisos  
4. **Verificar la base de datos:** Ejecutar consultas de prueba para comprobar que todas las tablas, relaciones, procedimientos y permisos funcionan correctamente.  


---

> **Sugerencias futuras:**  
> Los procedimientos almacenados implementados en este proyecto fueron creados principalmente para la **presentación del modelo de pruebas** a la empresa.  
> En versiones futuras se podrían desarrollar procedimientos más complejos y funcionales, tales como:  
> - Automatización de inserciones de ventas y detalle de ventas.  
> - Automatización de compras y detalle de compras.  
> - Mayor control de stock de productos, incluyendo alertas por niveles mínimos.  
> - Generación de estadísticas y reportes automáticos sobre ventas, compras y clientes.  
> - Consultas de stock por nombre de producto, además de consultas por ID.  
> 
> Estas mejoras permitirían que la base de datos no solo sea un modelo de prueba, sino una **herramienta operativa completa para la panadería**.


---

📌 Autor

Franco Díaz - [GitHub](https://github.com/fesdsm)
