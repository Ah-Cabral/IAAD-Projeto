begin;
create schema Compania_aereaPop;
use Compania_aereaPop;

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
    PRIMARY KEY(Numero_trecho)
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

-- procedure section
create procedure Informacao_aeronave (Numero_voo int)
select voo.Companhia_aerea from voo as A, reserva_assento as B
where A.Numero_voo = B.Numero_voo;

-- funções de agregação

-- passagem de avião mais barata

select min(TARIFA.Quantidade) from TARIFA;

-- entre as datas 
select count(Instancia_trecho.Data1) as quant_trechos_data
from Instancia_trecho
where Data1 between 2020-06-24 and 2020-09-01;

-- função de agrupamento

select B.Companhia_aerea, count(A.Nome_cliente) as quant_clientes from reserva_assento as A, voo as B
where A.Numero_voo=B.Numero_voo
group by Companhia_aerea;

commit;