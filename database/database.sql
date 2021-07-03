begin;
create schema Compania_aerea;
use Compania_aerea;

create table Aeroporto(
    Codigo_aeroporto INT auto_increment,
    nome VARCHAR(45) not null,
    Cidade VARCHAR(45) not null,
    Estado VARCHAR(45) null,
    primary key(Codigo_aeroporto)
)ENGINE=InnoDB;

create table Voo (
    Numero_voo int auto_increment,
    Companhia_aerea varchar(45) not null,
    Dias_da_semana varchar(45) not null,
    primary key(Numero_voo)
)ENGINE=InnoDB;

create table Trecho_voo(
    Numero_voo int, 
    Numero_trecho int, 
    Codigo_aeroporto_partida int unique not null, 
    Horario_partida_previsto varchar(5) null, 
    Codigo_aeroporto_chegada int unique not null, 
    Horario_chegada_previsto varchar(10) null,
    PRIMARY KEY(Numero_trecho, Numero_voo)
)ENGINE=InnoDB;

create table TARIFA (
    Numero_voo int,
    Codigo_tarifa INT,
    Quantidade decimal(6,2) null,
    Restricoes VARCHAR (50) null,
    PRIMARY KEY (Numero_voo,Codigo_tarifa)
)ENGINE=InnoDB;

create table TIPO_AERONAVE (
      Nome_tipo_aeronave VARCHAR(20),
      Qtd_max_assentos VARCHAR(10)  null,
      Companhia VARCHAR(45) null,
      PRIMARY KEY(Nome_tipo_aeronave)
)ENGINE=InnoDB;

create table PODE_POUSAR (
    Nome_tipo_aeronave VARCHAR(45),
    Codigo_aeroporto int,
    PRIMARY KEY (Nome_tipo_aeronave, Codigo_aeroporto)
)ENGINE=InnoDB;

create table AERONAVE (
    Codigo_aeronave int auto_increment,
    Numero_total_assentos VARCHAR(10) null,
    Tipo_aeronave VARCHAR(20) unique null,
    PRIMARY KEY (Codigo_aeronave)
)ENGINE=InnoDB;

create table RESERVA_ASSENTO(
    Numero_voo INT,
    Numero_trecho INT,
    Data1 DATE,
    Numero_assento VARCHAR(10),
    Nome_cliente VARCHAR(50) null,
    Telefone_cliente VARCHAR(10) unique,
    PRIMARY KEY(Numero_voo, Numero_trecho, Data1, Numero_assento)
)ENGINE=InnoDB;

create table Instancia_trecho(
    Numero_voo INT, 
    Numero_trecho int, 
    Data1 date, 
    Numero_assentos_disponiveis int null, 
    Codigo_aeronave int unique null, 
    Codigo_aeroporto_partida int unique null, 
    Horario_partida varchar(10)  null, 
    Codigo_aeroporto_chegada int unique null, 
    Horario_chegada varchar(10) null,
    primary key (Numero_voo, Numero_trecho, Data1)  
)ENGINE=InnoDB;

-- foreign keys section
alter table Trecho_voo

add foreign key (Codigo_aeroporto_partida )references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key (Codigo_aeroporto_chegada) references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,

add foreign key (Numero_voo) references voo(Numero_voo) ON UPDATE CASCADE ON DELETE CASCADE;

alter table TARIFA

add foreign key (Numero_voo) references voo(Numero_voo) ON UPDATE CASCADE ON DELETE CASCADE;

alter table AERONAVE
add foreign key (Tipo_aeronave) references TIPO_AERONAVE(Nome_tipo_aeronave) ON UPDATE CASCADE ON DELETE CASCADE;

alter table PODE_POUSAR
add foreign key(Nome_tipo_aeronave) references Tipo_aeronave(Nome_tipo_aeronave) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key(Codigo_aeroporto) references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE;

alter table Instancia_trecho

add foreign key (Codigo_aeroporto_partida )references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key (Codigo_aeroporto_chegada) references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key (Codigo_aeronave) references AERONAVE (Codigo_aeronave) ON UPDATE CASCADE ON DELETE CASCADE,

add foreign key (Numero_trecho) references Trecho_voo (Numero_trecho) ON UPDATE CASCADE ON DELETE CASCADE;

alter table reserva_assento
add foreign key(Numero_trecho) references Instancia_trecho(Numero_trecho);

-- data
insert into Aeroporto values
	(1, "Aeroporto do Recife", "Recife", "Pernambuco"),
    (2, "Aeroporto de Guarulhos", "Guarulhos", "São Paulo"),
    (3, "Aeroporto de Congonhas", "São Paulo", "São Paulo"),
    (4, "Aeroporto Internacional de Brasília", "Brasília", "DF"),
    (5, "Aeroporto Internacional de Viracopos", "Campinas", "São Paulo"),
	(6, "Aeroporto Santos Dumont", "Rio de Janeiro", "Rio de Janeiro"),
	(7, "Aeroporto Internacional Tom Jobim- Galeão", "Rio de Janeiro", "Rio de Janeiro"),
    (8, "Aeroporto Internacional de Confins", "Belo Horizonte", "Minas Gerais");

insert into Voo values
	(1, "Azul", "Quinta-Feira"),
    (2, "Gol", "Segunda-Feira"),
    (3, "Tam", "Sexta-Feira"),
    (4, "Varig", "Quarta-Feira"),
    (5, "Transbrasil", "Quinta-Feira"),
    (6, "Cruzeiro", "Sábado"),
    (7, "Real Aerovias", "Domingo"),
    (8,"Panair", "Segunda-Feira"),
    (9, "Vasp", "Quarta-Feira"),
    (10, "Avianca", "Terça-Feira");
    

insert into Trecho_voo values
	(1, 1, 1,"13:00", 2, "15:00"),
    (2, 2, 3,"12:00", 5, "13:00"),
    (3, 3, 4,"08:00", 6, "10:00"),
    (4, 4, 8,"20:00", 7, "21:00"),
    (5, 5, 5,"20:00", 1, "23:00"),
    (6, 6, 2,"15:00", 4, "17:00"),
    (7, 7, 6,"08:00", 8, "09:00"),
    (8, 8, 7,"14:00", 3, "15:00");

insert into TARIFA values
	(1, 1, 1000, "Criança abaixo de 7 anos não paga"),
    (2, 2, 1500, "Criança abaixo de 7 anos não paga"),
    (3, 3, 2000, "Criança abaixo de 7 anos não paga"),
    (4, 4, 2500, "Criança abaixo de 7 anos não paga"),
    (5, 5, 1200, "Criança abaixo de 7 anos não paga"),
    (6, 6, 1340, "Criança abaixo de 7 anos não paga"),
    (7, 7, 1950, "Criança abaixo de 7 anos não paga"),
    (8, 8, 1800, "Criança abaixo de 7 anos não paga");

insert into TIPO_AERONAVE values
	("Aeronave A-1", 330, "Azul"),
	("Aeronave A-2", 320, "Azul"),
    ("Aeronave B-1", 340, "Tam"),
    ("Aeronave B-2", 350, "Tam"),
    ("Aeronave C-1", 340, "Gol"),
    ("Aeronave C-2", 350, "Gol"),
    ("Aeronave D-1", 330, "Varig"),
	("Aeronave D-2", 340, "Varig"),
	("Aeronave E-1", 330, "Transbrasil"),
    ("Aeronave E-2", 345, "Transbrasil"),
    ("Aeronave F-1", 338, "Cruzeiro"),
    ("Aeronave F-2", 335, "Cruzeiro"),
    ("Aeronave T-1", 330, "Real Aerovias"),
    ("Aeronave T-2", 342, "Real Aerovias"),
    ("Aeronave R-1", 338, "Panair"),
    ("Aeronave R-2", 330, "Panair"),
    ("Aeronave V-1", 345, "Vasp"),
    ("Aeronave V-2", 328, "Vasp"),
    ("Aeronave P-1", 330, "Avianca"),
    ("Aeronave P-2", 338, "Avianca");
    
insert into PODE_POUSAR values
	("Aeronave A-1", 2),
    ("Aeronave C-2", 2),
    ("Aeronave B-1", 6),
    ("Aeronave D-1", 7),
    ("Aeronave E-2", 1),
    ("Aeronave F-2", 4),
    ("Aeronave T-2", 8),
	("Aeronave R-1", 3);
    
insert into AERONAVE values
	(1, 330, "Aeronave A-1"),
	(2, 320,"Aeronave A-2"),
    (3, 340,"Aeronave B-1"),
    (4, 350,"Aeronave B-2"),
    (5, 340,"Aeronave C-1"),
    (6, 350,"Aeronave C-2"),
    (7, 330,"Aeronave D-1"),
	(8, 340,"Aeronave D-2"),
	(9, 330,"Aeronave E-1"),
    (10, 345,"Aeronave E-2"),
    (11, 338,"Aeronave F-1"),
    (12, 335,"Aeronave F-2"),
    (13, 330,"Aeronave T-1"),
    (14, 342,"Aeronave T-2"),
    (15, 338,"Aeronave R-1"),
    (16, 330,"Aeronave R-2"),
    (17, 345,"Aeronave V-1"),
    (18, 328,"Aeronave V-2"),
    (19, 330,"Aeronave P-1"),
    (20, 338,"Aeronave P-2");

insert into Instancia_trecho values
	(1, 1, '2021-06-24', 300, 1, 1, "13:00", 2, "15:00"),
    (2, 2, '2021-06-21', 320, 5, 3,"12:00", 5, "13:00"),
	(3, 3, '2021-06-25', 325, 3, 4,"08:00", 6, "10:00"),
    (4, 4, '2021-06-23', 318, 7, 8,"20:00", 7, "21:00"),
    (5, 5, '2021-07-01', 310, 10, 5,"20:00", 1, "23:00"),
    (6, 6, '2021-06-26', 335, 11, 2,"15:00", 4, "17:00" ),
    (7, 7, '2021-06-27', 315, 13, 6,"08:00", 8, "09:00"),
    (8, 8, '2021-06-28', 305, 15,7,"14:00", 3, "15:00");

insert into RESERVA_ASSENTO values
	(1, 1, '2021-06-24', 7, "João", "999661532"),
    (2, 2, '2021-06-21', 9,"Jessica", "999764542"),
	(3, 3, '2021-06-25', 100,"Arthur", "994811572"),
    (4, 4, '2021-06-23', 25,"Carlos", "98965538"),
    (5, 5, '2021-07-01', 77,"Jorge", "987562532"),
    (6, 6, '2021-06-26', 80,"José", "998731532"),
    (7, 7, '2021-06-27', 25,"Carla", "987651533"),
    (8, 8, '2021-06-29', 15,"Natalia", "998664512");
-- trigger section
create trigger tr_desconto before insert
on TARIFA
for each row
set new.Quantidade = (new.Quantidade*0.85);

create trigger tr_nassento_insert after insert
on reserva_assento
for each row
update Instancia_trecho
set Numero_assentos_disponiveis = Numero_assentos_disponiveis - 1
where (Instancia_trecho.Numero_voo = RESERVA_ASSENTO.Numero_voo )and (Instancia_trecho.Numero_trecho = RESERVA_ASSENTO.Numero_trecho) and Instancia_trecho.Data1 = RESERVA_ASSENTO.Data1;

create trigger tr_nassento_delete after delete
on reserva_assento
for each row
update Instancia_trecho
set Numero_assentos_disponiveis = Numero_assentos_disponiveis +1
where (Instancia_trecho.Numero_voo = RESERVA_ASSENTO.Numero_voo )and (Instancia_trecho.Numero_trecho = RESERVA_ASSENTO.Numero_trecho) and Instancia_trecho.Data1 = RESERVA_ASSENTO.Data1;

-- stored procedure section
create procedure Informacao_aeronave (Numero_voo int)
select voo.Companhia_aerea from voo as A, reserva_assento as B
where A.Numero_voo = B.Numero_voo;

-- call Informacao_aeronave();

-- consultas

-- média de tarifa de cada companhia aérea
select A.Companhia_aerea, avg(B.Quantidade) as Média_tarifa from Companhia_aerea as A inner join TARIFA as B 
on A.Numero_voo=B.Numero_voo 
group by A.Companhia_aerea;

-- quantidade de voos que partem de cada aeroporto
select A.nome, count(B.Numero_voo) as quant_voos_partem  from Aeroporto as A inner join Trecho_voo as B
on A.Codigo_aeroporto = B.Codigo_aeroporto_partida
group by A.nome
order by count(B.Numero_trecho) ASC;

commit;