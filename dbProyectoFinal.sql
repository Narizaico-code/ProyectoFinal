drop database if exists proyecto_final_db;
create database proyecto_final_db;
use proyecto_final_db;

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
