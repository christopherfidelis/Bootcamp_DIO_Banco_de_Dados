USE ecommerce;

-- Número de clientes
SELECT count(*) FROM clients;

-- Pedidos dos clientes
SELECT * FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- Pedidos dos clientes especificando os atributos que estou recuperando
SELECT concat(Fname, ' ', Lname) AS Client, IdOrder AS Request, OrderStatus AS Status FROM clients c, orders o WHERE c.idClient = idOrderClient;

-- Contar o número de ordens de serviço por cliente.
SELECT concat(C.Fname, ' ', c.Lname) AS Name_Client, count(*) FROM clients c, orders o
	WHERE c.idClient = idOrderClient
		GROUP BY idOrder;
        
-- Recuperar quantos pedidos foram realizados pelos clientes
SELECT c.IdClient, Fname, count(*) AS Number_of_orders FROM clients c INNER JOIN orders o ON c.idClient = o.IdOrderClient
    GROUP BY IdClient;

-- Quem são os clientes de cada ordem de serviço?
SELECT o.idOrder, concat(c.Fname, ' ', c.lname) AS Name_Client, c.CPF, c.Address
	FROM Orders o INNER JOIN clients c ON o.IdOrderClient = c.idClient;

-- Há algum cliente que não possui nenhuma ordem de serviço?
SELECT concat(c.Fname, ' ', c.Lname) AS Name_Client
	FROM Orders o RIGHT OUTER JOIN clients c ON o.IdOrderClient = c.idClient
    WHERE idOrder IS NULL;

-- Quais foram os cliente que compraram pelo aplicativo?
SELECT concat(c.Fname, ' ', c.Lname) AS Name_Client
	FROM Orders o INNER JOIN clients c ON o.IdOrderClient = c.idClient
    WHERE OrderDescription = 'compra via aplicativo';

-- Quantos produtos estão cadastrados?
SELECT count(*) FROM product;

-- Dentre os produtos cadastrados, quais possuem avaliação maior que 4 estrelas?
SELECT IdProduct, Pname AS Nome_Produto FROM product WHERE avaliacao >= 4;

-- Dentre os produtos cadastrados, quais são destinados ao público infantil?
SELECT IdProduct, Pname AS Nome_Produto FROM product WHERE classification_kids = 1;

-- Dentre os produtos cadastrados, quais estão classificados na categoria Eletrônico?
SELECT IdProduct, Pname AS Nome_Produto FROM product WHERE category = 'Eletrônico';

-- O E-commerce possui quantos fornecedores?
SELECT count(*) FROM Supplier;

-- Quais são os fornecedores do E-commerce?
SELECT DISTINCT SocialName FROM Supplier;

-- Em quais cidades estão localizados os vendedores do Ecommerce?
SELECT DISTINCT location AS Cidade FROM Seller ORDER BY location ASC;

-- Quais são os produtos vendidos por cada vendedor e suas respectivas quantidades?
SELECT p.Pname AS Nome_Produto, s.SocialName AS Vendedor, ps.ProdQuantity AS Quantidade_Vendida
	FROM ProductSeller ps INNER JOIN product p ON ps.IdProduct = p.IdProduct 
    INNER JOIN seller s ON ps.IdPSeller = s.idSeller ORDER BY ps.ProdQuantity;

-- Quais foram os produtos vendidos em cada ordem de serviço, e suas respectivas quantidades? E quem foram os clientes que os compraram?
SELECT po.IdPoOrder, p.Pname AS Nome_Produto, po.PoQuantity AS Quantidade_vendida, concat(c.Fname, ' ', c.Lname) AS Nome_Cliente 
	FROM ProductOrder po INNER JOIN product p ON po.IdPoProduct = P.idProduct INNER JOIN orders o ON po.IdPoOrder = o.IdOrder 
	INNER JOIN clients c ON o.idOrderClient = c.IdClient;

-- Qual a quantidade de produto em cada Centro de distribuição?
SELECT p.Pname AS Nome_Product, ps.Quantity AS Quantidade_Produto, s.Location AS Cidade_CD 
	FROM ProductsStorage ps INNER JOIN product p ON ps.IdSProduct = p.IdProduct
	INNER JOIN StorageLocation s ON ps.IdSStorage = s.IdStorage ORDER BY ps.Quantity DESC;

SELECT * FROM ProductSupplier;
-- Quantidade de produto, de cada fornecedor, disponível para venda?
SELECT s.CNPJ, s.SocialName AS Fornecedor, p.Pname AS Nome_Produto, ps.Quantity AS Qtd_dispoível 
	FROM ProductSupplier ps INNER JOIN supplier s ON ps.IdPsSupplier= s.IdSupplier INNER JOIN Product p ON ps.IdPsProduct=p.IdProduct 
    ORDER BY ps.Quantity;

-- Quais fornecedores possuem mais de 500 unidades de produtos disponíveis para venda?
SELECT s.SocialName AS Fornecedor, sum(ps.Quantity)
	FROM ProductSupplier ps INNER JOIN supplier s ON ps.IdPsSupplier= s.IdSupplier INNER JOIN Product p ON ps.IdPsProduct=p.IdProduct 
    GROUP BY s.SocialName HAVING sum(ps.Quantity) > 500;

-- Quais fornecedores possuem menos de 500 unidades de produtos disponíveis para venda?
SELECT s.SocialName AS Fornecedor, sum(ps.Quantity)
	FROM ProductSupplier ps INNER JOIN supplier s ON ps.IdPsSupplier= s.IdSupplier INNER JOIN Product p ON ps.IdPsProduct=p.IdProduct 
    GROUP BY s.SocialName HAVING sum(ps.Quantity) < 500; 