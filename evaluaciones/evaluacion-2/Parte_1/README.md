# Evaluacion 2: Modelo de Base de Datos - Salmones Fiordo Azul S.A.

Este repositorio contiene la solución completa para la **Evaluación 2** del caso de estudio **Salmones Fiordo Azul S.A.**, desarrollada utilizando **Oracle SQL Developer Data Modeler**.

---

## 📌 Descripción del Proyecto

El sistema está diseñado para gestionar de forma integral el proceso productivo, sanitario, administrativo y comercial de la empresa salmonera. Cubre desde el origen de la producción hasta la venta final y distribución en plantas de procesamiento.

### Módulos Principales
1. **Territorial y Centros**: Gestión de regiones, comunas, barrios sanitarios y centros de cultivo.
2. **Producción e Infraestructura**: Control de jaulas, pisciculturas, especies y lotes de cultivo.
3. **Control Operativo y Sanitario**: Seguimiento diario de alimentación, mortalidad y tratamientos sanitarios (con sus respectivos fármacos y médicos veterinarios).
4. **Procesamiento y Comercialización**: Registro de cosechas, plantas de procesamiento, clientes, ventas y detalle de ventas.
5. **Recursos Humanos**: Administración de empleados con jerarquía y especialización de roles (`OPERARIO`, `JEFE_CENTRO`, `MEDICO_VETERINARIO`).

---

## 📁 Estructura del Repositorio

```text
evaluacion-2/
├── img/
│   └── diagrama_relacional.png      # Captura de alta resolución del modelo relacional final
├── model/
│   └── Parte 1.dmd                  # Archivo de diseño fuente de Oracle SQL Developer Data Modeler
├── sql/
│   └── script_salmones_fiordo_azul.ddl # Script DDL completo con las sentencias DDL (CREATE/ALTER TABLE)
└── README.md                        # Documentación principal del proyecto
```

---

## 🛠️ Especificaciones Técnicas del Modelo

* **Herramienta de Modelado**: Oracle SQL Developer Data Modeler.
* **Modelo Lógico**: 25 entidades principales con sus atributos y tipos de datos de dominio.
* **Modelo Relacional**: 
  * Normalización completa en 3FN.
  * Claves primarias (PK) y foráneas (FK) validadas sin duplicación de atributos.
  * Subtipos e identificación de relaciones mapeadas correctamente.
  * Enrutamiento de líneas ortogonal para lectura profesional del diagrama.

---

## 🚀 Instrucciones de Ejecución Script DDL

Para desplegar las tablas en una base de datos Oracle SQL Developer / Oracle Database:

1. Abrir la conexión a la base de datos objetivo.
2. Cargar y ejecutar el script ubicado en `sql/script_salmones_fiordo_azul.ddl`.
3. Verificar la creación de las tablas y las restricciones mediante la vista del usuario:
   ```sql
   SELECT table_name FROM user_tables;
   ```