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
    direccion varchar (255) not null,
    rol enum('Cliente', 'Admin') default 'Cliente',
    constraint pk_Usuarios primary key (idUsuario)
);

create table Clientes (
    idCliente int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) not null unique,
    telefono varchar(20) not null,
    direccion varchar(255) not null,
    idUsuario int not null,
	constraint fk_Clientes_Usuario foreign key (idCliente)
		references Usuarios (idUsuario) 
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
    nombreProducto varchar(100) not null,
    descripcion varchar(255),
    precio double not null,
    stock int default 0,
    talla varchar(20),
    color varchar(50),
    marca varchar(100),
    categoria varchar(100),
    imagenURL varchar(255),
    estado enum('activo', 'inactivo') default 'activo'
);

create table CarritoDetalles (
	idDetalleCarrito int auto_increment not null,
    idCliente int not null,
    idProducto int not null,
    estado enum('Activo', 'Procesado'),
    cantidad int not null,
    precioUnitario decimal (10,2),
    subTotal decimal (10,2),
    primary key pk_carrito_detalles (idCarrito),
    constraint fk_carrito_detalles_clientes foreign key (idCliente)
		references Clientes (idCliente),
	constraint fk_carrito_detalles_productos foreign key (idProducto)
		references Productos (idProducto)
);

create table Pedidos (
	idPedido int auto_increment not null,
    idCliente int not null,
    fechaPedido date,
    total decimal (10,2) not null,
    metodoPago ENUM('Efectivo','Tarjeta Credito', 'Tarjeta Debito') default 'Efectivo',
    estado ENUM('Pendiente', 'Pagado','Enviado', 'Entregado', 'Cancelado') default 'Pendiente',
    primary key pk_pedidos (idPedido),
    constraint pk_pedidos_clientes foreign key (idCliente)
		references Clientes (idCliente)
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
		references Pedidos(idPedido),
	constraint fk_detallePedido_Producto foreign key (idProducto) 
		references Productos(idProducto)
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
		references Pedidos (idPedido)
);

create table CarritoDetalles (
	idDetalleCarrito int auto_increment not null,
    idCliente int not null,
    idProducto int not null,
    estado enum('Activo', 'Procesado') default 'Procesando',
    cantidad int not null,
    precioUnitario decimal(10,2) not null,
    constraint pk_CarritoDetalles primary key (idDetalleCarrito)
);

-- Procesos almacenados de Usuarios
delimiter $$
create procedure sp_listarUsuarios()
	begin
		select 
			U.idUsuario, 
			U.nombre, 
			U.apellido, 
			U.correo, 
			U.contrasena, 
			U.telefono, 
			U.direccion, 
			U.rol
		from Usuarios U;
	end$$
delimiter ;
call sp_listarUsuarios();

delimiter $$
create procedure sp_agregarUsuario(
    in p_nombre varchar(128),
    in p_apellido varchar(128),
    in p_correo varchar(128),
    in p_contrasena varchar(255),
    in p_telefono varchar(12),
    in p_direccion varchar(255),
    in p_rol enum('Cliente', 'Admin'))
		begin
			insert into Usuarios(nombre, apellido, correo, contrasena, telefono, direccion, rol)
			values (p_nombre, p_apellido, p_correo, p_contrasena, p_telefono, p_direccion, p_rol);
		end
$$delimiter ;

delimiter $$
-- 3. Actualizar Usuario
create procedure sp_actualizarUsuario(
    in p_idUsuario int,
    in p_nombre varchar(128),
    in p_apellido varchar(128),
    in p_correo varchar(128),
    in p_contrasena varchar(255),
    in p_telefono varchar(12),
    in p_direccion varchar(255),
    in p_rol enum('Cliente', 'Admin')
)
begin
    update Usuarios
    set nombre = p_nombre,
        apellido = p_apellido,
        correo = p_correo,
        contrasena = p_contrasena,
        telefono = p_telefono,
        direccion = p_direccion,
        rol = p_rol
    where idUsuario = p_idUsuario;
end$$
delimiter ;

delimiter $$
-- 4. Eliminar Usuario
create procedure sp_eliminarUsuario(
    in p_idUsuario int)
	begin
		delete from Usuarios where idUsuario = p_idUsuario;
	end$$
delimiter ;

delimiter //
create procedure sp_buscarUsuario(
	in p_idUsuario int)
	begin
		select * from Clientes where idUsuario = p_idUsuario;
    end
//delimiter ;
    
-- procesos almacenados de Cliente
delimiter //
create procedure sp_agregarCliente(
	in p_nombre varchar(100),
    in p_correo varchar(100),
    in p_telefono varchar(20),
    in p_direccion varchar(255),
    in p_idUsario int)
	begin
		insert into Clientes(nombre, email, telefono, direccion,idUsuario)
			values (p_nombre, p_correo, p_telefono, p_direccion, p_idUsario);
    end
//delimiter ;
call sp_agregarCliente();

-- listarCliente
delimiter //
create procedure sp_listarCliente()
	begin
		select 
			C.idCliente, 
			C.nombre, 
			C.email, 
			C.telefono, 
			C.direccion, 
			C.idUsuario
        From Clientes C;
    end
//delimiter ;
call sp_listarCliente();

-- EliminarCliente
delimiter //
create procedure sp_eliminarCliente(
	in p_idCliente int)
	begin
		delete from Clientes where idCliente = p_idCliente;
    end
//delimiter ;

-- buscarCliente 
delimiter //
create procedure sp_buscarCliente(
	in p_idCliente int)
	begin
		select * from Cliente where idCliente = p_idCliente;
    end
//delimiter ;

-- actualizarCliente
delimiter //
create procedure sp_actualizarCliente(
    in p_idCliente int,
    in p_nombre varchar(100),
    in p_correo varchar(100),
    in p_telefono varchar(20),
    in p_direccion varchar(255),
    in p_idUsuario int)
	begin
		update Clientes
		set nombre = p_nombre,
			correo = p_correo,
			telefono = p_telefono,
			direccion = p_direccion,
			idUsuario = p_idUsuario,
		where idCliente = p_idCliente;
	end
$$delimiter ;
desc Clientes;

-- Procesos almacenados para pedidos
delimiter $$
-- 1. Listar Pedidos
create procedure sp_ListarPedidos()
begin
    select * from Pedidos;
end$$
delimiter ;

delimiter $$
-- 2. Agregar Pedido
create procedure sp_AgregarPedido(
    in p_idCliente int,
    in p_fechaPedido date,
    in p_total decimal(10,2),
    in p_metodoPago enum('Efectivo','Tarjeta Credito', 'Tarjeta Debito'),
    in p_estado enum('Pendiente', 'Pagado','Enviado', 'Entregado', 'Cancelado')
)
begin
    insert into Pedidos(idCliente, fechaPedido, total, metodoPago, estado)
    values (p_idCliente, p_fechaPedido, p_total, p_metodoPago, p_estado);
end$$
delimiter ;

delimiter $$
-- 3. Actualizar Pedido
create procedure sp_ActualizarPedido(
    in p_idPedido int,
    in p_idCliente int,
    in p_fechaPedido date,
    in p_total decimal(10,2),
    in p_metodoPago enum('Efectivo','Tarjeta Credito', 'Tarjeta Debito'),
    in p_estado enum('Pendiente', 'Pagado','Enviado', 'Entregado', 'Cancelado')
)
begin
    update Pedidos
    set idCliente = p_idCliente,
        fechaPedido = p_fechaPedido,
        total = p_total,
        metodoPago = p_metodoPago,
        estado = p_estado
    where idPedido = p_idPedido;
end$$
delimiter ;

delimiter $$
-- 4. Eliminar Pedido
create procedure sp_EliminarPedido(in p_idPedido int)
begin
    delete from Pedidos where idPedido = p_idPedido;
end$$
delimiter ;



-- Procesos para Proveedores
delimiter $$
-- Listar Proveedores
create procedure sp_ListarProveedores()
begin
    select * from Proveedores;
end $$

-- Agregar Proveedor
create procedure sp_AgregarProveedor(
    in p_nombreProveedor varchar(100),
    in p_contactoNombre varchar(100),
    in p_telefono varchar(20),
    in p_correo varchar(100),
    in p_direccion varchar(255),
    in p_estado enum('activo', 'inactivo')
)
begin
    insert into Proveedores(nombreProveedor, contactoNombre, telefono, correo, direccion, estado)
    values (p_nombreProveedor, p_contactoNombre, p_telefono, p_correo, p_direccion, p_estado);
end $$

-- Editar Proveedor
create procedure sp_ActualizarProveedor(
    in p_idProveedor int,
    in p_nombreProveedor varchar(100),
    in p_contactoNombre varchar(100),
    in p_telefono varchar(20),
    in p_correo varchar(100),
    in p_direccion varchar(255),
    in p_estado enum('activo', 'inactivo')
)
begin
    update Proveedores
    set nombreProveedor = p_nombreProveedor,
        contactoNombre = p_contactoNombre,
        telefono = p_telefono,
        correo = p_correo,
        direccion = p_direccion,
        estado = p_estado
    where idProveedor = p_idProveedor;
end $$

-- Eliminar Proveedor
create procedure sp_EliminarProveedor(
    in p_idProveedor int
)
begin
    delete from Proveedores where idProveedor = p_idProveedor;
end $$

delimiter ;

delimiter $$

-- Listar Productos
create procedure sp_ListarProductos()
begin
    select * from Productos;
end $$

-- Agregar Producto
create procedure sp_AgregarProducto(
    in p_nombreProducto varchar(100),
    in p_descripcion varchar(255),
    in p_precio double,
    in p_stock int,
    in p_talla varchar(20),
    in p_color varchar(50),
    in p_marca varchar(100),
    in p_categoria varchar(100),
    in p_imagenURL varchar(255),
    in p_estado enum('activo', 'inactivo')
)
begin
    insert into Productos(
        nombreProducto, descripcion, precio, stock, talla, color,
        marca, categoria, imagenURL, estado
    )
    values (
        p_nombreProducto, p_descripcion, p_precio, p_stock, p_talla, p_color,
        p_marca, p_categoria, p_imagenURL, p_estado
    );
end $$

-- Editar Producto
create procedure sp_ActualizarProducto(
    in p_idProducto int,
    in p_nombreProducto varchar(100),
    in p_descripcion varchar(255),
    in p_precio double,
    in p_stock int,
    in p_talla varchar(20),
    in p_color varchar(50),
    in p_marca varchar(100),
    in p_categoria varchar(100),
    in p_imagenURL varchar(255),
    in p_estado enum('activo', 'inactivo')
)
begin
    update Productos
    set nombreProducto = p_nombreProducto,
        descripcion = p_descripcion,
        precio = p_precio,
        stock = p_stock,
        talla = p_talla,
        color = p_color,
        marca = p_marca,
        categoria = p_categoria,
        imagenURL = p_imagenURL,
        estado = p_estado
    where idProducto = p_idProducto;
end $$

-- Eliminar Producto
create procedure sp_EliminarProducto(
    in p_idProducto int
)
begin
    delete from Productos where idProducto = p_idProducto;
end $$

delimiter ;

delimiter $$
-- 1. Listar CarritoDetalles
create procedure sp_ListarCarritoDetalles()
begin
    select * from CarritoDetalles;
end$$
delimiter ;

delimiter $$
-- 2. Agregar CarritoDetalle (subTotal se calcula dentro)
create procedure sp_AgregarCarritoDetalle(
    in p_idCliente int,
    in p_idProducto int,
    in p_estado enum('Activo', 'Procesado'),
    in p_cantidad int,
    in p_precioUnitario decimal(10,2)
)
begin
    insert into CarritoDetalles(idCliente, idProducto, estado, cantidad, precioUnitario, subTotal)
    values (
        p_idCliente,
        p_idProducto,
        p_estado,
        p_cantidad,
        p_precioUnitario,
        p_cantidad * p_precioUnitario
    );
end$$
delimiter ;

delimiter $$
-- 3. Actualizar CarritoDetalle (subTotal también se recalcula)
create procedure sp_ActualizarCarritoDetalle(
    in p_idDetalleCarrito int,
    in p_idCliente int,
    in p_idProducto int,
    in p_estado enum('Activo', 'Procesado'),
    in p_cantidad int,
    in p_precioUnitario decimal(10,2)
)
begin
    update CarritoDetalles
    set idCliente = p_idCliente,
        idProducto = p_idProducto,
        estado = p_estado,
        cantidad = p_cantidad,
        precioUnitario = p_precioUnitario,
        subTotal = p_cantidad * p_precioUnitario
    where idDetalleCarrito = p_idDetalleCarrito;
end$$
delimiter ;

delimiter $$
-- 4. Eliminar CarritoDetalle
create procedure sp_EliminarCarritoDetalle(
    in p_idDetalleCarrito int
)
begin
    delete from CarritoDetalles where idDetalleCarrito = p_idDetalleCarrito;
end$$
delimiter ;