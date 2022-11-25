
create schema if not exists biblioteca; 
use biblioteca;

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de tablas:

drop table if exists usuarios;
create table if not exists usuarios (
Id_usuario int auto_increment Primary key,
Nombre_usuario varchar(30) not null,
Apellido_paterno varchar(30) not null,
Apellido_materno varchar(30),
Sexo enum ('M', 'F') not null,
DNI int,
Edad int, 
Dirección varchar(60) not null,
Teléfono varchar(25) not null
);

drop table if exists ubicaciones;
create table if not exists ubicaciones (
Código_ubicación varchar(32) Primary key,
Título varchar(100) not null,
Número_ejemplar int
);

drop table if exists editoriales;
create table if not exists editoriales (
Id_editorial int auto_increment Primary key,
Nombre_editorial varchar(50) not null,
Dirección_editorial varchar(100),
Teléfono_editorial varchar(25)
);

drop table if exists autores;
create table if not exists autores (
Id_autor int auto_increment Primary key,
Nombre_autor varchar(32) not null,
Apellido_autor varchar(32) not null
);

drop table if exists idiomas;
create table if not exists idiomas (
Id_idioma int auto_increment Primary key,
Idioma varchar(15) not null
);

drop table if exists libros;
create table if not exists libros (
Id_libro int auto_increment Primary key,
Código_ubicación varchar(32) not null,
Id_editorial int not null,
Id_autor int not null,
Id_idioma int not null,
Género varchar(20), 
Fecha_publicación year,
ISBN varchar(100) not null, 
Estado enum ('Disponible', 'Prestado') not null,
constraint `libros_ubicaciones` foreign key (Código_ubicación) references ubicaciones (Código_ubicación),
constraint `libros_editoriales` foreign key (Id_editorial) references editoriales (Id_editorial),
constraint `libros_autores` foreign key (Id_autor) references autores (Id_autor),
constraint `libros_idiomas` foreign key (Id_idioma) references idiomas (Id_idioma)
);

drop table if exists préstamos;
create table if not exists préstamos (
Número_préstamo int auto_increment Primary key,
Id_usuario int not null,
Id_libro int not null,
Fecha_préstamo date not null,
Fecha_límite date not null, 
Fecha_devolución date,
constraint `préstamos_usuario` foreign key (Id_usuario) references usuarios (Id_usuario),
constraint `préstamos_libros` foreign key (Id_libro) references libros (Id_libro)
);

-- -------------------------//----------------------------------//-----------------------------------------
-- Inserción de datos: 

INSERT INTO `autores` VALUES (1,'Gabriel','Garcia Marquez'),(2,'Arthur','Conan Doyle'),(3,'Dan','Brown'),(4,'John','Boyne'),(5,'Patrick','Suskind'),(6,'Khaled','Hosseini'),(7,'Jackson','Pearce'),(8,'Alejandro','Dumas'),(9,'Tom','Clancy'),(10,'Juan','Ruiz');
INSERT INTO `editoriales` VALUES (1,'Debolsillo','Blvd. Miguel de Cervantes Saavedra 301-piso 1','(55) 3067 8441'),(2,'Alianza editorial','C. de Juan Ignacio Luca de Tena 15','(34) 91 393 88 88'),(3,'Editorial planeta','Cl. 73 #7-60 BogotÃ¡','(57) 6016079997'),(4,'Salamandra','C.C. Aves Maria Calle 75 Sur #43-202 Local 231','(57) 305 4688251'),(5,'Seix Barral','Av. Diagonal  662-664','(34) 93 492 89 01'),(6,'Molino','Avda. Diagonal 189','(34) 932170088'),(7,'Books4pocket','','(34) 932375564'),(8,'Hispanoamerica','Cra. 67b #45 25 BogotÃ¡','(57) 6012216694');
INSERT INTO `idiomas` VALUES (1,'Espanol'),(2,'Ingles'),(3,'Aleman'),(4,'Frances'),(5,'Mandarin');
INSERT INTO `ubicaciones` VALUES ('1','Memoria de mis putas tristes',1),('1.1','Memoria de mis putas tristes',2),('1.2','Memoria de mis putas tristes',3),('10','Cronica de una muerte anunciada',1),('100','El codigo Da Vinci',1),('100.1','El codigo Da Vinci',2),('100.2','El codigo Da Vinci',3),('100.3','El codigo Da Vinci',4),('101','Angeles y demonios',1),('102','Inferno',1),('103','El simbolo perdido',1),('103.1','El simbolo perdido',2),('104','La conspiracion',1),('104.1','La conspiracion',2),('104.2','La conspiracion',3),('105','La fortaleza digital',1),('105.1','La fortaleza digital',2),('106','El conde de Montecristo',1),('106.1','El conde de Montecristo',2),('11','Sherlock Holmes',1),('11.1','Sherlock Holmes',2),('11.2','Sherlock Holmes',3),('160','El nino con el pijama de rayas',1),('161','Cometas en el cielo',1),('161.1','Cometas en el cielo',2),('161.2','Cometas en el cielo',3),('161.3','Cometas en el cielo',4),('161.4','Cometas en el cielo',5),('162','Tres deseos',1),('2','El coronel no tiene quien le escriba',1),('2.1','El coronel no tiene quien le escriba',2),('260','Libro del buen amor',1),('260.1','Libro del buen amor',2),('280','El perfume',1),('280.1','El perfume',2),('3','Noticia de un secuestro',1),('3.1','Noticia de un secuestro',2),('300','La caza de octubre rojo',1),('300.1','La caza de octubre rojo',2),('4','Del amor y otros demonios',1),('4.1','Del amor y otros demonios',2),('4.2','Del amor y otros demonios',3),('5','Ojos de perro azul',1),('6','Relato de un naufrago',1),('6.1','Relato de un naufrago',2),('7','Cien años de soledad',1),('8','El amor en los tiempos del colera',1),('9','La hojarasca',1),('9.1','La hojarasca',2),('9.2','La hojarasca',3);
INSERT INTO `usuarios` VALUES (1,'Jhonatan','Toro','Vasquez','M',1036402696,25,'Calle 15C 82 BB 65','(57) 3044355739'),(2,'Juan','Velez','Ramirez','M',1482666161,14,'Calle 33 Nro 42 B-06','(57) 3205497807'),(3,'Mariana','Cooper','','F',1177345827,28,'Calle 10 No. 41-25','(57) 6042663258'),(4,'Esteban','Henao','Londoño','M',1671610782,27,'Carrera 42B # 33-38','(57) 6042663375'),(5,'Ana','Trujillo','Ceballos','F',1606505540,36,'Calle 19 # 80A-40','(57) 6043455500'),(6,'Valentina','Rios','Mesa','F',1350920903,21,'Carrera 56A No. 51 - 81','(57) 6045132929'),(7,'Camila','Kant','','F',1022635030,25,'Av. El Poblado #5A-113','(57) 6044366949'),(8,'Juana','Martinez','Vega','F',1621327681,22,'Cl. 21 #74-42','(57) 6044487068'),(9,'Julian','Henao','','M',1826392810,48,'Transversal 39 #Cir. 73','(57) 6043207240'),(10,'Marcos','Marin','Toro','M',1275151038,55,'Av. 33 #65c - 48','(57) 3012573135'),(11,'Nestor','Vasquez','Uribe','M',1418301095,61,'Dg. 75B #2a-80','(57) 3216420425'),(12,'Antonio','Velez','Henao','M',1013488819,57,'Cra. 75 #2B Sur -50','(57) 6042564748'),(13,'Victoria','Sierra','','F',1537663577,49,'Cra. 84 #34-36','(57) 6044129988'),(14,'Evelyn','Marin','Torres','F',1055020355,18,'Cl. 2b #81a-460','(57) 6045735180'),(15,'Tomas','Echeverry','Montoya','M',1611604745,33,'Cra. 84b #4G-75','(57) 6045793852');
INSERT INTO `libros` VALUES (1,'1',1,1,1,'Novela',2004,'9788497938464','Prestado'),(2,'1.1',1,1,1,'Novela',2004,'9788497938464','Disponible'),(3,'1.2',1,1,1,'Novela',2004,'9788497938464','Disponible'),(4,'2',1,1,1,'Novela',1961,'9788497592352','Disponible'),(5,'2.1',1,1,1,'Novela',1961,'9788497592352','Disponible'),(6,'3',1,1,1,'Novela',1996,'9788497592628','Prestado'),(7,'3.1',1,1,1,'Novela',1996,'9788497592628','Disponible'),(8,'4',1,1,1,'Novela',1994,'9788497592420','Prestado'),(9,'4.1',1,1,1,'Novela',1994,'9788497592420','Prestado'),(10,'4.2',1,1,1,'Novela',1994,'9788497592420','Prestado'),(11,'5',1,1,1,'Novela',1972,'9788497592376','Disponible'),(12,'6',1,1,1,'Novela',1970,'9788490323762','Prestado'),(13,'6.1',1,1,1,'Novela',1970,'9788490323762','Disponible'),(14,'7',1,1,1,'Novela',1967,'9788497592208','Disponible'),(15,'8',1,1,1,'Novela',1985,'9788497592451','Disponible'),(16,'9',1,1,1,'Novela',1955,'9788497592475','Prestado'),(17,'9.1',1,1,1,'Novela',1955,'9788497592475','Disponible'),(18,'9.2',1,1,1,'Novela',1955,'9788497592475','Disponible'),(19,'10',1,1,1,'Novela',1981,'9788497592437','Disponible'),(20,'260',1,10,1,'Poesia',1923,'9788497590587','Disponible'),(21,'260.1',1,10,1,'Poesia',1923,'9788497590587','Disponible'),(22,'11',2,2,1,'Novela',1958,'9788420665726','Prestado'),(23,'11.1',2,2,1,'Novela',1958,'9788420665726','Prestado'),(24,'11.2',2,2,1,'Novela',1958,'9788420665726','Disponible'),(25,'100',3,3,1,'Accion-Misterio',2003,'9788408096146','Prestado'),(26,'100.1',3,3,1,'Accion-Misterio',2003,'9788408096146','Disponible'),(27,'100.2',3,3,1,'Accion-Misterio',2003,'9788408096146','Prestado'),(28,'100.3',3,3,1,'Accion-Misterio',2003,'9788408096146','Disponible'),(29,'101',3,3,1,'Accion-Misterio',2000,'9788408099970','Prestado'),(30,'102',3,3,1,'Accion-Misterio',2013,'9788408127413','Disponible'),(31,'103',3,3,1,'Accion-Misterio',2009,'9788408097785','Prestado'),(32,'103.1',3,3,1,'Accion-Misterio',2009,'9788408097785','Prestado'),(33,'160',4,4,1,'Ficcion',2006,'9788498380798','Prestado'),(34,'280',5,5,1,'Realismo magico',2007,'9788432216664','Prestado'),(35,'280.1',5,5,1,'Realismo magico',2007,'9788432216664','Prestado'),(36,'161',4,6,1,'Ficcion-Drama',2003,'9788478888856','Prestado'),(37,'161.1',4,6,1,'Ficcion-Drama',2003,'9788478888856','Prestado'),(38,'161.2',4,6,1,'Ficcion-Drama',2003,'9788478888856','Disponible'),(39,'161.3',4,6,1,'Ficcion-Drama',2003,'9788478888856','Disponible'),(40,'161.4',4,6,1,'Ficcion-Drama',2003,'9788478888856','Disponible'),(41,'162',6,7,1,'Fantasia juvenil',2010,'9788427200272','Disponible'),(42,'104',3,3,1,'Accion-Misterio',2001,'9788408099963','Prestado'),(43,'104.1',3,3,1,'Accion-Misterio',2001,'9788408099963','Prestado'),(44,'104.2',3,3,1,'Accion-Misterio',2001,'9788408099963','Prestado'),(45,'105',7,3,1,'Accion-Misterio',1998,'9788492516209','Prestado'),(46,'105.1',7,3,1,'Accion-Misterio',1998,'9788492516209','Disponible'),(47,'106',8,8,1,'Ficcion historica',1970,'9788494277863','Prestado'),(48,'106.1',8,8,1,'Ficcion historica',1970,'9788494277863','Prestado'),(49,'300',1,9,1,'Tecno-thriller',1984,'9788497599283','Disponible'),(50,'300.1',1,9,1,'Tecno-thriller',1984,'9788497599283','Disponible');
INSERT INTO `préstamos` VALUES (1,1,7,'2022-10-03','2022-10-18','2022-10-11'),(2,2,8,'2022-10-03','2022-10-18','2022-10-06'),(3,4,10,'2022-10-03','2022-10-18','2022-10-09'),(4,10,12,'2022-10-03','2022-10-18','2022-10-12'),(5,12,11,'2022-10-05','2022-10-20','2022-10-13'),(6,5,20,'2022-10-05','2022-10-20','2022-10-08'),(7,7,6,'2022-10-05','2022-10-20','2022-10-07'),(8,9,19,'2022-10-06','2022-10-21','2022-10-14'),(9,1,1,'2022-10-15','2022-10-30',NULL),(10,2,6,'2022-10-15','2022-10-30',NULL),(11,3,8,'2022-10-15','2022-10-30',NULL),(12,4,9,'2022-10-15','2022-10-30',NULL),(13,5,10,'2022-10-15','2022-10-30',NULL),(14,6,12,'2022-10-16','2022-10-31',NULL),(15,7,16,'2022-10-16','2022-10-31',NULL),(16,8,22,'2022-10-16','2022-10-31',NULL),(17,9,23,'2022-10-16','2022-10-31',NULL),(18,10,25,'2022-10-16','2022-10-31',NULL),(19,11,27,'2022-10-16','2022-10-31',NULL),(20,12,29,'2022-10-16','2022-10-31',NULL),(21,13,31,'2022-10-16','2022-10-31',NULL),(22,14,32,'2022-10-17','2022-11-01',NULL),(23,15,33,'2022-10-17','2022-11-01',NULL),(24,4,34,'2022-10-17','2022-11-01',NULL),(25,2,35,'2022-10-18','2022-11-02',NULL),(26,1,36,'2022-10-19','2022-11-03',NULL),(27,5,37,'2022-10-19','2022-11-03',NULL),(28,8,42,'2022-10-19','2022-11-03',NULL),(29,2,43,'2022-10-19','2022-11-03',NULL),(30,10,44,'2022-10-20','2022-11-04',NULL),(31,1,45,'2022-10-20','2022-11-04',NULL),(32,7,47,'2022-10-21','2022-11-05',NULL),(33,14,48,'2022-10-21','2022-11-05',NULL);

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de vistas:

create view vw_ubicaciones_libros
as (
 select u.*, l.Estado
 from ubicaciones as u join libros as l
 on u.Código_ubicación = l.Código_ubicación
 );
 
create view vw_libros_prestados
 as (
select * 
from vw_ubicaciones_libros
where Estado = 'Prestado'
 );
 
create view vw_libros_disponibles
 as (
select * 
from vw_ubicaciones_libros
where Estado = 'Disponible'
 );
 
 create or replace view vw_autores_libros
as (
 select distinct u.Título, a.Nombre_autor, a.Apellido_autor
 from libros as l left join ubicaciones as u
 on l.Código_ubicación = u.Código_ubicación
 left join autores as a 
 on l.Id_autor = a.Id_autor
 );
 
  create or replace view vw_libros_editoriales
as (
 select distinct u.Título, e.Nombre_editorial
 from libros as l left join ubicaciones as u
 on l.Código_ubicación = u.Código_ubicación
 left join editoriales as e
 on l.Id_editorial = e.Id_editorial
 );
 
-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de funciones:

drop function if exists fn_cantidad_títulos_por_autor;
delimiter //
create function `fn_cantidad_títulos_por_autor`(p_nombre varchar(32),
									         p_apellido varchar(32))
returns int
deterministic
begin 
	declare Títulos varchar(100);
    set Títulos = (select distinct count(Título)
					from vw_autores_libros
					where Nombre_autor = p_nombre
					and Apellido_autor = p_apellido);
	return Títulos;
    
end //
delimiter ;

drop function if exists fn_cantidad_títulos_por_editorial;
delimiter //
create function `fn_cantidad_títulos_por_editorial`(p_editorial varchar(32))
returns int
deterministic
begin 
	declare Títulos varchar(100);
    set Títulos = (select distinct count(Título)
					from vw_libros_editoriales
					where Nombre_editorial = p_editorial);
	return Títulos;
    
end //
delimiter ;

drop function if exists fn_datos_por_usuario;
delimiter //
create function `fn_datos_por_usuario`(p_identificación varchar(50))
returns varchar(500)
deterministic
begin 
	declare Tel varchar(100);
    declare Dir varchar(100);
    set Tel = (select Teléfono
				from usuarios
				where DNI = p_identificación);
	set Dir = (select Dirección
				from usuarios
				where DNI = p_identificación);
                
	return concat('El teléfono es: ',Tel,' y su dirección es: ', Dir);
    
end //
delimiter ;

-- -------------------------//----------------------------------//-----------------------------------------
-- Invocación de funciones:

select biblioteca.fn_cantidad_títulos_por_autor('Gabriel', 'Garcia Marquez') as Cantidad_títulos;
select biblioteca.fn_cantidad_títulos_por_editorial('Debolsillo') as Cantidad_títulos;
select biblioteca.fn_datos_por_usuario('1036402696') as Datos_personales;

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de procedimientos:

drop procedure if exists sp_ordenar_tabla; -- El procedimiento sirve para ordenar una tabla cualquiera de acuerdo con un parámetro escogido, ya sea de manera ascendente o descendente.
delimiter //
create procedure `sp_ordenar_tabla` (in p_indicador_tabla varchar(50), -- Parámetro para elegir la tabla a ordenar.
								     in p_indicador_orden varchar(32), -- Parámetro para escoger el campo con el que queremos ordenar la tabla. 
								     in p_tipo_orden varchar(32)) -- Parámetro para seleccionar si se ordena de manera ascendete(asc) o descendente(desc).
begin  

set @tabla = concat('select * from ', p_indicador_tabla);
set @campo = concat(' order by ', p_indicador_orden);
set @orden = concat(' ', p_tipo_orden);

set @clausula = concat(@tabla, @campo, @orden);
prepare ejecutar from @clausula;
execute ejecutar;
deallocate prepare ejecutar;

end//
delimiter ;
          
drop procedure if exists sp_insertar_registro; -- El procedimiento sirve para insertar registros en la tabla de usuarios.
delimiter //
create procedure `sp_insertar_registro` (in p_id int,
										 in p_nombre varchar(30),
                                         in p_apellido_paterno varchar(30),
                                         in p_apellido_materno varchar(30),
                                         in p_sexo enum('M','F'),
                                         in p_dni int, 
                                         in p_edad int, 
                                         in p_dirección varchar(60),
                                         in p_teléfono varchar(25))
begin  

insert into `usuarios` (Id_usuario, Nombre_usuario, Apellido_paterno, Apellido_materno, Sexo, DNI, Edad, Dirección, Teléfono) 
values (p_id, p_nombre, p_apellido_paterno, p_apellido_materno, p_sexo, p_dni, p_edad, p_dirección, p_teléfono);

end//
delimiter ;          
          
drop procedure if exists sp_eliminar_registro; -- El procedimiento sirve para eliminar registros en la tabla de usuarios sabiendo previamente su Id de usuario.
delimiter //
create procedure `sp_eliminar_registro` (in p_id int)
begin  

delete 
from `usuarios`
where Id_usuario = p_id;

end//
delimiter ;              

-- -------------------------//----------------------------------//-----------------------------------------
-- Invocación de stored procedures:
          
call biblioteca.sp_ordenar_tabla('ubicaciones', 'Título', 'asc');
call biblioteca.sp_insertar_registro(16, 'Sara', 'Rios', 'Moreno', 'F', 1036403573, 26, 'Cra. 37a #15b - 50', '(57) 3947993314'); select * from usuarios;
call biblioteca.sp_eliminar_registro(16); select * from usuarios;

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de tablas LOG:

drop table if exists log_auditoria_usuarios;
create table if not exists log_auditoria_usuarios (
Id_log int auto_increment primary key,
Nombre_de_acción varchar(12),
Nombre_tabla varchar(50),
Id_usuario int,
Nombre_usuario varchar(30) not null,
Apellido_paterno varchar(30) not null,
Apellido_materno varchar(30),
Sexo enum ('M', 'F') not null,
DNI int,
Edad int, 
Dirección varchar(60) not null,
Teléfono varchar(25) not null,
Responsable varchar(100),
Fecha_movimiento date,
Hora time
);

drop table if exists log_auditoria_préstamos;
create table if not exists log_auditoria_préstamos (
Id_log int auto_increment primary key,
Nombre_de_acción varchar(12),
Nombre_tabla varchar(50),
Número_préstamo int,
Id_usuario int not null,
Id_libro int not null,
Fecha_préstamo date not null,
Fecha_límite date not null, 
Fecha_devolución date,
Responsable varchar(100),
Fecha_movimiento date,
Hora time
);

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de triggers:

drop trigger if exists trg_log_usuarios_delete;
delimiter //
create trigger trg_log_usuarios_delete after delete on biblioteca.usuarios -- Este trigger controlará que los usuarios no sean borrados por error, y en caso de ser eliminados, poder recuperar sus registros.
for each row
begin 

insert into log_auditoria_usuarios (Nombre_de_acción, Nombre_tabla, Id_usuario, Nombre_usuario, Apellido_paterno, Apellido_materno, Sexo, DNI, Edad, Dirección, Teléfono, Responsable, Fecha_movimiento, Hora)
values ('Delete', 'usuarios', old.Id_usuario, old.Nombre_usuario, old.Apellido_paterno, old.Apellido_materno, old.sexo, old.DNI, old.Edad, old.Dirección, old.Teléfono, current_user(), current_date(), current_time());

end//
delimiter ;

drop trigger if exists trg_log_usuarios_update;
delimiter //
create trigger trg_log_usuarios_update before update on biblioteca.usuarios -- Este trigger hará que los registros de los usuarios solo sean alterados cuando posean alguna actualización de datos y proporcionará evidencia de estos.
for each row
begin 

insert into log_auditoria_usuarios (Nombre_de_acción, Nombre_tabla, Id_usuario, Nombre_usuario, Apellido_paterno, Apellido_materno, Sexo, DNI, Edad, Dirección, Teléfono, Responsable, Fecha_movimiento, Hora)
values ('Update', 'usuarios', old.Id_usuario, old.Nombre_usuario, old.Apellido_paterno, old.Apellido_materno, old.sexo, old.DNI, old.Edad, old.Dirección, old.Teléfono, current_user(), current_date(), current_time());

end//
delimiter ;

drop trigger if exists trg_log_préstamos_delete;
delimiter //
create trigger trg_log_préstamos_delete after delete on biblioteca.préstamos -- Este trigger controlará que no se eliminen registros de los préstamos sin consentimiento.
for each row
begin 

insert into log_auditoria_préstamos (Nombre_de_acción, Nombre_tabla, Número_préstamo, Id_usuario, Id_libro, Fecha_préstamo, Fecha_límite, Fecha_devolución, Responsable, Fecha_movimiento, Hora)
values ('Delete', 'préstamos', old.Número_préstamo, old.Id_usuario, old.Id_libro, old.Fecha_préstamo, old.Fecha_límite, old.Fecha_devolución, current_user(), current_date(), current_time());

end//
delimiter ;

drop trigger if exists trg_log_préstamos_update;
delimiter //
create trigger trg_log_préstamos_update before update on biblioteca.préstamos -- Este trigger controlará la actualización del estado de los libros y evitará que sus registros sean alterados sin consentimiento.
for each row
begin 

insert into log_auditoria_préstamos (Nombre_de_acción, Nombre_tabla, Número_préstamo, Id_usuario, Id_libro, Fecha_préstamo, Fecha_límite, Fecha_devolución, Responsable, Fecha_movimiento, Hora)
values ('Delete', 'préstamos', old.Número_préstamo, old.Id_usuario, old.Id_libro, old.Fecha_préstamo, old.Fecha_límite, old.Fecha_devolución, current_user(), current_date(), current_time());

end//
delimiter ;

-- -------------------------//----------------------------------//-----------------------------------------
-- Prueba triggers:

insert into `usuarios` (Id_usuario, Nombre_usuario, Apellido_paterno, Apellido_materno, Sexo, DNI, Edad, Dirección, Teléfono) -- Inserto un nuevo registro para posteriormente actualizarlo, borrarlo al final y capturar sus valores.
values (16, 'Sara', 'Rios', 'Moreno', 'F', 1036403573, 26, 'Cra. 37a #15b - 50', '(57) 3947993314');
update `usuarios` set Dirección = 'No registra' where Id_usuario = 16;
update `usuarios` set Teléfono = 'No registra' where Id_usuario = 16;
delete from `usuarios` where Id_usuario = 16; 
select * from log_auditoria_usuarios;

insert into `préstamos` (Id_usuario, Id_libro, Fecha_préstamo, Fecha_límite, Fecha_devolución) -- Inserto un nuevo registro para posteriormente actualizarlo, borrarlo al final y capturar sus valores.
values (1,7,'2022-10-21','2022-11-05',null);
update `préstamos` set Fecha_devolución = '2022-11-02' where Id_usuario = 34;
delete from `préstamos` where Número_préstamo = 34; 
select * from log_auditoria_préstamos;

-- -------------------------//----------------------------------//-----------------------------------------
-- Creación de usuarios y permisos:

use mysql;

drop user if exists 'administrador@localhost';
create user if not exists 'administrador@localhost' identified by '12345'; -- Se crea un usuario para la persona que estará actualizando los registros de la base de datos de la biblioteca.
grant select, insert, update on biblioteca.autores to 'administrador@localhost'; -- Otorgo permisos para leer, insertar y actualizar registros en las tablas correspondientes al área de desempeño del usuario.
grant select, insert, update on biblioteca.editoriales to 'administrador@localhost';
grant select, insert, update on biblioteca.idiomas to 'administrador@localhost';
grant select, insert, update on biblioteca.libros to 'administrador@localhost';
grant select, insert, update on biblioteca.préstamos to 'administrador@localhost';
grant select, insert, update on biblioteca.ubicaciones to 'administrador@localhost';
grant select, insert, update on biblioteca.usuarios to 'administrador@localhost';
grant select, insert, update on biblioteca.vw_autores_libros to 'administrador@localhost';
grant select, insert, update on biblioteca.vw_libros_disponibles to 'administrador@localhost';
grant select, insert, update on biblioteca.vw_libros_editoriales to 'administrador@localhost';
grant select, insert, update on biblioteca.vw_libros_prestados to 'administrador@localhost';
grant select, insert, update on biblioteca.vw_ubicaciones_libros to 'administrador@localhost';

drop user if exists 'usuario@localhost';
create user if not exists 'usuario@localhost' identified by 'usuario'; -- Se crea un usuario para la personas que estén adentro de la biblioteca puedan hacer consultas de su interés.
grant select on biblioteca.vw_autores_libros to 'usuario@localhost';  -- Otorgo permisos de solo lectura ya que este usuario solo podrá hacer consultas de cierta información.
grant select on biblioteca.vw_libros_disponibles to 'usuario@localhost';
grant select on biblioteca.vw_ubicaciones_libros to 'usuario@localhost';

-- -------------------------//----------------------------------//-----------------------------------------
-- Permisos otorgados:

select * from user; 
show grants for 'administrador@localhost';
show grants for 'usuario@localhost';

-- -------------------------//----------------------------------//-----------------------------------------
-- Control de transacciones: 

use biblioteca;
set @@autocommit = 0;

start transaction;
delete from idiomas where id_idioma = 3; 
delete from idiomas where id_idioma = 4; 
delete from idiomas where id_idioma = 5; 
select * from idiomas; -- Tabla antes del rollback
rollback;
select * from idiomas; -- Tabla después del rollback
-- commit; -- En caso de querer confirmar los cambios

start transaction;
insert into autores (Nombre_autor, Apellido_autor) 
values ('Oscar', 'Wilde');
insert into autores (Nombre_autor, Apellido_autor) 
values ('Franz', 'Kafka');
insert into autores (Nombre_autor, Apellido_autor) 
values ('William', 'Shakespeare');
insert into autores (Nombre_autor, Apellido_autor) 
values ('Charles', 'Dickens');
savepoint sp1;
insert into autores (Nombre_autor, Apellido_autor) 
values ('Virginia', 'Woolf');
insert into autores (Nombre_autor, Apellido_autor) 
values ('Mary', 'Shelley');
insert into autores (Nombre_autor, Apellido_autor) 
values ('Dante', 'Alighieri');
insert into autores (Nombre_autor, Apellido_autor) 
values ('Stephen', 'King');
savepoint sp2;
select * from autores;  -- Tabla antes del rollback al savepoint 1
rollback to sp1; 
select * from autores;  -- Tabla después del rollback al savepoint 1
-- release savepoint sp1; -- Elimino el savepoint de los primeros 4 registros insertados

-- -------------------------//----------------------------------//-----------------------------------------









