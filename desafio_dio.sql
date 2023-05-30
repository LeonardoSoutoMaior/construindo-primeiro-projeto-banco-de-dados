create database ecommerce2;
use ecommerce2;

-- criando tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
    login varchar(20) not null unique,
    senha varchar(25) not null
);
alter table cliente auto_increment=1;

-- ctriando tabela cliente pf
create table clientePf(
	idClientePf int auto_increment primary key,
    idCliente int,
    nome varchar(30) not null,
    sobrenome varchar(45) not null,
    cpf char(11) not null,
    endereco varchar(200) not null,
    dataNascimento date not null,
    constraint cliente_pf_cpf unique (cpf, idCliente),
    constraint fk_pf_clienteTotal foreign key(idCliente) references cliente(idCliente)
);

-- criando tabela cliente pj
create table clientePj(
	idClientePj int auto_increment primary key,
    idCliente int not null,
    cnpj varchar(25) not null,
    razaoSocial varchar(45) not null,
    nomeFantasia varchar(45) not null,
    endereco varchar(200),
    constraint cliente_pj_cnpj unique (cnpj, idCliente),
    constraint fk_pj_clienteTotal foreign key (idCliente) references cliente(idCliente)
);

-- criando tabela produto
create table produto(
	idProduto int auto_increment primary key,
    produtoNome varchar(45),
    categoria enum('Roupas', 'Eletronico', 'Alimentos'),
    valor float not null
);

-- criando a tabela pagamento
create table pagamento(
	idPagamento int auto_increment primary key,
    formaPagamento enum('pix', 'cartao', 'boleto')
);

-- criando a tabela pedido
create table pedido(
	idPedido int auto_increment primary key,
    idCliente int,
    idPagamento int,
    statusP enum ('Em andamento', 'Em processamento', 'Enviado', 'Entregue'),
    frete float default 5,
    constraint fk_pedido_cliente foreign key (idPedido) references cliente(idCliente),
    constraint fk_pedido_pagamento foreign key (idPagamento) references pagamento (idPagamento)
);

-- criando a tabela estoque
create table estoque(
	idEstoque int auto_increment primary key,
    localEstoque varchar(200),
    quantidade float default 10
);

-- criando tabela fornecedor 
create table fornecedor(
	idFornecedor int auto_increment primary key,
    razaoSocial varchar(45) not null,
    nomeFantasia varchar(45) not null,
    cnpj varchar(30) not null,
    contato char(11) not null,
    endereco varchar(200),
    constraint cnpj_fornecedor unique (cnpj)
);


-- criando tabela produto/estoque
create table produtoEstoque(
	idEstoque int,
    idProduto int,
    constraint pk_produtoEstoque primary key (idEstoque, idProduto),
    constraint fk_produtoEstoque_estoque foreign key (idEstoque) references estoque (idEstoque),
    constraint fk_produtoEstoque_produto foreign key (idProduto) references produto (idProduto)
);

-- criando a tabela produto/pedido
create table produtoPedido(
	idPedido int,
    idProduto int,
    quantidade int,
    constraint pk_produtoPedido primary key (idPedido, idProduto),
    constraint fk_produtoPedido_pedido foreign key (idPedido) references pedido (idPedido),
    constraint fk_produtoPedido_produto foreign key (idProduto) references produto (idProduto)
);

-- criando tabela produto/fornecedor
create table produtoFornecedor(
	idFornecedor int,
    idProduto int,
    quantidade int not null,
    constraint pk_produtoFornecedor primary key (idFornecedor, idProduto),
    constraint fk_produtoFornecedor_fornecedor foreign key (idFornecedor) references fornecedor (idFornecedor),
    constraint fk_produtoFornecedor_produto foreign key (idProduto) references produto (idProduto)
);

-- criando tabela entrega
create table entrega(
	idEntrega int auto_increment primary key,
    idPedido int,
    statusE enum('em processamento', 'enviado', 'entregue'),
    constraint fk_entrega_pedido foreign key (idPedido) references pedido (idPedido)
);


