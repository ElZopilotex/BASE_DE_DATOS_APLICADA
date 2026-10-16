# Evaluación Parcial N°2 - Parte 2 (Caso 2)
## Construcción y Normalización de Modelo Relacional

Este módulo contiene la solución del **Caso 2**, correspondiente a la transformación, análisis de normalización y construcción del **Modelo Relacional Normalizado** a partir del MER no normalizado proporcionado en la evaluación.

---

## 📌 Diagnóstico y Proceso de Normalización (1FN, 2FN y 3FN)

Para garantizar la integridad de los datos, evitar redundancias y anomalías de inserción/actualización/borrado, se aplican las tres formas normales sobre el modelo original:

### 1. Primera Forma Normal (1FN) - Eliminación de Atributos Repetitivos / Multivaluados
* **`PLANTA_PROCESO`**: Los atributos atómicos y repetitivos `telefono1` y `telefono2` se independizan para admitir múltiples números telefónicos sin modificar la estructura de la tabla principal.
* **`CLIENTE`**: Los atributos `correo1` y `correo2` se desglosan en una entidad dependiente de contactos/correos.

### 2. Segunda Forma Normal (2FN) - Eliminación de Dependencias Parciales
* **`PRODUCTO`**: El atributo `nombre_especie` depende funcionalmente de `cod_especie` y no del producto. Se extrae la entidad **`ESPECIE`** (`cod_especie`, `nombre_especie`) para evitar redundancia al registrar múltiples productos de la misma especie.

### 3. Tercera Forma Normal (3FN) - Eliminación de Dependencias Transitivas
* **Geografía / Ubicación**:
  * En `PLANTA_PROCESO`, `comuna` y `region` se normalizan en tablas independientes (`COMUNA` y `REGION`).
  * En `CLIENTE`, `ciudad` y `pais` se independizan mediante relaciones de localización estructurada.

---

## 📐 Modelo Entidad Relación Extendido (MERE)

### Subtipos de `EMBARQUE`
Se implementa la jerarquía de herencia exclusiva para los tipos de transporte:
* **Supertipo**: `EMBARQUE` (`nro_embarque` [PK], `fecha_salida`, `puerto_origen`).
* **Subtipo `MARITIMO`**: Hereda `nro_embarque` [PK/FK] + (`naviera`, `nombre_buque`, `nro_contenedor`).
* **Subtipo `AEREO`**: Hereda `nro_embarque` [PK/FK] + (`aerolinea`, `nro_vuelo`, `nro_guia_aerea`).

---

## 📁 Estructura del Directorio `Parte_2/`

```text
Parte_2/
├── img/
│   └── modelo_relacional_normalizado_caso2.png  # Captura del modelo normalizado final
├── model/
│   └── Caso2_Normalizado.dmd                     # Proyecto fuente de Oracle Data Modeler
├── sql/
│   └── script_caso2_normalizado.ddl             # Script DDL de generación de tablas
├── Evaluación Parcial 2_CASO_2_.docx             # Documento Word de respaldo/entrega
└── README.md                                    # Documentación del Caso 2
```

---

## 🚀 Próximos Pasos de Implementación

1. Crear el modelo relacional en **Oracle SQL Developer Data Modeler** según el diseño normalizado.
2. Generar el script de DDL (`script_caso2_normalizado.ddl`).
3. Exportar la captura de pantalla a `img/modelo_relacional_normalizado_caso2.png`.
4. Completar el documento Word de la prueba parcial para la entrega final vía AVA.