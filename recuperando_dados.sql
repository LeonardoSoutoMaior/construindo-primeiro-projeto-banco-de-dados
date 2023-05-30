-- mostrando a quantidade de clientes pf
select count(*) from clientepf;

-- qunatidade de produtos vendidos
select sum(quantidade) vendas from produtoPedido;

-- quantos pedidos foram feitos por cliente pf
select c.idCliente, login, count(*) as numero_pedidos from cliente as c
								inner join pedido as p on c.idCliente = p.idCliente
						group by idCliente;

-- algum fornecedor também é cliente pj?
select f.razaoSocial, f.cnpj, f.nomeFantasia from fornecedor f, clientePj c 
		where f.cnpj = c.cnpj;
        
-- Relação de nomes dos fornecedores e nomes dos produtos
select f.razaoSocial, f.nomeFantasia from fornecedor f
				inner join produtoFornecedor pf on idFornecedor = idFornecedor
		inner join produto p on p.idProduto = idProduto;