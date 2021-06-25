begin;
create schema Compania_aereaTeste2;
use Compania_aereaTeste2;

create table Aeroporto(
    Codigo_aeroporto VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(45) not null,
    Cidade VARCHAR(45) not null,
    Estado VARCHAR(45) null
)ENGINE=InnoDB;

create table Voo (
    Numero_voo varchar(6) primary key,
    Companhia_aerea varchar(45) not null,
    Dias_da_semana varchar(45) not null
)ENGINE=InnoDB;

create table Trecho_voo(
    Numero_voo varchar(6), 
    Numero_trecho int, 
    Codigo_aeroporto_partida varchar(5) unique not null, 
    Horario_partida_previsto varchar(5) null, 
    Codigo_aeroporto_chegada varchar(5) unique not null, 
    Horario_chegada_previsto varchar(10) null,
    PRIMARY KEY(Numero_voo, Numero_trecho)
)ENGINE=InnoDB;

create table Instancia_trecho(
    Numero_voo int, 
    Numero_trecho int, 
    Data date, 
    Numero_assentos_disponiveis int null, 
    Codigo_aeronave varchar(5) unique null, 
    Codigo_aeroporto_partida varchar(5) unique null, 
    Horario_partida varchar(10)  null, 
    Codigo_aeroporto_chegada varchar(5) unique null, 
    Horario_chegada varchar(10) null,
    PRIMARY KEY(Numero_voo, Numero_trecho, Data)
)ENGINE=InnoDB;

create table TARIFA (
    Numero_voo VARCHAR(6),
    Codigo_tarifa INT,
    Quantidade decimal(4,2) null,
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
    Codigo_aeroporto VARCHAR(5),
    PRIMARY KEY (Nome_tipo_aeronave, Codigo_aeroporto)
)ENGINE=InnoDB;

create table AERONAVE (
    Codigo_aeronave VARCHAR(5),
    Numero_total_assentos VARCHAR(10) null,
    Tipo_aeronave VARCHAR(20) unique null,
    PRIMARY KEY (Codigo_aeronave)
)ENGINE=InnoDB;

create table RESERVA_ASSENTO(
    Numero_voo VARCHAR(6),
    Numero_trecho INT,
    Data DATE,
    Numero_assento VARCHAR(10),
    Nome_cliente VARCHAR(50) null,
    Telefone_cliente VARCHAR(10) unique,
    PRIMARY KEY(Numero_voo, Numero_trecho, Data, Numero_assento)
)ENGINE=InnoDB;

-- foreign keys section
alter table Trecho_voo
-- all fk inserted
-- Aeroporto table
add foreign key (Codigo_aeroporto_partida )references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key (Codigo_aeroporto_chegada) references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE,
-- voo table
add foreign key (Numero_voo) references voo(Numero_voo) ON UPDATE CASCADE ON DELETE CASCADE;

alter table TARIFA
-- all fk inserted
-- voo table
add foreign key (Numero_voo) references voo(Numero_voo) ON UPDATE CASCADE ON DELETE CASCADE;

alter table AERONAVE
-- all fk inserted
add foreign key (Tipo_aeronave) references TIPO_AERONAVE(Nome_tipo_aeronave) ON UPDATE CASCADE ON DELETE CASCADE;

alter table PODE_POUSAR
-- all fk inserted
add foreign key(Nome_tipo_aeronave) references Tipo_aeronave(Nome_tipo_aeronave) ON UPDATE CASCADE ON DELETE CASCADE,
add foreign key(Codigo_aeroporto) references Aeroporto(Codigo_aeroporto) ON UPDATE CASCADE ON DELETE CASCADE;

alter table Instancia_trecho
-- not all fk inserted
-- Aeroporto table
add foreign key (Codigo_aeroporto_partida )references Aeroporto(Codigo_aeroporto),
add foreign key (Codigo_aeroporto_chegada) references Aeroporto(Codigo_aeroporto),
-- AERONAVE table
add foreign key (Codigo_aeronave) references AERONAVE (Codigo_aeronave),
-- Trecho_voo table 
add foreign key(Numero_trecho) references Trecho_voo(Numero_trecho);
-- RESERVA_ASSENTO table 


commit;