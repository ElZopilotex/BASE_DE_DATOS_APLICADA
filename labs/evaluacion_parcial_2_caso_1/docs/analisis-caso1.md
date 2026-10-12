# Caso 1: Gestión de Patrimonio Forestal, Cosecha y Despacho de Trozas
**Empresa:** Forestal Bosques del Sur S.A.

---

## 1. Entidades, Atributos y Claves (Análisis Técnico)

### 1.1 Entidades Fuertes y Débiles
* **REGION**: `codigo_region` (PK), `nombre_region`.
* **COMUNA**: `codigo_comuna` (PK), `nombre_comuna`, `codigo_region` (FK).
* **PREDIO**: `rol_predio` (PK), `nombre_predio`, `superficie_total_ha`, `codigo_comuna` (FK).
* **RODAL** (Entidad Débil / Identificación Compuesta): 
  * Clave primaria compuesta: (`rol_predio` [FK], `numero_rodal`).
  * Atributos: `superficie_ha`, `anno_plantacion`, `densidad_arboles_ha` (Opcional/Nulo), `codigo_especie` (FK).
* **ESPECIE**: `codigo_especie` (PK), `nombre_comun`, `nombre_cientifico`, `turno_rotacion_annos`.
* **CONTRATISTA**: `rut_contratista` (PK), `razon_social`, `telefono`.
* **TRABAJADOR** (Supertipo):
  * Atributos: `rut_trabajador` (PK), `nombres`, `apellidos`, `fecha_ingreso`, `rut_contratista` (FK), `rut_jefe_cuadrilla` (FK - Autorrelación).
* **SUBTIPOS DE TRABAJADOR**:
  * **MOTOSIERRISTA**: `numero_certificacion`.
  * **OPERADOR_MAQUINARIA**: `clase_licencia`.
  * **BRIGADISTA**: `fecha_ultimo_curso_incendios`.
* **FAENA_COSECHA**: `id_faena` (PK), `fecha_inicio`, `fecha_termino` (Opcional), `metodo` (Tala rasa / Raleo), `rol_predio` + `numero_rodal` (FK a RODAL), `rut_contratista` (FK).
* **CAMION**: `patente` (PK), `capacidad_m3`, `rut_contratista` (FK - Dueño).
* **DESTINO** (Supertipo) / **ASERRADERO** / **PLANTA_CELULOSA** (Subtipos exclusión mutua):
  * **ASERRADERO**: `codigo_aserradero` (PK), `nombre`, `codigo_comuna` (FK).
  * **PLANTA_CELULOSA**: `codigo_planta` (PK), `nombre`, `capacidad_ton_dia`.
* **GUIA_DESPACHO**: `numero_guia` (PK), `fecha_hora`, `id_faena` (FK), `patente_camion` (FK), `rut_conductor` (FK - Trabajador), `codigo_destino` (FK).
* **PRODUCTO**: `codigo_producto` (PK), `descripcion` (Troza aserrable, Troza pulpable).
* **DETALLE_GUIA** (Entidad Intermedia N:M entre Guía y Producto):
  * Clave primaria compuesta: (`numero_guia` [FK], `codigo_producto` [FK]).
  * Atributos: `largo_m`, `numero_trozas`, `volumen_m3`.
* **INCENDIO**: `id_incendio` (PK), `fecha_hora_deteccion`, `fecha_hora_control` (Opcional), `superficie_afectada_ha`, `rol_predio` (FK).
* **COMBATE_INCENDIO** (Entidad Intermedia N:M entre Incendio y Brigadista):
  * Clave primaria compuesta: (`id_incendio` [FK], `rut_brigadista` [FK]).
  * Atributos: `hora_llegada`, `fecha_hora_retiro`.

---

## 2. Reglas de Negocio y Restricciones
* **BR-01:** Volumen total de GUÍA DE DESPACHO <= Capacidad m³ del CAMIÓN.
* **BR-02:** Edad del Rodal (`Año actual` - `Año plantación`) >= Turno de rotación de su ESPECIE.
* **BR-03:** Solo TRABAJADORES de tipo BRIGADISTA pueden participar en COMBATE_INCENDIO.
* **BR-04:** Un DESTINO es un Aserradero O una Planta de Celulosa, nunca ambos.
