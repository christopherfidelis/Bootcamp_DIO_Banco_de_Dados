-- criação do Banco de Dados para o cenário de Oficina;
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Criar tabela Mecânico
CREATE TABLE Mecanico (
	IdMecanico INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100),
    Especialidade ENUM("Suspensão", "Motor", "Freio", "Elétrica", "Hidraúlica"),
    CONSTRAINT PK_Mecanico PRIMARY KEY (IdMecanico)
);

-- Criar tabela Cliente
CREATE TABLE Cliente (
	Nome VARCHAR(50) NOT NULL,
    CPF CHAR(11),
    RG CHAR(7) NOT NULL,
	Endereco VARCHAR(100),
    Telefone CHAR(11),
    CONSTRAINT unique_Cliente_RG UNIQUE (RG),
    CONSTRAINT PK_Cliente PRIMARY KEY (CPF)
);

-- Criar tabela Veículo
CREATE TABLE Veiculo (
	Placa CHAR(7),
    IdCliente CHAR(11) NOT NULL,
    Chassi CHAR(17) NOT NULL,
	Marca VARCHAR(20),
    Modelo VARCHAR(20),
    AnoFabricacao CHAR(4),
    Cor VARCHAR(20),
    CONSTRAINT unique_Veiculo_Chassi UNIQUE (Chassi),
    CONSTRAINT PK_Veiculo PRIMARY KEY (Placa),
    CONSTRAINT FK_CPF_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente (CPF)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criar tabela Ordem de serviço
CREATE TABLE OrdemServico (
	Numero INT,
    OSPlacaVeiculo CHAR(7),
    OSIdMecanico INT, 
    DataEmissao DATE,
    StatusOS ENUM("Esperando aprovação", "Aprovada", "Em andamento", "Concluída", "Recusado"),
    Valor FLOAT NOT NULL,
    DataConclusao DATE,
	CONSTRAINT PK_OrdemServico PRIMARY KEY (Numero, OSPlacaVeiculo, OSIdMecanico),
    CONSTRAINT FK_OS_Placa FOREIGN KEY (OSPlacaVeiculo) REFERENCES Veiculo(Placa),
    CONSTRAINT FK_OS_Mecanico FOREIGN KEY (OSIdMecanico) REFERENCES Mecanico(IdMecanico)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criando tabela de Serviços
CREATE TABLE Servico (
	IdServico INT,
    Nome VARCHAR(55) NOT NULL,
    Valor float NOT NULL,
    Descricao VARCHAR(255),
    CONSTRAINT PK_Servico PRIMARY KEY (IdServico)
);

-- Criando tabela de serviços prestados em uma OS
CREATE TABLE ServicoOS (
	NumeroOS INT,
    IdServicoOS INT,
    CONSTRAINT PK_ServicoOS PRIMARY KEY (NumeroOS, IdServicoOS),
    CONSTRAINT FK_OSNum_Servico FOREIGN KEY (NumeroOS) REFERENCES OrdemServico(Numero),
    CONSTRAINT FK_OS_Servico FOREIGN KEY (IdServicoOS) REFERENCES Servico(IdServico)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Criando tabela Peça
CREATE TABLE Peca (
	IdPeca INT,
    Nome VARCHAR(55) NOT NULL,
    Valor float NOT NULL,
    Descricao VARCHAR(255),
    CONSTRAINT PK_Peca PRIMARY KEY (IdPeca)
);

-- Criando a tabela das peças utilizas em uma OS
CREATE TABLE PecaOS (
	NumeroOS INT,
    IdPecaOS INT,
    CONSTRAINT PK_ServicoOS PRIMARY KEY (NumeroOS, IdPecaOS),
    CONSTRAINT FK_OSNum_peca FOREIGN KEY (NumeroOS) REFERENCES OrdemServico(Numero),
    CONSTRAINT FK_OS_peca FOREIGN KEY (IdPecaOS) REFERENCES Peca(IdPeca )
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

SHOW TABLES;

