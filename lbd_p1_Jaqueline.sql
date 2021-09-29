-- create database p1;

use p1;
-- 1-Criar todas as tabelas das entidades propostas no mer, adicionando as PKs e FKs e valores DEFAULT (1,0)

-- ingrediente extra
/*create table ingredientePizza(
    codigo bigint auto_increment,
	valorExtra decimal(10,2) default 0.00,
    primary key (codigo)
);*/

/*create table item(
	codigoItem bigint auto_increment,
    quantidade int(5),
    valorUnitario decimal(10,2),
    valorTotal decimal(10,2),
    primary key (codigoItem)
);*/

/*create table ingrediente(
    codigo bigint auto_increment,
    nome varchar(100),
	peso decimal(10,2) default 0.01,
	valor decimal(10,2) default 0.01,
    primary key (codigo),
    codigoIngredientePizza bigint default null,
	foreign key (codigo) references ingredientePizza (codigo)
);

create table produto(
    CodigoProduto bigint auto_increment,
    codigoIngrediente1 bigint default null, 
	codigoIngrediente2 bigint default null, 
	codigoIngrediente3 bigint default null, 
	codigoIngrediente4 bigint default null, 
	codigoIngrediente5 bigint default null, 
    nome varchar(100),
	valor decimal(10,2) default 0.01,
	primary key (CodigoProduto),
	foreign key (codigoIngrediente1) references ingrediente (codigo),
	foreign key (codigoIngrediente2) references ingrediente (codigo),
    foreign key (codigoIngrediente3) references ingrediente (codigo),
    foreign key (codigoIngrediente4) references ingrediente (codigo),
	foreign key (codigoIngrediente5) references ingrediente (codigo)
);

create table pedido(
    codigo bigint auto_increment,
	codigoItem bigint default null,
	codigoIngredientePizza bigint default null,
	codigoEntregador bigint default null, 
	codigoCliente bigint default null, 
	dataPedido timestamp default null,
    totalPedido decimal(10,2),
    statusPedido bigint (1), -- 1 para feito, 2 para entregue ou 3 para cancelado
    primary key (codigo),
	foreign key (codigoItem) references item (codigo),
	foreign key (codigoIngredientePizza) references IngredientePizza (codigo),
	foreign key (codigoEntregador) references entregador (codigo),
    foreign key (codigoCliente) references cliente (codigo)
);

create table cliente(
    codigo bigint auto_increment,
	nome varchar (100) not null,
	endereco varchar (100) not null,
    telefone varchar (30) default 'Sem Telefone',
    primary key (codigo)
);*/

/*create table entregador(
    codigoEntregador bigint auto_increment,
	nome varchar (100) not null,
    telefone varchar (30) default 'Sem Telefone',
	comissao decimal(10,2) default 0.05,
    primary key (codigoEntregador)
);*/

/* ---------------------------------------------------------------------------------------------------------------*/ 

-- 2-Insira almenos 5 registros para cada tabela criada, respeitando os relacionamentos (1,0)

-- insert into ingredientePizza (valorExtra) values (4.00);

/*insert into ingrediente values 
(default, 'calabresa', 100, 3.50, default), 1
(default, 'catupiry', 100, 4.00, default), 2
(default, 'milho', 100, 3.20, default), 3
(default, 'brócolis', 100, 2.80, default), 4
(default, 'bacon', 100, 7.50, default), 5
(default, 'mussarela', 100, 4.00, default), 6
(default, 'frango', 100, 6.00, default);7*/

/*insert into produto values 
(1, 6, default, default, default, 'toscana', 22.50),1
(1, default, default, default, default, 'mussarela', 25.50),2
(1, 6, 2, default, default, 'Lombo', 36.50),3
(5, 2, default, default, default, 'bacon', 31.50),4
(2, 3, 4, default, default, 'brocolis', 22.50);5*/

/*insert into item values 
-- (1, 2, 6.00, 29.00); -- cod, quantidade, valor unitario, valor total.
(4, 3, 6.00, 49.00),
(2, 4, 6.00, 55.00),
(3, 6, 6.00, 78.00),
(5, 7, 6.00, 140.00);*/

/*insert into cliente (nome, endereco, telefone) values
("Ana Silva", "Av Bandeirantes, 123. Centro. Sao Paulo-SP", "94587-9625"),
("Barbara Cirilo", "Rua Treze, 456. Jaragua. Sao Paulo-SP", "97896-4589"),
("Felipe Freire", "Rua Santos, 789. Centro. Sao Paulo-SP", "93458-9658"),
("Natalia Protasio", "Av Azul, 101. Autodromo. Sao Paulo-SP", "97489-5698"),
("Lucas Silva", "Av Campos, 121. Centro. Mogi das Cruzes-SP", "94152-6356");*/

/*insert into entregador (nome, telefone, comissao) values
('Alan Santos','97856-9689',15.00),
('Breno Silva','97845-9658',12.00),
('Carlos Luis','97458-1585',14.00),
('Daniel Souza','93695-8956',18.00),
('Eduardo Monaco','97489-5688',	17.00);*/
    
/*insert into pedido (codigoItem, codigoIngredientePizza, codigoEntregador, codigoCliente, dataPedido, totalPedido, statusPedido)
values 
(2, default, 1, 2, curdate(), 120.00, 1);
(5,default, 2, 1, curdate(), 45.00, 2),
(1, default, 3, 4, curdate(), 48.50, 3),
(3, default, 4, 3, curdate(), 34.80, 1),
(4, default, 5, 5, curdate(), 74.90, 2);*/

/* ---------------------------------------------------------------------------------------------------------------*/ 

/* -- 3-Extraia a informação de quantos pedidos os clientes fizeram, a soma dos pedidos e o valor medio gasto, 
-- caso o cliente ainda não tenha feito nenhum pedido, mostre estes campos de sumarização zerados. (1,0) */

select  c.codigoCliente as CodigoCliente, c.nome as NomeCliente, COUNT(p.codigoPedido) as QtdPedidoRealizado, 
if(p.totalPedido is not null, AVG(p.totalPedido), 0.0) as ValorMedioGasto
	from pedido p right outer join cliente c 
		on c.codigoCliente = p.codigoCliente 
			group by c.nome;
            
/* ---------------------------------------------------------------------------------------------------------------*/ 
           
-- 4-Extraia o total dos pedidos entregues, e a comissao calculada (comissão x total de pedidos) 
-- dos entregadores (1,0) 
 
select e.codigoEntregador as CodigoEntregador, e.nome as NomeEntregador, COUNT(p.statusPedido) as TotalPedidosEntregues, SUM(e.comissao) as TotalComissao
	from entregador e inner join pedido p
		on e.codigoEntregador = p.codigoEntregador where p.statusPedido = 2
			group by e.nome;
 
 /* ---------------------------------------------------------------------------------------------------------------*/ 
 
-- 5-Exiba quais produtos são mais vendidos
select i.codigoItem as CodigoItem, pr.CodigoProduto as CodigoProduto, pr.nome as NomeProduto, 
	COUNT(i.codigoProduto) as ProdutosMaisVendidos
		from pedido p 
			inner join item i on i.codigoProduto = p.codigoItem
			inner join produto pr on pr.codigoProduto = i.codigoProduto 
				group by pr.nome
					order by COUNT(i.codigoProduto) desc;

/* ---------------------------------------------------------------------------------------------------------------*/ 

-- 6-Exiba quais ingredientes são mais utilizados nos pedidos, mostrando o total utilizado 
-- nos pedidos e o valor gasto (1,0)
/*apresenta erro*/
 select distinct p.CodigoProduto as CodigoProduto, ing.nome, 'ingrediente' as tipo, count(p.codigoIngrediente) as quantidade, sum(totalPedido) as totalPedido, sum(valorTotal) as valorGasto
	from item i inner join pedido ped on ped.CodigoItem = i.CodigoProduto
				inner join produto p on p.CodigoProduto = i.CodigoProduto
				inner join ingrediente ing on ing.CodigoIngrediente = p.CodigoIngrediente
			group by nome
            order by nome;