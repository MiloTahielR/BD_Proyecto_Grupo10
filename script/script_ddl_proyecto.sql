-- SCRIPT TEMA "TIENDA DE EMPRENDEDORES"
-- DEFINNICIÓN DEL MODELO DE DATOS

use TiendaEmprendedores;

CREATE TABLE Rol
(
  id_rol INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT pk_Rol PRIMARY KEY (id_rol),
  CONSTRAINT uk_Rol_descripcion UNIQUE (descripcion)
);
ALTER TABLE Rol
ALTER COLUMN descripcion VARCHAR(100);


CREATE TABLE Estado
(
  id_estado INT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
CONSTRAINT pk_Estado PRIMARY KEY (id_estado),
CONSTRAINT uk_Estado_descripcion UNIQUE (descripcion),
);

CREATE TABLE FormaPago
(
  descripcion VARCHAR(200) NOT NULL,
  id_formaPago INT NOT NULL,
  CONSTRAINT pk_FormaPago PRIMARY KEY (id_formaPago)
);

CREATE TABLE Categoria
(
  id_categoria INT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  CONSTRAINT pk_Categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE EstadoPago
(
  id_estadoPago INT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  CONSTRAINT pk_EstadoPago PRIMARY KEY (id_estadoPago),
  CONSTRAINT uk_EstadoPago_descripcion UNIQUE (descripcion)
);

CREATE TABLE Usuarios
(
  id_usuarios INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  contraseña VARCHAR(200) NOT NULL,
  id_estado INT NOT NULL,
  id_rol INT NOT NULL,
  CONSTRAINT pk_Usuarios PRIMARY KEY (id_usuarios),
  CONSTRAINT fk_Usuarios_Estado FOREIGN KEY (id_estado) REFERENCES Estado(id_estado),
  CONSTRAINT fk_Usuarios_Rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
  CONSTRAINT uk_Usuarios_email UNIQUE (email)
);

CREATE TABLE Producto
(
  id_producto INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  stock INT NOT NULL,
  precio FLOAT NOT NULL,
  id_categoria INT NOT NULL,
  CONSTRAINT pk_Producto PRIMARY KEY (id_producto),
  CONSTRAINT fk_Producto_Categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Factura
(
  id_factura INT NOT NULL,
  fecha DATE NOT NULL,
  Total FLOAT NOT NULL,
  id_usuarios INT NOT NULL,
  CONSTRAINT pk_Factura PRIMARY KEY (id_factura),
  CONSTRAINT fk_Factura_Usuarios FOREIGN KEY (id_usuarios) REFERENCES Usuarios(id_usuarios)
);

CREATE TABLE Carrito
(
  id_carrito INT NOT NULL,
  fecha_creacion DATE NOT NULL,
  id_usuarios INT NOT NULL,
  CONSTRAINT pk_Carrito PRIMARY KEY (id_carrito),
  CONSTRAINT fk_Carrito_Usuarios FOREIGN KEY (id_usuarios) REFERENCES Usuarios(id_usuarios)
);

CREATE TABLE ItemCarrito
(
  cantidad INT NOT NULL,
  precio FLOAT NOT NULL,
  id_producto INT NOT NULL,
  id_carrito INT NOT NULL,
  CONSTRAINT pk_ItemCarrito PRIMARY KEY (id_producto, id_carrito),
  CONSTRAINT fk_ItemCarrito_Producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  CONSTRAINT fk_ItemCarrito_Carrito FOREIGN KEY (id_carrito) REFERENCES Carrito(id_carrito)
);

CREATE TABLE DetalleFactura
(
  cantidad INT NOT NULL,
  precio_unitario FLOAT NOT NULL,
  id_producto INT NOT NULL,
  id_factura INT NOT NULL,
  CONSTRAINT pk_DetalleFactura PRIMARY KEY (id_producto, id_factura),
  CONSTRAINT fk_DetalleFactura_Producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  CONSTRAINT fk_DetalleFactura_Factura FOREIGN KEY (id_factura) REFERENCES Factura(id_factura)
);

CREATE TABLE Pago
(
  id_pago INT NOT NULL,
  fecha DATE NOT NULL,
  montoTotal FLOAT NOT NULL,
  id_factura INT NOT NULL,
  id_formaPago INT NOT NULL,
  id_estadoPago INT NOT NULL,
  CONSTRAINT pk_Pago PRIMARY KEY (id_pago),
  CONSTRAINT fk_Pago_Factura FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
  CONSTRAINT fk_Pago_FormaPago FOREIGN KEY (id_formaPago) REFERENCES FormaPago(id_formaPago),
  CONSTRAINT fk_Pago_EstadoPago FOREIGN KEY (id_estadoPago) REFERENCES EstadoPago(id_estadoPago)
);

