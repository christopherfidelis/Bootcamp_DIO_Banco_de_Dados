USE oficina;

-- Inserindo Clientes
INSERT INTO Cliente VALUES
	("Arthur Silva","12345678910", "1234567", "Rua A, 145", "11123456789"),
    ("Julia Freitas", "10987654321", "7654321", "Avenida ABC, 1178, apto 303A", "12659784645"),
    ("Pedro Sampaio","12345448910", "1357911", "Rua XXY, 248", "34991610772"),
    ("Camila Pereira", "99999999999", "7777777", "Avenida Amoras, 72, apto 1010", "35997456871"),
    ("Naiara Azevedo","12312312312", "1234987", "Rua Peixotos, 2020, apto 504B", "66984210337"),
    ("Renato Augusto Santos", "64826482648", "7894561", "Avenida Atlântica, 2021, apto 705C", "21999140211"),
    ("Antonio Henrique Silveira","13353970606", "2150422", "Rua XYZ, 171", "12987634568"),
    ("José Santos", "11111111111", "4564564", "Rua Araras, 355", "3396254120");

-- Inserindo Veículos
INSERT INTO Veiculo VALUES
	("ABC1234", "12345678910", "9BWHE21JX24060831", "Chevrolet", "Onix", "2021", "Preto"),
    ("XYZ1234", "12345678910", "8XYZA12RS24074113", "Chevrolet", "Tracker", "2022", "Vermelho"),
    ("DFE5678", "10987654321", "7ABCD47AS47874713", "Fiat", "Uno", "2010", "Branco"),
    ("RSW5218", "99999999999", "1VXER65AS64314747", "Hyundai", "HB20", "2018", "Preto"),
    ("YTW4736", "12312312312", "9BWHE65AS64314747", "Ford", "EcoSport", "2014", "Cinza"),
    ("PYJ2579", "64826482648", "5JEPS78BP45714683", "Fiat", "Cronos", "2022", "Preto"),
    ("GHI9999", "64826482648", "5JEPS78BP64314747", "Kia", "Soul", "2016", "Azul"),
    ("AAA2222", "13353970606", "3XYZA56XX71976513", "Fiat", "Argo", "2019", "Vermelho"),
    ("BCA4321", "13353970606", "1IOIW88QX83121515", "Fiat", "Mobi", "2016", "Preto");
  
-- Inserindos mecânicos
INSERT INTO Mecanico VALUES
	(1, "José Ricardo Silva", "Avenida Paraguai, 2121", "Motor"),
    (2, "Eduardo Martins", "Avenida Brasil, 111", "Elétrica"),
    (3, "Maria Camila", "Rua Aracajú, 89", "Suspensão"),
    (4, "Guilherme Almeida", "Rua dos Municípios, 212, apto 202", "Hidráulica"),
    (5, "Rodrigo Oliveira", "Avenida Adriano Bailoni, 380", "Motor");
    
-- Inserindo Peças
INSERT INTO Peca VALUES
	(1, "Embreagem", 592.50, null),
    (2, "Filtro Óleo", 149.90, null),
    (3, "Amortecedor", 245.89, null),
    (4, "Correia Dentada", 60.00, null),
    (5, "Pastilha de Freio", 89.99, null),
    (6, "Disco Freio", 370.00, null),
    (7, "Filtro Ar", 14.79, null),
    (8, "Vela de Ignição", 37.52, null),
    (9, "Bateria", 400.00, "Bateria da Marca Moura");

-- Inserindo serviços
INSERT INTO Servico VALUES
	(1, "Troca de óleo", 50.00, null),
    (2, "Pintura", 1500.90, null),
    (3, "Martelinho de Ouro", 599.00, null),
    (4, "Alinhamento", 990.00, null),
    (5, "Balanceamento", 350.00, null),
    (6, "Substituição de molas e amortecedores", 499.90, null),
    (7, "Substituição de correias", 199.00, null),
    (8, "Regulagem de válvulas", 89.90, null),
    (9, "Troca de filtro", 79.90, null),
    (10, "Troca de baterias", 199.90, null),
    (11, "Reparos no sistema de iluminação", 59.89, null),
    (12, "Reparos no sistema de partida", 269.90, null);

-- Inserindo Ordem de Serviços
INSERT INTO OrdemServico VALUES 
	(1, "ABC1234", 3, '2022-03-14', "Aprovada", 1000.00, '2022-03-21'),
    (2, "ABC1234", 3, '2022-08-15', "Aprovada", 200.00, '2022-08-15'),
    (4, "RSW5218", 2, '2020-06-30', "Aprovada", 500.00, '2020-07-01'),
    (5, "AAA2222", 1, '2021-07-11', "Aprovada", 400.00, '2021-07-12'),
    (6, "YTW4736", 2, '2022-09-18', "Aprovada", 300.00, '2022-09-18'),
    (7, "GHI9999", 5, '2019-01-02', "Aprovada", 400.00, '2019-01-02'),
    (7, "GHI9999", 2, '2019-01-03', "Aprovada", 300.00, '2019-01-03'),
    (8, "BCA4321", 5, '2022-10-10', "Aprovada", 200.00, '2022-10-10'),
    (9, "XYZ1234", 3, '2019-03-25', "Aprovada", 1400.00, '2019-03-30'),
    (10, "RSW5218", 1, '2021-09-07', "Aprovada", 1699.00, '2021-09-07'),
    (10, "RSW5218", 4, '2021-09-07', "Aprovada", 1699.00, '2021-09-07'),
    (11, "GHI9999", 1, '2020-02-28', "Recusado", 80.00, '2020-02-28'),
    (3, "DFE5678", 1, '2018-04-08', "Recusado", 700.00, '2018-04-08'),
	(3, "DFE5678", 4, '2018-04-08', "Recusado", 700.00, '2018-04-08');

-- Inserindo as peças usadas em cada ordem de serviço
INSERT INTO PecaOS VALUES
	(4, 9),
    (5, 4),
    (7, 6),
    (10, 1),
    (10, 6),
    (10, 9);

-- Inserindo os serviços prestados em cada ordem de serviço
INSERT INTO ServicoOS VALUES
	(1, 4),
    (2, 1),
    (2, 9),
    (3, 3),
    (4, 11),
    (5, 7),
    (6, 12),
    (7, 11),
    (8, 1),
    (8, 9),
    (9, 1),
    (9, 4),
    (9, 5),
    (10, 10),
    (11, 1);
    

    
