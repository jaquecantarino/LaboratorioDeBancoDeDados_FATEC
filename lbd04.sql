-- use vendedor;

/* use vendedor;
 create table vendedor (
codigo int auto_increment,
vendedor varchar (30) not null,
telefone varchar(9) not null,
comissao int(3),
primary key (codigo)
); */

-- select * from vendedor
/* use vendedor;
insert into vendedor (vendedor, telefone, comissao) values ("Mario", "988559977", '20');*/

/* 1- Altere o campo comissao da tabela vendedor aumentando em 10% */
-- update vendedor set comissao='10' where codigo=1; 

-- select * from vendedor

-- use lbd;
-- select * from cliente;

-- update cliente set idade = idade + 1 where cidade = "São Paulo";
/* Altere o campo idade da tabela cliente somando + 1 quando a cidade for são paulo */

/* use vendedor;
insert into vendedor (vendedor, telefone, comissao) values ("João", "947853269", '10');
insert into vendedor (vendedor, telefone, comissao) values ("Maria", "945715894", '12');
insert into vendedor (vendedor, telefone, comissao) values ("José", "947896523", '17');
insert into vendedor (vendedor, telefone, comissao) values ("Ana", "974589631", '21'); */
/*use vendedor;
delete from vendedor where codigo = 1;

use lbd;
delete from cliente where codigo = 1;*/
/*Remova um registro de cada tabela usando a chave*/

rollback; -- cancela comandos da transação
commit; -- efetiva comandos da transação
/*Utilize os comandos de DTL*/

