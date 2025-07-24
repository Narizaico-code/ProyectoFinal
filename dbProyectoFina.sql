drop database if exists proyecto_final_db;
create database proyecto_final_db;
use proyecto_final_db;

create table Usuarios (
    idUsuario int auto_increment,
    correo varchar(100) not null unique,
    contrasena varchar(255) not null,
    fecha_registro timestamp default current_timestamp,
    constraint pk_Usuarios primary key (idUsuario)
);

create table Clientes (
    idCliente int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100),
    telefono varchar(20),
    direccion varchar(255),
    id_usuario int,
	constraint fk_Clientes_Usuario foreign key (idCliente)
		references Usuarios (idUsuario) 
);