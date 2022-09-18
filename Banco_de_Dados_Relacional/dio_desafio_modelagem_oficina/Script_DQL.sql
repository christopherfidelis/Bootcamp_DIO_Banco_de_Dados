USE oficina;

-- Quais os mecânicos da oficina?
SELECT * FROM mecanico;

-- Quais são os clientes da oficina (em ordem alfabética)?
SELECT * FROM cliente c ORDER BY c.nome ASC;

-- Quais clientes da oficina possuem o nome começando com a letra "A"?
SELECT c.nome FROM cliente c WHERE c.nome LIKE "A%";

-- Quantos mecânicos a oficina possuem em cada especialidade?
SELECT m.Especialidade, count(*) AS Quantidade FROM mecanico m GROUP BY m.Especialidade;

-- Quais os veículos cadastrados na oficina (Ordeno do mais novo para o mais velho)?
SELECT v.placa, v.marca, v.modelo, v.AnoFabricacao from veiculo v ORDER BY v.anofabricacao DESC;

-- Quem são os donos dos respectivos veículos?
SELECT v.placa, v.marca, v.modelo, c.nome FROM veiculo v INNER JOIN cliente c ON v.IdCliente=c.CPF;

-- Quais os modelos de veículos da marca Fiat?
SELECT DISTINCT modelo FROM veiculo v WHERE v.marca = "Fiat";

-- Quantos veículos possui cada cliente da oficina?
SELECT c.nome, count(*) AS QtdVeiculos FROM veiculo v INNER JOIN cliente c ON v.IdCliente=c.CPF GROUP BY c.nome;

-- Há clientes que não possuem veículo(s)? Quem são eles?
SELECT c.nome FROM veiculo v RIGHT JOIN cliente c ON v.IdCliente=c.CPF WHERE v.IdCliente IS NULL;

-- Quais são as peças vendidas pela oficina?
SELECT * FROM peca;

-- Qual a peça de maior valor? E a peça de menor valor? E qual o valor médio das peças vendidas?
SELECT p.nome, p.valor FROM peca p WHERE p.valor = (SELECT max(valor) FROM peca p);
SELECT p.nome, p.valor FROM peca p WHERE p.valor = (SELECT min(valor) FROM peca p);
SELECT ROUND(AVG(p.valor), 2) AS Valor_Médio FROM peca p;

-- Quais são os serviços prestados pela oficina?
SELECT * FROM servico;

-- Qual o servico de maior valor? E o servico de menor valor? E qual o valor médio dos serviços prestados?
SELECT s.nome, s.valor FROM servico s WHERE s.valor = (SELECT max(valor) FROM servico s);
SELECT s.nome, s.valor FROM servico s WHERE s.valor = (SELECT min(valor) FROM servico s);
SELECT ROUND(AVG(s.valor), 2) AS Valor_Médio FROM servico s;

-- Quais peças foram utilizadas em quais Ordens de Serviços?
SELECT po.NumeroOS, po.IdPecaOS, p.nome as Nome_Peça FROM pecaos po inner join peca p WHERE po.IdPecaOS = p.IdPeca;

-- Em uma OS, quantas peças foram utilizadas?
SELECT po.NumeroOS, count(*) as Qtd_Peças FROM pecaos po inner join peca p ON po.IdPecaOS = p.IdPeca GROUP BY po.NumeroOS;

-- Quais serviços foram prestados em quais Ordens de Serviços?
SELECT so.NumeroOS, s.IdServico, s.nome AS Nome_serviço FROM servicoos so inner join servico s ON so.IdServicoOS = s.IdServico;

-- Em uma OS, quantas serviços foram prestados?
SELECT so.NumeroOS,  count(*) AS Qtd_Serviço FROM servicoos so inner join servico s ON so.IdServicoOS = s.IdServico GROUP BY so.NumeroOS ORDER BY  so.NumeroOS ASC;

-- Quais foram as ordem de serviços da oficina?
SELECT * FROM ordemservico;

-- Quantas OS foram efetuadas?
SELECT count(*) FROM ordemservico;

-- Quantas OS foram efetuadas em cada ano?
SELECT Year(os.dataconclusao) AS ANO, count(*) AS OS_Efetuadas FROM ordemservico os GROUP BY Year(os.dataconclusao) ORDER BY ANO desc;

-- Quantas OS realizaram cada mecânico?
SELECT m.nome, count(*) AS Qtd_OS FROM ordemservico os INNER JOIN mecanico m ON os.OSIdMecanico = m.Idmecanico GROUP BY m.nome ORDER BY Qtd_OS DESC;

-- Quantidade de ordem de serviço realizadas por cada cliente?
SELECT c.nome, count(*) AS Qtd_OS 
	FROM ordemservico os INNER JOIN veiculo v ON os.OSPlacaVeiculo = v.Placa INNER JOIN cliente c ON v.IdCliente = c.CPF
		GROUP BY c.nome ORDER BY Qtd_OS DESC;

-- Algum cliente não efetuou nenhuma OS? Em caso afirmativo, quem foram?
SELECT c.nome FROM cliente c WHERE c.cpf =  (SELECT v.IdCliente 
	FROM ordemservico os RIGHT JOIN veiculo v ON os.OSPlacaVeiculo = v.Placa WHERE os.numero IS NULL);
    
-- 	Quem são os clientes que tiveram a OS recusada?
SELECT os.numero, os.statusos, c.nome
	FROM ordemservico os INNER JOIN veiculo v ON os.OSPlacaVeiculo = v.Placa INNER JOIN cliente c ON v.IdCliente = c.cpf
		WHERE os.StatusOS = "Recusado";

-- Qual o maior e o menor valor de uma OS? E o valor médio gastado pelos clientes?
SELECT max(valor) AS Maior_valor, min(valor) AS Menor_Valor, round(avg(valor), 2) AS Ticket_Médio FROM ordemservico;

-- Qual a soma dos valor gastos em OS por cada cliente da oficina?
SELECT c.nome, sum(valor) AS Valor_Gasto_em_OS 
	FROM ordemservico os INNER JOIN veiculo v ON os.OSPlacaVeiculo = v.Placa INNER JOIN cliente c ON v.IdCliente = c.CPF 
		GROUP BY c.CPF ORDER BY sum(valor) DESC;
        
-- Quais os clientes que gastaram, no total, mais de R$ 2000 em Ordem de Serviço?
SELECT c.nome 
	FROM ordemservico os INNER JOIN veiculo v ON os.OSPlacaVeiculo = v.Placa INNER JOIN cliente c ON v.IdCliente = c.CPF 
		GROUP BY c.CPF HAVING sum(valor) >= 2000 ORDER BY c.nome;