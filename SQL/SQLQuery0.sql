
	--EXERCÍCIOS MÓDULO 5

use ContosoRetailDW;

-- Ex1
select sum(SalesQuantity) as 'Quantidade Vendida', sum(ReturnQuantity) as 'Quantidade Devolvida'
from FactSales where ChannelKey = 1;

select*from DimEmployee


-- Ex2
select * from DimStore;

-- Ex3
-- a
select max(EmployeeCount) from DimStore;


-- b
select top(1) StoreName as 'Nom da Loja',
EmployeeCount as 'QTD. Funcionários'
from DimStore
Order by EmployeeCount DESC;


-- c
select min(EmployeeCount) from DimStore;


-- d
select top(1) StoreName as 'Nome da Loja', EmployeeCount as 'QTD. Funcioários'
from DimStore where EmployeeCount is not null
order by EmployeeCount;


-- Ex4
-- a
select
count(gender) as 'QtD. Funcionarios Masc'
from DimEmployee
where Gender ='M'


-- b
select
count(gender) as 'QtD. Funcionarios Fem'
from DimEmployee
where Gender ='F'


--Ex5
--a, b, c
select * from DimProduct

SELECT
    COUNT(DISTINCT ColorName) AS 'Quantidade de Cores Distintas',
    COUNT(DISTINCT BrandName) AS 'Quantidade de Marcas Distintas',
    COUNT(DISTINCT ClassName) AS 'Quantidade de Classes Distintas'
FROM DimProduct;


-- Retorna uma tabela resumo com o Total de funcionários para cada departamento.
select 
	DepartmentName,
	COUNT(DepartmentName) as 'Total de Funcionário'
from DimEmployee
group by DepartmentName


-- Agrupa a tabela DImStore de acordo com a contagem de funcionários e ordena de acordo com essa quantidade.
select 
	StoreType,
	sum(EmployeeCount) as 'Qtde. Total Funcionários'
from
	DimStore
group by StoreType
order by sum(EmployeeCount) desc


-- Cria um agrupamento por Cor do Produto, mas antes considera apenas os produtos de marca Contoso.
select
	ColorName as 'Cor do Produto',
	count(ColorName) as 'Qtd. Total'
from
	DimProduct
where BrandName = 'Contoso'
group by ColorName


-- Cria um agrupamento por Marca. Em seguida, é utilizado o HAVING para filtrar a tabela agrupada.
select 
	BrandName as 'Marca',
	count(BrandName) as 'Total Marca'
from
	DimProduct
group by BrandName
having count(BrandName) >= 200


--No código abaixo, antes de realizar o pagamento, consideramos apenas os produtos da classe 'Economy'. E após realizar o agrupamento, utiliza-se o HAVING para filtrar a tabela agrupada.
select 
	BrandName as 'Marca',
	count(BrandName) as 'Total Marca'
from
	DimProduct
where ClassName = 'Economy'			-- Filtra a tabela original, amtes do agrupamento.
group by BrandName
having count(BrandName) >= 200		-- Filtra a tabela depois de agrupada.


	--EXERCÍCIOS MÓDULO 6

--Ex1 FACTSALES
--a
select top (100) * from FactSales

select 
	ChannelKey as 'Canal de Venda',
	sum(SalesQuantity) as 'Total Vendido'
from 
	FactSales
group by ChannelKey


--b
select * from FactSales

select StoreKey,
	sum(SalesQuantity) as 'Quantidade Total Vendida',
	sum(ReturnQuantity) as 'Quantidade Total Devolvida'
from FactSales
group by StoreKey


--c
select * from FactSales

select ChannelKey, 
	sum(SalesAmount) as 'Valor Total Vendido'
from FactSales
where DateKey like '%2007%'
group by ChannelKey


--Ex2 FACTSALES
--a
select * from FactSales

select ProductKey as 'ID do Produto',
	sum(SalesAmount) as 'Faturamento Total'
from FactSales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) desc


--b
select * from FactSales

select top (10) ProductKey as 'ID do Produto',
	sum(SalesAmount) as 'Faturamento Total'
from FactSales
group by ProductKey
order by sum(SalesAmount) desc


--Ex3 FACTONLINESALES
--a
select * from FactOnlineSales

select top(1) CustomerKey,
	sum(TotalCost) 
from FactOnlineSales
group by CustomerKey
order by sum(SalesQuantity) desc


--b
select * from FactOnlineSales
 
select top(3) ProductKey,
	sum(TotalCost) 
from FactOnlineSales
where CustomerKey = '19037'
group by ProductKey
order by sum(SalesQuantity) desc


--Ex4 DIMPRODUCT
--a
select * from DimProduct

select BrandName, 
	count(ProductName) 
from DimProduct
group by BrandName;


--b
select * from DimProduct

select ClassName as 'Classe do Produto'	,
	avg(UnitPrice) as 'Preço Médio'
from DimProduct
group by ClassName


--c
select * from DimProduct

select ColorName as 'Cor',
	sum(Weight) as 'Peso Total'
from DimProduct
group by ColorName


--Ex5 DIMPRODUCT
select * from DimProduct

select StockTypeName as 'Tipo de Produto',
	sum(Weight) as 'Peso Total'
from DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(Weight) desc


--Ex6 DIMPRODUCT
select * from DimProduct

select BrandName as 'Nome da Marca',
	count(DISTINCT ColorName) as 'Cores'
from DimProduct
group by BrandName


--Ex7 DIMCUSTOMER
select * from DimCustomer

select Gender as 'Gênero',
	count(CustomerKey) as 'Total de Cliente'
from DimCustomer
where Gender is not null
group by Gender

select Gender as 'Gênero',
	count(CustomerKey) as 'Total de Cliente'
from DimCustomer
where Gender = 'M' or Gender = 'F'
group by Gender

select Gender as 'Gênero',
	count(CustomerKey) as 'Total de Cliente',
	avg(YearlyIncome) as 'Média Salarial'
from DimCustomer
where Gender is not null
group by Gender


--Ex8 DIMCUSTOMER
select * from DimCustomer

select Education as 'Nível Escolar',
	count(CustomerKey) as 'Qtd. de Clientes',
	avg(YearlyIncome) as 'Média Salarial'
from DimCustomer
where Education is not null
group by Education


--Ex9 DIMEMPLOYEE
select * from DimEmployee

select DepartmentName,
	count(EmployeeKey)
from DimEmployee
where status = 'Current' or EndDate is null
group by DepartmentName


--Ex10 DIMEMPLOYEE
select * from DimEmployee

select Title as 'Cargo',
	sum(VacationsHours)as 'Horas Totais'
from DimEmployee
where Gender = 'F' and 
	DepartmentName in ('Production', 'Marketing', 'Engineering', 'Finance') and
	HireDate between '1991-01-01' and '2000-12-31'
group by Title

