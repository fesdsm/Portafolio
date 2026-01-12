# 📦 Proyecto ETL – EDW Educacional

## 📌 Descripción general

Este proyecto simula un proceso ETL orientado a la **migración, homologación y consolidación de datos educacionales** hacia un **Enterprise Data Warehouse (EDW)**, replicando escenarios y decisiones técnicas habituales en entornos productivos.

El caso de estudio se basa en un contexto ficticio de reorganización institucional, donde información histórica y actual proveniente de distintas fuentes debe ser formalizada, estandarizada y centralizada en un modelo de datos único, confiable y preparado para análisis y reporting.

El foco del proyecto no está en el dominio educacional en sí, sino en la **implementación técnica del proceso ETL**, el diseño del modelo destino y la aplicación de buenas prácticas de integración de datos.

---

## 🎯 Objetivos del proyecto

- Diseñar un proceso ETL completo, desde fuentes origen hasta un modelo analítico centralizado.
- Implementar reglas de **homologación y normalización** de datos.
- Simular la **integración progresiva de información histórica digitalizada**.
- Aplicar **lógica de carga incremental (delta)** para optimizar el procesamiento.
- Construir un **modelo de datos estructurado** bajo el enfoque de Data Warehouse empresarial.
- Documentar decisiones técnicas, supuestos y alcances del proceso.

---

## 🏗️ Justificación del uso de Enterprise Data Warehouse (EDW)

Se adopta un enfoque de **Enterprise Data Warehouse** debido a las siguientes necesidades técnicas:

- Existencia de múltiples fuentes de datos con estructuras y criterios distintos.
- Presencia de información histórica que requiere consistencia y trazabilidad.
- Separación entre datos operacionales y datos analíticos.
- Necesidad de un modelo centralizado, estable y optimizado para consultas.
- Escalabilidad del modelo para futuras incorporaciones de datos o nuevos procesos ETL.

El EDW actúa como **repositorio único de información consolidada**, garantizando integridad, estandarización y una base sólida para análisis posteriores.

---

## 🔄 Justificación de la carga incremental (delta)

La lógica de carga incremental se justifica por la **digitalización progresiva de información histórica**, originalmente almacenada en formatos físicos o no estructurados, y por la posibilidad de correcciones posteriores derivadas de procesos administrativos y revisiones internas.

El proceso ETL contempla:

- Inserción de nuevos registros digitalizados.
- Actualización de registros previamente cargados.
- Reprocesos parciales por periodo académico o rango temporal.
- Control de cambios para evitar cargas completas innecesarias.

Este enfoque permite:

- Optimizar tiempos de ejecución.
- Reducir reprocesamiento de datos históricos.
- Mantener trazabilidad y control sobre las cargas realizadas.

---

## 🧱 Arquitectura general del proceso

El flujo de datos se organiza en capas lógicas:

- **Origen**: fuentes simuladas (archivos estructurados).
- **Staging**: carga inicial, validaciones básicas y transformaciones preliminares.
- **Core / EDW**: modelo centralizado, normalizado y consistente.
- **Control**: tablas auxiliares para gestión de cargas y auditoría.

Esta arquitectura permite desacoplar las fuentes del modelo analítico y facilita el mantenimiento del proceso ETL.

---

## 🛠️ Tecnologías y herramientas utilizadas

- SQL
- Bases de datos relacionales
- Modelado de datos
- Procesos ETL
- Lógica de carga incremental (delta)
- Documentación técnica

---

## 📌 Alcance y supuestos

- Los datos utilizados son ficticios, pero estructurados de forma coherente.
- No se consideran aspectos financieros ni contractuales.
- El foco está en el diseño técnico y la lógica del proceso ETL.
- El modelo puede extenderse para nuevos dominios o fuentes sin rediseño completo.
- El modelo está sujeto a cambios que signifiquen mejoras.

---

📌 **Autor**  
Franco Díaz – GitHub
