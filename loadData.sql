BEGIN;

INSERT INTO region (id_region, nombre_region) VALUES
    (1, 'Metropolitana de Santiago'),
    (2, 'Valparaíso'),
    (3, 'Biobío');

INSERT INTO comuna (id_comuna, nombre_comuna, id_region) VALUES
    (1, 'Santiago', 1),
    (2, 'Ñuñoa', 1),
    (3, 'Valparaíso', 2),
    (4, 'Viña del Mar', 2),
    (5, 'Concepción', 3),
    (6, 'Talcahuano', 3);

INSERT INTO cliente (id_cliente, rut_cliente, nombre_cliente, apellido, telefono_cliente, email_cliente, direccion_cliente, id_comuna) VALUES
    (1, '21.000.001-1', 'Eduardo', 'Hyatt', '+56990000001', 'eduardo.hyatt@example.test', 'Dirección de prueba 1', 1),
    (2, '21.000.002-K', 'Vicente', 'Mutilla', '+56990000002', 'vicente.mutilla@example.test', 'Dirección de prueba 2', 1),
    (3, '21.000.003-8', 'Dionisio', 'Manterola', '+56990000003', 'dionisio.manterola@example.test', 'Dirección de prueba 3', 1),
    (4, '21.000.004-6', 'Konrad', 'Zuse', '+56990000004', 'konrad.zuse@example.test', 'Dirección de prueba 4', 3),
    (5, '21.000.005-4', 'Karl', 'Benz', '+56990000005', 'karl.benz@example.test', 'Dirección de prueba 5', 3),
    (6, '21.000.006-2', 'Alfred', 'Renard', '+56990000006', 'alfred.renard@example.test', 'Dirección de prueba 6', 3),
    (7, '21.000.007-0', 'Georges', 'Renard', '+56990000007', 'georges.renard@example.test', 'Dirección de prueba 7', 5),
    (8, '21.000.008-9', 'Sergei', 'Korolev', '+56990000008', 'sergei.korolev@example.test', 'Dirección de prueba 8', 5),
    (9, '21.000.009-7', 'Valentin', 'Glushko', '+56990000009', 'valentin.glushko@example.test', 'Dirección de prueba 9', 5);

INSERT INTO especie (id_especie, nombre_especie) VALUES
    (1, 'Perro'),
    (2, 'Gato'),
    (3, 'Conejo');

INSERT INTO raza (id_raza, nombre_raza, id_especie) VALUES
    (1, 'Mestizo', 1),
    (2, 'Pastor alemán', 1),
    (3, 'Siamés', 2),
    (4, 'Persa', 2),
    (5, 'Enano holandés', 3),
    (6, 'Mini lop', 3);


INSERT INTO mascota (id_mascota, nombre_mascota, fecha_nacimiento, sexo, id_cliente, id_raza) VALUES
    (1, 'Sputnik-1', DATE '1999-01-15', 'Macho', 1, 1),
    (2, 'Sputnik-2', DATE '2000-02-15', 'Hembra', 2, 2),
    (3, 'Sputnik-3', DATE '2001-03-15', 'Macho', 3, 1),
    (4, 'Vostok-1', DATE '2002-04-15', 'Hembra', 4, 2),
    (5, 'Vostok-2', DATE '2003-05-15', 'Macho', 5, 3),
    (6, 'Soyuz-1', DATE '2004-06-15', 'Hembra', 4, 4),
    (7, 'Soyuz-2', DATE '2005-07-15', 'Macho', 6, 3),
    (8, 'Soyuz-3', DATE '2006-08-15', 'Hembra', 7, 4),
    (9, 'Salyut-1', DATE '2007-09-15', 'Macho', 8, 5),
    (10, 'Salyut-2', DATE '2008-01-15', 'Hembra', 7, 6),
    (11, 'Luna-1', DATE '2009-02-15', 'Macho', 9, 5),
    (12, 'Voskhod-1', DATE '2010-03-15', 'Hembra', 2, 6);

INSERT INTO tipo_atencion (id_tipo_atencion, nombre_tipo_atencion, descripcion) VALUES
    (1, 'Consulta general', 'Evaluación clínica general'),
    (2, 'Vacunación', 'Administración de vacuna'),
    (3, 'Control preventivo', 'Control preventivo de salud'),
    (4, 'Cirugía menor', 'Atención de procedimiento menor');

INSERT INTO cargo (id_cargo, nombre_cargo, descripcion) VALUES
    (1, 'Veterinario', 'Profesional que realiza atenciones veterinarias'),
    (2, 'Técnico veterinario', 'Apoyo en la atención clínica'),
    (3, 'Administrativo', 'Apoyo administrativo de la sucursal');

INSERT INTO sucursal (id_sucursal, nombre_sucursal, direccion_sucursal, telefono_sucursal, id_comuna) VALUES
    (1, 'Clínica Santiago Centro', 'Alameda 1000', '+56222000001', 1),
    (2, 'Clínica Valparaíso', 'Avenida Brasil 500', '+56322000002', 3),
    (3, 'Clínica Concepción', 'Avenida O’Higgins 700', '+56412000003', 5);


INSERT INTO empleado (id_empleado, rut_empleado, nombre_empleado, apellido, email, telefono, id_sucursal, id_cargo) VALUES
    (1, '22.000.001-K', 'José', 'Gutiérrez', 'empleado1@example.test', '+56980000001', 1, 1),
    (2, '22.000.002-8', 'Germán', 'Holtheuer', 'empleado2@example.test', '+56980000002', 1, 1),
    (3, '22.000.003-6', 'Jorge', 'Urzúa', 'empleado3@example.test', '+56980000003', 1, 2),
    (4, '22.000.004-4', 'Wernher', 'von Braun', 'empleado4@example.test', '+56980000004', 2, 1),
    (5, '22.000.005-2', 'Rudolf', 'Diesel', 'empleado5@example.test', '+56980000005', 2, 1),
    (6, '22.000.006-0', 'Ferdinand', 'Porsche', 'empleado6@example.test', '+56980000006', 2, 3),
    (7, '22.000.007-9', 'Émile', 'Allard', 'empleado7@example.test', '+56980000007', 3, 1),
    (8, '22.000.008-7', 'Jean', 'Stampe', 'empleado8@example.test', '+56980000008', 3, 1),
    (9, '22.000.009-5', 'Mikhail', 'Tikhonravov', 'empleado9@example.test', '+56980000009', 3, 2);

INSERT INTO sueldo (id_sueldo, monto, id_empleado) VALUES
    (1, 1800000.00, 1), (2, 1450000.00, 2), (3, 850000.00, 3),
    (4, 1700000.00, 4), (5, 1400000.00, 5), (6, 900000.00, 6),
    (7, 1900000.00, 7), (8, 1500000.00, 8), (9, 950000.00, 9);

-- Atenciones ingresadas una por una con INSERT y VALUES.
INSERT INTO atencion (id_atencion, fecha_hora, monto_total, id_tipo_atencion, id_sucursal, id_mascota, id_empleado, observacion) VALUES
    (1, TIMESTAMP '2024-01-10 09:00:00', 110000.00, 1, 1, 1, 1, 'Atención de prueba del año 2024'),
    (2, TIMESTAMP '2024-01-10 09:00:00', 110000.00, 1, 1, 1, 1, 'Atención de prueba del año 2024'),
    (3, TIMESTAMP '2024-01-10 09:00:00', 80000.00, 1, 2, 6, 5, 'Atención de prueba del año 2024'),
    (4, TIMESTAMP '2024-02-10 09:00:00', 80100.00, 1, 2, 6, 4, 'Atención de prueba del año 2024'),
    (5, TIMESTAMP '2024-02-10 09:00:00', 80100.00, 1, 2, 6, 4, 'Atención de prueba del año 2024'),
    (6, TIMESTAMP '2024-02-10 09:00:00', 75100.00, 1, 3, 10, 8, 'Atención de prueba del año 2024'),
    (7, TIMESTAMP '2024-03-10 09:00:00', 75200.00, 1, 3, 10, 7, 'Atención de prueba del año 2024'),
    (8, TIMESTAMP '2024-03-10 09:00:00', 75200.00, 1, 3, 10, 7, 'Atención de prueba del año 2024'),
    (9, TIMESTAMP '2024-03-10 09:00:00', 110200.00, 1, 1, 1, 2, 'Atención de prueba del año 2024'),
    (10, TIMESTAMP '2024-04-10 09:00:00', 110300.00, 1, 1, 1, 1, 'Atención de prueba del año 2024'),
    (11, TIMESTAMP '2024-04-10 09:00:00', 110300.00, 1, 1, 1, 1, 'Atención de prueba del año 2024'),
    (12, TIMESTAMP '2024-04-10 09:00:00', 80300.00, 1, 2, 6, 5, 'Atención de prueba del año 2024'),
    (13, TIMESTAMP '2024-05-10 09:00:00', 80400.00, 1, 2, 6, 4, 'Atención de prueba del año 2024'),
    (14, TIMESTAMP '2024-05-10 09:00:00', 80400.00, 1, 2, 6, 4, 'Atención de prueba del año 2024'),
    (15, TIMESTAMP '2024-05-10 09:00:00', 75400.00, 1, 3, 10, 8, 'Atención de prueba del año 2024'),
    (16, TIMESTAMP '2024-06-10 09:00:00', 75500.00, 1, 3, 10, 7, 'Atención de prueba del año 2024'),
    (17, TIMESTAMP '2024-06-10 09:00:00', 75500.00, 1, 3, 10, 7, 'Atención de prueba del año 2024'),
    (18, TIMESTAMP '2024-06-10 09:00:00', 110500.00, 1, 1, 1, 2, 'Atención de prueba del año 2024'),
    (19, TIMESTAMP '2024-07-10 09:00:00', 38000.00, 2, 1, 5, 1, 'Atención de prueba del año 2024'),
    (20, TIMESTAMP '2024-07-10 09:00:00', 39000.00, 2, 1, 5, 1, 'Atención de prueba del año 2024'),
    (21, TIMESTAMP '2024-07-10 09:00:00', 35000.00, 2, 2, 9, 5, 'Atención de prueba del año 2024'),
    (22, TIMESTAMP '2024-08-10 09:00:00', 36000.00, 2, 2, 9, 4, 'Atención de prueba del año 2024'),
    (23, TIMESTAMP '2024-08-10 09:00:00', 37000.00, 2, 2, 9, 4, 'Atención de prueba del año 2024'),
    (24, TIMESTAMP '2024-08-10 09:00:00', 38000.00, 2, 3, 2, 8, 'Atención de prueba del año 2024'),
    (25, TIMESTAMP '2024-09-10 09:00:00', 39000.00, 2, 3, 2, 7, 'Atención de prueba del año 2024'),
    (26, TIMESTAMP '2024-09-10 09:00:00', 35000.00, 2, 3, 2, 7, 'Atención de prueba del año 2024'),
    (27, TIMESTAMP '2024-09-10 09:00:00', 36000.00, 2, 1, 5, 2, 'Atención de prueba del año 2024'),
    (28, TIMESTAMP '2024-10-10 09:00:00', 37000.00, 3, 1, 5, 1, 'Atención de prueba del año 2024'),
    (29, TIMESTAMP '2024-10-10 09:00:00', 38000.00, 3, 1, 9, 1, 'Atención de prueba del año 2024'),
    (30, TIMESTAMP '2024-10-10 09:00:00', 39000.00, 3, 2, 9, 5, 'Atención de prueba del año 2024'),
    (31, TIMESTAMP '2024-11-10 09:00:00', 35000.00, 3, 2, 1, 4, 'Atención de prueba del año 2024'),
    (32, TIMESTAMP '2024-11-10 09:00:00', 36000.00, 4, 2, 1, 4, 'Atención de prueba del año 2024'),
    (33, TIMESTAMP '2024-11-10 09:00:00', 37000.00, 3, 3, 2, 8, 'Atención de prueba del año 2024'),
    (34, TIMESTAMP '2024-12-10 09:00:00', 38000.00, 3, 3, 5, 7, 'Atención de prueba del año 2024'),
    (35, TIMESTAMP '2024-12-10 09:00:00', 39000.00, 4, 3, 5, 7, 'Atención de prueba del año 2024'),
    (36, TIMESTAMP '2024-12-10 09:00:00', 35000.00, 4, 1, 9, 2, 'Atención de prueba del año 2024'),
    (37, TIMESTAMP '2025-11-10 10:00:00', 110000.00, 1, 1, 1, 1, 'Atención de prueba del período reciente'),
    (38, TIMESTAMP '2025-11-10 10:00:00', 80000.00, 1, 2, 6, 4, 'Atención de prueba del período reciente'),
    (39, TIMESTAMP '2025-11-10 10:00:00', 75000.00, 1, 3, 10, 7, 'Atención de prueba del período reciente'),
    (40, TIMESTAMP '2025-12-10 10:00:00', 110100.00, 1, 1, 1, 2, 'Atención de prueba del período reciente'),
    (41, TIMESTAMP '2025-12-10 10:00:00', 80100.00, 1, 2, 6, 5, 'Atención de prueba del período reciente'),
    (42, TIMESTAMP '2025-12-10 10:00:00', 75100.00, 1, 3, 10, 8, 'Atención de prueba del período reciente'),
    (43, TIMESTAMP '2026-01-10 10:00:00', 110200.00, 1, 1, 1, 1, 'Atención de prueba del período reciente'),
    (44, TIMESTAMP '2026-01-10 10:00:00', 80200.00, 1, 2, 6, 4, 'Atención de prueba del período reciente'),
    (45, TIMESTAMP '2026-01-10 10:00:00', 75200.00, 1, 3, 10, 7, 'Atención de prueba del período reciente'),
    (46, TIMESTAMP '2026-02-10 10:00:00', 110300.00, 1, 1, 1, 2, 'Atención de prueba del período reciente'),
    (47, TIMESTAMP '2026-02-10 10:00:00', 80300.00, 1, 2, 6, 5, 'Atención de prueba del período reciente'),
    (48, TIMESTAMP '2026-02-10 10:00:00', 75300.00, 1, 3, 10, 8, 'Atención de prueba del período reciente'),
    (49, TIMESTAMP '2026-03-10 10:00:00', 110400.00, 1, 1, 1, 1, 'Atención de prueba del período reciente'),
    (50, TIMESTAMP '2026-03-10 10:00:00', 80400.00, 1, 2, 6, 4, 'Atención de prueba del período reciente'),
    (51, TIMESTAMP '2026-03-10 10:00:00', 75400.00, 1, 3, 10, 7, 'Atención de prueba del período reciente'),
    (52, TIMESTAMP '2026-04-10 10:00:00', 110500.00, 1, 1, 1, 2, 'Atención de prueba del período reciente'),
    (53, TIMESTAMP '2026-04-10 10:00:00', 80500.00, 1, 2, 6, 5, 'Atención de prueba del período reciente'),
    (54, TIMESTAMP '2026-04-10 10:00:00', 75500.00, 1, 3, 10, 8, 'Atención de prueba del período reciente'),
    (55, TIMESTAMP '2026-05-10 10:00:00', 38000.00, 2, 1, 5, 1, 'Atención de prueba del período reciente'),
    (56, TIMESTAMP '2026-05-10 10:00:00', 39000.00, 2, 2, 9, 4, 'Atención de prueba del período reciente'),
    (57, TIMESTAMP '2026-05-10 10:00:00', 35000.00, 2, 3, 2, 7, 'Atención de prueba del período reciente'),
    (58, TIMESTAMP '2026-06-10 10:00:00', 36000.00, 2, 1, 5, 2, 'Atención de prueba del período reciente'),
    (59, TIMESTAMP '2026-06-10 10:00:00', 37000.00, 2, 2, 9, 5, 'Atención de prueba del período reciente'),
    (60, TIMESTAMP '2026-06-10 10:00:00', 38000.00, 2, 3, 2, 8, 'Atención de prueba del período reciente'),
    (61, TIMESTAMP '2026-07-10 10:00:00', 39000.00, 2, 1, 5, 1, 'Atención de prueba del período reciente'),
    (62, TIMESTAMP '2026-07-10 10:00:00', 35000.00, 2, 2, 9, 4, 'Atención de prueba del período reciente'),
    (63, TIMESTAMP '2026-07-10 10:00:00', 36000.00, 2, 3, 2, 7, 'Atención de prueba del período reciente'),
    (64, TIMESTAMP '2026-08-10 10:00:00', 37000.00, 3, 1, 5, 2, 'Atención de prueba del período reciente'),
    (65, TIMESTAMP '2026-08-10 10:00:00', 38000.00, 3, 2, 9, 5, 'Atención de prueba del período reciente'),
    (66, TIMESTAMP '2026-08-10 10:00:00', 39000.00, 3, 3, 2, 8, 'Atención de prueba del período reciente'),
    (67, TIMESTAMP '2026-09-10 10:00:00', 35000.00, 3, 1, 9, 1, 'Atención de prueba del período reciente'),
    (68, TIMESTAMP '2026-09-10 10:00:00', 36000.00, 3, 2, 1, 4, 'Atención de prueba del período reciente'),
    (69, TIMESTAMP '2026-09-10 10:00:00', 37000.00, 3, 3, 5, 7, 'Atención de prueba del período reciente'),
    (70, TIMESTAMP '2026-10-10 10:00:00', 38000.00, 4, 1, 9, 2, 'Atención de prueba del período reciente'),
    (71, TIMESTAMP '2026-10-10 10:00:00', 39000.00, 4, 2, 1, 5, 'Atención de prueba del período reciente'),
    (72, TIMESTAMP '2026-10-10 10:00:00', 35000.00, 4, 3, 5, 8, 'Atención de prueba del período reciente');


-- Un pago único por atención pagada. Las atenciones 19, 21 y 24 quedan sin pago.
INSERT INTO pago (id_pago, fecha_pago, medio_pago, monto_pagado, id_atencion) VALUES
    (1, DATE '2024-01-11', 'Débito', 110000.00, 1),
    (2, DATE '2024-01-11', 'Transferencia', 110000.00, 2),
    (3, DATE '2024-01-11', 'Tarjeta', 80000.00, 3),
    (4, DATE '2024-02-11', 'Débito', 80100.00, 4),
    (5, DATE '2024-02-11', 'Transferencia', 80100.00, 5),
    (6, DATE '2024-02-11', 'Tarjeta', 75100.00, 6),
    (7, DATE '2024-03-11', 'Débito', 75200.00, 7),
    (8, DATE '2024-03-11', 'Transferencia', 75200.00, 8),
    (9, DATE '2024-03-11', 'Tarjeta', 110200.00, 9),
    (10, DATE '2024-04-11', 'Débito', 110300.00, 10),
    (11, DATE '2024-04-11', 'Transferencia', 110300.00, 11),
    (12, DATE '2024-04-11', 'Tarjeta', 80300.00, 12),
    (13, DATE '2024-05-11', 'Débito', 80400.00, 13),
    (14, DATE '2024-05-11', 'Transferencia', 80400.00, 14),
    (15, DATE '2024-05-11', 'Tarjeta', 75400.00, 15),
    (16, DATE '2024-06-11', 'Débito', 75500.00, 16),
    (17, DATE '2024-06-11', 'Transferencia', 75500.00, 17),
    (18, DATE '2024-06-11', 'Tarjeta', 110500.00, 18),
    (19, DATE '2024-07-11', 'Transferencia', 39000.00, 20),
    (20, DATE '2024-08-11', 'Débito', 36000.00, 22),
    (21, DATE '2024-08-11', 'Transferencia', 37000.00, 23),
    (22, DATE '2024-09-11', 'Débito', 39000.00, 25),
    (23, DATE '2024-09-11', 'Transferencia', 35000.00, 26),
    (24, DATE '2024-09-11', 'Tarjeta', 36000.00, 27),
    (25, DATE '2024-10-11', 'Débito', 37000.00, 28),
    (26, DATE '2024-10-11', 'Transferencia', 38000.00, 29),
    (27, DATE '2024-10-11', 'Tarjeta', 39000.00, 30),
    (28, DATE '2024-11-11', 'Débito', 35000.00, 31),
    (29, DATE '2024-11-11', 'Transferencia', 36000.00, 32),
    (30, DATE '2024-11-11', 'Tarjeta', 37000.00, 33),
    (31, DATE '2024-12-11', 'Débito', 38000.00, 34),
    (32, DATE '2024-12-11', 'Transferencia', 39000.00, 35),
    (33, DATE '2024-12-11', 'Tarjeta', 35000.00, 36),
    (34, DATE '2025-11-11', 'Débito', 110000.00, 37),
    (35, DATE '2025-11-11', 'Transferencia', 80000.00, 38),
    (36, DATE '2025-11-11', 'Tarjeta', 75000.00, 39),
    (37, DATE '2025-12-11', 'Débito', 110100.00, 40),
    (38, DATE '2025-12-11', 'Transferencia', 80100.00, 41),
    (39, DATE '2025-12-11', 'Tarjeta', 75100.00, 42),
    (40, DATE '2026-01-11', 'Débito', 110200.00, 43),
    (41, DATE '2026-01-11', 'Transferencia', 80200.00, 44),
    (42, DATE '2026-01-11', 'Tarjeta', 75200.00, 45),
    (43, DATE '2026-02-11', 'Débito', 110300.00, 46),
    (44, DATE '2026-02-11', 'Transferencia', 80300.00, 47),
    (45, DATE '2026-02-11', 'Tarjeta', 75300.00, 48),
    (46, DATE '2026-03-11', 'Débito', 110400.00, 49),
    (47, DATE '2026-03-11', 'Transferencia', 80400.00, 50),
    (48, DATE '2026-03-11', 'Tarjeta', 75400.00, 51),
    (49, DATE '2026-04-11', 'Débito', 110500.00, 52),
    (50, DATE '2026-04-11', 'Transferencia', 80500.00, 53),
    (51, DATE '2026-04-11', 'Tarjeta', 75500.00, 54),
    (52, DATE '2026-05-11', 'Débito', 38000.00, 55),
    (53, DATE '2026-05-11', 'Transferencia', 39000.00, 56),
    (54, DATE '2026-05-11', 'Tarjeta', 35000.00, 57),
    (55, DATE '2026-06-11', 'Débito', 36000.00, 58),
    (56, DATE '2026-06-11', 'Transferencia', 37000.00, 59),
    (57, DATE '2026-06-11', 'Tarjeta', 38000.00, 60),
    (58, DATE '2026-07-11', 'Débito', 39000.00, 61),
    (59, DATE '2026-07-11', 'Transferencia', 35000.00, 62),
    (60, DATE '2026-07-11', 'Tarjeta', 36000.00, 63),
    (61, DATE '2026-08-11', 'Débito', 37000.00, 64),
    (62, DATE '2026-08-11', 'Transferencia', 38000.00, 65),
    (63, DATE '2026-08-11', 'Tarjeta', 39000.00, 66),
    (64, DATE '2026-09-11', 'Débito', 35000.00, 67),
    (65, DATE '2026-09-11', 'Transferencia', 36000.00, 68),
    (66, DATE '2026-09-11', 'Tarjeta', 37000.00, 69),
    (67, DATE '2026-10-11', 'Débito', 38000.00, 70),
    (68, DATE '2026-10-11', 'Transferencia', 39000.00, 71),
    (69, DATE '2026-10-11', 'Tarjeta', 35000.00, 72);


INSERT INTO medicamento (id_medicamento, nombre_medicamento, descripcion) VALUES
    (1, 'Meloxicam', 'Antiinflamatorio veterinario de prueba'),
    (2, 'Amoxicilina', 'Antibiótico veterinario de prueba'),
    (3, 'Gabapentina', 'Medicamento veterinario de prueba'),
    (4, 'Metronidazol', 'Medicamento veterinario de prueba'),
    (5, 'Enrofloxacino', 'Antibiótico veterinario de prueba'),
    (6, 'Metoclopramida', 'Medicamento veterinario de prueba');

-- Cuatro recetas por especie; las cantidades hacen que un medicamento sea el más recetado en cada especie.
INSERT INTO receta (id_receta, fecha_emision, observacion, id_atencion) VALUES
    (1, DATE '2025-11-10', 'Receta de prueba', 37),
    (2, DATE '2025-12-10', 'Receta de prueba', 40),
    (3, DATE '2026-01-10', 'Receta de prueba', 43),
    (4, DATE '2026-02-10', 'Receta de prueba', 46),
    (5, DATE '2025-11-10', 'Receta de prueba', 38),
    (6, DATE '2025-12-10', 'Receta de prueba', 41),
    (7, DATE '2026-05-10', 'Receta de prueba', 55),
    (8, DATE '2026-06-10', 'Receta de prueba', 58),
    (9, DATE '2025-11-10', 'Receta de prueba', 39),
    (10, DATE '2025-12-10', 'Receta de prueba', 42),
    (11, DATE '2026-05-10', 'Receta de prueba', 56),
    (12, DATE '2026-06-10', 'Receta de prueba', 59);

INSERT INTO detalle_receta (id_receta, id_medicamento, cantidad, dosis, frecuencia, duracion, indicacion) VALUES
    (1, 1, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (1, 2, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (2, 1, 4, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (2, 2, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (3, 1, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (3, 2, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (4, 1, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (4, 2, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (5, 3, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (5, 4, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (6, 3, 4, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (6, 4, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (7, 3, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (7, 4, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (8, 3, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (8, 4, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (9, 5, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (9, 6, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (10, 5, 4, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (10, 6, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (11, 5, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (11, 6, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'),
    (12, 5, 5, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba'), (12, 6, 1, 'Según indicación veterinaria', 'Según receta', 'Según receta', 'Dato ficticio para prueba');

COMMIT;

-- Conteos esperados: 3 regiones, 6 comunas, 9 clientes, 3 especies, 6 razas, 12 mascotas,
-- 4 tipos de atención, 3 cargos, 3 sucursales, 9 empleados, 9 sueldos, 72 atenciones,
-- 69 pagos, 12 recetas, 6 medicamentos y 24 detalles de receta.
