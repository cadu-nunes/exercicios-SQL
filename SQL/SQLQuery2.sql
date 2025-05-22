

create database LojaDB
go

use LojaDB
go

create table Clientes (
ClienteId int primary key,
NomeCliente varchar(100),
Cidade varchar(50)
);

create table Categorias (
CategoriaID int primary key,
NomeCategoria varchar(100)
);

create table Produtos (
ProdutoID int primary key,
NomeProduto varchar(100),
CategoriaID int,
Preco decimal(10, 2),
foreign key (CategoriaID) references Categorias(CategoriaID)
);

create table Pedidos (
PedidoID int primary key,
ClienteID int,
ProdutoID int,
DataPedido date,
foreign key (ClienteID) references Clientes (ClienteID),
foreign key (ProdutoID) references Produtos (ProdutoID)
);
go

insert into Categorias (CategoriaID, NomeCategoria) values
(1, 'Eletrônicos'),
(2, 'Vestuário');
go

insert into Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) values
(1, 'Celular', 1, 1500.00),
(2, 'Televisão', 1, 3000.00),
(3, 'Camiseta', 2, 50.00);
go

insert into Clientes (ClienteID, NomeCliente, Cidade) values
(1, 'Maria Silva', 'São Paulo'),
(2, 'João Santos', 'Rio Janeiro'),
(3, 'Ana Costa', 'Belo Horizonte');
go


insert into Pedidos (PedidoID, ClienteID, ProdutoID, DataPedido) values
(1, 1, 1, '2024-01-15'),
(2, 2, 3, '2024-01-20'),
(3, 1, 2, '2024-02-10');
go

select * from Clientes;

select * from Produtos;

select * from Categorias;

select * from Pedidos;


--INNER JOIN

select Clientes.NomeCliente, Pedidos.DataPedido, Produtos.NomeProduto, Categorias.NomeCategoria
from Clientes
inner join Pedidos on Clientes.ClienteID = Pedidos.ClienteID
inner join Produtos on Produtos.ProdutoID = Pedidos.ProdutoID
inner join Categorias on Produtos.CategoriaID = Categorias.CategoriaID;
go


select Clientes.NomeCliente, Pedidos.DataPedido
from Clientes
left join Pedidos on Clientes.ClienteID = Pedidos.ClienteID;
go



select * from Clientes;

select * from Produtos;

select * from Categorias;

select * from Pedidos;

