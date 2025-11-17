use TiendaEmprendedores;
-- trabajo con la tabla producto.
select * from Producto;

--VISTAS:
-- Instruccion que se usa como fuente de datos de las consultas usuales.
-- no guardan datos solo consultas, ejecuta la query real sobre la tabla base.

-- 1)Crear una vista sobre alguna tabla que solo muestre algunos campos de la misma. USO LA TABLA PRODUCTO:
CREATE VIEW vProductoDatos
AS
SELECT
    id_producto,
    nombre,
    precio
FROM Producto;

-- select sobre la vista para ver el resultado muestra algunas columnas de Productos.
SELECT * from vProductoDatos;

-- 2) Realizar un insert de un lote de datos a travez de la vista
INSERT INTO vProductoDatos (id_producto, nombre, precio)
VALUES 
    (1001, 'Mate Imperial', 15000),
    (1002, 'Cuaderno A5', 2500),
    (1003, 'Bolso de cuero', 32000);

-- 1ra observacion: no puedo hacer un insert si mi vista no incluye todos los campos con condicion not null
-- podría hacer la vista omitiendo campos opcionales (en este caso la tabla productos  no tiene ninguno).

-- creo una vista con todos los campos not null de mi tabla para continuar con la consigna
CREATE VIEW vProductoDatos2
AS
SELECT
    id_producto,
    nombre,
    descripcion,
    stock,
    precio,
    id_categoria
FROM Producto;

-- Insert de datos
INSERT INTO vProductoDatos2
(id_producto, nombre, descripcion, stock, precio, id_categoria)
VALUES
(2001, 'CollarJade', 'con piedra natural', 10, 15000, 2),
(2002, 'MantaTejida', 'Hilos de Algodon', 5, 20000, 4);

--Verificacion:
SELECT * FROM vProductoDatos2;
SELECT * FROM Producto;
--Observacion: la insercion se hizo en la tabla base. Las modificaciones realizadas mediante la vista impactan en las tablas subyacentes.

-- Insert de lote de 500 productos aleatorios
;WITH Numbers AS (
    SELECT TOP (500)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects AS A
    CROSS JOIN sys.objects AS B
)
INSERT INTO vProductoDatos2
(id_producto, nombre, descripcion, stock, precio, id_categoria)
SELECT
    3000 + n,
    'Producto ' + CAST(n AS VARCHAR(10)),
    'Descripción del producto ' + CAST(n AS VARCHAR(10)),
    ABS(CHECKSUM(NEWID())) % 100 + 1,
    CAST((ABS(CHECKSUM(NEWID())) % 50000) + 500 AS FLOAT),
    (ABS(CHECKSUM(NEWID())) % 5) + 1
FROM Numbers;
GO

-- 3) Realizar UPDATE de algunos registros y verificar el resultado en la tabla 
-- modifico precio con suba del 10% y sumo 5 articulos de cada producto 
UPDATE vProductoDatos2
SET precio= precio* 1.10, 
stock = stock +5
WHERE id_producto BETWEEN 1 AND 3  

--Verificacion
SELECT * FROM vProductoDatos2
WHERE id_producto BETWEEN 1 AND 3;

select * from Producto;
-- Se actualzan ambas tablas. hay correspondencia 

--4) Borrar todos los registros insertados a través de la vista
DELETE FROM vProductoDatos2
WHERE id_producto >= 3000;

-- Verificación
SELECT * FROM vProductoDatos2 WHERE id_producto >= 3000;
SELECT * FROM Producto WHERE id_producto >= 3000;
-- En ambos casos devuelve el conjunto vacio 


--VISTAS INDEXADAS: guarda los resultados de la vista en disco.Los mantiene sincronizados automáticamente con la tabla base.

--5) Crear un índice sobre alguna de las columnas de la vista creada
-- No se puede crear un índice sobre esa vista porque no está definida con SCHEMABINDING y no cumple los requisitos de una vista indexada.
-- No referencia columnas con el schema (dbo.Producto), 
-- entonces creo una vista que si pueda ser indexada

CREATE VIEW vProductoIndexada
WITH SCHEMABINDING
AS
SELECT 
    id_producto,
    nombre,
    precio
FROM dbo.Producto;
GO
-- Un índice clustered Ordena físicamente los datos según la clave del índice.
-- Solo puede haber uno por vista.
CREATE UNIQUE CLUSTERED INDEX IX_vProductoIndexada_id
ON vProductoIndexada (id_producto);
GO

--Verificacion: 
SELECT * FROM vProductoIndexada; 

-- esta vista no permita hacer un INSERT ya que debe incluir todas las columnas NOT NULL que no tengan valor por defecto
-------------------------------------------------------------------------------------------------------------------------------
---- OTROS ejemplos de vistas con Joinn:

-- creo la vista utilizando dos tablas 
CREATE VIEW v_ProductosYCategorias
AS
SELECT 
    p.nombre AS producto,
    c.descripcion AS categoria
FROM Producto p
JOIN Categoria c ON p.id_categoria = c.id_categoria;

-- Uso la vista: 
SELECT * FROM v_ProductosYCategorias;
-- el resultado es Una vista de los productos con su categoria  categoría.


-- OTRA VISTA: Clientes que compraron un monto mayor a 10mil pesos
create view compra_mayor10 as 
select u.id_usuarios, nombre, f.Total
from usuarios u
join Factura f
on f.id_usuarios = u.id_usuarios 
and f.Total > 10000;

select * from compra_mayor10;
-- ejemplo de insert que da error: 
INSERT INTO compra_mayor10 (id_usuarios, nombre, Total)
VALUES (500, 'Juan Pérez', 15000);

--vista para ver todos los datos de la factura unidos
create view datos_venta as
select u.id_usuarios, u.nombre as nom_usuario, p.nombre, df.precio_unitario,
df.cantidad, f.Total 
from Usuarios u
join Factura f on f.id_usuarios = u.id_usuarios
join DetalleFactura df on df.id_factura = f.id_factura
join Producto p on p.id_producto = df.id_producto;

select * from datos_venta;

-- Estas vistas no son actualizable no permiten operaciones DML.
-- Al hacer JOIN a varias tablas, SQL Server ya no sabe en cuál aplicar el UPDATE (salvo casos especiales).
-------------------------------------------------------------------------------------------------------------
-- OTROS EJEMPLOS DE VISTAS INDEXADAS:
-- Creo la vista con SCHEMABINDING
 
CREATE VIEW dbo.v_StockPorCategoria
WITH SCHEMABINDING
AS
SELECT 
    p.id_categoria,
    SUM(p.stock) AS StockTotal,
    COUNT_BIG(*) AS CantidadProductos --por categoria 
FROM dbo.Producto p
GROUP BY p.id_categoria;

-- Creo el indice, esto la convierte en vista indexada
CREATE UNIQUE CLUSTERED INDEX IX_v_StockPorCategoria
ON dbo.v_StockPorCategoria (id_categoria);

-- Uso la vista, resultado: suma total de stock por categoría, y cant de productos por categoria .
SELECT *
FROM dbo.v_StockPorCategoria;

------------------------------------------------------------------------------------------------------------------------------
--OTRO CASO para mostrar la diferencia en rendimiento y en el plan de ejecución entre 
--Una consulta compleja ejecutada directamente sobre tablaS, Y la misma consulta definida dentro de una vista indexada.

SELECT 
    P.nombre AS producto,
    CAST(F.fecha AS date) AS fecha,
    SUM(DF.cantidad * DF.precio_unitario) AS totalVendido
FROM dbo.Producto AS P
INNER JOIN dbo.DetalleFactura AS DF
    ON P.id_producto = DF.id_producto
INNER JOIN dbo.Factura AS F
    ON DF.id_factura = F.id_factura
GROUP BY 
    P.nombre,
    CAST(F.fecha AS date);


SELECT * FROM VentasPorProductoYFecha; -- PARA COMPARAR

    CREATE VIEW dbo.VentasPorProductoYFecha
WITH SCHEMABINDING
AS
SELECT
    P.id_producto,
    P.nombre,
    F.fecha AS fecha,
    SUM(DF.cantidad * DF.precio_unitario) AS totalVendido,
    COUNT_BIG(*) AS filas
FROM dbo.Producto AS P
INNER JOIN dbo.DetalleFactura AS DF
    ON P.id_producto = DF.id_producto
INNER JOIN dbo.Factura AS F
    ON DF.id_factura = F.id_factura
GROUP BY 
    P.id_producto,
    P.nombre,
    F.fecha;
GO

CREATE UNIQUE CLUSTERED INDEX IX_VentasPorProductoYFecha
ON dbo.VentasPorProductoYFecha (id_producto, fecha);
GO


--CONCLUSION BREVE: 
-- Las vistas son representaciones que muestran el resultado de una consulta y se recalculan cada vez que se ejecutan. 
--Una vista puede involucrar una o varias tablas, simplificando el acceso a consultas complejas mediante un nombre único.
-- cuando una vista es actualizable permite operaciones DML y trabajar sobre ella es equivalente a trabajar sobre las tablas base. 
-- Es decir que las modificaciones realizadas mediante la vista impactan inmediatamente en las tablas subyacentes.
-- En cambio, las vistas indexadas almacenan físicamente sus datos mediante un índice clustered único, Las vistas normales no permiten índices.
-- Únicamente si la vista cumple los requisitos de SQL Server se puede hacer un indice cluster, lo que permite acceder 
-- a los resultados precalculados, mejorando significativamente el rendimiento en consultas repetitivas.














