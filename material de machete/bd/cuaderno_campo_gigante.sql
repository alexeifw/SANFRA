--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      EXO S.A.
-- Project :      bd_campo.DM1
-- Author :       lore
--
-- Date Created : Tuesday, October 01, 2019 20:27:52
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Arado 
--

CREATE TABLE Arado(
    id_arado                  INT         NOT NULL,
    id_periodo_preparacion    INT         NOT NULL,
    id_suelo                  INT         NOT NULL,
    descripcion               CHAR(25)    NOT NULL,
    PRIMARY KEY (id_arado, id_periodo_preparacion, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Caract_Cultivo 
--

CREATE TABLE Caract_Cultivo(
    id_caract_cultivo    INT         NOT NULL,
    id_cultivo           INT         NOT NULL,
    id_suelo             INT         NOT NULL,
    descripcion          CHAR(25)    NOT NULL,
    PRIMARY KEY (id_caract_cultivo, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Clima 
--

CREATE TABLE Clima(
    id_clima            INT         NOT NULL,
    id_cultivo          INT         NOT NULL,
    id_suelo            INT         NOT NULL,
    descripcion         CHAR(25)    NOT NULL,
    id_sistema_riego    INT         NOT NULL,
    id_nivel_humedad    INT         NOT NULL,
    PRIMARY KEY (id_clima, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Contactos 
--

CREATE TABLE Contactos(
    id_contacto      INT         NOT NULL,
    Id_persona       INT         NOT NULL,
    email            CHAR(25)    NOT NULL,
    celular          INT         NOT NULL,
    telefono_fijo    INT         NOT NULL,
    id_proveedor     INT         NOT NULL,
    id_empleado      INT         NOT NULL,
    PRIMARY KEY (id_contacto, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Control_de_Plaga 
--

CREATE TABLE Control_de_Plaga(
    id_control_plaga    INT         NOT NULL,
    id_plaga            INT         NOT NULL,
    descripcion         CHAR(25)    NOT NULL,
    PRIMARY KEY (id_control_plaga, id_plaga)
)ENGINE=MYISAM
;



-- 
-- TABLE: Cosecha 
--

CREATE TABLE Cosecha(
    id_cosecha            INT         NOT NULL,
    id_temporada          INT         NOT NULL,
    id_cultivo            INT         NOT NULL,
    id_suelo              INT         NOT NULL,
    id_tecnica_cosecha    INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    id_tipo_cosecha       INT         NOT NULL,
    PRIMARY KEY (id_cosecha, id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Cultivo 
--

CREATE TABLE Cultivo(
    id_cultivo            INT    NOT NULL,
    id_suelo              INT    NOT NULL,
    id_semilla            INT    NOT NULL,
    id_caract_cultivo     INT    NOT NULL,
    id_tecnica_siembra    INT    NOT NULL,
    id_fertilizacion      INT    NOT NULL,
    id_temporada          INT    NOT NULL,
    id_clima              INT    NOT NULL,
    id_periodo_control    INT    NOT NULL,
    PRIMARY KEY (id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Domicilio 
--

CREATE TABLE Domicilio(
    id_domicilio         INT         NOT NULL,
    Id_persona           INT         NOT NULL,
    id_tipo_domicilio    INT         NOT NULL,
    nombre_calle         CHAR(25)    NOT NULL,
    numero               INT         NOT NULL,
    barrio               CHAR(25)    NOT NULL,
    id_localidad         INT         NOT NULL,
    id_paraje            INT         NOT NULL,
    cod_postal           INT         NOT NULL,
    provincia            CHAR(25)    NOT NULL,
    PRIMARY KEY (id_domicilio, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Empleados 
--

CREATE TABLE Empleados(
    id_empleado    INT         NOT NULL,
    descripcion    CHAR(25)    NOT NULL,
    Id_persona     INT         NOT NULL,
    id_contacto    INT         NOT NULL,
    PRIMARY KEY (id_empleado, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Establecimiento 
--

CREATE TABLE Establecimiento(
    id_establecimiento    INT         NOT NULL,
    id_persona            INT         NOT NULL,
    medidas               INT         NOT NULL,
    id_relieve            INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    id_forma              INT,
    PRIMARY KEY (id_establecimiento, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fertilizacion 
--

CREATE TABLE Fertilizacion(
    id_fertilizacion          INT         NOT NULL,
    id_periodo_preparacion    INT         NOT NULL,
    id_suelo                  INT         NOT NULL,
    descripcion               CHAR(25),
    PRIMARY KEY (id_fertilizacion, id_periodo_preparacion, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Forma 
--

CREATE TABLE Forma(
    id_forma              INT         NOT NULL,
    id_establecimiento    INT         NOT NULL,
    id_persona            INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    PRIMARY KEY (id_forma, id_establecimiento, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Localidad 
--

CREATE TABLE Localidad(
    id_localidad        INT         NOT NULL,
    id_domicilio        INT         NOT NULL,
    Id_persona          INT         NOT NULL,
    nombre_localidad    CHAR(25)    NOT NULL,
    PRIMARY KEY (id_localidad, id_domicilio, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Nivel_humedad 
--

CREATE TABLE Nivel_humedad(
    id_nivel_humedad    INT         NOT NULL,
    id_suelo            INT         NOT NULL,
    descripcion         CHAR(25)    NOT NULL,
    PRIMARY KEY (id_nivel_humedad, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Paraje 
--

CREATE TABLE Paraje(
    id_paraje        INT         NOT NULL,
    id_domicilio     INT         NOT NULL,
    Id_persona       INT         NOT NULL,
    nombre_paraje    CHAR(25)    NOT NULL,
    PRIMARY KEY (id_paraje, id_domicilio, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Parcela 
--

CREATE TABLE Parcela(
    id_parcela    INT    NOT NULL,
    id_suelo      INT    NOT NULL,
    id_cultivo    INT    NOT NULL,
    id_clima      INT    NOT NULL,
    id_relieve    INT    NOT NULL,
    PRIMARY KEY (id_parcela, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Periodo_Control 
--

CREATE TABLE Periodo_Control(
    id_periodo_control    INT         NOT NULL,
    id_cultivo            INT         NOT NULL,
    id_suelo              INT         NOT NULL,
    id_plaga              INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    tiempo                INT         NOT NULL,
    PRIMARY KEY (id_periodo_control, id_cultivo, id_suelo, id_plaga)
)ENGINE=MYISAM
;



-- 
-- TABLE: Periodo_preparacion 
--

CREATE TABLE Periodo_preparacion(
    id_periodo_preparacion    INT    NOT NULL,
    id_suelo                  INT    NOT NULL,
    id_arado                  INT    NOT NULL,
    id_fertilizacion          INT    NOT NULL,
    PRIMARY KEY (id_periodo_preparacion, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Persona 
--

CREATE TABLE Persona(
    Id_persona      INT         NOT NULL,
    id_domicilio    INT         NOT NULL,
    nombre          CHAR(25)    NOT NULL,
    apellido        CHAR(25)    NOT NULL,
    dni             INT         NOT NULL,
    id_contacto     INT         NOT NULL,
    cuil            INT         NOT NULL,
    PRIMARY KEY (Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Persona_Establecimiento 
--

CREATE TABLE Persona_Establecimiento(
    Id_persona            INT    NOT NULL,
    id_establecimiento    INT    NOT NULL,
    PRIMARY KEY (Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Plaga 
--

CREATE TABLE Plaga(
    id_plaga            INT         NOT NULL,
    descripcion         CHAR(25)    NOT NULL,
    id_tipo_plaga       INT         NOT NULL,
    id_control_plaga    INT         NOT NULL,
    PRIMARY KEY (id_plaga)
)ENGINE=MYISAM
;



-- 
-- TABLE: Productores 
--

CREATE TABLE Productores(
    id_productor    INT         NOT NULL,
    razon_social    CHAR(25)    NOT NULL,
    id_contacto     INT         NOT NULL,
    Id_persona      INT         NOT NULL,
    PRIMARY KEY (id_productor, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Proveedores 
--

CREATE TABLE Proveedores(
    id_proveedor    INT         NOT NULL,
    Id_persona      INT         NOT NULL,
    razon_social    CHAR(25)    NOT NULL,
    id_contacto     INT         NOT NULL,
    PRIMARY KEY (id_proveedor, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Relieve 
--

CREATE TABLE Relieve(
    id_relieve            INT         NOT NULL,
    id_establecimiento    INT         NOT NULL,
    id_persona            INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    PRIMARY KEY (id_relieve, id_establecimiento, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Semilla 
--

CREATE TABLE Semilla(
    id_semilla     INT         NOT NULL,
    id_cultivo     INT         NOT NULL,
    id_suelo       INT         NOT NULL,
    descripcion    CHAR(25)    NOT NULL,
    PRIMARY KEY (id_semilla, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Siembra 
--

CREATE TABLE Siembra(
    id_siembra            INT         NOT NULL,
    id_temporada          INT         NOT NULL,
    id_cultivo            INT         NOT NULL,
    id_suelo              INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    id_orientacion        INT         NOT NULL,
    orientacion           CHAR(25)    NOT NULL,
    id_sistema_riego      INT         NOT NULL,
    id_tecnica_siembra    INT         NOT NULL,
    PRIMARY KEY (id_siembra, id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Sistema_Riego 
--

CREATE TABLE Sistema_Riego(
    id_sistema_riego    INT         NOT NULL,
    id_clima            INT         NOT NULL,
    id_cultivo          INT         NOT NULL,
    id_suelo            INT         NOT NULL,
    descripcion         CHAR(25)    NOT NULL,
    PRIMARY KEY (id_sistema_riego, id_clima, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Suelo 
--

CREATE TABLE Suelo(
    id_suelo                  INT         NOT NULL,
    descripcion               CHAR(25)    NOT NULL,
    id_terreno                INT         NOT NULL,
    id_tipo_suelo             INT         NOT NULL,
    id_nivel_humedad          INT         NOT NULL,
    id_mensura                INT         NOT NULL,
    id_cultivo                INT         NOT NULL,
    id_periodo_preparacion    INT         NOT NULL,
    PRIMARY KEY (id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tecnica_de_Cosecha 
--

CREATE TABLE Tecnica_de_Cosecha(
    id_tecnica_cosecha    CHAR(10)    NOT NULL,
    id_cosecha            INT         NOT NULL,
    id_temporada          INT         NOT NULL,
    id_cultivo            INT         NOT NULL,
    id_suelo              INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tecnica_cosecha, id_cosecha, id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tecnica_siembra 
--

CREATE TABLE Tecnica_siembra(
    id_tecnica_siembra    INT         NOT NULL,
    id_siembra            INT         NOT NULL,
    id_temporada          INT         NOT NULL,
    id_cultivo            INT         NOT NULL,
    id_suelo              INT         NOT NULL,
    descripcion           CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tecnica_siembra, id_siembra, id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Temporada 
--

CREATE TABLE Temporada(
    id_temporada    INT         NOT NULL,
    id_cultivo      INT         NOT NULL,
    id_suelo        INT         NOT NULL,
    descripcion     CHAR(25)    NOT NULL,
    id_siembra      INT         NOT NULL,
    id_cosecha      INT         NOT NULL,
    PRIMARY KEY (id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tipo_cosecha 
--

CREATE TABLE Tipo_cosecha(
    id_tipo_cosecha    INT         NOT NULL,
    id_cosecha         INT         NOT NULL,
    id_temporada       INT         NOT NULL,
    id_cultivo         INT         NOT NULL,
    id_suelo           INT         NOT NULL,
    descripcion        CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tipo_cosecha, id_cosecha, id_temporada, id_cultivo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tipo_domicilio 
--

CREATE TABLE Tipo_domicilio(
    id_tipo_domicilio    INT         NOT NULL,
    id_domicilio         INT         NOT NULL,
    Id_persona           INT         NOT NULL,
    descripcion          CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tipo_domicilio, id_domicilio, Id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tipo_Plaga 
--

CREATE TABLE Tipo_Plaga(
    id_tipo_plaga    INT         NOT NULL,
    id_plaga         INT         NOT NULL,
    descripcion      CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tipo_plaga, id_plaga)
)ENGINE=MYISAM
;



-- 
-- TABLE: Tipo_Suelo 
--

CREATE TABLE Tipo_Suelo(
    id_tipo_suelo    INT         NOT NULL,
    id_suelo         INT         NOT NULL,
    descripcion      CHAR(25)    NOT NULL,
    PRIMARY KEY (id_tipo_suelo, id_suelo)
)ENGINE=MYISAM
;



-- 
-- TABLE: Arado 
--

ALTER TABLE Arado ADD CONSTRAINT RefPeriodo_preparacion26 
    FOREIGN KEY (id_periodo_preparacion, id_suelo)
    REFERENCES Periodo_preparacion(id_periodo_preparacion, id_suelo)
;


-- 
-- TABLE: Caract_Cultivo 
--

ALTER TABLE Caract_Cultivo ADD CONSTRAINT RefCultivo21 
    FOREIGN KEY (id_cultivo, id_suelo)
    REFERENCES Cultivo(id_cultivo, id_suelo)
;


-- 
-- TABLE: Clima 
--

ALTER TABLE Clima ADD CONSTRAINT RefCultivo12 
    FOREIGN KEY (id_cultivo, id_suelo)
    REFERENCES Cultivo(id_cultivo, id_suelo)
;


-- 
-- TABLE: Contactos 
--

ALTER TABLE Contactos ADD CONSTRAINT RefPersona8 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Control_de_Plaga 
--

ALTER TABLE Control_de_Plaga ADD CONSTRAINT RefPlaga36 
    FOREIGN KEY (id_plaga)
    REFERENCES Plaga(id_plaga)
;


-- 
-- TABLE: Cosecha 
--

ALTER TABLE Cosecha ADD CONSTRAINT RefTemporada27 
    FOREIGN KEY (id_temporada, id_cultivo, id_suelo)
    REFERENCES Temporada(id_temporada, id_cultivo, id_suelo)
;


-- 
-- TABLE: Cultivo 
--

ALTER TABLE Cultivo ADD CONSTRAINT RefSuelo10 
    FOREIGN KEY (id_suelo)
    REFERENCES Suelo(id_suelo)
;


-- 
-- TABLE: Domicilio 
--

ALTER TABLE Domicilio ADD CONSTRAINT RefPersona2 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Empleados 
--

ALTER TABLE Empleados ADD CONSTRAINT RefPersona6 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Establecimiento 
--

ALTER TABLE Establecimiento ADD CONSTRAINT RefPersona_Establecimiento11 
    FOREIGN KEY (id_persona)
    REFERENCES Persona_Establecimiento(Id_persona)
;


-- 
-- TABLE: Fertilizacion 
--

ALTER TABLE Fertilizacion ADD CONSTRAINT RefPeriodo_preparacion25 
    FOREIGN KEY (id_periodo_preparacion, id_suelo)
    REFERENCES Periodo_preparacion(id_periodo_preparacion, id_suelo)
;


-- 
-- TABLE: Forma 
--

ALTER TABLE Forma ADD CONSTRAINT RefEstablecimiento13 
    FOREIGN KEY (id_establecimiento, id_persona)
    REFERENCES Establecimiento(id_establecimiento, id_persona)
;


-- 
-- TABLE: Localidad 
--

ALTER TABLE Localidad ADD CONSTRAINT RefDomicilio29 
    FOREIGN KEY (id_domicilio, Id_persona)
    REFERENCES Domicilio(id_domicilio, Id_persona)
;


-- 
-- TABLE: Nivel_humedad 
--

ALTER TABLE Nivel_humedad ADD CONSTRAINT RefSuelo14 
    FOREIGN KEY (id_suelo)
    REFERENCES Suelo(id_suelo)
;


-- 
-- TABLE: Paraje 
--

ALTER TABLE Paraje ADD CONSTRAINT RefDomicilio30 
    FOREIGN KEY (id_domicilio, Id_persona)
    REFERENCES Domicilio(id_domicilio, Id_persona)
;


-- 
-- TABLE: Parcela 
--

ALTER TABLE Parcela ADD CONSTRAINT RefSuelo15 
    FOREIGN KEY (id_suelo)
    REFERENCES Suelo(id_suelo)
;


-- 
-- TABLE: Periodo_Control 
--

ALTER TABLE Periodo_Control ADD CONSTRAINT RefCultivo22 
    FOREIGN KEY (id_cultivo, id_suelo)
    REFERENCES Cultivo(id_cultivo, id_suelo)
;

ALTER TABLE Periodo_Control ADD CONSTRAINT RefPlaga34 
    FOREIGN KEY (id_plaga)
    REFERENCES Plaga(id_plaga)
;


-- 
-- TABLE: Periodo_preparacion 
--

ALTER TABLE Periodo_preparacion ADD CONSTRAINT RefSuelo23 
    FOREIGN KEY (id_suelo)
    REFERENCES Suelo(id_suelo)
;


-- 
-- TABLE: Persona_Establecimiento 
--

ALTER TABLE Persona_Establecimiento ADD CONSTRAINT RefPersona9 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Productores 
--

ALTER TABLE Productores ADD CONSTRAINT RefPersona7 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Proveedores 
--

ALTER TABLE Proveedores ADD CONSTRAINT RefPersona5 
    FOREIGN KEY (Id_persona)
    REFERENCES Persona(Id_persona)
;


-- 
-- TABLE: Relieve 
--

ALTER TABLE Relieve ADD CONSTRAINT RefEstablecimiento17 
    FOREIGN KEY (id_establecimiento, id_persona)
    REFERENCES Establecimiento(id_establecimiento, id_persona)
;


-- 
-- TABLE: Semilla 
--

ALTER TABLE Semilla ADD CONSTRAINT RefCultivo20 
    FOREIGN KEY (id_cultivo, id_suelo)
    REFERENCES Cultivo(id_cultivo, id_suelo)
;


-- 
-- TABLE: Siembra 
--

ALTER TABLE Siembra ADD CONSTRAINT RefTemporada28 
    FOREIGN KEY (id_temporada, id_cultivo, id_suelo)
    REFERENCES Temporada(id_temporada, id_cultivo, id_suelo)
;


-- 
-- TABLE: Sistema_Riego 
--

ALTER TABLE Sistema_Riego ADD CONSTRAINT RefClima18 
    FOREIGN KEY (id_clima, id_cultivo, id_suelo)
    REFERENCES Clima(id_clima, id_cultivo, id_suelo)
;


-- 
-- TABLE: Tecnica_de_Cosecha 
--

ALTER TABLE Tecnica_de_Cosecha ADD CONSTRAINT RefCosecha32 
    FOREIGN KEY (id_cosecha, id_temporada, id_cultivo, id_suelo)
    REFERENCES Cosecha(id_cosecha, id_temporada, id_cultivo, id_suelo)
;


-- 
-- TABLE: Tecnica_siembra 
--

ALTER TABLE Tecnica_siembra ADD CONSTRAINT RefSiembra24 
    FOREIGN KEY (id_siembra, id_temporada, id_cultivo, id_suelo)
    REFERENCES Siembra(id_siembra, id_temporada, id_cultivo, id_suelo)
;


-- 
-- TABLE: Temporada 
--

ALTER TABLE Temporada ADD CONSTRAINT RefCultivo19 
    FOREIGN KEY (id_cultivo, id_suelo)
    REFERENCES Cultivo(id_cultivo, id_suelo)
;


-- 
-- TABLE: Tipo_cosecha 
--

ALTER TABLE Tipo_cosecha ADD CONSTRAINT RefCosecha33 
    FOREIGN KEY (id_cosecha, id_temporada, id_cultivo, id_suelo)
    REFERENCES Cosecha(id_cosecha, id_temporada, id_cultivo, id_suelo)
;


-- 
-- TABLE: Tipo_domicilio 
--

ALTER TABLE Tipo_domicilio ADD CONSTRAINT RefDomicilio4 
    FOREIGN KEY (id_domicilio, Id_persona)
    REFERENCES Domicilio(id_domicilio, Id_persona)
;


-- 
-- TABLE: Tipo_Plaga 
--

ALTER TABLE Tipo_Plaga ADD CONSTRAINT RefPlaga35 
    FOREIGN KEY (id_plaga)
    REFERENCES Plaga(id_plaga)
;


-- 
-- TABLE: Tipo_Suelo 
--

ALTER TABLE Tipo_Suelo ADD CONSTRAINT RefSuelo16 
    FOREIGN KEY (id_suelo)
    REFERENCES Suelo(id_suelo)
;


