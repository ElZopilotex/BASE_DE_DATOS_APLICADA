-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-10-12 02:56:23 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BRIGADISTA 
    ( 
     rut_trabajador               VARCHAR2 (12)  NOT NULL , 
     fecha_ultimo_curso_incendios DATE  NOT NULL 
    ) 
;

ALTER TABLE BRIGADISTA 
    ADD CONSTRAINT BRIGADISTA_PK PRIMARY KEY ( rut_trabajador ) ;

CREATE TABLE COMUNA 
    ( 
     codigo_comuna        NUMBER (5)  NOT NULL , 
     nombre_comuna        VARCHAR2 (100)  NOT NULL , 
     REGION_codigo_region NUMBER (5)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( codigo_comuna ) ;

CREATE TABLE CONTRATISTA 
    ( 
     rut_contratista VARCHAR2 (12)  NOT NULL , 
     razon_social    VARCHAR2 (150)  NOT NULL , 
     telefono        VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE CONTRATISTA 
    ADD CONSTRAINT CONTRATISTA_PK PRIMARY KEY ( rut_contratista ) ;

CREATE TABLE ESPECIE 
    ( 
     codigo_especie       NUMBER (5)  NOT NULL , 
     nombre_comun         VARCHAR2 (100)  NOT NULL , 
     nombre_cientifico    VARCHAR2 (100)  NOT NULL , 
     turno_rotacion_annos NUMBER (4)  NOT NULL 
    ) 
;

ALTER TABLE ESPECIE 
    ADD CONSTRAINT ESPECIE_PK PRIMARY KEY ( codigo_especie ) ;

CREATE TABLE FAENA_COSECHA 
    ( 
     id_faena                    NUMBER (10)  NOT NULL , 
     fecha_inicio                DATE  NOT NULL , 
     fecha_termino               DATE , 
     estado_faena                VARCHAR2 (30)  NOT NULL , 
     RODAL_numero_rodal          NUMBER (5)  NOT NULL , 
     RODAL_PREDIO_rol_predio     VARCHAR2 (20)  NOT NULL , 
     CONTRATISTA_rut_contratista VARCHAR2 (12)  NOT NULL 
    ) 
;

ALTER TABLE FAENA_COSECHA 
    ADD CONSTRAINT FAENA_COSECHA_PK PRIMARY KEY ( id_faena ) ;

CREATE TABLE GUIA_DESPACHO 
    ( 
     numero_guia            NUMBER (10)  NOT NULL , 
     fecha_emision          DATE  NOT NULL , 
     volumen_m3             NUMBER (10,2)  NOT NULL , 
     patente_camion         VARCHAR2 (10)  NOT NULL , 
     FAENA_COSECHA_id_faena NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE GUIA_DESPACHO 
    ADD CONSTRAINT GUIA_DESPACHO_PK PRIMARY KEY ( numero_guia ) ;

CREATE TABLE MAQUINARIA 
    ( 
     codigo_maquinaria           NUMBER (8)  NOT NULL , 
     tipo_maquinaria             VARCHAR2 (50)  NOT NULL , 
     patente                     VARCHAR2 (10)  NOT NULL , 
     horas_uso                   NUMBER (8,2)  NOT NULL , 
     CONTRATISTA_rut_contratista VARCHAR2 (12)  NOT NULL 
    ) 
;

ALTER TABLE MAQUINARIA 
    ADD CONSTRAINT MAQUINARIA_PK PRIMARY KEY ( codigo_maquinaria ) ;

CREATE TABLE MOTOSIERRISTA 
    ( 
     rut_trabajador       VARCHAR2 (12)  NOT NULL , 
     numero_certificacion VARCHAR2 (30)  NOT NULL 
    ) 
;

ALTER TABLE MOTOSIERRISTA 
    ADD CONSTRAINT MOTOSIERRISTA_PK PRIMARY KEY ( rut_trabajador ) ;

CREATE TABLE OPERADOR_MAQUINARIA 
    ( 
     rut_trabajador VARCHAR2 (12)  NOT NULL , 
     clase_licencia VARCHAR2 (5)  NOT NULL 
    ) 
;

ALTER TABLE OPERADOR_MAQUINARIA 
    ADD CONSTRAINT OPERADOR_MAQUINARIA_PK PRIMARY KEY ( rut_trabajador ) ;

CREATE TABLE PREDIO 
    ( 
     rol_predio           VARCHAR2 (20)  NOT NULL , 
     nombre_predio        VARCHAR2 (100)  NOT NULL , 
     superficie_total_ha  NUMBER (10,2)  NOT NULL , 
     COMUNA_codigo_comuna NUMBER (5)  NOT NULL 
    ) 
;

ALTER TABLE PREDIO 
    ADD CONSTRAINT PREDIO_PK PRIMARY KEY ( rol_predio ) ;

CREATE TABLE REGION 
    ( 
     codigo_region NUMBER (5)  NOT NULL , 
     nombre_region VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( codigo_region ) ;

CREATE TABLE RODAL 
    ( 
     numero_rodal           NUMBER (5)  NOT NULL , 
     superficie_ha          NUMBER (5)  NOT NULL , 
     anno_plantacion        NUMBER (4)  NOT NULL , 
     densidad_arboles_ha    NUMBER (6) , 
     ESPECIE_codigo_especie NUMBER (5)  NOT NULL , 
     PREDIO_rol_predio      VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE RODAL 
    ADD CONSTRAINT RODAL_PK PRIMARY KEY ( numero_rodal, PREDIO_rol_predio ) ;

CREATE TABLE TRABAJADOR 
    ( 
     rut_trabajador              VARCHAR2 (12)  NOT NULL , 
     nombres                     VARCHAR2 (100)  NOT NULL , 
     apellidos                   VARCHAR2 (100)  NOT NULL , 
     fecha_ingreso               DATE  NOT NULL , 
     CONTRATISTA_rut_contratista VARCHAR2 (12)  NOT NULL , 
     TRABAJADOR_rut_trabajador   VARCHAR2 (12) 
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_PK PRIMARY KEY ( rut_trabajador ) ;

ALTER TABLE BRIGADISTA 
    ADD CONSTRAINT BRIGADISTA_TRABAJADOR_FK FOREIGN KEY 
    ( 
     rut_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     rut_trabajador
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_codigo_region
    ) 
    REFERENCES REGION 
    ( 
     codigo_region
    ) 
;

ALTER TABLE FAENA_COSECHA 
    ADD CONSTRAINT FAENA_COSECHA_CONTRATISTA_FK FOREIGN KEY 
    ( 
     CONTRATISTA_rut_contratista
    ) 
    REFERENCES CONTRATISTA 
    ( 
     rut_contratista
    ) 
;

ALTER TABLE FAENA_COSECHA 
    ADD CONSTRAINT FAENA_COSECHA_RODAL_FK FOREIGN KEY 
    ( 
     RODAL_numero_rodal,
     RODAL_PREDIO_rol_predio
    ) 
    REFERENCES RODAL 
    ( 
     numero_rodal,
     PREDIO_rol_predio
    ) 
;

ALTER TABLE GUIA_DESPACHO 
    ADD CONSTRAINT GUIA_DESPACHO_FAENA_COSECHA_FK FOREIGN KEY 
    ( 
     FAENA_COSECHA_id_faena
    ) 
    REFERENCES FAENA_COSECHA 
    ( 
     id_faena
    ) 
;

ALTER TABLE MAQUINARIA 
    ADD CONSTRAINT MAQUINARIA_CONTRATISTA_FK FOREIGN KEY 
    ( 
     CONTRATISTA_rut_contratista
    ) 
    REFERENCES CONTRATISTA 
    ( 
     rut_contratista
    ) 
;

ALTER TABLE MOTOSIERRISTA 
    ADD CONSTRAINT MOTOSIERRISTA_TRABAJADOR_FK FOREIGN KEY 
    ( 
     rut_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     rut_trabajador
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE OPERADOR_MAQUINARIA 
    ADD CONSTRAINT OPERADOR_MAQUINARIA_TRABAJADOR_FK FOREIGN KEY 
    ( 
     rut_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     rut_trabajador
    ) 
;

ALTER TABLE PREDIO 
    ADD CONSTRAINT PREDIO_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_codigo_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     codigo_comuna
    ) 
;

ALTER TABLE RODAL 
    ADD CONSTRAINT RODAL_ESPECIE_FK FOREIGN KEY 
    ( 
     ESPECIE_codigo_especie
    ) 
    REFERENCES ESPECIE 
    ( 
     codigo_especie
    ) 
;

ALTER TABLE RODAL 
    ADD CONSTRAINT RODAL_PREDIO_FK FOREIGN KEY 
    ( 
     PREDIO_rol_predio
    ) 
    REFERENCES PREDIO 
    ( 
     rol_predio
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_CONTRATISTA_FK FOREIGN KEY 
    ( 
     CONTRATISTA_rut_contratista
    ) 
    REFERENCES CONTRATISTA 
    ( 
     rut_contratista
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_TRABAJADOR_FK FOREIGN KEY 
    ( 
     TRABAJADOR_rut_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     rut_trabajador
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             26
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
-- ERRORS                                   4
-- WARNINGS                                 0
