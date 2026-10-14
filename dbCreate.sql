DROP DATABASE IF EXISTS Veterinaria;
CREATE DATABASE Veterinaria;
USE Veterinaria;

CREATE TABLE region (
    id_region INTEGER PRIMARY KEY,
    nombre_region VARCHAR(100) NOT NULL,
    
    UNIQUE (nombre_region)
);

CREATE TABLE comuna (
    id_comuna INTEGER PRIMARY KEY,
    nombre_comuna VARCHAR(100) NOT NULL,
    id_region INTEGER NOT NULL,
    CONSTRAINT fk_comuna_region
        FOREIGN KEY (id_region)
        REFERENCES region(id_region),
        
	UNIQUE (id_region, nombre_comuna)
);

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY,
    rut_cliente VARCHAR(12) NOT NULL UNIQUE,
    nombre_cliente VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(20),
    email_cliente VARCHAR(120),
    direccion_cliente VARCHAR(200),
    id_comuna INTEGER NOT NULL,
    CONSTRAINT fk_cliente_comuna
        FOREIGN KEY (id_comuna)
        REFERENCES comuna(id_comuna)
);

CREATE TABLE especie (
    id_especie INTEGER PRIMARY KEY,
    nombre_especie VARCHAR(100) NOT NULL,
    
    UNIQUE (nombre_especie)
);

CREATE TABLE raza (
    id_raza INTEGER PRIMARY KEY,
    nombre_raza VARCHAR(100) NOT NULL,
    id_especie INTEGER NOT NULL,
    CONSTRAINT fk_raza_especie
        FOREIGN KEY (id_especie)
        REFERENCES especie(id_especie),
	UNIQUE (id_especie, nombre_raza)
);

CREATE TABLE mascota (
    id_mascota INTEGER PRIMARY KEY,
    nombre_mascota VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    sexo VARCHAR(10),
    id_cliente INTEGER NOT NULL,
    id_raza INTEGER NOT NULL,
    CONSTRAINT fk_mascota_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),
    CONSTRAINT fk_mascota_raza
        FOREIGN KEY (id_raza)
        REFERENCES raza(id_raza)
);

CREATE TABLE tipo_atencion (
    id_tipo_atencion INTEGER PRIMARY KEY,
    nombre_tipo_atencion VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    
    UNIQUE (nombre_tipo_atencion)
);

CREATE TABLE cargo (
    id_cargo INTEGER PRIMARY KEY,
    nombre_cargo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    
    UNIQUE (nombre_cargo)
);

CREATE TABLE sucursal (
    id_sucursal INTEGER PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    direccion_sucursal VARCHAR(200) NOT NULL,
    telefono_sucursal VARCHAR(20),
    id_comuna INTEGER NOT NULL,
    CONSTRAINT fk_sucursal_comuna
        FOREIGN KEY (id_comuna)
        REFERENCES comuna(id_comuna)
);

CREATE TABLE empleado (
    id_empleado INTEGER PRIMARY KEY,
    rut_empleado VARCHAR(12) NOT NULL UNIQUE,
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(120),
    telefono VARCHAR(20),
    id_sucursal INTEGER NOT NULL,
    id_cargo INTEGER NOT NULL,
    CONSTRAINT fk_empleado_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_empleado_cargo
        FOREIGN KEY (id_cargo)
        REFERENCES cargo(id_cargo)
);

CREATE TABLE sueldo (
    id_sueldo INTEGER PRIMARY KEY,
    monto NUMERIC(12,2) NOT NULL,
    id_empleado INTEGER NOT NULL UNIQUE,
    CONSTRAINT fk_sueldo_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado),
	
    CHECK (monto > 0)
);

CREATE TABLE atencion (
    id_atencion INTEGER PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    monto_total NUMERIC(12,2) NOT NULL,
    observacion VARCHAR(500),
    id_mascota INTEGER NOT NULL,
    id_tipo_atencion INTEGER NOT NULL,
    id_sucursal INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL,
    CONSTRAINT fk_atencion_mascota
        FOREIGN KEY (id_mascota)
        REFERENCES mascota(id_mascota),
    CONSTRAINT fk_atencion_tipo
        FOREIGN KEY (id_tipo_atencion)
        REFERENCES tipo_atencion(id_tipo_atencion),
    CONSTRAINT fk_atencion_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal),
    CONSTRAINT fk_atencion_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado),
        
	CHECK (monto_total >= 0)
);

CREATE TABLE pago (
    id_pago INTEGER PRIMARY KEY,
    fecha_pago DATE NOT NULL,
    medio_pago VARCHAR(50) NOT NULL,
    monto_pagado NUMERIC(12,2) NOT NULL,
    id_atencion INTEGER NOT NULL UNIQUE,
    CONSTRAINT fk_pago_atencion
        FOREIGN KEY (id_atencion)
        REFERENCES atencion(id_atencion),
        
	CHECK (monto_pagado >= 0)
);

CREATE TABLE receta (
    id_receta INTEGER PRIMARY KEY,
    fecha_emision DATE NOT NULL,
    observacion VARCHAR(500),
    id_atencion INTEGER NOT NULL UNIQUE,
    CONSTRAINT fk_receta_atencion
        FOREIGN KEY (id_atencion)
        REFERENCES atencion(id_atencion)
);

CREATE TABLE medicamento (
    id_medicamento INTEGER PRIMARY KEY,
    nombre_medicamento VARCHAR(150) NOT NULL,
    descripcion VARCHAR(300),
    
    UNIQUE (nombre_medicamento)
);

CREATE TABLE detalle_receta (
    id_receta INTEGER NOT NULL,
    id_medicamento INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    frecuencia VARCHAR(100),
    duracion VARCHAR(100),
    indicacion VARCHAR(500),
    CONSTRAINT pk_detalle_receta
        PRIMARY KEY (id_receta, id_medicamento),
    CONSTRAINT fk_detalle_receta_receta
        FOREIGN KEY (id_receta)
        REFERENCES receta(id_receta),
    CONSTRAINT fk_detalle_receta_medicamento
        FOREIGN KEY (id_medicamento)
        REFERENCES medicamento(id_medicamento),
        
	CHECK (cantidad > 0)
);