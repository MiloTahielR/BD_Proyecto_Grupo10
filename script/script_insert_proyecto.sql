-- SCRIPT "TIENDA DE EMPRENDEDORES"
-- INSERCIÓN DEL LOTE DE DATOS

USE TiendaEmprendedores;
GO
-------------------------------------------------------
-- 1 Tabla: Rol
-------------------------------------------------------
INSERT INTO Rol (id_rol, descripcion) VALUES
(1, 'Administrador'),
(2, 'Emprendedor'),
(3, 'Cliente'),
(4, 'Cajero'),
(5, 'Supervisor'),
(6, 'Soporte'),
(7, 'Gerente'),
(8, 'Encargado'),
(9, 'Vendedor'),
(10, 'Invitado');
GO

-------------------------------------------------------
-- 2 Tabla: Estado
-------------------------------------------------------
INSERT INTO Estado (id_estado, descripcion) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Suspendido'),
(4, 'Pendiente'),
(5, 'Bloqueado'),
(6, 'Verificado'),
(7, 'Eliminado'),
(8, 'Nuevo'),
(9, 'Revisando'),
(10, 'Archivado');
GO

-------------------------------------------------------
-- 3 Tabla: FormaPago
-------------------------------------------------------
INSERT INTO FormaPago (id_formaPago, descripcion) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta Débito'),
(3, 'Tarjeta Crédito'),
(4, 'Transferencia Bancaria'),
(5, 'Mercado Pago'),
(6, 'Pago Fácil'),
(7, 'Crédito en cuenta'),
(8, 'Cheque'),
(9, 'QR'),
(10, 'Otro');
GO

-------------------------------------------------------
-- 4 Tabla: Categoria
-------------------------------------------------------
INSERT INTO Categoria (id_categoria, descripcion) VALUES
(1, 'Alimentos'),
(2, 'Artesanías'),
(3, 'Bebidas'),
(4, 'Textiles'),
(5, 'Decoración'),
(6, 'Tecnología'),
(7, 'Belleza'),
(8, 'Hogar'),
(9, 'Joyería'),
(10, 'Otros');
GO

-------------------------------------------------------
-- 5 Tabla: EstadoPago
-------------------------------------------------------
INSERT INTO EstadoPago (id_estadoPago, descripcion) VALUES
(1, 'Pendiente'),
(2, 'Aprobado'),
(3, 'Rechazado'),
(4, 'En proceso'),
(5, 'Anulado'),
(6, 'Reembolsado'),
(7, 'Completado'),
(8, 'Devuelto'),
(9, 'Esperando'),
(10, 'Cancelado');
GO

-------------------------------------------------------
-- 6 Tabla: Usuarios
-------------------------------------------------------
INSERT INTO Usuarios (id_usuarios, nombre, email, contraseña, id_estado, id_rol) VALUES
(1, 'Juan Perez', 'juan.perez@gmail.com', 'pass1', 1, 2),
(2, 'Maria Gomez', 'maria.gomez@hotmail.com', 'pass2', 1, 3),
(3, 'Pedro Ruiz', 'pedro.ruiz@yahoo.com', 'pass3', 2, 2),
(4, 'Ana Lopez', 'ana.lopez@gmail.com', 'pass4', 1, 1),
(5, 'Carlos Diaz', 'carlos.diaz@outlook.com', 'pass5', 3, 3),
(6, 'Sofia Torres', 'sofia.torres@gmail.com', 'pass6', 1, 2),
(7, 'Luis Fernández', 'luis.fernandez@yahoo.com', 'pass7', 2, 3),
(8, 'Rosa Medina', 'rosa.medina@hotmail.com', 'pass8', 1, 2),
(9, 'Hernán Castro', 'hernan.castro@gmail.com', 'pass9', 1, 3),
(10, 'Lucía Vargas', 'lucia.vargas@outlook.com', 'pass10', 1, 2);
GO

-------------------------------------------------------
-- 7 Tabla: Producto
-------------------------------------------------------
INSERT INTO Producto (id_producto, nombre, descripcion, stock, precio, id_categoria) VALUES
(1, 'Yerba Orgánica', 'Yerba mate artesanal', 100, 2500, 1),
(2, 'Mermelada de Frutilla', 'Mermelada casera', 80, 1800, 1),
(3, 'Alfajor Artesanal', 'Dulce de leche regional', 60, 900, 1),
(4, 'Mate de Madera', 'Artesanía regional', 40, 3000, 2),
(5, 'Camisa de Lino', 'Ropa ecológica', 30, 7000, 4),
(6, 'Cartera de Cuero', 'Artesanía de cuero local', 25, 12500, 2),
(7, 'Jabón Natural', 'Producto de cosmética artesanal', 200, 600, 7),
(8, 'Vaso Decorativo', 'Hecho a mano en cerámica', 50, 2500, 5),
(9, 'Collar de Plata', 'Joyería artesanal', 15, 15000, 9),
(10, 'Termo de Acero', 'Producto de acero inoxidable', 70, 18000, 6);
GO

-------------------------------------------------------
-- 8 Tabla: Carrito
-------------------------------------------------------
INSERT INTO Carrito (id_carrito, fecha_creacion, id_usuarios) VALUES
(1, '2025-10-01', 2),
(2, '2025-10-02', 5),
(3, '2025-10-03', 7),
(4, '2025-10-04', 9),
(5, '2025-10-05', 1),
(6, '2025-10-06', 3),
(7, '2025-10-07', 8),
(8, '2025-10-08', 4),
(9, '2025-10-09', 6),
(10, '2025-10-10', 10);
GO

-------------------------------------------------------
-- 9 Tabla: ItemCarrito
-------------------------------------------------------
INSERT INTO ItemCarrito (id_producto, id_carrito, cantidad, precio) VALUES
(1, 1, 2, 2500),
(2, 1, 1, 1800),
(3, 2, 3, 900),
(4, 3, 1, 3000),
(5, 4, 2, 7000),
(6, 5, 1, 12500),
(7, 6, 4, 600),
(8, 7, 1, 2500),
(9, 8, 2, 15000),
(10, 9, 1, 18000);
GO

-------------------------------------------------------
-- 10 Tabla: Factura
-------------------------------------------------------
INSERT INTO Factura (id_factura, fecha, Total, id_usuarios) VALUES
(1, '2025-10-01', 6800, 2),
(2, '2025-10-02', 2700, 5),
(3, '2025-10-03', 3000, 7),
(4, '2025-10-04', 14000, 9),
(5, '2025-10-05', 12500, 1),
(6, '2025-10-06', 2400, 3),
(7, '2025-10-07', 2500, 8),
(8, '2025-10-08', 30000, 4),
(9, '2025-10-09', 18000, 6),
(10, '2025-10-10', 900, 10);
GO

-------------------------------------------------------
-- 11 Tabla: DetalleFactura
-------------------------------------------------------
INSERT INTO DetalleFactura (id_producto, id_factura, cantidad, precio_unitario) VALUES
(1, 1, 2, 2500),
(2, 1, 1, 1800),
(3, 2, 3, 900),
(4, 3, 1, 3000),
(5, 4, 2, 7000),
(6, 5, 1, 12500),
(7, 6, 4, 600),
(8, 7, 1, 2500),
(9, 8, 2, 15000),
(10, 9, 1, 18000);
GO

-------------------------------------------------------
-- 12 Tabla: Pago
-------------------------------------------------------
INSERT INTO Pago (id_pago, fecha, montoTotal, id_factura, id_formaPago, id_estadoPago) VALUES
(1, '2025-10-01', 6800, 1, 2, 2),
(2, '2025-10-02', 2700, 2, 1, 1),
(3, '2025-10-03', 3000, 3, 3, 2),
(4, '2025-10-04', 14000, 4, 4, 2),
(5, '2025-10-05', 12500, 5, 5, 1),
(6, '2025-10-06', 2400, 6, 2, 2),
(7, '2025-10-07', 2500, 7, 1, 2),
(8, '2025-10-08', 30000, 8, 3, 3),
(9, '2025-10-09', 18000, 9, 5, 2),
(10, '2025-10-10', 900, 10, 2, 1);
GO

