use TiendaEmprendedores;

/*Tema: Manejo de transacciones y transacciones anidadas.

Consignas: 
--Insertar un registro en alguna tabla, luego otro registro en otra tabla y por último la actualización de uno o más registros en
otra tabla.Actualizar los datos solamente si toda la operación es completada con éxito.

--Sobre el código escrito anteriormente provocar intencionalmente un error luego del insert y verificar que los datos queden 
consistentes(no se debería realizar ningún insert).

--Expresar las conclusiones en base a las pruebas realizadas.




*/
SELECT * FROM Categoria;
SELECT * FROM Producto;
SELECT * FROM Usuarios;
SELECT * FROM Estado;
SELECT * FROM Rol;
SELECT * FROM Pago;
SELECT * FROM FormaPago;
SELECT * FROM EstadoPago;
SELECT * FROM Carrito;
SELECT * FROM ItemCarrito;
SELECT * FROM Factura;
SELECT * FROM DetalleFactura;

-------------------------------------------------------------------------------------------------------------------
--El manejo de transacciones y transacciones anidadas se implementó con el objetivo de garantizar la integridad y consistencia
--de los datos en uno de los procesos más críticos del sistema: la generación de facturas de venta, el registro de sus detalles
--y la actualización del stock de productos. Para ello, se trabajó sobre las tablas Factura, DetalleFactura y Producto.

PRINT '--- PASO 1: Transacción EXITOSA ---';
BEGIN TRAN;

BEGIN TRY
    -- Generar id_factura nuevo 
    DECLARE @idFactura INT;
    SELECT @idFactura = ISNULL(MAX(id_factura),0) + 1
    FROM Factura WITH (UPDLOCK, HOLDLOCK);

    -- 1) Insertar cabecera
    INSERT INTO Factura(id_factura, fecha, Total, id_usuarios)
    VALUES (@idFactura, GETDATE(), 0, 1); 

    -- 2) Insertar detalle (producto 10, cantidad 2, precio)
    DECLARE @idProd INT = 10, @cant INT = 2, @precio FLOAT;
    SELECT @precio = precio FROM Producto WHERE id_producto = @idProd;

    INSERT INTO DetalleFactura(id_producto, id_factura, cantidad, precio_unitario)
    VALUES (@idProd, @idFactura, @cant, @precio);

    -- 3) Validar y descontar stock
    IF (SELECT stock FROM Producto WHERE id_producto = @idProd) < @cant
        THROW 51000, 'Stock insuficiente.', 1;

    UPDATE Producto SET stock = stock - @cant WHERE id_producto = @idProd;

    -- 4) Actualizar total de Factura
    UPDATE f
       SET Total = (SELECT SUM(cantidad * precio_unitario)
                    FROM DetalleFactura WHERE id_factura = @idFactura)
    FROM Factura f WHERE f.id_factura = @idFactura;

    COMMIT TRAN;
    PRINT ' Paso 1 OK';
END TRY
BEGIN CATCH
    ROLLBACK TRAN;
    PRINT 'Paso 1 ERROR';
    PRINT ERROR_MESSAGE();
END CATCH;

-- Verificación
SELECT TOP (1) * FROM Factura ORDER BY id_factura DESC;
SELECT TOP (1) * FROM DetalleFactura ORDER BY id_factura DESC;
SELECT * FROM Producto WHERE id_producto = 10;
-----------------------------------------------------------------------------------------------
PRINT '--- PASO 2: Transacción con ERROR intencional (FK) ---';
BEGIN TRAN;

BEGIN TRY
    DECLARE @idFactura2 INT;
    SELECT @idFactura2 = ISNULL(MAX(id_factura),0) + 1
    FROM Factura WITH (UPDLOCK, HOLDLOCK);

    INSERT INTO Factura(id_factura, fecha, Total, id_usuarios)
    VALUES (@idFactura2, GETDATE(), 0, 1);

    -- Detalle con producto inexistente (9999) 
    INSERT INTO DetalleFactura(id_producto, id_factura, cantidad, precio_unitario)
    VALUES (9999, @idFactura2, 1, 123.45);

    COMMIT TRAN;
    PRINT 'Paso 2 OK';
END TRY
BEGIN CATCH
    ROLLBACK TRAN;
    PRINT 'Paso 2 ROLLBACK ejecutado';
    PRINT ERROR_MESSAGE();
END CATCH;

-- Verificación
SELECT TOP (3) * FROM Factura ORDER BY id_factura DESC;
SELECT TOP (3) * FROM DetalleFactura ORDER BY id_factura DESC;

---------------------------------------------------------------------------
PRINT '--- PASO 3: Transacción con SAVEPOINT (stock) ---';
BEGIN TRAN;

BEGIN TRY
    DECLARE @idFactura3 INT;
    SELECT @idFactura3 = ISNULL(MAX(id_factura),0) + 1
    FROM Factura WITH (UPDLOCK, HOLDLOCK);

    INSERT INTO Factura(id_factura, fecha, Total, id_usuarios)
    VALUES (@idFactura3, GETDATE(), 0, 2);   

    DECLARE @idProd3 INT = 10, @cant3 INT = 60, @precio3 FLOAT;
    SELECT @precio3 = precio FROM Producto WHERE id_producto = @idProd3;

    INSERT INTO DetalleFactura(id_producto, id_factura, cantidad, precio_unitario)
    VALUES (@idProd3, @idFactura3, @cant3, @precio3);

    -- Subtransacción: actualización de stock
    SAVE TRAN SP_Stock;

    IF (SELECT stock FROM Producto WHERE id_producto = @idProd3) < @cant3
    BEGIN
        ROLLBACK TRAN SP_Stock;                 
        THROW 51010, 'Stock insuficiente (SAVEPOINT).', 1; 
    END

    UPDATE Producto SET stock = stock - @cant3 WHERE id_producto = @idProd3;

    UPDATE f
       SET Total = (SELECT SUM(cantidad * precio_unitario)
                    FROM DetalleFactura WHERE id_factura = @idFactura3)
    FROM Factura f WHERE f.id_factura = @idFactura3;

    COMMIT TRAN;
    PRINT 'Paso 3 OK';
END TRY
BEGIN CATCH
    ROLLBACK TRAN;
    PRINT ' Paso 3 ERROR (se revirtió todo)';
    PRINT ERROR_MESSAGE();
END CATCH;

-- Verificación 
SELECT TOP (5) * FROM Factura ORDER BY id_factura DESC;
SELECT TOP (5) * FROM DetalleFactura ORDER BY id_factura DESC;
SELECT * FROM Producto WHERE id_producto IN (9,10);

/*CONCLUSIÓN 
En el primer caso, se ejecutó una transacción completa y exitosa que incluyó la creación de una factura, la inserción de su detalle
y la actualización del stock del producto, evidenciando que todos los cambios se confirman de manera simultánea y consistente.

En el segundo caso, se provocó un error intencional en la clave foránea para comprobar el comportamiento de ROLLBACK, observándose que
el sistema revirtió automáticamente todas las operaciones, sin dejar registros parciales ni inconsistencias.

Finalmente, en el tercer caso, se implementó una transacción anidada mediante un SAVEPOINT, que permitió controlar una etapa crítica del
proceso —la actualización del stock— de forma independiente. Ante cualquier error en esa suboperación, el sistema pudo revertir 
únicamente esa sección sin comprometer la consistencia general de la base.

las pruebas realizadas demuestran que el uso correcto de transacciones, control de errores y puntos de guardado permite mantener las 
propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad), asegurando que el sistema de ventas opere de manera confiable,
segura y libre de errores lógicos o de integridad.
*/