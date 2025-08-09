drop database if exists proyecto_final_db;
create database proyecto_final_db;
use proyecto_final_db;

create table Usuarios (
    idUsuario int auto_increment not null,
    nombre varchar (128) not null,
    apellido varchar (128) not null,
    correo varchar(128) not null unique,
    contrasena varchar(255) not null,
    telefono varchar (12) not null,
    genero enum('masculino','femenino','no') default 'no',
    fechaNacimiento timestamp,
    rol enum('Cliente', 'Admin') default 'Cliente',
	estado enum('ACTIVO','SUSPENDIDO'),
    constraint pk_Usuarios primary key (idUsuario)
);

create table Proveedores (
    idProveedor int primary key auto_increment,
    nombreProveedor varchar(100) not null,
    contactoNombre varchar(100),
    telefono varchar(20),
    correo varchar(100),
    direccion varchar(255),
    estado enum('activo', 'inactivo') default 'activo'
);

create table Marcas(
	idMarca int not null auto_increment,
    nombreMarca varchar(255),
    correoMarca varchar(255),
    descripcion varchar(255),
    constraint pk_Marcas primary key (idMarca)
);

create table Categorias(
	idCategoria int not null auto_increment,
    nombreCategoria varchar(255),
    constraint pk_Categorias primary key(idCategoria)
);
 
create table Productos (
    idProducto int primary key auto_increment,
    idProveedor int not null,
    idMarca int not null,
    idCategoria int not null,
    nombreProducto varchar(100) not null,
    descripcion varchar(255),
    precio double not null,
    stock int default 0,
    talla varchar(20),
    color varchar(50),
    imagenURL varchar(255),
    fechaIngreso timestamp default current_timestamp,
    estado enum('activo', 'inactivo') default 'activo',
	constraint pk_productos_proveedores foreign key (idProveedor)
		references Proveedores (idProveedor)on delete cascade,
	constraint fk_Productos_Marcas foreign key (idMarca)
		references Marcas(idMarca) on delete cascade,
	constraint fk_Prodcutos_Categorias foreign key(idCategoria)
		references Categorias(idCategoria) on delete cascade
);

create table Pedidos (
	idPedido int auto_increment not null,
    idUsuario int not null,
    fechaPedido date,
    total decimal (10,2) not null,
    metodoPago ENUM('Efectivo','Tarjeta Credito', 'Tarjeta Debito') default 'Efectivo',
    estado ENUM('Pendiente', 'Pagado','Enviado', 'Entregado', 'Cancelado') default 'Pendiente',
    primary key pk_pedidos (idPedido),
    constraint pk_pedidos_usuarios foreign key (idUsuario)
		references Usuarios (idUsuario) on delete cascade
);

create table Detallepedidos(
	idDetallePedido int auto_increment not null, 
    idPedido int not null, 
    idProducto int not null, 
    talla varchar(64),
    cantidad int not null, 
    precioUnitario double, 
    subTotal double, 
    constraint pk_detallePedido primary key (idDetallePedido), 
    constraint fk_detallePedido_Pedidos foreign key (idPedido) 
		references Pedidos(idPedido)on delete cascade,
	constraint fk_detallePedido_Producto foreign key (idProducto) 
		references Productos(idProducto)on delete cascade
);

create table Envios(
	idEnvio int auto_increment not null, 
    idPedido int not null, 
    direccionEnvio varchar(250), 
    empresaEnvio varchar(250), 
    codigoSeguimiento int, 
    fechaEnvio datetime, 
    fechaEntrega datetime, 
    estado enum('Pendiente','En tránsito','Entregado'), 
    constraint pk_envios primary key(idEnvio),
    constraint fk_envios_Pedidos foreign key (idPedido) 
		references Pedidos (idPedido) on delete cascade
);


-- ------------------------------------------------  TUPLAS DE USUARIOS -------------------------------------------------------------------------
INSERT INTO Usuarios (nombre, apellido, correo, contrasena, telefono,fechaNacimiento, rol, estado)
	VALUES 	('Juan', 'Pérez', 'juan.perez@example.com', '12345678', '5551234567', '2002-07-25 14:33:59', 'Cliente', 'ACTIVO'),
			('Saul', 'Sical', 'saul.sical@gmail.com', '22222222', '5551234568', '2002-06-25 14:33:59', 'Admin', 'ACTIVO'),
            ('Angel', 'Vinasco', 'angel.vinasco@example.com', '33333333', '5551234569', '2002-08-25 14:33:59', 'Cliente', 'ACTIVO'),
            ('Kenny', 'Angel', 'kenny.angel@example.com', '44444444', '5551234570', '2002-06-25 14:33:59', 'Cliente', 'ACTIVO'),
			('Jose', 'Zeta', 'jose.zeta@example.com', '55555555', '5551234571', '2002-09-25 14:33:59', 'Cliente', 'ACTIVO');

 
-- ------------------------------------------------- TUPLAS DE PEDIDOS ------------------------------------------------------------------------
insert into Pedidos (idUsuario, fechaPedido, total, metodoPago, estado) 
	values	(1, '2025-07-30', 1499.98, 'Tarjeta Credito', 'Pendiente'),
			(2, '2025-07-29', 299.99, 'Efectivo', 'Pagado'),
			(3, '2025-07-28', 1099.99, 'Tarjeta Debito', 'Enviado'),
			(4, '2025-07-27', 399.99, 'Efectivo', 'Entregado'),
			(5, '2025-07-26', 7999.99, 'Tarjeta Credito', 'Cancelado');


-- ------------------------------------------------- TUPLAS DE MARCAS -------------------------------------------------------------------------
insert into Marcas (nombreMarca, correoMarca, descripcion)
	values 	('Adidas','adidasrecepcion@gmail.com','Marca de ropa, tenis y mas!!'),
			('Shein','sheinrecepcion@gmail.com','Marca de ropa, tenis y mas!!'),
			('H&M','hymrecepcion@gmail.com','Marca de ropa, tenis y mas!!'),
			('Forever21','foreverrecepcion@gmail.com','Marca de ropa, tenis y mas!!'),
			('Nike','nikerecepcion@gmail.com','Marca de ropa, tenis y mas!!');
 
 
 -- ------------------------------------------------ TUPLAS DE CATEGORIAS -------------------------------------------------------------------------
insert into Categorias (nombreCategoria)
	values	
			('Camisa'),
			('Pantalones'),
			('Sueteres');

 -- ------------------------------------------------ TUPLAS DE PROOVEDORES -------------------------------------------------------------------------
INSERT INTO Proveedores(nombreProveedor, contactoNombre, telefono, correo, direccion, estado)
VALUES ('Distribuidora Textil S.A.','Laura Martínez','50212345678','laura@textiles.com','Zona 1, Ciudad de Guatemala','activo'
);



INSERT INTO Productos (idProveedor, idMarca, idCategoria, nombreProducto, descripcion, precio, stock, talla, color, imagenURL, estado) VALUES
(1, 1, 1, 'Camisa de Hombre #1', 'Camisa Besh', 75.50, 150, 'M', 'Besh', 'https://i.postimg.cc/BvCkYM4m/1.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #2', 'Camisa negra con estampado', 82.00, 125, 'M', 'Negra', 'https://i.postimg.cc/gc75Twbb/2.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #3', 'Camisa Lisa Negra', 95.75, 180, 'M', 'Negra', 'https://i.postimg.cc/3Nzc4qFx/3.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #4', 'Camisa Blanca con Diseño', 88.20, 110, 'S', 'Blanco', 'https://i.postimg.cc/C5R2K0D2/4.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #5', 'Camisa Cafe clara con diseño', 99.00, 175, 'L', 'Cafe', 'https://i.postimg.cc/P5s7dBq6/5.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #6', 'Camisa Besh con diseño', 72.50, 140, 'M', 'Besh', 'https://i.postimg.cc/d0JSyrrr/6.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #7', 'Camisa Gris formal', 85.00, 190, 'S', 'Gris', 'https://i.postimg.cc/2yLHDwNR/7.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #8', 'Camisa Lisa Negra', 91.50, 160, 'L', 'Negra', 'https://i.postimg.cc/W46m0yT1/8.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #9', 'Camisa Negra con estampado', 94.25, 130, 'L', 'Negra', 'https://i.postimg.cc/MKMy9Hq4/9.jpg', 'activo'),
(1, 1, 1, 'Camisa de Hombre #10', 'Camisa Negra com diseño', 78.90, 195, 'L', 'Negra', 'https://i.postimg.cc/m2v7J4rr/10.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #1', 'Camisa Terracota semi-Formal', 87.75, 188, 'S', 'Naranja', 'https://i.postimg.cc/yx90YpQK/26.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #2', 'Camisa Blanca Formal', 90.45, 128, 'M', 'Blanca', 'https://i.postimg.cc/GhFvWNTJ/27.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #3', 'Camisa Formal Verde', 76.50, 172, 'L', 'Verde', 'https://i.postimg.cc/XYxdJC8r/28.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #4', 'Camisa semi-Formal', 81.80, 108, 'XL', 'Celeste', 'https://i.postimg.cc/43dthxLB/29.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #5', 'Camisa Manga LArga', 94.90, 197, 'M', 'Blanca', 'https://i.postimg.cc/YSsFNBTk/30.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #6', 'Camisa Manga larga con diseño ', 73.00, 153, 'L', 'Negra', 'https://i.postimg.cc/C1nqm6V8/31.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #7', 'Camisa Con deseño', 88.10, 168, 'S', 'Blanca', 'https://i.postimg.cc/wMKsPc6G/32.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #8', 'Camisa Formal Azul', 95.50, 138, 'M', 'Azul', 'https://i.postimg.cc/rsStL0sF/33.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #9', 'Camisa Formal', 78.40, 183, 'L', 'Blanca', 'https://i.postimg.cc/7Yk2nVtC/34.jpg', 'activo'),
(1, 1, 1, 'Camisa de Mujer #10', 'Camisa Formal', 82.90, 112, 'XL', 'Verde Oscuro', 'https://i.postimg.cc/y69RR5j4/35.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #1', 'Pantalón Overside', 175.00, 125, '35', 'Celeste', 'https://i.postimg.cc/kgDXQRC6/51.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #2', 'Pantalón Formal', 220.50, 110, '36', 'Negro', 'https://i.postimg.cc/QdPN0NN6/52.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #3', 'Pantalón Besh', 198.75, 140, '37', 'Besh', 'https://i.postimg.cc/zBYzYdgK/53.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #4', 'Pantalón Blanco', 165.90, 105, '38', 'Blanco', 'https://i.postimg.cc/xCG0fKv7/54.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #5', 'Pantalón Overzide', 240.25, 135, '39', 'Negro', 'https://i.postimg.cc/C5mSDS6s/55.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #6', 'Pantalón Overzide', 155.00, 115, '40', 'Celeste', 'https://i.postimg.cc/RCRM2LVJ/56.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #7', 'Pantalón Overzide', 210.10, 145, '41', 'Negro', 'https://i.postimg.cc/fywMJJ5b/57.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #8', 'Pantalón Celeste', 185.30, 120, '35', 'Celeste', 'https://i.postimg.cc/FHfNdtb0/58.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #9', 'Pantalón Negro', 235.60, 150, '36', 'Negro', 'https://i.postimg.cc/SN1mxQ9y/59.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Hombre #10', 'Pantalón', 179.80, 100, '37', 'Celeste', 'https://i.postimg.cc/3wmh1gcR/60.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #1', 'Pantalón de mujer ', 205.00, 130, '36', 'Negro', 'https://i.postimg.cc/kMj0x1gs/76.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #2', 'Pantalón Azul', 162.50, 112, '37', 'Azul', 'https://i.postimg.cc/tCw8csPV/77.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #3', 'Pantalón Celeste', 228.00, 148, '38', 'Celeste', 'https://i.postimg.cc/yNX5WnGF/78.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #4', 'Pantalón Azul', 190.40, 108, '39', 'Azul', 'https://i.postimg.cc/wBdZ6nwq/79.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #5', 'Pantalón de mujer ', 215.80, 142, '40', 'Celeste', 'https://i.postimg.cc/htmNRKbZ/80.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #6', 'Pantalón', 170.00, 122, '41', 'Celeste', 'https://i.postimg.cc/rmfPNsMs/81.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #7', 'Pantalón Azul', 230.90, 138, '35', 'Azul', 'https://i.postimg.cc/C5d6P0xN/82.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #8', 'Pantalón ', 188.60, 102, '36', 'Celeste', 'https://i.postimg.cc/pr7c3S9t/83.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #9', 'Pantalón de mujer', 201.25, 133, '37', 'Celeste', 'https://i.postimg.cc/MKMF1z4Z/84.jpg', 'activo'),
(1, 1, 2, 'Pantalón de Mujer #10', 'Pantalón de muje', 168.30, 117, '38', 'negro', 'https://i.postimg.cc/3JsbBP5X/85.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #1', 'Suéter de mujer', 245.50, 146, 'S', 'Negro', 'https://i.postimg.cc/fyXgnKYt/111.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #2', 'Suéter De rayas', 280.00, 75, 'M', 'Azul', 'https://i.postimg.cc/dDPm2ckD/101.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #3', 'Suéter de rayas', 215.50, 90, 'L', 'Blanco', 'https://i.postimg.cc/XNZRkKB0/102.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #4', 'Suéter de mujer', 320.75, 60, 'XL', 'Blanco', 'https://i.postimg.cc/BZddY82P/103.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #5', 'Suéter Liso', 250.20, 85, 'S', 'Corinto', 'https://i.postimg.cc/XYWtWTHV/104.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #6', 'Suéter Liso', 345.00, 55, 'M', 'Blanco', 'https://i.postimg.cc/BnCknMk2/105.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #7', 'Suéter de Rayas', 205.80, 98, 'L', 'Blanco', 'https://i.postimg.cc/k5XZ6WPz/106.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #8', 'Suéter Liso', 310.15, 65, 'XL', 'Blanco', 'https://i.postimg.cc/HsXFfptZ/107.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #9', 'Suéter MOderno', 270.40, 80, 'S', 'Cafe', 'https://i.postimg.cc/s26Lp1VX/108.jpg', 'activo'),
(1, 1, 3, 'Suéter de Mujer #10', 'Suéter de mujer', 335.60, 52, 'L', 'Gris', 'https://i.postimg.cc/tTsMDyTz/109.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #1', 'Suéter de hombre', 240.90, 93, 'XL', 'Blanco', 'https://i.postimg.cc/wvnbGPRY/110.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #2', 'Suéter con estampado', 300.00, 70, 'M', 'Negro', 'https://i.postimg.cc/X7kQfXLb/126.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #3', 'Suéter de Stich', 225.25, 95, 'L', 'Negro', 'https://i.postimg.cc/nhd2W5NS/127.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #4', 'Suéter con estampado', 318.50, 58, 'S', 'Gris', 'https://i.postimg.cc/xdc5V52f/128.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #5', 'Suéter con estampado', 260.75, 88, 'M', 'Gris', 'https://i.postimg.cc/HLR2YMYQ/129.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #6', 'Suéter con estampado', 340.30, 50, 'L', 'Gris', 'https://i.postimg.cc/4dc1m3yj/130.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #7', 'Suéter con estampado', 210.60, 99, 'XL', 'Gris', 'https://i.postimg.cc/NFwkTwrF/131.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #8', 'Suéter con estampado', 325.90, 62, 'S', 'Gris', 'https://i.postimg.cc/1XccrYpH/132.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #9', 'Suéter con estampado', 295.10, 78, 'M', 'Gris', 'https://i.postimg.cc/G3kQR9Zy/133.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #10', 'Suéter con estampado', 330.45, 57, 'L', 'Gris', 'https://i.postimg.cc/tCpz4pjm/134.jpg', 'activo'),
(1, 1, 3, 'Suéter de Hombre #11', 'Suéter de hombre modelo #11', 230.80, 83, 'XL', 'Gris', 'https://i.postimg.cc/yNgmbNmW/138.jpg', 'activo');
 INSERT INTO Detallepedidos (idPedido, idProducto,talla, cantidad, precioUnitario, subTotal)
VALUES
(1, 1,'XL', 2, 45.99, 91.98),
(1, 6,'L', 1,50.99, 50.99),
(2, 3,'S', 1,35.99, 35.99),
(2, 2,'M', 2,25.99, 51.98),
(3, 5,'XL', 1,30.99, 30.99),
(3, 10,'L', 1,55.99, 55.99),
(4, 13,'L', 1,55.99, 55.99),
(5, 15,'L', 2,65.99, 131.98);
 
 
INSERT INTO Envios (idPedido, direccionEnvio, empresaEnvio, codigoSeguimiento, fechaEnvio, fechaEntrega, estado)
VALUES
(3, 'Calle Real 123, CDMX', 'DHL', 1001001, '2025-07-29 08:00:00', NULL, 'En tránsito'),
(4, 'Av. Reforma 456, Puebla', 'FedEx', 1001002, '2025-07-28 09:00:00', '2025-07-29 16:00:00', 'Entregado'),
(5, 'Cra. 45 #12-34, Bogotá', 'Estafeta', 1001003, '2025-07-27 10:00:00', NULL, 'Pendiente');


select * from Productos;