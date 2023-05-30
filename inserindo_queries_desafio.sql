use ecommerce2;

-- inserindo cliente pf

insert into clientePf (idCliente, nome, sobrenome, cpf, endereco, dataNascimento) values
			(1, 'Leonardo', 'Souto', 12345678901, 'Rua dias da cruz 234', '2002/05/06'),
            (2, 'Antonio' , 'Silva', 09876543210, 'Rua trinta, 235', '2001/06/12'),
            (3, 'Camila', 'Pereira', 12345698701, 'Rua vinte, 236', '2000/03/17'),
            (4, 'Luiz', 'da Silva', 13246578901, 'Rua quarenta, 237', '1999/09/25'),
            (5, 'Júlia', 'Suares', 12365478912, 'Rua cinquenta, 238', '2002/08/08');
            
-- inserindo cliente pj

insert into clientePj (idCliente, cnpj, razaoSocial, nomeFantasia, endereco) values
			(6, 1287907543, 'Loja de roupas', 'Nike', 'Rua noventa, 34'),
            (7, 7478939293, 'Loja de eletronicos', 'Pichau', 'Rua cem, 45'),
            (8, 6766349022, 'Loja de alimento', 'Lindt', 'Rua trinta, 23');
            
            
-- inserindo cliente
insert into cliente (login, senha) values
			('usuario1', 'senha123'),
            ('usuario2', 'senha1234'),
            ('usuario3', 'senha321');

-- inserindo produto

insert into produto (produtoNome, categoria, valor) values
			('Chuteira Nike', 'Roupas', 200,00),
            ('Pc gamer', 'Eletronico', 5000,00),
            ('Chocolate Lindt', 'Alimentos', 50,00);
            
-- inserindo pagamento

insert into pagamento (formaPagamento) values
			('pix'),
            ('cartao'),
            ('boleto');
            
-- inserindo pedido

insert into pedido (idCliente, idPagamento, statusP, frete) values
			(1, 2, 'Em andamento', default),
            (2, 3, 'Enviado', 10),
            (5, 6, 'Entregue', default),
            (6, 7, 'Em processamento', 15);

-- inserindo estoque

insert into estoque(localEstoque, quantidade) values
			('Rua sessenta, 35', default),
            ('Rua vinte, 34', 50),
            ('Rua trinta, 323', 20);
            
-- inserindo fornecedor
insert into fornecedor(razaoSocial, nomeFantasia, cnpj, contato, endereco) values
			('Loja eletronicos2','Pichau1', 3328948029, 21997735963, 'Rua oitenta,576'),
            ('Loja de roupas1', 'Adidas', 6585868838, 21955632390, 'Rua treze, 456'),
            ('Loja de alimentos','Cacau Show', 785854790, 21950972087, 'Rua dez, 342');
            
-- inserindo produto/estoque

insert into produtoEstoque (idEstoque, idProduto) values
			(1,1),
            (2,3),
            (3,4),
            (5,6);
            
-- inserindo produto/pedido

insert into produtoPedido (idPedido, idProduto, quantidade) values
			(1,1,10),
            (2,2,1),
            (4,5,3),
            (5,6,2);
            
-- inserindo produto/fornecedor

insert into produtoFornecedor (idFornecedor, idProduto, quantidade) values
			(1,1, 100),
            (2,2, 50),
            (4,5,300),
            (5,6,200);
            
-- inserindo entrega

insert into entrega (idPedido, statusE) values
			(1, 'enviado'),
            (2, 'entregue'),
            (4, 'em processamento'),
            (3, 'em processamento');
