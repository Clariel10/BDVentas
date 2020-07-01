create database VENTAS;
drop database VENTAS;
use VENTAS;

--Crear Tablas

create table Productos(
id_producto int identity(1,1) primary key not null,
id_categoria int not null foreign key references Categorias(id_categoria),
id_proveedor int not null foreign key references Proveedores(id_proveedor),
nombre_producto varchar(70),
cantidad int,
costo money,
precio_venta money
);

create table Categorias(
id_categoria int identity (1,1) primary key not null,
nombre_categoria varchar (50),
);

create table Proveedores(
id_proveedor int identity (1,1) primary key not null,
nombre_proveedor varchar (50),
direccion varchar (50),
telefono varchar (30)
);

create table Empleados(
id_empleado int identity (1,1) primary key not null,
id_cargo int not null foreign key references Cargos(id_cargo),
nombre_empleado varchar(50), 
apellido_empleado varchar(50),
usuario varchar (50),
contrasenia varchar (50)
);

create table Cargos (
id_cargo int identity (1,1) primary key not null,
nombre_cargo varchar (30),
sueldo money
);

create table Clientes (
id_cliente int identity (1,1) primary key not null,
nombre_cliente varchar (50),
apellido_cliente varchar (50),
direccion varchar (100),
telefono varchar(30),
dui varchar (50),
nit varchar(20),
nrc varchar (20)
);

create table Ventas (
id_venta int identity (1,1) primary key not null,
id_empleado int not null foreign key references Empleados(id_empleado),
id_cliente int not null foreign key references Clientes(id_cliente),
id_documento int not null foreign key references Tipo_Documentos(id_documento),
total_venta money,
fecha date
);

alter table Detalle_Venta alter column precio decimal(18,2)
alter table Ventas alter column total_venta decimal(18,2)



create table Detalle_Venta (
id_detalle_Venta int identity (1,1) primary key not null,
id_venta int not null foreign key references Ventas(id_venta),
id_producto int not null foreign key references Productos(id_producto),
cantidad int,
precio money,
);

create table Tipo_Documentos (
id_documento int identity (1,1) primary key not null,
tipo_documento varchar (50)
);

create table Compras (
id_compra int identity (1,1) primary key not null,
id_empleado int not null foreign key references Empleados(id_empleado),
total_compra money,
fecha date
);

create table Detalle_Compra (
id_detalle_compra int identity (1,1) primary key not null,
id_compra int not null foreign key references Compras(id_compra),
id_producto int not null foreign key references Productos(id_producto),
id_proveedor int not null foreign key references Proveedores(id_proveedor),
cantidad int,
precio money
);

insert into Tipo_Documentos (tipo_documento) values ('Factura');
insert into Tipo_Documentos (tipo_documento) values ('Tickect');
insert into Categorias (nombre_categoria) values ('Dispositivo');
insert into Proveedores (nombre_proveedor,telefono,direccion) values ('Apple','7647-8446','Sexta avenida Norte, Chalatenango');
insert into Productos (id_categoria,id_proveedor,nombre_producto,cantidad,costo,precio_venta) values (1,1,'Iphone',50,100.00,999.99);
insert into Cargos (nombre_cargo,sueldo) values ('Administrador','$700');
insert into Cargos (nombre_cargo,sueldo) values ('Cajero','$350');
insert into Empleados (id_cargo,nombre_empleado,apellido_empleado,usuario,contrasenia) values (2,'Clariel','Alfaro','master','123');
insert into clientes (nombre_cliente,apellido_cliente,direccion,telefono,dui,nit,nrc) values ('Generico','Generico','-----','-----','-----','-----','-----');
	
select * from Compras
select * from Detalle_Compra


