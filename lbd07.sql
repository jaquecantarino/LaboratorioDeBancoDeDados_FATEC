use lbd;

/*create table vendedor(
    codigo bigint primary key auto_increment,
	nome varchar (100) not null,
	email varchar (100) not null,
    telefone varchar(30) default 'SEM TELEFONE',
	comissao decimal(10,2) default 0.05
);*/

/*insert into vendedor (nome, email, telefone, comissao) 
values ('Ana','ana@email.com', 985476598, default);
insert into vendedor (nome, email, telefone, comissao) 
values ('Barbara','barbara@email.com', 457896321, default);
insert into vendedor (nome, email, telefone, comissao) 
values ('Cal','cal@email.com', 974859145, default);
insert into vendedor (nome, email, telefone, comissao) 
values ('Daniela','daniela@email.com', 874596258, default);
insert into vendedor (nome, email, telefone, comissao) 
values ('Eric','eric@email.com', 974159658, default);*/

-- alter table cliente ADD email varchar(70); /* adicionei o campo e-mail na tabela criada no lbd06 para reaproveitar*/
/*UPDATE do novo dado na coluna*/
/*update cliente set email='alfreds@email.com' where codigoCliente=1;
update cliente set email='anajulia@email.com' where codigoCliente=2;
update cliente set email='antonio@email.com' where codigoCliente=3;*/

select*from cliente;

/*1-Faça o union das tabelas cliente e vendedor extraia 
os camos nome e email ordernando pelo nome de forma crescente*/
/*select nome, email, 'vendedor' as tipo from vendedor
union /*união que remove os duplicados*/
/*select nome, email, 'cliente' as tipo from cliente
order by nome asc;*/

/*2-Faça o union all das tabelas cliente e vendedor extraia os camos nome e email*/
/*select nome, email, 'vendedor' as tipo  from vendedor
union all select nome, email, 'cliente' as tipo from cliente;*/

/*3-Faça o except das tabelas cliente e vendedor extraia os camos nome e email*/
	/*Mostra todas as linhas da tabela A que não faz parte da tabela B*/
/*select nome, email from vendedor 
where (nome, email) not in (select nome, email from cliente);*/

/*4-Faça o intersect das tabelas cliente e vendedor extraia os camos nome e email*/
/*Mostra os registros que as duas tabelas tem em comum.*/
/*select nome, email from vendedor 
where (nome, email) in (select nome, email from cliente);*/






