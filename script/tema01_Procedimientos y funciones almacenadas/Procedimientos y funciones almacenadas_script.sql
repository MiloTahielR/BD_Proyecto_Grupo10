USE TiendaEmprendedores;
GO
--Tema: Procedimientos y funciones almacenadas

--Usamos la sentencia CREATE PROCEDURE para crear un procedimiento almacenado (Stored Procedure)

--tres procedimientos almacenados que permitan: Insertar, Modificar y borrar registros de alguna de las tablas del proyecto.

--Insertamos un producto
-- el @ es para declarar los parametros (nombre de los atributos) y alado va el tipo de datos 
-- el AS indica cual es el bloque de la instruccion que se quiere ejecutar
--BEGIN ... END deliminta el bloque de la sentencia que se va a ejecutar
GO
CREATE PROCEDURE sp_insertar_producto
 @id_producto INT,
 @nombre VARCHAR(200),
 @descripcion VARCHAR(200),
 @stock INT,
 @precio FLOAT,
 @id_categoria INT 
  AS
BEGIN 
 INSERT INTO Producto (id_producto,nombre,descripcion,stock,precio,id_categoria)
 VALUES(@id_producto,@nombre,@descripcion,@stock,@precio,@id_categoria);
END;
GO

--Modificar producto
-- El @ es para declarar los parametros (nombre de los atributos) y alado va el tipo de datos 
-- El AS indica cual es el bloque de la instruccion que se quiere ejecutar
--Usamos la sentencia UTDATE para modificar los datos de la tabla productos
GO
CREATE PROCEDURE sp_modificar_producto
 @id_producto INT,
 @nuevo_nombre VARCHAR(200),
 @nueva_descripcion VARCHAR(200),
 @nuevo_stock INT,
 @nuevo_precio FLOAT,
 @nuevo_id_categoria INT 
  AS
BEGIN 
 UPDATE Producto
  SET -- se usa esa sentencia para especificar que columnas se van a modificar y con que valores
    nombre = @nuevo_nombre,
    descripcion = @nueva_descripcion,
    stock = @nuevo_stock,
    precio = @nuevo_precio,
    id_categoria = @nuevo_id_categoria
  WHERE @id_producto = id_producto;-- indica cuales son las fila o filas que se van a modificar (sin eso modifica toda la tabla)
END;
GO

--Eliminar Producto
GO
CREATE PROCEDURE sp_eliminar_producto
 @id_producto INT --con ese identificador (clave primaria) indicamos cual es el producto a eliminar 
AS
  BEGIN 
   DELETE FROM Producto -- indicamos de que tabla vamos a eliminar
   WHERE id_producto = @id_producto;-- indicamos cual es la fila que queremos eliminar 
  END;
GO

--Insertar un lote de datos en la tabla Categoria con sentencias insert  
--Inserto 5 filas en la tabla Categoria para poder insertar los productos con los procedimientos creados
GO
INSERT INTO Categoria (id_categoria,descripcion)
VALUES 
(6,'Artesania y Decoracion'),
(7,'Alimintos y Bebidas'),
(8,'Hogar y Jardin'),
(9,'Mascotas'),
(10,'Indumentaria y Accesorios');
GO
--Otro lote invocando a los procedimientos creados. 
-- Se usa EXEC para ejecutar un procedimiento almacenado (EXECUTE)
--Inserto 5 filas en la tabla Producto 
GO
EXEC sp_insertar_producto 
 @id_producto = 11,
 @nombre = 'Pastafrola',
 @descripcion = 'Membrillo 15cm/8porciones',
 @stock = 3,
 @precio = 9000,
 @id_categoria = 7;
GO

GO
EXEC sp_insertar_producto 
 @id_producto = 12,
 @nombre = 'Bolso',
 @descripcion = 'tejido a crochet',
 @stock = 5,
 @precio = 12000,
 @id_categoria = 10;
GO

GO
EXEC sp_insertar_producto 
 @id_producto = 13,
 @nombre = 'Lampara de Oceano de Resina',
 @descripcion = 'Hecho con Resina y madera natural',
 @stock = 6,
 @precio = 20000,
 @id_categoria = 6;
GO

GO
EXEC sp_insertar_producto 
 @id_producto = 14,
 @nombre = 'Estrella Federal',
 @descripcion = 'arbusto ornamental apreciado por su espectacular despliegue de color ocurre en generalmente primavera',
 @stock = 8,
 @precio = 14000,
 @id_categoria = 8;
GO

GO
 EXEC sp_insertar_producto 
 @id_producto = 15,
 @nombre = ' Chaleco Polar Liso Mascotas Perros Gatos ',
 @descripcion = 'Tejido a crochet',
 @stock = 10,
 @precio = 5000,
 @id_categoria = 9;
GO
 --Realizar  update y delete sobre  algunos de los registros insertados  en esas tablas invocando a los procedimientos.
 -- Modificamos (UPDATE) un producto de la tabla Producto y se lo busca por su id (id=3)
GO
EXEC sp_modificar_producto
 @id_producto = 13,
 @nuevo_nombre = 'Lampara de Arbol',
 @nueva_descripcion = 'Hecho con Resina y madera natural de roble',
 @nuevo_stock = 4,
 @nuevo_precio = 21000,
 @nuevo_id_categoria = 6;
GO
 --Eliminamos (DELETE) sobre un producto de la tabla producto y se lo busca por su id (id=1)
GO
 EXEC sp_eliminar_producto 
  @id_producto = 11;
GO

--Desarrollar al menos tres funciones almacenadas. Por ej: calcular la edad, 
--A las funciones se las declara con CREATE FUNCTION y un Return ya que siempre devuelve un valor,(puede tener parametros de entrada)

--Calcula el stock total de productos para saber cuantos productos en total hay en el inventario
GO
CREATE FUNCTION fn_total_stock()
RETURNS INT 
AS 
BEGIN 
  DECLARE @total INT -- se declara una variable local para el total de stock
  SELECT @total = SUM(stock) -- se suma todos los valores de la columna stock de la tabla Producto
  FROM Producto 
  RETURN @total; -- devuelve el total de stock como resultado de la funcion 
END;
GO
/*--Calcula el stock total de productos por categoria para saber cuantos productos hay en el inventario por categoria
GO
CREATE FUNCTION fn_total_stock_Categoria(@id_categoria INT)
RETURNS INT 
AS 
BEGIN 
  DECLARE @total_categoria INT -- se declara una variable local para el total de stock por categoria
  SELECT @total_categoria = SUM(stock) -- se suma el stock por categorias de la tabla Producto
  FROM Producto 
  WHERE id_categoria = @id_categoria
  RETURN @total_categoria; -- devuelve el total de stock como resultado de la funcion 
END;
GO*/
--Calcular el valor total del inventario de una categoria especifica
GO
CREATE FUNCTION fn_total_categoria(@id_categoria INT)
RETURNS FLOAT
AS
BEGIN 
  DECLARE @total_categoria FLOAT -- se declara la variable con su tipo de dato
  SELECT @total_categoria = SUM(stock * precio)
  FROM Producto
  WHERE id_categoria = @id_categoria
  RETURN @total_categoria;
END;
GO
/*--Calcular el valor total del inventario
GO
CREATE FUNCTION fn_total()
RETURNS FLOAT
AS
BEGIN 
  DECLARE @total FLOAT -- se declara la variable con su tipo de dato
  SELECT @total = SUM(stock * precio)
  FROM Producto
  RETURN @total;
END;
GO*/
--Calcular el aumento porcentual del precio de un producto
GO
CREATE FUNCTION fn_aplicar_aumento(@id_producto INT, @porcentaje FLOAT)
RETURNS FLOAT
AS
BEGIN  
    DECLARE @nuevo_precio FLOAT;
    DECLARE @precio FLOAT;--se declara la variable del precio
    --se guarda el precio de ese producto que se ingreso por parametro con el id_producto
    SELECT @precio = precio FROM Producto WHERE id_producto = @id_producto
    SET @nuevo_precio = @precio + (@precio * @porcentaje / 100)--se calcula el porcentaje para ese precio
    RETURN @nuevo_precio
END;
GO
--Probar que las funciones funcionen 

--total de stock 
SELECT dbo.fn_total_stock() AS Total_Stock;
--total de stock por categoria
SELECT dbo.fn_total_categoria(6) AS Total_Categoria;
--aplicar aumento
SELECT dbo.fn_aplicar_aumento(13, 10) AS Nuevo_Precio;

--Comparar la eficiencia de las operaciones directas versus el uso de procedimientos y funciones.

--Se usa SET STATIC TIME ON para activar la medicion de tiempo que tarda en ejecutar cada consulta
--Se usa SET STATISTICS IO ON que miede la cantidda de operaciones entrada/salida que se realizan en el disco o cache al ejecutar la consulta
-- se usa esas dos sentencias para desactivar las mediciones de tiempo que se activaron mas arriba

--Con SET STATISTICS TIME ON se puede observar:
--CPU time:Cuanto tiempo se uso el procesador para ejecutar la instruccion
--Elapsed time:Tiempo total desde que empezo hasta que termmino(incluye esperas,lectura de disco)

--Con SET STATISTICS IO ON se puede observar:
--Scan count:Cuantas veces se leyo la tabla
--Logical reads:Paginas leidas deesde memoria cache
--Physical reads:Paginas leidas desde el disco
--Read_ahead reads:Lectura anticipada que hace SQL SERVER

--Se mide la insercion directa con INSERT INTO 
 SET STATISTICS TIME ON;
 SET STATISTICS IO ON;

 INSERT INTO Producto (id_producto,nombre,descripcion,stock,precio,id_categoria)
 VALUES(16,'Remera basica','Remera de algodon',7,14000,10);

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

 --Se mide la inserta mediante procedimientos EXEC
 SET STATISTICS TIME ON;
 SET STATISTICS IO ON;

 EXEC sp_insertar_producto
     @id_producto = 17,
     @nombre = 'Chaleco',
     @descripcion = 'Chaleco tejido a crochet',
     @stock = 9,
     @precio = 18500,
     @id_categoria = 10;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
  
--Se mide y compara la eficencia de las consultas directas y las funciones

--Se mide la suma el stock total por categoria con la consulta directa 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT SUM(precio * stock) AS TotalCategoria
FROM Producto
WHERE id_categoria = 6;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--Se mide la suma el stock total por categoria con la funcion
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT dbo.fn_total_categoria(6) AS TotalCategoria_Funcion;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

/*Resultados de la ejecucion:
INSERCION DIRECTA (INSERT INTO)
 .CPU time = 0ms
 .Elapsed time = 0-14ms
 .Logical reads = 2
 .Physical reads = 0

INSERCION MEDIANTE PROCEDIMIENTO ALMACEMADO
 .CPU time = 0-16ms
 .Elapsed time = 13-16ms
 .Logical reads = 2
 .Physical reads = 0

CONSULTA DIRECTA (SELECT)
 .CPU time = 0
 .Elapsed time = 7ms
 .Logical reads = 2
 .Physical reads = 0
FUNCION ALMACENADA 
 .CPU time = 0ms
 .Elapsed time = 0ms
 .Logical reads = 2
 .Physical reads = 0
*/