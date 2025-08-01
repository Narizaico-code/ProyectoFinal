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

create table Productos (
    idProducto int primary key auto_increment,
    idProveedor int not null,
    nombreProducto varchar(100) not null,
    descripcion varchar(255),
    precio double not null,
    stock int default 0,
    talla varchar(20),
    color varchar(50),
    marca varchar(100),
    categoria varchar(100),
    imagenURL varchar(255),
    fechaIngreso timestamp default current_timestamp,
    estado enum('activo', 'inactivo') default 'activo',
    
     constraint pk_productos_proveedores foreign key (idProveedor)
		references Proveedores (idProveedor)on delete cascade
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
insert into usuarios (nombre, apellido, correo, contrasena, telefono, fechaNacimiento, rol) values
('Ana', 'Gómez', 'ana.gomez@example.com', 'pass123', '5551112222', '1990-03-15 00:00:00', 'Cliente'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'abc123', '5553334444', '1985-07-22 00:00:00', 'Admin'),
('María', 'Lopez', 'maria.lopez@example.com', 'clave321', '5555556666', '2000-12-01 00:00:00', 'Cliente'),
('Carlos', 'Ramírez', 'carlos.ramirez@example.com', 'qwerty', '5557778888', '1995-10-10 00:00:00', 'Cliente'),
('Lucía', 'Hernández', 'lucia.hernandez@example.com', 'mypassword', '5559990000', '1999-05-05 00:00:00', 'Cliente');


insert into proveedores (nombreProveedor, contactoNombre, telefono, correo, direccion, estado) values
('TechSupplier', 'Pedro Rivas', '50212345678', 'pedro@tech.com', 'Zona 1, Guatemala', 'activo'),
('GamerStore', 'Sandra Díaz', '50287654321', 'sandra@gamer.com', 'Zona 10, Guatemala', 'activo'),
('ElectroMax', 'Juan Alvarado', '50255667788', 'juan@electromax.com', 'Zona 4, Guatemala', 'activo'),
('ProData', 'Karen Pérez', '50233445566', 'karen@prodata.com', 'Zona 15, Guatemala', 'activo'),
('Distribuciones XYZ', 'Luis Mena', '50244556677', 'luis@xyz.com', 'Zona 7, Guatemala', 'activo');


insert into productos (idProveedor, nombreProducto, descripcion, precio, stock, talla, color, marca, categoria, imagenURL, estado) values
(1, 'Teclado Mecánico', 'Teclado RGB con switches azules', 299.99, 20, null, 'Negro', 'HyperX', 'Accesorios', 'img/teclado.jpg', 'activo'),
(2, 'Mouse Gamer', 'Mouse óptico 8000 DPI', 149.99, 35, null, 'Rojo', 'Logitech', 'Accesorios', 'img/mouse.jpg', 'activo'),
(3, 'Monitor 24"', 'Full HD con tasa de 144Hz', 1099.99, 10, null, 'Negro', 'Samsung', 'Pantallas', 'img/monitor.jpg', 'activo'),
(4, 'Audífonos Inalámbricos', 'Bluetooth con cancelación de ruido', 399.99, 25, null, 'Azul', 'Sony', 'Audio', 'img/audifonos.jpg', 'activo'),
(5, 'Laptop Gamer', 'Core i7, RTX 3060, 16GB RAM', 7999.99, 5, null, 'Gris', 'MSI', 'Computadoras', 'img/laptop.jpg', 'activo');


insert into pedidos (idUsuario, fechaPedido, total, metodoPago, estado) values
(1, '2025-07-30', 1499.98, 'Tarjeta Credito', 'Pendiente'),
(2, '2025-07-29', 299.99, 'Efectivo', 'Pagado'),
(3, '2025-07-28', 1099.99, 'Tarjeta Debito', 'Enviado'),
(4, '2025-07-27', 399.99, 'Efectivo', 'Entregado'),
(5, '2025-07-26', 7999.99, 'Tarjeta Credito', 'Cancelado');


INSERT INTO Usuarios (nombre, apellido, correo, contrasena, telefono,fechaNacimiento, rol)
VALUES ('Juan', 'Pérez', 'juan.perez@example.com', '12345678', '5551234567', '2025-07-25 14:33:59', 'Cliente');
INSERT INTO Productos (idProveedor,nombreProducto, descripcion, precio, stock, talla, color, marca, categoria, imagenURL) 
VALUES 
(1,'Camisa Elegante', 'Camisa de algodón con diseño moderno para eventos formales.', 45.99, 50, 'M', 'Blanco', 'Elegancia Moda', 'Camisas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ItVG6L4PtaPdboK3AwBjDhJtBq5orRzFEg&s'),
(2,'Camisa Básica', 'Camisa básica de uso diario, ligera y cómoda.', 25.99, 100, 'L', 'Azul', 'Comodidad Diaria', 'Camisas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq9E8hTLCj_y-TU2ra4qH0l1M_xLIYVJh9nw&s'),
(3,'Camisa a Cuadros', 'Camisa informal con diseño de cuadros clásicos.', 35.99, 75, 'M', 'Rojo y Negro', 'Estilo Clásico', 'Camisas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyG87o5iaTj1TmfNrRFMOK_tbuF71sIf9yZA&s'),
(4,'Camisa Slim Fit', 'Ajustada al cuerpo para un estilo más moderno.', 40.99, 60, 'S', 'Negro', 'Modern Fit', 'Camisas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhac59qYX4Dy-IHadefeu46NhfIfpfWQ3zgQ&s'),
(5,'Camisa Casual', 'Ideal para salidas informales o trabajo casual.', 30.99, 80, 'L', 'Gris', 'Casual Wear', 'Camisas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxX4qu8NH2_d6Xhi-1M_q8UHrRXt2P_wdqOyYXsMnGviQ9m5vhP01SOjDIcNGaU6TrLXk&usqp=CAU'),
(1,'Pantalón Casual', 'De corte recto, cómodo para el día a día.', 50.99, 40, '32', 'Beige', 'Comodidad Urbana', 'Pantalones', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vvI-4A8gQPVapROMAttP2TnYHIylKdTzzg&s'),
(3,'Pantalón Cargo', 'Con bolsillos laterales, estilo urbano.', 60.99, 30, '34', 'Verde Militar', 'Urban Style', 'Pantalones', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTQGaujhps04jUbPwmngyS7Sj4N4Ci5YxZg&s'),
(1,'Jogger', 'Pantalón deportivo con puños elásticos.', 45.99, 50, 'M', 'Negro', 'Sport Life', 'Pantalones', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRaEzKN6sUJIfIExozLrlu8CM6UA165zKJPg&s'),
(2,'Pantalón de Vestir', 'Para eventos formales y reuniones de trabajo.', 70.99, 20, '36', 'Azul Marino', 'Formal Elegance', 'Pantalones', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5E9hQmEbUcmiU580EbcUtnPWKiCfUaILHvaMN8t0UdSoWvgmcy_kJ7vleehR4KXUgKZc&usqp=CAU'),
(1,'Pantalón Slim', 'Ajustado a las piernas para un look moderno.', 55.99, 35, '30', 'Gris', 'Modern Fit', 'Pantalones', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W8uBxR6a_ikILpQqsCvNCThW9Wx70AWTVw&s'),
(2,'Suéter Básico', 'Suéter de lana ligero y cálido para uso diario.', 50.99, 60, 'M', 'Gris', 'Warm Comfort', 'Suéteres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA4qW08bmbo5s-yVS4KCnbXbAN7bphS5ydXA&s'),
(2,'Suéter Cuello Alto', 'Ideal para invierno y días fríos.', 60.99, 40, 'L', 'Negro', 'Winter Essentials', 'Suéteres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbdRSlszDC0tHY9kLN8N7l7cDGNPPmFfXcNA&s'),
(2,'Suéter con Capucha', 'Diseño casual con estilo deportivo.', 55.99, 50, 'M', 'Azul', 'Sporty Look', 'Suéteres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wSylwr3zwLMv_kcRKgKMK7J3ZckSVgAfSQ&s'),
(2,'Cardigan', 'Abrigo abierto con botones para un look elegante.', 70.99, 30, 'L', 'Marrón', 'Elegant Knits', 'Suéteres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLpPmgcg_JFm7YPMB2Ft_Ulktu16S8KL86xw&s'),
(2,'Suéter Trenzado', 'Textura de punto grueso para mayor abrigo.', 65.99, 25, 'XL', 'Verde', 'Cozy Knits', 'Suéteres', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0vni5V__w7Ik3l6-wETrfhu3tsXIjtU7P9-vtWX8diJt5IbFbqGmsXya3Gk_tyw9r05c&usqp=CAU');

