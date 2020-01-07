drop database if exists MundoTech;
create database MundoTech;  
use MundoTech;
create table pais (
	id_pais int(3) auto_increment,
	Nombre nvarchar(40),
	Nombre_com nvarchar(50),
    lat float(10,6) not null,
	lon float(10,6) not null,
	Bandera nvarchar(25),
	Escudo nvarchar(25),
	himno nvarchar(25),
	Capital nvarchar(60),
	Gentilicio nvarchar(40),
	Superficie int(10),
	Agua float(2),
	Punto_Alto nvarchar(50),
	Habitantes int(13),
	Moneda nvarchar(40),
    
	PRIMARY KEY (id_pais)
);
create table tipo (
	id_tipo int(1) auto_increment,
	tipo nvarchar(50),
	decripcion nvarchar(200),
	PRIMARY KEY (id_tipo)
);
create table fecha (
	id_fecha int(1) auto_increment,
	id_pais int(3),
	id_tipo int(1),
	fecha date,
	PRIMARY KEY (id_fecha),
	FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE CASCADE,
	FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo) ON DELETE CASCADE
);

create table lema (
	id_lema int(3) auto_increment,
	id_pais int(3),
	lema nvarchar(60),
	PRIMARY KEY (id_lema),
	FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE CASCADE
);
create table idioma (
	id_idioma int(3) auto_increment,
	id_pais int(3),
	idioma nvarchar(40),
	PRIMARY KEY (id_idioma),
	FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE CASCADE
);
create table sabiasQue (
	id_sabiasQue int(3) auto_increment,
	id_pais int(3),
	sabiasQue nvarchar(150),
	PRIMARY KEY (id_sabiasQue),
	FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE CASCADE
);
insert into pais (Nombre, Nombre_com, Bandera, Escudo, Capital, Gentilicio, Superficie, Agua, Punto_Alto, habitantes, moneda, himno, lat, lon)
	values(
		'México','Estados Unidos Mexicanos','IMG/BANDERAS/id1.jpg','IMG/ESCUDOS/id1.jpg','Ciudad de México','Mexicano','1964375','2.50','Citlaltépetl, 5 610','119530753','Peso (MXN)','SND/HIMNOS/id1.mp3', '23.329549','-102.422788'
	),
	(
		'Madagascar','República de Madagascar','IMG/BANDERAS/id2.jpg','IMG/ESCUDOS/id2.jpg','Antananarivo','Malgache','587041','0.90','Maromokotro, 2 876','22446000','Ariary (MGA)','SND/HIMNOS/id2.mp3', -21.100919, 46.580753
	),
	(
		'Estados Unidos','Estados Unidos de América','IMG/BANDERAS/id3.jpg','IMG/ESCUDOS/id3.jpg','Washington D.C.','Estadounidense','9371174','2.20','Denali, 6 168','316017000','Dólar estadounidense (USD)','SND/HIMNOS/id3.mp3', 40.479483, -101.349530
	),
	(
		'Italia','República Italiana','IMG/BANDERAS/id4.jpg','IMG/ESCUDOS/id4.jpg','Roma','Italiano','301338','2.40','Mont Blanc, 4 810','60782892','Euro (EUR),','SND/HIMNOS/id4.mp3', 43.192030, 12.016169
	),
	(
		'China','República Popular de China','IMG/BANDERAS/id5.jpg','IMG/ESCUDOS/id5.jpg','Pekín','Chino','9596961','2.80','Monte Everest, 8 848','1369811000','Renminbi (CNY)','SND/HIMNOS/id5.mp3', 35.925683, 103.519234
	),
	(
		'Rusia','Federación de Rusia','IMG/BANDERAS/id6.jpg','IMG/ESCUDOS/id6.jpg','Moscú','Ruso','17125246','0.50','Monte Elbrús, 5 642','142020031','Rublo Ruso (RUB)','SND/HIMNOS/id6.mp3', 62.020788, 93.493172
	),
	(
		'Haití','República de Haití','IMG/BANDERAS/id7.jpg','IMG/ESCUDOS/id7.jpg','Puerto príncipe','Haitiano','27750','0.70','Pico de Selle, 2 680','10033000','Gourde haitiano (HGT)','SND/HIMNOS/id7.mp3', 19.161104, -72.349516
	),
	(
		'Indonesia','República de Indonesia','IMG/BANDERAS/id8.jpg','IMG/ESCUDOS/id8.jpg','Yakarta','Indonesio','1919449','4.85','Jaya, 4 884','259556393','Rupia Indonesia (IDR)','SND/HIMNOS/id8.mp3', -2.212367, 114.652068
	),
	(
		'India','República de India','IMG/BANDERAS/id9.jpg','IMG/ESCUDOS/id9.jpg','Nueva Delhi','Indio','3287595','9.50','Kanchenjunga, 8 586','1210193422','Rupia India (INR)','SND/HIMNOS/id9.mp3', 22.697607, 79.256094
	),
	(
		'Libia','Estado de Libia','IMG/BANDERAS/id10.jpg','IMG/ESCUDOS/id10.jpg','Trípoli','Libio','1759541','0.01','Bikku Bitti, 2 267','5670688','Dinar Libio (LYD)','SND/HIMNOS/id10.mp3', 27.315638, 17.381396
	),
	(
		'Malta','República de Malta','IMG/BANDERAS/id11.jpg','IMG/ESCUDOS/id11.jpg','La Valeta','Maltés','316','0.01','TaDmejrek, 253','423282','Euro (EUR)','SND/HIMNOS/id11.mp3', 35.925316, 14.402224
	),
	(
		'Níger','República de Níger','IMG/BANDERAS/id12.jpg','IMG/ESCUDOS/id12.jpg','Niamey','Nigerino','1267000','0.01','Monte Idoukal-n-Taghès, 2 022','17493000','Franco CFA de África Occidental (XOF)','SND/HIMNOS/id12.mp3', 17.016186, 9.149805
	),
	(
		'Papúa Nueva Guinea','Estado Independiente de Papúa Nueva Guinea','IMG/BANDERAS/id13.jpg','IMG/ESCUDOS/id13.jpg','Puerto Moresby','Papú','462840','2.00','Monte Wilhelm, 4 509','7463577','Kina (PKG)','SND/HIMNOS/id13.mp3', -6.681953, 146.908797
	),
	(
		'Ciudad del Vaticano','Estado de la Ciudad del Vaticano','IMG/BANDERAS/id14.jpg','IMG/ESCUDOS/id14.jpg','Ciudad del Vaticano','Vaticano','0.44','0.00','Colina Vaticana, 75','932','Euro (EUR)','SND/HIMNOS/id14.mp3', 41.903449, 12.453392
	),
	(
		'Kazajistán','República de Kazajistán','IMG/BANDERAS/id15.jpg','IMG/ESCUDOS/id15.jpg','Astaná','Kazajo','2724900','1.70','Khan Tengri, 7 010','18310000','Tenge (KZT)','SND/HIMNOS/id15.mp3', 47.992246, 67.169154
	),
	(
		'Chipre','República de Chipre','IMG/BANDERAS/id16.jpg','IMG/ESCUDOS/id16.jpg','Nicosia','Chipriota','9250','0.01','Monte Olimpo, 1 952','1116564','Euro (EUR)','SND/HIMNOS/id16.mp3', 35.002143, 33.129193
	),
	(
		'Islandia','Islandia','IMG/BANDERAS/id17.jpg','IMG/ESCUDOS/id17.jpg','Reikiavik','Islandés','103125','2.75','Hvannadalshnjúkur , 2 110','330610','Corona Islandesa (ISK)','SND/HIMNOS/id17.mp3', 64.874210, -18.605178
	),
	(
		'Estonia','República de Estonia','IMG/BANDERAS/id18.jpg','IMG/ESCUDOS/id18.jpg','Tallin','Estonio','45226','4.56','Suur Munamägi, 318','1287000','Euro (EUR)','SND/HIMNOS/id18.mp3', 58.779372, 25.711177
	),
	(
		'Nauru','República de Nauru','IMG/BANDERAS/id19.jpg','IMG/ESCUDOS/id19.jpg','Yaren','Nauruano','21.3','0.01','Command Ridge, 71','11218','Dólar Australiano (AUD)','SND/HIMNOS/id19.mp3', -0.525496, 166.930290
	),
	(
		'Colombia','República de Colombia','IMG/BANDERAS/id20.jpg','IMG/ESCUDOS/id20.jpg','Bogóta','Colombiano','1141748','8.80','Pico Cristóbal Colón, 5780','48747632','Peso Colombiano (COP)','SND/HIMNOS/id20.mp3', 3.626217, -73.327333
	);
insert into tipo (tipo, decripcion)
	values(
		'Independencia','Formacion de un pais mediante la separacion de otro'
	),
	(
		'Independencia perdida','Cuando un país es reconquistado y puesto nuevamente bajo la forma de gobierno por el país del que se separo'
	),
	(
		'Independencia redeclarada','Reormacion de un pais mediante la separacion de otro'
	),
	(
		'Fundacion','Es el proseso por el cual se establece un nuevo pais'
	),
	(
		'República','Sistema politico que se fundamenta en la igualdad ante la ley, donde se elige quien gobernara mediante el voto'
	),
	(
		'Estado','Forma de organización politica conformada por un conjunto de instituciónes que tienen el poder'
	),
	(
		'Federación','Sistema politico republicano y excepcionalmente monárquico'
	),
	(
		'RSFSR','República Socialista Federativa  Soviética de Rusia'
	),
	(
		'URSS','Unión de Repúblicas Socialistas Soviéticas'
	),
	(
		'Imperio','Un estado que consiguio parte de su territorio por medio de conquistas y mantiene una expanción constante'
	);
select * from pais;
insert into fecha (id_pais, id_tipo, fecha)
	values(
		'1','1','1821-06-27'
	),
	(
		'2','1','1960-06-26'
	),
	(
		'3','1','1776-07-4'
	),
	(
		'4','2','1815-01-1'
	),
	(
		'5','3','1912-01-1'
	),
	(
		'6','10','1721-10-22'
	),
	(
		'6','8','1917-11-7'
	),
	(
		'6','9','1922-12-10'
	),
	(
		'6','7','1991-12-24'
	),
	(
		'7','1','1804-01-1'
	),
	(
		'7','1','1934-01-1'
	),
	(
		'8','1','1945-08-17'
	),
	(
		'9','1','1947-08-15'
	),
	(
		'10','1','1951-12-24'
	),
	(
		'11','1','1964-09-21'
	),
	(
		'12','1','1960-08-3'
	),
	(
		'13','1','1973-12-1'
	),
	(
		'14','1','1929-02-11'
	),
	(
		'15','1','1991-12-16'
	),
	(
		'16','1','1960-08-16'
	),
	(
		'17','1','1918-12-11'
	),
	(
		'18','1','1918-02-24'
	),
	(
		'18','2','1940-06-16'
	),
	(
		'18','3','1991-08-20'
	),
	(
		'19','1','1968-01-31'
	),
	(
		'20','1','1810-06-20'
	);
insert into idioma (id_pais, idioma)
	values(
		'1','Español'
	),
	(
		'2','Malgache'
	),
	(
		'2','Francés'
	),
	(
		'3','Ingles'
	),
	(
		'4','Italiano'
	),
	(
		'5','Chino mandarín'
	),
	(
		'6','Ruso'
	),
	(
		'7','Frances'
	),
	(
		'8','Indonesio'
	),
	(
		'9','Hindi'
	),
	(
		'9','Ingles'
	),
	(
		'10','Árabe'
	),
	(
		'10','Bereber'
	),
	(
		'11','Maltés'
	),
	(
		'11','Ingles'
	),
	(
		'12','Francés'
	),
	(
		'13','Ingles'
	),
	(
		'13','Tok pisin'
	),
	(
		'13','Hiri Motu'
	),
	(
		'14','Latín'
	),
	(
		'14','Italiano'
	),
	(
		'15','Kazajo'
	),
	(
		'15','Ruso'
	),
	(
		'16','Griego'
	),
	(
		'16','Turco'
	),
	(
		'17','Islandés'
	),
	(
		'18','Estonio'
	),
	(
		'19','Ingles'
	),
	(
		'19','Nauruano'
	),
	(
		'20','Español'
	);
insert into sabiasQue (id_pais, sabiasQue)
	values(
		'1','México celebra el grito de independencia el 15 de septimbre ya que es el cumpleaños de Porfirio Díaz'
	);
insert into lema (id_pais, lema)
	values(
		'2','Patria, Libertad, Progreso'
	),
	(
		'3','En Dios confiamos'
	),
	(
		'7','La unión hace la fuerza'
	),
	(
		'8','Unidad en la diversidad'
	),
	(
		'9','La verdad solo triunfa'
	),
	(
		'13','Unidad en la diversidad'
	);
    
    show tables;
    

create table Usuarios(
	gametag nvarchar(30),
    id int(5),
	nombre nvarchar(50),
	paterno nvarchar(20),
	contra nvarchar(30),
     email nvarchar(100),
     imagen nvarchar(500) default 'default.jpg',
     nivel int,
     activado int(1) default 0,
	PRIMARY KEY (gametag)
);

    
    select * from usuarios;

create table Score_Game1(
	id_Score_Game1 int(4),
	gametag nvarchar(30),
	Score int(4),
	PRIMARY KEY (id_Score_Game1),
	FOREIGN KEY (gametag) REFERENCES Usuarios(gametag)
);
create table Score_Game2(
	id_Score_Game2 int(4),
	Gametag nvarchar(30),
	Score int(4),
	PRIMARY KEY (id_Score_Game2),
	FOREIGN KEY (Gametag) REFERENCES Usuarios(Gametag)
);

create table grupo(
	idgrupo int(4) auto_increment,
    Nomnbre nvarchar(20),
    Propietario nvarchar(30),
    primary key(idgrupo),
    foreign key(Propietario) references Usuarios(gametag) on delete cascade
);
create table alumnogrupo(
	idalumnogrupo int(4) auto_increment,
    alumno nvarchar(20),
    idgrupo int(4),
    primary key(idalumnogrupo),
    foreign key(alumno) references Usuarios(gametag) on delete cascade,
    foreign key(idgrupo) references grupo(idgrupo) on delete cascade
);
create table paisgrupo(
	idpaisgrupo int(4) auto_increment,
    id_pais int(3),
    idgrupo int(4),
    primary key(idpaisgrupo),
    foreign key(id_pais) references pais(id_pais) on delete cascade,
    foreign key(idgrupo) references grupo(idgrupo) on delete cascade
);
delimiter //
	create procedure creagrupo(in Nom nvarchar(20), in prop nvarchar(30))
    begin
		declare msj nvarchar(40);
		if exists(select gametag from Usuarios where gametag = prop) then
			insert into grupo(Nomnbre,Propietario) values(Nom,prop);
            set msj = 'grupo creado satisfactoriamente';
        else
			set msj = 'ha ocurrido un error de autenticacion';
        end if;
        select msj;
    end//
    create procedure incluyealumno(in alumn nvarchar(20),in grupo int(4))
    begin
		declare msj nvarchar(40);
        if exists(select gametag from Usuarios where gametag = alumn) then
			if exists(select idgrupo from grupo where idgrupo = grupo) then
				insert into alumnogrupo(alumno,idgrupo) values(alumn,grupo);
                set msj = 'alumno agregado exitosamente';
            else
				set msj = 'el grupo no existe';
            end if;
        else
			set msj = 'el alumno no existe';
        end if;
        select msj;
    end//
    create procedure agregaPais(in Nombre nvarchar(40), in Nombre_com nvarchar(50), in Capital nvarchar(60),in Gentilicio nvarchar(40),in Superficie int(10),in Agua float(2),in Punto_Alto nvarchar(50),in habitantes int(13),in moneda nvarchar(40))
    begin
    end//
delimiter ;


delimiter //

create procedure addusr(in Nom nvarchar(50), in Ape nvarchar(20),in tag nvarchar(30), in mail nvarchar(255),in con nvarchar(40),in lv int(1))
begin
	declare msj nvarchar(50);
	declare idi int(5);# (select ifnull(max(idalumno), 0) + 1 from alumnos)
		set idi = (select ifnull(max(id),0) + 1 from usuarios);
		if exists(select email from Usuarios where email = mail)then
			set msj = 'Error, el email proporcionado ya existe.';
		else
			if exists(select gametag from Usuarios where gametag = tag)then
				set msj = 'Error, el nombre de usuario ya existe.';
			else
				
					insert into Usuarios(Nombre,paterno,gametag,email,contra,nivel,id)
					values(Nom,Ape,tag,mail,con,lv,idi);
                    set msj = 'Usuario registrado con éxito.';
				
			end if;
		end if;
        select msj;
end//


create procedure modiusr(in Nom nvarchar(50), in Ape nvarchar(20),in tag nvarchar(30), in mail nvarchar(255),in con nvarchar(40),in ncon nvarchar(40))
begin
	declare msj nvarchar(50);
		if exists(select gametag from Usuarios where gametag = tag)then
						if exists(select email from Usuarios where email = mail)then
					set msj = 'Error, el email proporcionado ya existe.';
				else
						if (select contra from Usuarios where gametag = tag) = con then
							update Usuarios set Nombre = nom,paterno = ape ,email = mail,contra = ncon where gametag = tag;
							set msj = 'Usuario actualizado con éxito.';
						else
                         set msj = 'Error, las contraseñas no coinciden.';
					end if;
				end if;
			else
				set msj = 'Error, el nombre de usuario no existe.';
		end if;
	select msj;
        
end//
delimiter ;

delimiter **
create procedure sp_valida(in us nvarchar(30), ps nvarchar(30))
begin
if (select count(*) from Usuarios where gametag = us and contra = ps) = 1 then

select nivel from usuarios where gametag = us and contra = ps;

end if;
end;**
create procedure sp_ActualizaImgUsr(in game nvarchar(30), in img nvarchar(500))
begin
	declare msj nvarchar(50);
    declare existe int;
    
		set existe = (select count(*) from usuarios where gametag = game);
        
        if existe = 1 then
			update usuarios set imagen= img where gametag= game;
            set msj = 'Imagen actualizada';
            else
            set msj = 'No se pudo actualizar';
        end if;
	select msj;
end;**

create procedure sp_activaUsr(in us nvarchar(30), in ps nvarchar(30))
begin
	declare msj nvarchar(50);
	declare existe nvarchar(50);
    declare activa int(1);
	
    set existe = (select count(*) from Usuarios where gametag = us and contra = ps);
    set activa = (select activado from usuarios where gametag = us and contra = ps);
    
    if existe = 1 then
		if activa = 0 then
			update usuarios set activado = 1 where gametag = us and contra = ps;
			set msj = 'Usuario activado';
        else
			set msj = 'No se pudo activar el usuario';
		end if;
        else
        set msj = 'No se pudo activar el usuario';
    end if;
    
    select msj;
end;**

delimiter ;

call addusr('The Real','Technology', 'Administrador','TheRealTechnology2016@gmail.com', 'MundoTech',1);
call sp_ActualizaImgUsr( 'Administrador','Logo.png');
call addusr('Usuario','Prueba', 'Usuario','usuario@gmail.com', 'User',2);
call addusr('Profesor','Profesor', 'Profesor','elprofe@gmail.com', 'Profe',3);
call sp_valida('Administrador', 'mundotech');
call sp_activaUsr('Administrador', 'MundoTech');
call sp_activaUsr('Usuario', 'User');
call sp_activaUsr('Profesor', 'Profe');





select * from usuarios order by nivel, id;










