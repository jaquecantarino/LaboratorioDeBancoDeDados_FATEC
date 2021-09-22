-- use lbd;

/*create table cliente(
codigoCliente bigint primary key auto_increment,
nome varchar(100),
contato varchar(50),
logradouro varchar(100),
cidade varchar(100),
cep varchar(8),
pais varchar(100) 
);*/

/*insert into cliente(nome, contato, logradouro, cidade, cep, pais)
values('Alfreds','Maria','Obere Str. 57','Berlin','12209','Germany');
insert into cliente(nome, contato, logradouro, cidade, cep, pais)
values('Ana Julia','Ana','Av. Nazare 2222','SP','5021','Brasil');
insert into cliente(nome, contato, logradouro, cidade, cep, pais)
values('Antonio Moreno','Antonio','Rua Bom Pastor','SP','5023','Brasil');*/

/*create table pedido(
codigo bigint primary key auto_increment,
codigoCliente bigint,
codigoVendedor bigint,
dataPedido timestamp,
codigoEntrega bigint,
foreign key (codigoCliente) references cliente(codigoCliente)
);*/

/*insert into pedido(codigoCliente, codigoVendedor, dataPedido, codigoEntrega)
values(1,1,curdate(), 1);
insert into pedido(codigoCliente, codigoVendedor, dataPedido, codigoEntrega)
values(1,2,curdate(), 2);
insert into pedido(codigoCliente, codigoVendedor, dataPedido, codigoEntrega)
values(2,1,curdate(), 3);*/

/*2-Faça o inner join entre as tabelas PEDIDO e CLIENTE, mostrando
 o codigo do pedido, data do pedido, nome do cliente*/
/*select p.codigo, p.dataPedido, c.nome from 
pedido p inner join cliente c
on p.codigoCliente=c.codigoCliente; */

/*3-Faça o LEFT JOIN  entre as tabelas PEDIDO e CLIENTE 
para mostrar os pedidos que não tem cadastro de cliente*/
/*select p.codigo, p.dataPedido, c.nome from 
pedido p left outer join cliente c
on p.codigoCliente=c.codigoCliente where nome is null; */

/*4-Faça o RIGHT JOIN  entre as tabelas PEDIDO e CLIENTE para
 mostrar os clientes que não tem pedido*/
/* select p.codigo, p.dataPedido, c.nome from 
pedido p right outer join cliente c
on p.codigoCliente=c.codigoCliente where p.codigo is null; */

/*5-Faça uma consulta do plano cartesiano das duas tabelas*/
-- select * from pedido, cliente;

 













