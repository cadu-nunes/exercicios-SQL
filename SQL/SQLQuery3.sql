

use LojaDB
go


-- EX1
-- a
select Pedidos.pedidoID, clientes.NomeCliente from clientes
inner join pedidos on clientes.clienteID = pedidos.clienteID
go


-- b
select pedidos.pedidoID, clientes.NomeCliente, pedidos.DataPedido from clientes
inner join pedidos on clientes.clienteID = pedidos.clienteID
go


-- EX2
-- a
select clientes.NomeCliente, pedidos.pedidoID from clientes
left join
pedidos on clientes.clienteID = pedidos.clienteID
go


-- b
select clientes.NomeCliente, clientes.Cidade, pedidos.pedidoID from clientes
left join
pedidos on clientes.clienteID = pedidos.clienteID
go


-- EX3
-- a
select distinct clientes.NomeCliente from clientes
union
Select distinct Clientes.NomeCliente from Pedidos
inner join clientes on pedidos.clienteID = Clientes.ClienteID
go


-- b
select distinct clientes.NomeCliente, clientes.Cidade from clientes
union
Select distinct Clientes.NomeCliente, clientes.Cidade from Pedidos
inner join clientes on pedidos.clienteID = Clientes.ClienteID
go


-- EX4
-- a
select clientes.NomeCliente from Clientes
union all
select clientes.NomeCliente from pedidos
inner join clientes on pedidos.clienteID = clientes.clienteID
go


-- b
select NomeCliente, count(*) as Numeros from (select clientes.nomecliente from clientes
union all
select clientes.NomeCliente from pedidos
inner join clientes on pedidos.clienteID = clientes.clienteID) as restultado_uniao
group by NomeCliente
go


-- EX5
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


select clientes.NomeCliente, Produtos.NomeProduto, Detalhespedidos.Quantidade, Pedidos.DataPedido from clientes
inner join pedidos
on clientes.clienteID = pedidos.clienteID
inner join detalhespedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos
on detalhesPedidos.ProdutoID = produtos.ProdutoID
order by Pedidos.DataPedido desc


select Clientes.NomeCliente, count(Pedidos.PedidoID) as TotalPedidos
from Clientes
left join Pedidos on Clientes.ClienteID = Pedidos.ClienteID
group by Clientes.NomeCliente;


select clientes.NomeCliente, sum(DetalhesPedidos.Quantidade) as TotalItens
from clientes
inner join pedidos
on clientes.clienteID = pedidos.clienteID
inner join detalhespedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
group by Clientes.NomeCliente;


select clientes.NomeCliente, sum(DetalhesPedidos.Quantidade * Produtos.Preco) as TotalGasto
from clientes 
inner join pedidos
on clientes.clienteID = pedidos.clienteID
inner join detalhespedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos
on detalhesPedidos.ProdutoID = produtos.ProdutoID
group by Clientes.NomeCliente;


select Produtos.NomeProduto, sum(DetalhesPedidos.Quantidade) as QuantidadeVendida
from Clientes
inner join pedidos
on clientes.clienteID = pedidos.clienteID
inner join detalhespedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos
on detalhesPedidos.ProdutoID = produtos.ProdutoID
group by Produtos.NomeProduto
order by QuantidadeVendida desc;


select Produtos.NomeProduto, sum(DetalhesPedidos.Quantidade) as QuantidadeVendida
from Produtos
inner join detalhespedidos
on Produtos.ProdutoID = detalhespedidos.ProdutoID
group by Produtos.NomeProduto
order by QuantidadeVendida desc;


select Pedidos.DataPedido, sum(DetalhesPedidos.Quantidade * Produtos.Preco) as Faturamento
from Pedidos
inner join DetalhesPedidos
on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos
on detalhesPedidos.ProdutoID = produtos.ProdutoID
group by Pedidos.DataPedido
order by Pedidos.DataPedido desc;


