use Compania_aereaTeste2;

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

insert into RESERVA_ASSENTO values
	(1, 1, '2021-06-24', 7, "João", "999661532"),
    (2, 2, '2021-06-21', 9,"Jessica", "999764542"),
	(3, 3, '2021-06-25', 100,"Arthur", "994811572"),
    (4, 4, '2021-06-23', 25,"Carlos", "98965538"),
    (5, 5, '2021-07-01', 77,"Jorge", "987562532"),
    (6, 6, '2021-06-26', 80,"José", "998731532"),
    (7, 7, '2021-06-27', 25,"Carla", "987651533"),
    (8, 8, '2021-06-29', 15,"Natalia", "998664512");
insert into Instancia_trecho values
	(1, 1, '2021-06-24', 300, 1, 1, "13:00", 2, "15:00"),
    (2, 2, '2021-06-21', 320, 5, 3,"12:00", 5, "13:00"),
	(3, 3, '2021-06-25', 325, 3, 4,"08:00", 6, "10:00"),
    (4, 4, '2021-06-23', 318, 7, 8,"20:00", 7, "21:00"),
    (5, 5, '2021-07-01', 310, 10, 5,"20:00", 1, "23:00"),
    (6, 6, '2021-06-26', 335, 11, 2,"15:00", 4, "17:00" ),
    (7, 7, '2021-06-27', 315, 13, 6,"08:00", 8, "09:00"),
    (8, 8, '2021-06-28', 305, 15,7,"14:00", 3, "15:00");