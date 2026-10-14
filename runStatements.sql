USE Veterinaria;
-- ============================================================
-- 1. Mascota con más atenciones por sucursal.
-- ============================================================
SELECT
    s.nombre_sucursal,
    m.id_mascota,
    m.nombre_mascota,
-- cantidad de atenciones recibidas por mascota en sucursal
    COUNT(a.id_atencion) AS total_atenciones
FROM sucursal s
-- atenciones en sucursal
JOIN atencion a
    ON s.id_sucursal = a.id_sucursal
-- atenciones por mascota
JOIN mascota m
    ON a.id_mascota = m.id_mascota
-- agrupamos por sucursal y por mascota para calcular el total de visitas de cada una
GROUP BY
    s.id_sucursal,
    s.nombre_sucursal,
    m.id_mascota,
    m.nombre_mascota
-- solo muestra el mayor numero de atenciones
HAVING COUNT(a.id_atencion) = (
    SELECT MAX(conteo_mascota)
    FROM (
		-- cantidad de atenciones de cada mascota en la sucursal actual
        SELECT COUNT(atencion_sucursal.id_atencion) AS conteo_mascota
        FROM atencion atencion_sucursal
        WHERE atencion_sucursal.id_sucursal = s.id_sucursal
        GROUP BY atencion_sucursal.id_mascota
    ) AS tabla_conteos_sucursal
);
-- ============================================================
-- 2. Veterinario con más atenciones realizadas por mes durante el 2024.
-- ============================================================
-- Define que datos mostrar: elmes, el id empleado y el total de atenciones en el mes
SELECT 
    MONTH(atencion_principal.fecha_hora) AS mes,
    CONCAT(empleado_principal.apellido, ' ', empleado_principal.nombre_empleado) AS veterinario,
    COUNT(atencion_principal.id_atencion) AS cantidad_atenciones

-- Identifica que empleado realiza atenciones
FROM atencion AS atencion_principal
JOIN empleado AS empleado_principal 
    ON atencion_principal.id_empleado = empleado_principal.id_empleado
JOIN cargo AS cargo_principal 
    ON empleado_principal.id_cargo = cargo_principal.id_cargo

-- Realiza la consulta para las atenciones del año 2024
WHERE atencion_principal.fecha_hora >= '2024-01-01' 
  AND atencion_principal.fecha_hora <  '2025-01-01'
  AND cargo_principal.nombre_cargo = 'Veterinario'

-- Agrupa los datos datos por mes, con cada empleado
GROUP BY 
    mes, 
    empleado_principal.id_empleado, 
    empleado_principal.nombre_empleado, 
    empleado_principal.apellido

-- Realiza el conteo del empleado con mayor atenciones en el mes, y los ordena por mes
HAVING COUNT(atencion_principal.id_atencion) >= ALL (
    SELECT COUNT(atencion_comparativa.id_atencion)
    FROM atencion AS atencion_comparativa
    JOIN empleado AS empleado_comparativo 
        ON atencion_comparativa.id_empleado = empleado_comparativo.id_empleado
    JOIN cargo AS cargo_comparativo 
        ON empleado_comparativo.id_cargo = cargo_comparativo.id_cargo
    WHERE atencion_comparativa.fecha_hora >= '2024-01-01' 
      AND atencion_comparativa.fecha_hora <  '2025-01-01'
      AND MONTH(atencion_comparativa.fecha_hora) = mes
      AND cargo_comparativo.nombre_cargo = 'Veterinario'
    GROUP BY atencion_comparativa.id_empleado
)
ORDER BY mes ASC;
-- ============================================================
-- 3. Especie más atendida por sucursal.
-- ============================================================
-- ordena datos : sucursal, especie y cantidad de atenciones
SELECT 
    sucursal_principal.nombre_sucursal AS sucursal,
    especie_principal.nombre_especie AS especie,
    COUNT(atencion_principal.id_atencion) AS cantidad_atenciones

-- determina la ESPECIE de cada ANIMAL, que tuvo ATENCION, en cada SUCURSAL
FROM sucursal AS sucursal_principal
JOIN atencion AS atencion_principal 
    ON sucursal_principal.id_sucursal = atencion_principal.id_sucursal
JOIN mascota AS mascota_principal 
    ON atencion_principal.id_mascota = mascota_principal.id_mascota
JOIN raza AS raza_principal 
    ON mascota_principal.id_raza = raza_principal.id_raza
JOIN especie AS especie_principal 
    ON raza_principal.id_especie = especie_principal.id_especie

-- Cuenta por cada ESPECIE, las ATENCIONES, recibida en cada SUCURSAL
GROUP BY 
    sucursal_principal.id_sucursal,
    sucursal_principal.nombre_sucursal,
    especie_principal.id_especie,
    especie_principal.nombre_especie

-- Selecciona la ESPECIE, con mas ATENCIONES, en la SUCURSAL
HAVING COUNT(atencion_principal.id_atencion) >= ALL (
    
    SELECT COUNT(atencion_comparativa.id_atencion)
    FROM atencion AS atencion_comparativa
    JOIN mascota AS mascota_comparativa 
        ON atencion_comparativa.id_mascota = mascota_comparativa.id_mascota
    JOIN raza AS raza_comparativa 
        ON mascota_comparativa.id_raza = raza_comparativa.id_raza
    WHERE atencion_comparativa.id_sucursal = sucursal_principal.id_sucursal
    GROUP BY raza_comparativa.id_especie
);
-- ============================================================
-- 4. Cliente que más ha gastado en atenciones por año.
-- ============================================================
-- Cliente que mas gasta en atencion por año
-- Se obtiene el gasto total de un cliente para cada año
WITH gastosxanio AS (
    SELECT
        c.id_cliente,
        c.nombre_cliente,
         -- Suma los montos relacionados a la atencion del cliente en cuestion
        SUM(a.monto_total) AS monto_total_anio_cliente,
        -- Indica el año correspondiente a la atencion
        YEAR(a.fecha_hora) AS Anio
    FROM cliente c
    -- liga la mascota al cliente
    JOIN mascota m
        ON m.id_cliente = c.id_cliente
	-- liga atenciones
    JOIN atencion a
        ON a.id_mascota = m.id_mascota
	-- agrupamos por id, nombre del cliente y año en que se realizo la atencion
    GROUP BY c.id_cliente, c.nombre_cliente, Anio
),
-- Se le asigna un ranking a cada gasto total x año de un cliente para un año correspondiente.
ranking AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY Anio
            ORDER BY monto_total_anio_cliente DESC
        ) AS posicion
    FROM gastosxanio
)
-- Se obtienen solo los numero uno pertenecientes al ranking x año anterior
SELECT
    id_cliente,
    nombre_cliente,
    monto_total_anio_cliente,
    Anio
FROM ranking
WHERE posicion = 1
ORDER BY Anio ASC;
-- ============================================================
-- 5. Medicamento más recetado por especie.
-- ============================================================
-- Obtiene las apariciones totales para cada medicamento recetado por cada especie;
WITH medicamentosxespecie AS (


SELECT e.nombre_especie,
   m.nombre_medicamento,
   COUNT(m.nombre_medicamento) AS apariciones
FROM especie e
-- Uno a la tabla de raza
JOIN raza r
   ON r.id_especie = e.id_especie
-- Uno a la tabla de mascota
JOIN mascota ma
   ON ma.id_raza = r.id_raza
-- Uno a la tabla de atencion
JOIN atencion a
   ON a.id_mascota = ma.id_mascota
-- Uno a la tabla de receta
JOIN receta re
   ON re.id_atencion = a.id_atencion
-- Uno a la tabla detalle de la receta
JOIN detalle_receta d
   ON d.id_receta = re.id_receta
-- Uno a la tabla el medicamento
JOIN medicamento m
   ON m.id_medicamento = d.id_medicamento
-- Agrupamos por el medicamento y por el nombre de la especie
GROUP BY e.nombre_especie, m.nombre_medicamento
ORDER BY e.nombre_especie DESC


),
-- SUB tabla ranking por tipo de especie y el medicamento que mas se repite para esa especie;
ranking AS (


SELECT *,
RANK() OVER (


   PARTITION BY nombre_especie
   ORDER BY apariciones DESC


) AS posicion
FROM medicamentosxespecie


)
-- Muestra solo el medicamento que mas se repite para la especie, si hay 2 o mas empatados se muestran;
SELECT nombre_especie,
   nombre_medicamento,
   apariciones
FROM ranking
WHERE posicion = 1;
-- ============================================================
-- 6. Total recaudado por sucursal por mes en los últimos 12 meses.
-- ============================================================
WITH totalxaniomes AS (
SELECT YEAR(a.fecha_hora) AS anio,
   MONTH(a.fecha_hora) AS mes,
   s.id_sucursal,
   s.nombre_sucursal,
   SUM(a.monto_total) AS total_recaudado
FROM atencion a
JOIN sucursal s
   ON a.id_sucursal = s.id_sucursal
GROUP BY anio, s.id_sucursal, mes
ORDER BY s.id_sucursal ASC, anio DESC, mes DESC
),
numerado AS (
SELECT
   *,
   -- Asigna un numero a cada registro para cada sucursal
   ROW_NUMBER() OVER (


       PARTITION BY id_sucursal
       ORDER BY id_sucursal ASC, anio DESC, mes DESC


   ) AS numero
   FROM totalxaniomes
)
SELECT anio, mes,id_sucursal, nombre_sucursal, total_recaudado
FROM numerado
WHERE numero <= 12;
-- ============================================================
-- 7. Tipo de atención más solicitado por comuna.
-- ============================================================
-- contamos la cantidad de tios de atenciones en cada comuna
WITH conteos AS (
    SELECT
        comuna.id_comuna,
        comuna.nombre_comuna,
        tipo_atencion.id_tipo_atencion,
        tipo_atencion.nombre_tipo_atencion,
        COUNT(*) AS cantidad
    FROM atencion
    JOIN tipo_atencion
        ON tipo_atencion.id_tipo_atencion = atencion.id_tipo_atencion
    JOIN sucursal
        ON sucursal.id_sucursal = atencion.id_sucursal
    JOIN comuna
        ON comuna.id_comuna = sucursal.id_comuna
    GROUP BY
        comuna.id_comuna,
        comuna.nombre_comuna,
        tipo_atencion.id_tipo_atencion,
        tipo_atencion.nombre_tipo_atencion
),
-- seleccionamos los datos finales,se separa por comuna, se ordenan de mayor a menor y se les asiggna un ranking por puntuacion en base a la posicion descendiente de la cantidad

ranking AS (
    SELECT
        nombre_comuna,
        nombre_tipo_atencion,
        cantidad,
        RANK() OVER (
            PARTITION BY id_comuna
            ORDER BY cantidad DESC
        ) AS puesto
    FROM conteos
)
-- se seleciona solo los que tienen el ranking mas alto
SELECT nombre_tipo_atencion, cantidad, nombre_comuna
FROM ranking
WHERE puesto = 1
ORDER BY nombre_comuna;
-- ============================================================
-- 8. Empleados con mayor y menor sueldo por sucursal, indicando su cargo.

-- ============================================================
-- Reunimos la informacion del empleado, su sucursal, cargo y sueldo
WITH ranking_sueldos AS (
	SELECT
		s.id_sucursal,
        s.nombre_sucursal,
        e.id_empleado,
        e.nombre_empleado,
        e.apellido,
        c.nombre_cargo,
        su.monto AS sueldo,
        
        -- Ranking desde el sueldo mas alto al mas bajo
        RANK() OVER	(
			PARTITION BY s.id_sucursal
            ORDER BY su.monto DESC
        ) AS ranking_mayor,
        
        -- Ranking desde el sueldo mas bajo al mas alto
        RANK() OVER	(
			PARTITION BY s.id_sucursal
            ORDER BY su.monto ASC
        ) AS ranking_menor
	
    FROM sucursal s
    -- Relacionamos cada sucursal con sus empleados
    JOIN empleado e
    ON e.id_sucursal = s.id_sucursal
    -- Obtenemos el sueldo de cada empleado
    JOIN sueldo su
    ON su.id_empleado = e.id_empleado
    -- Obtenemos el cargo del empleado
    JOIN cargo c
    ON c.id_cargo = e.id_cargo
)
-- Mostramos solo los que tienen el sueldo maximo o minimo dentro de la sucursal
SELECT
	nombre_sucursal,
    id_empleado,
    nombre_empleado,
    apellido,
    nombre_cargo,
    sueldo,
    
    -- Indicamos si corresponde al sueldo mayor o menor
    CASE
		WHEN ranking_mayor = 1 AND ranking_menor = 1
			THEN "Mayor y menor sueldo"
		WHEN ranking_mayor = 1
			THEN "Mayor sueldo"
		WHEN ranking_menor = 1
			THEN "Menor sueldo"
	END AS tipo_sueldo 

FROM ranking_sueldos
WHERE ranking_mayor = 1 OR ranking_menor = 1
ORDER BY id_sucursal, sueldo DESC;
-- ============================================================
-- 9. Lista de regiones con la cantidad de clientes y de mascotas registradas en ellas.

-- ============================================================
SELECT r.nombre_region,
   -- Cuenta a los diferentes clientes para cada region;
   COUNT(DISTINCT c.id_cliente) AS clientes,
   -- Cuenta a las diferentes mascotas para cada region;
   COUNT(DISTINCT m.id_mascota) AS mascotas
FROM region r
JOIN comuna
   ON comuna.id_region = r.id_region
JOIN cliente c
   ON c.id_comuna = comuna.id_comuna
JOIN mascota m
   ON m.id_cliente = c.id_cliente
GROUP BY r.nombre_region
ORDER BY r.nombre_region ASC;
-- ============================================================
-- 10. Atenciones sin pago asociado por sucursal, indicando el monto total adeudado.
-- ============================================================
SELECT
	s.id_sucursal,
    s.nombre_sucursal,
    
    -- Cantidad de atenciones que aún no tienen pago
    COUNT(a.id_atencion) AS cantidad_atenciones_sin_pago,
    -- Suma del valor de todas las atenciones impagas
    SUM(a.monto_total) AS monto_total_adeudado
    
FROM sucursal s 

-- Relacionamos cada sucursal con sus atenciones
JOIN atencion a
	ON a.id_sucursal = s.id_sucursal
-- LEFT JOIN permite conservar las atenciones aunque no exista un pago asociado
LEFT JOIN pago p 
	ON p.id_atencion = a.id_atencion
    
-- Si id_pago es null, significa que no existe ningun pago asociado a esa atencion
WHERE p.id_pago IS NULL

-- Agrupamos por sucursal para contar atenciones y sumar la deuda de cada una
GROUP BY
	s.id_sucursal,
    s.nombre_sucursal
ORDER BY s.id_sucursal