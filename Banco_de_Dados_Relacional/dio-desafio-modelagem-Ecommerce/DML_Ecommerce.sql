-- inserção de dados e queries
use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO Clients (Fname, Minit, Lname, CPF, Address) 
	VALUES
		('Maria','M','Silva',12346789,'rua silva de prata 29, Carangola - Cidade das flores'),
		('Matheus', 'O', 'Pimentel', 987654321, 'rua alemeda 289, Centro - Cidade das flores'),
		('Ricardo','F','Silva', 45678913, 'avenida alemeda vinha 1009, Centro - Cidade das flores'),
		('Julia', 'S', 'França', 789123456, 'rua laranjeiras 861, Centro - Cidade das flores'),
		('Roberta','G','Assis', 98745631, 'avenidade koller 19, Centro - Cidade das flores'),
		('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category ('Eletrónico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') avalição, size
INSERT INTO product (Pname, classification_kids, category, Avaliacao, size) 
	VALUES
	('Fone de ouvido', false, 'Eletrônico', '4',null),
	('Barbie Elsa', true, 'Brinquedos', '3',null),
	('Body Carters' ,true, 'Vestimenta', '5' ,null),
	('Microfone Vedo - Youtuber', False, 'Eletrônico', '4', null),
	('Sofá retrátil', False, 'Móveis', '3', '3x57x80');


-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
	VALUES
		(1, default, 'compra via aplicativo', nulL, 1),
		(2, default, 'compra via aplicativo', 50, 0),
		(3, 'Confirmado', null, nuLL, 1),
		(4, default, 'compra via web site', 150, 0);

-- idPOproduct, idPOorder, poQuantity, postatus
INSERT INTO productOrder (idPOproduct, IdPoOrder, poQuantity, poStatus)
	VALUES
	(1, 1, 2, null),
	(2, 1, 1, null),
	(3, 3, 1, null);

-- storageLocation, quantity
INSERT INTO StorageLocation (idStorage, location)
	VALUES
		(1, 'Rio de Janeiro'),
		(2, 'São Paulo'),
		(3, 'Brasilia');

-- idlproduct, idlstorage, location
INSERT INTO ProductsStorage (IdSProduct, IdSStorage, Quantity)
	VALUES
	(1, 2, 20),
	(2, 3, 100);
    
-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) 
	VALUES
	('Almeida e filhos', 123456789123456, '21985474'),
	('Eletrônicos Silva', 854519649143457, '21985484'),
	('Eletrônicos Valma' , 934567893934695, '21975474');


-- idPsSupplieR, idPsProduct, quantity
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) 
	VALUES
		(1, 1, 500),
		(1, 2, 400),
		(2, 4, 633),
		(3, 3, 5),
		(2, 5, 10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
	VALUES
		('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
		('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
		('Kids World' ,null, 456789123654485, null, 'São Paulo', 1198657484);

-- idPseller, idPproduct, prodQuantity
INSERT INTO productSeller (idPseller, idProduct, prodQuantity) VALUES
	(1, 4, 80),
	(2, 5, 10);
