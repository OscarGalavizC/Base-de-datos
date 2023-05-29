#INTEGRANTES:
#-GALAVIZ CUEN OSCAR EDUARDO
#-NAVARRO MELENDREZ ERICK NAVARRO
#-OCHOA GALVAN DANIEL RUBEN
DROP DATABASE IF EXISTS dengue;
CREATE DATABASE dengue;

USE dengue;

DROP TABLE IF EXISTS dengue;
CREATE TABLE dengue (
	FECHA_ACTUALIZACION DATE,
    ID_REGISTRO INT,
    SEXO INT,
    EDAD_ANOS INT,
    ENTIDAD_RES INT,
    MUNICIPIO_RES INT,
    HABLA_LENGUA_INDIG BOOL,
    INDIGENA BOOL,
    ENTIDAD_UM_NOTIF INT,
    MUNICIPIO_UM_NOTIF INT,
    INSTITUCION_UM_NOTIF INT,
    FECHA_SIGN_SINTOMAS DATE,
    TIPO_PACIENTE INT,
    HEMORRAGICOS BOOL,
    DIABETES BOOL,
    HIPERTENSION BOOL,
    ENFERMEDAD_ULC_PEPTICA BOOL,
    ENFERMEDAD_RENAL BOOL,
    INMUNOSUPR BOOL,
    CIRROSIS_HEPATICA BOOL,
    EMBARAZO BOOL,
	DEFUNCION BOOL,
	DICTAMEN INT,
	TOMA_MUESTRA BOOL,
	RESULTADO_PCR INT,
	ESTATUS_CASO INT,
	ENTIDAD_ASIG INT,
	MUNICIPIO_ASIG INT
);

DROP TABLE IF EXISTS sexo;
CREATE TABLE sexo (
	CLAVE INT,
    DESCRIPCION varchar(10) NOT NULL
);

DROP TABLE IF EXISTS tipo_paciente;
CREATE TABLE tipo_paciente (
	CLAVE INT,
    DESCRIPCION varchar(50) NOT NULL
);

DROP TABLE IF EXISTS dictamen;
CREATE TABLE dictamen (
	CLAVE INT,
    DESCRIPCION varchar(30) NOT NULL
);

DROP TABLE IF EXISTS resultados_pcr;
CREATE TABLE resultados_pcr (
	CLAVE INT,
    DESCRIPCION varchar(80) NOT NULL
);

DROP TABLE IF EXISTS estatus_del_caso;
CREATE TABLE estatus_del_caso (
	CLAVE INT,
    DESCRIPCION varchar(50) NOT NULL
);

DROP TABLE IF EXISTS institucion_medica;
CREATE TABLE institucion_medica (
	CLAVE INT,
    DESCRIPCION varchar(60) NOT NULL
);

DROP TABLE IF EXISTS municipio;
CREATE TABLE municipio (
	CLAVE_MUNICIPIO INT,
    MUNICIPIO varchar(200) NOT NULL,
    CLAVE_ENTIDAD varchar(10) NOT NULL
);

DROP TABLE IF EXISTS entidad;
CREATE TABLE entidad (
	CLAVE_ENTIDAD INT,
    ENTIDAD_FEDERATIVA varchar(80) NOT NULL,
    ABREVIATURA varchar(10) NOT NULL
);

DROP TABLE IF EXISTS sino;
CREATE TABLE sino (
	CLAVE_SI_NO INT,
    DESCRIPCION varchar(5) NOT NULL
);

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/dengue_abierto.csv'
INTO TABLE dengue
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_sexo.csv'
INTO TABLE sexo
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_dictamen.csv'
INTO TABLE dictamen
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_entidad.csv'
INTO TABLE entidad
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_estatus_caso.csv'
INTO TABLE estatus_del_caso
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_institucion.csv'
INTO TABLE institucion_medica
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_municipio.csv'
INTO TABLE municipio
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_resultado_pcr.csv'
INTO TABLE resultados_pcr
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_si_no.csv'
INTO TABLE sino
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

LOAD DATA INFILE 'C:/Program Files/MySQL/csvs/catalogo_tipo_paciente.csv'
INTO TABLE tipo_paciente
FIELDS TERMINATED BY ',' -- Delimitador de campo (puede variar según el archivo)
LINES TERMINATED BY '\n' -- Delimitador de línea (puede variar según el archivo)
IGNORE 1 ROWS; -- Opcional, para ignorar la primera fila si es un encabezado

DROP TABLE IF EXISTS registro;
CREATE TABLE registro (
    ID_REGISTRO INT,
    SEXO INT,
    EDAD_ANOS INT,
    HABLA_LENGUA_INDIG BOOL,
    INDIGENA BOOL,
    FECHA_SIGN_SINTOMAS DATE,
    TIPO_PACIENTE INT,
	DEFUNCION BOOL,
	DICTAMEN INT,
	TOMA_MUESTRA BOOL,
	RESULTADO_PCR INT,
	ESTATUS_CASO INT,
    ID_ENTIDAD_RES INT,
    ID_MUNICIPIO_RES INT,
    ID_INSTITUCION_UM_NOTIF INT,
    ID_ENTIDAD_UM_NOTIF INT,
    ID_MUNICIPIO_UM_NOTIF INT,
    ID_ENTIDAD_ASIG INT,
    ID_MUNICIPIO_ASIG INT
);

DROP TABLE IF EXISTS atributos_de_salud;
CREATE TABLE atributos_de_salud (
	ID_REGISTRO INT,
    HEMORRAGICOS BOOL,
    DIABETES BOOL,
    HIPERTENSION BOOL,
    ENFERMEDAD_ULC_PEPTICA BOOL,
    ENFERMEDAD_RENAL BOOL,
    INMUNOSUPR BOOL,
    CIRROSIS_HEPATICA BOOL,
    EMBARAZO BOOL
);

SET SQL_SAFE_UPDATES = 0;

INSERT INTO atributos_de_salud
SELECT ID_REGISTRO ,HEMORRAGICOS, DIABETES, HIPERTENSION, ENFERMEDAD_ULC_PEPTICA, ENFERMEDAD_RENAL, INMUNOSUPR,CIRROSIS_HEPATICA, EMBARAZO
FROM dengue;

UPDATE atributos_de_salud
SET HEMORRAGICOS = CASE WHEN HEMORRAGICOS = 1 THEN TRUE
                       WHEN HEMORRAGICOS = 2 THEN FALSE
					END,
	DIABETES = CASE WHEN DIABETES = 1 THEN TRUE
                       WHEN DIABETES = 2 THEN FALSE
					END,
	HIPERTENSION = CASE WHEN HIPERTENSION = 1 THEN TRUE
                       WHEN HIPERTENSION = 2 THEN FALSE
					END,
	ENFERMEDAD_ULC_PEPTICA = CASE WHEN ENFERMEDAD_ULC_PEPTICA = 1 THEN TRUE
                       WHEN ENFERMEDAD_ULC_PEPTICA = 2 THEN FALSE
					END,
	ENFERMEDAD_RENAL = CASE WHEN ENFERMEDAD_RENAL = 1 THEN TRUE
                       WHEN ENFERMEDAD_RENAL = 2 THEN FALSE
					END,
	INMUNOSUPR = CASE WHEN INMUNOSUPR = 1 THEN TRUE
                       WHEN INMUNOSUPR = 2 THEN FALSE
					END,
	CIRROSIS_HEPATICA = CASE WHEN CIRROSIS_HEPATICA = 1 THEN TRUE
                       WHEN CIRROSIS_HEPATICA = 2 THEN FALSE
					END,
	EMBARAZO = CASE WHEN EMBARAZO = 1 THEN TRUE
					   WHEN EMBARAZO = 2 THEN FALSE
					END;
                  
INSERT INTO registro
SELECT ID_REGISTRO, SEXO, EDAD_ANOS, HABLA_LENGUA_INDIG, INDIGENA, FECHA_SIGN_SINTOMAS, TIPO_PACIENTE, DEFUNCION, DICTAMEN, TOMA_MUESTRA, RESULTADO_PCR, ESTATUS_CASO, ENTIDAD_RES, MUNICIPIO_RES, INSTITUCION_UM_NOTIF, ENTIDAD_UM_NOTIF, MUNICIPIO_UM_NOTIF, ENTIDAD_ASIG, MUNICIPIO_ASIG
FROM dengue;

UPDATE registro
SET HABLA_LENGUA_INDIG = CASE WHEN HABLA_LENGUA_INDIG = 1 THEN TRUE
                       WHEN HABLA_LENGUA_INDIG = 2 THEN FALSE
					END,
	INDIGENA = CASE WHEN INDIGENA = 1 THEN TRUE
                       WHEN INDIGENA = 2 THEN FALSE
					END,
	DEFUNCION = CASE WHEN DEFUNCION = 1 THEN TRUE
                       WHEN DEFUNCION = 2 THEN FALSE
					END,
	TOMA_MUESTRA = CASE WHEN TOMA_MUESTRA = 1 THEN TRUE
					   WHEN TOMA_MUESTRA = 2 THEN FALSE
					END;
                    
SELECT * FROM registro;