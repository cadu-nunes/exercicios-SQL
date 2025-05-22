use LojaDB

-- 1
-- a
select pedidos.pedidoID, clientes.NomeCliente from clientes
inner join pedidos on clientes.clientID = pedidos.clientID
go

-- b
select pedidos.pedidoID, clientes.NomeCliente, pedidos.DataPedido from clientes
inner join pedidos on clientes.clientID = pedidos.clientID
go

-- 2
-- a
select clientes.NomeCliente, pedidos.pedidoID from clientes
left join
pedidos on clientes.clientID = pedidos.clientID
go

-- b
select clientes.NomeCliente, clientes.Cidade, pedidos.pedidoID from clientes
left join
pedidos on clientes.clientID = pedidos.clientID
go

-- 3
-- a
select distinct clientes.NomeCliente from clientes
union
Select distinct Clientes.NomeCliente from Pedidos
inner join clientes on pedidos.clientID = Clientes.ClientID
go

-- b
select distinct clientes.NomeCliente, clientes.Cidade from clientes
union
Select distinct Clientes.NomeCliente, clientes.Cidade from Pedidos
inner join clientes on pedidos.clientID = Clientes.ClientID
go

-- 4
-- a
select clientes.NomeCliente from Clientes
union all
select clientes.NomeCliente from pedidos
inner join clientes on pedidos.clientID = clientes.clientID
go
-- b
select NomeCliente, count(*) as Numeros from (select clientes.nomecliente from clientes
union all
select clientes.NomeCliente from pedidos
inner join clientes on pedidos.clientID = clientes.clientID) as restultado_uniao
group by NomeCliente
go

-- 5
create table detalhespedidos (
detalheID int primary key,
pedidoID int,
produtoID int,
quantidade int,
foreign key (pedidoID) references pedidos (pedidoID),
foreign key (ProdutoID) references produtos (produtoID)
);
go



insert into detalhesPedidos (detalheID, pedidoID, produtoID, quantidade)
values
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 5), 
(4, 3, 2, 2); 
go

select clientes.NomeCliente, produtos.NomeProduto, Detalhespedidos.Quantidade, Pedidos.DataPedido from clientes
inner join pedidos
on clientes.clientID = pedidos.clientID
inner join detalhespedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos
on detalhesPedidos.ProdutoID = produtos.ProdutoID
order by Pedidos.DataPedido desc