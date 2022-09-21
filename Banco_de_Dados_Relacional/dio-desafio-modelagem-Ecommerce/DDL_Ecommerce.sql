-- criação do Banco de Dados para o cenário de E-commerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
-- DROP DATABASE ecommerce;

-- Criar tabela Cliente
CREATE TABLE Clients (
	idClient INT AUTO_INCREMENT,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(250),
    CONSTRAINT unique_CPF_client UNIQUE (CPF),
    CONSTRAINT PK_idCliente PRIMARY KEY (idClient)
);

ALTER TABLE Clients AUTO_INCREMENT=1;

-- Criar tabela Produto
-- OBS: size = dimensão do produto
CREATE TABLE Product (
	idProduct INT AUTO_INCREMENT NOT NULL,
    Pname VARCHAR(30),
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM("Eletrônico", "Vestimenta", "Brinquedos", "Alimentos", "Móveis") NOT NULL,
    Avaliacao FLOAT DEFAULT 0,
    Size VARCHAR(10),
    CONSTRAINT PK_idProduct PRIMARY KEY (idProduct)
);


-- Criar tabela Pedido
CREATE TABLE Orders (
	idOrder INT AUTO_INCREMENT,
    idOrderClient INT,
    OrderStatus ENUM("Cancelado", "Confirmado", "Em processamento") DEFAULT "Em processamento",
    OrderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    PaymentCash BOOL DEFAULT FALSE,
    CONSTRAINT PK_idOrder PRIMARY KEY (idOrder),
    CONSTRAINT FK_Orders_Client FOREIGN KEY (idOrderClient) REFERENCES Clients(IdClient)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Criar tabela de Estoque
CREATE TABLE StorageLocation (
	idStorage INT,
    Location VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Storage PRIMARY KEY (idStorage)
);

-- Criar tabela Fornecedor
CREATE TABLE Supplier (
	idSupplier INT AUTO_INCREMENT,
    SocialName VARCHAR(100) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier_CNPJ UNIQUE (CNPJ),
    CONSTRAINT PK_idSupplier PRIMARY KEY (idSupplier)
);

-- Criar tabela Vendedor
CREATE TABLE Seller (
	idSeller INT AUTO_INCREMENT,
    SocialName VARCHAR(100) NOT NULL,
    AbstName VARCHAR(100),
    CNPJ CHAR(15),
    CPF CHAR(9),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_seller_CNPJ UNIQUE (CNPJ),
    CONSTRAINT unique_seller_CPF UNIQUE (CPF),
    CONSTRAINT PK_idSeller PRIMARY KEY (idSeller)
);

-- Criar tabela Produto vendido por um Vendedor
CREATE TABLE ProductSeller (
	idPSeller INT,
    IdProduct INT,
    ProdQuantity INT DEFAULT 1,
    CONSTRAINT PK_ProductSeller PRIMARY KEY (idPSeller, IdProduct),
    CONSTRAINT FK_Product_Seller FOREIGN KEY (idPSeller) REFERENCES Seller(idSeller),
    CONSTRAINT FK_Product_Product FOREIGN KEY (IdProduct) REFERENCES Product(idProduct)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criar tabela Produtos em um pedido
CREATE TABLE ProductOrder (
	idPoProduct INT,
    IdPoOrder INT,
    PoQuantity INT DEFAULT 1,
    PoStatus ENUM("Disponível", "Sem estoque") 	DEFAULT "Disponível",
    CONSTRAINT PK_ProductOrder PRIMARY KEY (idPoProduct, IdPoOrder),
    CONSTRAINT FK_ProductOrder_Product FOREIGN KEY (idPoProduct) REFERENCES Product(idProduct),
    CONSTRAINT FK_ProductOrder_Order FOREIGN KEY (IdPoOrder) REFERENCES Orders(idOrder)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criar tabela Produtos em um determinado Estoque
CREATE TABLE ProductsStorage (
	IdSProduct INT,
    IdSStorage INT,
    Quantity INT DEFAULT 0,
    CONSTRAINT PK_ProductsStorage PRIMARY KEY (IdSProduct, IdSStorage),
    CONSTRAINT FK_ProductsStorage_Product FOREIGN KEY (IdSProduct) REFERENCES Product(idProduct),
    CONSTRAINT FK_ProductsStorage_Storage FOREIGN KEY (IdSStorage) REFERENCES StorageLocation(idStorage)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criando tabela Fornecedor disponiliza um produto
CREATE TABLE ProductSupplier (
	IdPsSupplier INT,
    IdPsProduct INT,
    Quantity INT NOT NULL,
	CONSTRAINT PK_ProductSupplier PRIMARY KEY(IdPsSupplier, IdPsProduct),
    CONSTRAINT FK_ProductSupplier_Supplier FOREIGN KEY (IdPsSupplier) REFERENCES Supplier(idSupplier),
    CONSTRAINT FK_ProductSupplier_Product FOREIGN KEY (IdPsProduct) REFERENCES Product(idProduct)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
