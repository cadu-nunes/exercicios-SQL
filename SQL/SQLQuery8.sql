
use ContosoRetailDW

select
productkey,
productname,
case
when classname = 'Economy' then '5%'
when classname = 'Regular' then '7%'
when classname = 'Deluxe' then '9%'
else '0%'
end as 'Desconto',
case
when classname = 'Economy' then UnitPrice*1.005
when classname = 'Regular' then UnitPrice*1.007
when classname = 'Deluxe' then UnitPrice*1.009
end as 'Preço com desconto'
from DimProduct
go

-- b
declare @varEco int, @varRegu int, @varDelu int
set @vareco = '5'
set @varregu = '7'
set @varDelu = '9'

select
productkey,
productname,
case
when classname = 'Economy' then @varEco
when classname = 'Regular' then @varRegu
when classname = 'Deluxe' then @varDelu
else '0%'
end as 'Desconto',
case
when classname = 'Economy' then UnitPrice*(1+(@varEco/100))
when classname = 'Regular' then UnitPrice*(1+(@varRegu/100))
when classname = 'Deluxe' then UnitPrice*(1+(@varDelu/100))
end as 'Preço com desconto'
from DimProduct
go

-- 2
select*from DimProduct
select BrandName as 'Marca',
case
when count(*) >= 500 then 'Categoria A'
when count(*) >= 100 then 'Categoria B'
else 'Categoria C'
end as 'Categoria'
from dimproduct
group by Brandname
go

-- 3
select Storename as 'Nome da Loja', EmployeeCount as 'Qtd. Funcionários',
case
when employeecount >= 50 then 'Acima de 50 funcionarios'
when employeecount >= 40 then 'Entre 40 e 49 funcionarios'
when employeecount >= 30 then 'Entre 30 e 39 funcionarios'
when employeecount >= 20 then 'Entre 20 e 29 funcionarios'
when employeecount >= 10 then 'Entre 10 e 19 funcionarios'
else 'Abaixo de 10 funcionarios'
end as 'Categoria'
from DimStore
go

-- 4
select
productsubcategoryname as 'Nome Subcategoria',
round(avg(weight)*100, 2) as 'Peso total',
case
when round(avg(weight) * 100, 2) >= 100 then 'Rota 2'
else 'Rota 1'
end as 'Rota'
from
Dimproduct
inner join dimproductsubcategory
on dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey
inner join dimproductcategory
on dimproductsubcategory.productcategorykey = dimproductcategory.productcategorykey
group by productsubcategoryname
go

-- 5
select Firstname as 'Nome', gender as 'sexo', totalchildren as 'Qtd. Filhos', emailaddress as 'E-mail',
case
when gender = 'F' and totalchildren > 0 then 'Sorteio Mãe do Ano'
when gender = 'M' and totalchildren > 0 then 'Sorteio Pai do Ano'
else 'Caminhão de Prêmios'
end as 'Ação de marketing'
from dimcustomer
go

-- 6
select * from DimStore

select Storename, OpenDate, CloseDate,
case
when CloseDate is null then datediff(day, opendate, getdate()) 
else datediff(day, opendate, CloseDate)
end as 'Dias de Atividade'
from dimstore
go

