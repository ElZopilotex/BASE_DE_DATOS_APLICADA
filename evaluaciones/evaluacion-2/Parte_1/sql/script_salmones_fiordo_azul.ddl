-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-10-16 04:24:30 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ALIMENTACION_DIARIA 
    ( 
     fecha               DATE  NOT NULL , 
     kilos_suministrados NUMBER (8,2)  NOT NULL 
    ) 
;

ALTER TABLE ALIMENTACION_DIARIA 
    ADD CONSTRAINT ALIMENTACION_DIARIA_PK PRIMARY KEY ( fecha ) ;

CREATE TABLE ALIMENTO 
    ( 
     cod_alimento              VARCHAR2 (10)  NOT NULL , 
     nombre_alimento           VARCHAR2 (80)  NOT NULL , 
     tamano_pellet_mm          NUMBER (4,2)  NOT NULL , 
     ALIMENTACION_DIARIA_fecha DATE  NOT NULL 
    ) 
;

ALTER TABLE ALIMENTO 
    ADD CONSTRAINT ALIMENTO_PK PRIMARY KEY ( cod_alimento, ALIMENTACION_DIARIA_fecha ) ;

CREATE TABLE ASIGNACION_CENTRO 
    ( 
     fecha_inicio  DATE  NOT NULL , 
     fecha_termino DATE 
    ) 
;

ALTER TABLE ASIGNACION_CENTRO 
    ADD CONSTRAINT ASIGNACION_CENTRO_PK PRIMARY KEY ( fecha_inicio ) ;

CREATE TABLE BARRIO_SANITARIO 
    ( 
     codigo_barrio                VARCHAR2 (10)  NOT NULL , 
     nombre_barrio                VARCHAR2 (100)  NOT NULL , 
     CENTRO_CULTIVO_codigo_centro VARCHAR2 (15)  NOT NULL , 
     CENTRO_CULTIVO_numb_jaula    NUMBER (4)  NOT NULL , 
     CENTRO_CULTIVO_id_lote       VARCHAR2 (20)  NOT NULL , 
     CENTRO_CULTIVO_fecha         DATE  NOT NULL , 
     CENTRO_CULTIVO_fecha1        DATE  NOT NULL 
    ) 
;

ALTER TABLE BARRIO_SANITARIO 
    ADD CONSTRAINT BARRIO_SANITARIO_PK PRIMARY KEY ( codigo_barrio ) ;

CREATE TABLE CARGO 
    ( 
     id_cargo         NUMBER (5)  NOT NULL , 
     nombre_cargo     VARCHAR2 (80)  NOT NULL , 
     EMPLEADO_num_rut NUMBER (8)  NOT NULL 
    ) 
;

ALTER TABLE CARGO 
    ADD CONSTRAINT CARGO_PK PRIMARY KEY ( id_cargo ) ;

CREATE TABLE CAUSA_MORTALIDAD 
    ( 
     cod_causa               VARCHAR2 (10)  NOT NULL , 
     descripcion_causa       VARCHAR2 (100)  NOT NULL , 
     MORTALIDAD_DIARIA_fecha DATE  NOT NULL 
    ) 
;

ALTER TABLE CAUSA_MORTALIDAD 
    ADD CONSTRAINT CAUSA_MORTALIDAD_PK PRIMARY KEY ( cod_causa, MORTALIDAD_DIARIA_fecha ) ;

CREATE TABLE CENTRO_CULTIVO 
    ( 
     codigo_centro                  VARCHAR2 (15)  NOT NULL , 
     nombre_centro                  VARCHAR2 (100)  NOT NULL , 
     numb_concesion                 VARCHAR2 (30)  NOT NULL , 
     latitud                        NUMBER (10,6)  NOT NULL , 
     longitud                       NUMBER (10,6)  NOT NULL , 
     fecha_inicio                   VARCHAR2 (20)  NOT NULL , 
     JAULA_numb_jaula               NUMBER (4)  NOT NULL , 
     JAULA_id_lote                  VARCHAR2 (20)  NOT NULL , 
     JAULA_fecha                    DATE  NOT NULL , 
     JAULA_fecha1                   DATE  NOT NULL , 
     ASIGNACION_CENTRO_fecha_inicio DATE  NOT NULL 
    ) 
;

ALTER TABLE CENTRO_CULTIVO 
    ADD CONSTRAINT CENTRO_CULTIVO_PK PRIMARY KEY ( codigo_centro, JAULA_numb_jaula, JAULA_id_lote, JAULA_fecha, JAULA_fecha1 ) ;

CREATE TABLE CLIENTE 
    ( 
     rut_cliente   VARCHAR2 (10)  NOT NULL , 
     dv            VARCHAR2 (1)  NOT NULL , 
     razon_social  VARCHAR2 (120)  NOT NULL , 
     direccion     VARCHAR2 (150)  NOT NULL , 
     telefono      VARCHAR2 (20)  NOT NULL , 
     numb_factura  NUMBER  NOT NULL , 
     numb_factura1 NUMBER  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( rut_cliente ) ;

CREATE TABLE COMUNA 
    ( 
     id_comuna                    NUMBER (5)  NOT NULL , 
     nombre_comuna                VARCHAR2 (100)  NOT NULL , 
     CENTRO_CULTIVO_codigo_centro VARCHAR2 (15)  NOT NULL , 
     CENTRO_CULTIVO_numb_jaula    NUMBER (4)  NOT NULL , 
     CENTRO_CULTIVO_id_lote       VARCHAR2 (20)  NOT NULL , 
     CENTRO_CULTIVO_fecha         DATE  NOT NULL , 
     CENTRO_CULTIVO_fecha1        DATE  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( id_comuna ) ;

CREATE TABLE COSECHA 
    ( 
     id_cosecha                      NUMBER (10)  NOT NULL , 
     fecha_cosecha                   DATE  NOT NULL , 
     toneladas_cosechadas            NUMBER (8,2)  NOT NULL , 
     calibre_promedio                VARCHAR2 (30)  NOT NULL , 
     rut_planta                      VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                     NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     PLANTA_PROCESAMIENTO_rut_planta VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE COSECHA 
    ADD CONSTRAINT COSECHA_PK PRIMARY KEY ( id_cosecha ) ;

CREATE TABLE DETALLE_VENTA 
    ( 
     cantidad_kilos       NUMBER (10,2)  NOT NULL , 
     precio_unitario_kilo NUMBER (8,2)  NOT NULL , 
     numb_factura         NUMBER  NOT NULL , 
     VENTA_numb_factura   NUMBER (10)  NOT NULL 
    ) 
;

CREATE TABLE EMPLEADO 
    ( 
     num_rut          NUMBER (8)  NOT NULL , 
     dv               VARCHAR2 (1)  NOT NULL , 
     nombres          VARCHAR2 (60)  NOT NULL , 
     apellido_paterno VARCHAR2 (60)  NOT NULL , 
     apellido_materno VARCHAR2 (60)  NOT NULL , 
     telefono         VARCHAR2 (20)  NOT NULL , 
     id_tratamiento   NUMBER  NOT NULL 
    ) 
;

ALTER TABLE EMPLEADO 
    ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY ( num_rut ) ;

CREATE TABLE ESPECIE 
    ( 
     codigo_especie               VARCHAR2 (10)  NOT NULL , 
     nombre_comun                 VARCHAR2 (80)  NOT NULL , 
     nombre_cientifico            VARCHAR2 (100)  NOT NULL , 
     LOTE_id_lote                 VARCHAR2 (20)  NOT NULL , 
     LOTE_fecha                   DATE  NOT NULL , 
     LOTE_MORTALIDAD_DIARIA_fecha DATE  NOT NULL 
    ) 
;

ALTER TABLE ESPECIE 
    ADD CONSTRAINT ESPECIE_PK PRIMARY KEY ( codigo_especie ) ;

CREATE TABLE FARMACO 
    ( 
     cod_farmaco                          VARCHAR2 (10)  NOT NULL , 
     nombre_farmaco                       VARCHAR2 (80)  NOT NULL , 
     principio_activo                     VARCHAR2 (100)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     TRATAMIENTO_SANITARIO_id_tratamiento NUMBER (8)  NOT NULL 
    ) 
;

ALTER TABLE FARMACO 
    ADD CONSTRAINT FARMACO_PK PRIMARY KEY ( cod_farmaco ) ;

CREATE TABLE JAULA 
    ( 
     numb_jaula                   NUMBER (4)  NOT NULL , 
     diametro                     NUMBER (6,2)  NOT NULL , 
     profundidad_red              NUMBER (6,2)  NOT NULL , 
     estado                       VARCHAR2 (20)  NOT NULL , 
     LOTE_id_lote                 VARCHAR2 (20)  NOT NULL , 
     LOTE_fecha                   DATE  NOT NULL , 
     LOTE_MORTALIDAD_DIARIA_fecha DATE  NOT NULL 
    ) 
;

ALTER TABLE JAULA 
    ADD CONSTRAINT JAULA_PK PRIMARY KEY ( numb_jaula, LOTE_id_lote, LOTE_fecha, LOTE_MORTALIDAD_DIARIA_fecha ) ;

CREATE TABLE JEFE_CENTRO 
    ( 
     num_rut      NUMBER (8)  NOT NULL , 
     bono_gestion NUMBER (10,2)  NOT NULL 
    ) 
;

ALTER TABLE JEFE_CENTRO 
    ADD CONSTRAINT JEFE_CENTRO_PK PRIMARY KEY ( num_rut ) ;

CREATE TABLE LOTE 
    ( 
     id_lote                              VARCHAR2 (20)  NOT NULL , 
     fecha_siembra                        DATE  NOT NULL , 
     cantidad_peces                       NUMBER (8)  NOT NULL , 
     peso_promedio_inicial_g              NUMBER (8,2)  NOT NULL , 
     fecha_cierre                         DATE , 
     ALIMENTACION_DIARIA_fecha            DATE  NOT NULL , 
     MORTALIDAD_DIARIA_fecha              DATE  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     TRATAMIENTO_SANITARIO_id_tratamiento NUMBER (8)  NOT NULL , 
     COSECHA_id_cosecha                   NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE LOTE 
    ADD CONSTRAINT LOTE_PK PRIMARY KEY ( id_lote, ALIMENTACION_DIARIA_fecha, MORTALIDAD_DIARIA_fecha ) ;

CREATE TABLE MEDICO_VETERINARIO 
    ( 
     num_rut                              NUMBER (8)  NOT NULL , 
     num_registro_colegio                 VARCHAR2 (20)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     TRATAMIENTO_SANITARIO_id_tratamiento NUMBER (8)  NOT NULL 
    ) 
;

ALTER TABLE MEDICO_VETERINARIO 
    ADD CONSTRAINT MEDICO_VETERINARIO_PK PRIMARY KEY ( num_rut ) ;

CREATE TABLE MORTALIDAD_DIARIA 
    ( 
     fecha                DATE  NOT NULL , 
     numero_peces_muertos NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE MORTALIDAD_DIARIA 
    ADD CONSTRAINT MORTALIDAD_DIARIA_PK PRIMARY KEY ( fecha ) ;

CREATE TABLE OPERARIO 
    ( 
     num_rut                        NUMBER (8)  NOT NULL , 
     area_especialidad              VARCHAR2 (60)  NOT NULL , 
     ASIGNACION_CENTRO_fecha_inicio DATE  NOT NULL 
    ) 
;

ALTER TABLE OPERARIO 
    ADD CONSTRAINT OPERARIO_PK PRIMARY KEY ( num_rut ) ;

CREATE TABLE PISCICULTURA 
    ( 
     rut_piscicultura             VARCHAR2 (10)  NOT NULL , 
     dv                           VARCHAR2 (1)  NOT NULL , 
     razon_social                 VARCHAR2 (120)  NOT NULL , 
     telefono                     VARCHAR2 (20)  NOT NULL , 
     LOTE_id_lote                 VARCHAR2 (20)  NOT NULL , 
     LOTE_fecha                   DATE  NOT NULL , 
     LOTE_MORTALIDAD_DIARIA_fecha DATE  NOT NULL 
    ) 
;

ALTER TABLE PISCICULTURA 
    ADD CONSTRAINT PISCICULTURA_PK PRIMARY KEY ( rut_piscicultura ) ;

CREATE TABLE PLANTA_PROCESAMIENTO 
    ( 
     rut_planta    VARCHAR2 (10)  NOT NULL , 
     dv            VARCHAR2 (1)  NOT NULL , 
     nombre_planta VARCHAR2 (100)  NOT NULL , 
     direccion     VARCHAR2 (150)  NOT NULL , 
     id_cosecha    NUMBER  NOT NULL , 
     id_cosecha1   NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PLANTA_PROCESAMIENTO 
    ADD CONSTRAINT PLANTA_PROCESAMIENTO_PK PRIMARY KEY ( rut_planta ) ;

CREATE TABLE REGION 
    ( 
     id_region        NUMBER (5)  NOT NULL , 
     nombre_region    VARCHAR2 (20)  NOT NULL , 
     COMUNA_id_comuna NUMBER (5) 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( id_region ) ;

CREATE TABLE TRATAMIENTO_SANITARIO 
    ( 
     id_tratamiento     NUMBER (8)  NOT NULL , 
     fecha_inicio       DATE  NOT NULL , 
     fecha_linea_cierre DATE , 
     dosis_aplicada     VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE TRATAMIENTO_SANITARIO 
    ADD CONSTRAINT TRATAMIENTO_SANITARIO_PK PRIMARY KEY ( id_tratamiento ) ;

CREATE TABLE VENTA 
    ( 
     numb_factura  NUMBER (10)  NOT NULL , 
     fecha_venta   DATE  NOT NULL , 
     monto_total   NUMBER (12,2)  NOT NULL , 
     numb_factura1 NUMBER  NOT NULL 
    ) 
;

ALTER TABLE VENTA 
    ADD CONSTRAINT VENTA_PK PRIMARY KEY ( numb_factura ) ;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE ALIMENTO 
    ADD CONSTRAINT ALIMENTO_ALIMENTACION_DIARIA_FK FOREIGN KEY 
    ( 
     ALIMENTACION_DIARIA_fecha
    ) 
    REFERENCES ALIMENTACION_DIARIA 
    ( 
     fecha
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE BARRIO_SANITARIO 
    ADD CONSTRAINT BARRIO_SANITARIO_CENTRO_CULTIVO_FK FOREIGN KEY 
    ( 
     CENTRO_CULTIVO_codigo_centro,
     CENTRO_CULTIVO_numb_jaula,
     CENTRO_CULTIVO_id_lote,
     CENTRO_CULTIVO_fecha,
     CENTRO_CULTIVO_fecha1
    ) 
    REFERENCES CENTRO_CULTIVO 
    ( 
     codigo_centro,
     JAULA_numb_jaula,
     JAULA_id_lote,
     JAULA_fecha,
     JAULA_fecha1
    ) 
;

ALTER TABLE CARGO 
    ADD CONSTRAINT CARGO_EMPLEADO_FK FOREIGN KEY 
    ( 
     EMPLEADO_num_rut
    ) 
    REFERENCES EMPLEADO 
    ( 
     num_rut
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE CAUSA_MORTALIDAD 
    ADD CONSTRAINT CAUSA_MORTALIDAD_MORTALIDAD_DIARIA_FK FOREIGN KEY 
    ( 
     MORTALIDAD_DIARIA_fecha
    ) 
    REFERENCES MORTALIDAD_DIARIA 
    ( 
     fecha
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE CENTRO_CULTIVO 
    ADD CONSTRAINT CENTRO_CULTIVO_ASIGNACION_CENTRO_FK FOREIGN KEY 
    ( 
     ASIGNACION_CENTRO_fecha_inicio
    ) 
    REFERENCES ASIGNACION_CENTRO 
    ( 
     fecha_inicio
    ) 
;

ALTER TABLE CENTRO_CULTIVO 
    ADD CONSTRAINT CENTRO_CULTIVO_JAULA_FK FOREIGN KEY 
    ( 
     JAULA_numb_jaula,
     JAULA_id_lote,
     JAULA_fecha,
     JAULA_fecha1
    ) 
    REFERENCES JAULA 
    ( 
     numb_jaula,
     LOTE_id_lote,
     LOTE_fecha,
     LOTE_MORTALIDAD_DIARIA_fecha
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_CENTRO_CULTIVO_FK FOREIGN KEY 
    ( 
     CENTRO_CULTIVO_codigo_centro,
     CENTRO_CULTIVO_numb_jaula,
     CENTRO_CULTIVO_id_lote,
     CENTRO_CULTIVO_fecha,
     CENTRO_CULTIVO_fecha1
    ) 
    REFERENCES CENTRO_CULTIVO 
    ( 
     codigo_centro,
     JAULA_numb_jaula,
     JAULA_id_lote,
     JAULA_fecha,
     JAULA_fecha1
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE COSECHA 
    ADD CONSTRAINT COSECHA_PLANTA_PROCESAMIENTO_FK FOREIGN KEY 
    ( 
     PLANTA_PROCESAMIENTO_rut_planta
    ) 
    REFERENCES PLANTA_PROCESAMIENTO 
    ( 
     rut_planta
    ) 
;

ALTER TABLE DETALLE_VENTA 
    ADD CONSTRAINT DETALLE_VENTA_VENTA_FK FOREIGN KEY 
    ( 
     VENTA_numb_factura
    ) 
    REFERENCES VENTA 
    ( 
     numb_factura
    ) 
;

ALTER TABLE ESPECIE 
    ADD CONSTRAINT ESPECIE_LOTE_FK FOREIGN KEY 
    ( 
     LOTE_id_lote,
     LOTE_fecha,
     LOTE_MORTALIDAD_DIARIA_fecha
    ) 
    REFERENCES LOTE 
    ( 
     id_lote,
     ALIMENTACION_DIARIA_fecha,
     MORTALIDAD_DIARIA_fecha
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE FARMACO 
    ADD CONSTRAINT FARMACO_TRATAMIENTO_SANITARIO_FK FOREIGN KEY 
    ( 
     TRATAMIENTO_SANITARIO_id_tratamiento
    ) 
    REFERENCES TRATAMIENTO_SANITARIO 
    ( 
     id_tratamiento
    ) 
;

ALTER TABLE JAULA 
    ADD CONSTRAINT JAULA_LOTE_FK FOREIGN KEY 
    ( 
     LOTE_id_lote,
     LOTE_fecha,
     LOTE_MORTALIDAD_DIARIA_fecha
    ) 
    REFERENCES LOTE 
    ( 
     id_lote,
     ALIMENTACION_DIARIA_fecha,
     MORTALIDAD_DIARIA_fecha
    ) 
;

ALTER TABLE JEFE_CENTRO 
    ADD CONSTRAINT JEFE_CENTRO_EMPLEADO_FK FOREIGN KEY 
    ( 
     num_rut
    ) 
    REFERENCES EMPLEADO 
    ( 
     num_rut
    ) 
;

ALTER TABLE LOTE 
    ADD CONSTRAINT LOTE_ALIMENTACION_DIARIA_FK FOREIGN KEY 
    ( 
     ALIMENTACION_DIARIA_fecha
    ) 
    REFERENCES ALIMENTACION_DIARIA 
    ( 
     fecha
    ) 
;

ALTER TABLE LOTE 
    ADD CONSTRAINT LOTE_COSECHA_FK FOREIGN KEY 
    ( 
     COSECHA_id_cosecha
    ) 
    REFERENCES COSECHA 
    ( 
     id_cosecha
    ) 
;

ALTER TABLE LOTE 
    ADD CONSTRAINT LOTE_MORTALIDAD_DIARIA_FK FOREIGN KEY 
    ( 
     MORTALIDAD_DIARIA_fecha
    ) 
    REFERENCES MORTALIDAD_DIARIA 
    ( 
     fecha
    ) 
;

ALTER TABLE LOTE 
    ADD CONSTRAINT LOTE_TRATAMIENTO_SANITARIO_FK FOREIGN KEY 
    ( 
     TRATAMIENTO_SANITARIO_id_tratamiento
    ) 
    REFERENCES TRATAMIENTO_SANITARIO 
    ( 
     id_tratamiento
    ) 
;

ALTER TABLE MEDICO_VETERINARIO 
    ADD CONSTRAINT MEDICO_VETERINARIO_EMPLEADO_FK FOREIGN KEY 
    ( 
     num_rut
    ) 
    REFERENCES EMPLEADO 
    ( 
     num_rut
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE MEDICO_VETERINARIO 
    ADD CONSTRAINT MEDICO_VETERINARIO_TRATAMIENTO_SANITARIO_FK FOREIGN KEY 
    ( 
     TRATAMIENTO_SANITARIO_id_tratamiento
    ) 
    REFERENCES TRATAMIENTO_SANITARIO 
    ( 
     id_tratamiento
    ) 
;

ALTER TABLE OPERARIO 
    ADD CONSTRAINT OPERARIO_ASIGNACION_CENTRO_FK FOREIGN KEY 
    ( 
     ASIGNACION_CENTRO_fecha_inicio
    ) 
    REFERENCES ASIGNACION_CENTRO 
    ( 
     fecha_inicio
    ) 
;

ALTER TABLE OPERARIO 
    ADD CONSTRAINT OPERARIO_EMPLEADO_FK FOREIGN KEY 
    ( 
     num_rut
    ) 
    REFERENCES EMPLEADO 
    ( 
     num_rut
    ) 
;

ALTER TABLE PISCICULTURA 
    ADD CONSTRAINT PISCICULTURA_LOTE_FK FOREIGN KEY 
    ( 
     LOTE_id_lote,
     LOTE_fecha,
     LOTE_MORTALIDAD_DIARIA_fecha
    ) 
    REFERENCES LOTE 
    ( 
     id_lote,
     ALIMENTACION_DIARIA_fecha,
     MORTALIDAD_DIARIA_fecha
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_id_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     id_comuna
    ) 
;

-- Error - Foreign Key VENTA_CLIENTE_FK has no columns

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            25
-- CREATE INDEX                             0
-- ALTER TABLE                             47
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  16
-- WARNINGS                                 0
