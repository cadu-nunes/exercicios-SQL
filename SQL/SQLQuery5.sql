use ContosoRetailDW;

select 
	FirstName as 'Nome',
	LastName as 'Sobrenome',
	EmailAddress as 'E-mail',
	CONCAT(FirstName, ' ', LastName) as 'Nome Completo'
from
	DimCustomer

select
	ProductName as 'Produto',
	UnitPrice as 'Preço',
	left(StyleName, 7) as 'cod 1',
	right(StyleName, 7) as 'cod 2'
from
	DimProduct

select
	concat(FirstName, ' ', LastName) as 'Nome Completo',
	gender as 'Sexo (Abrev)',
	replace(replace(gender, 'M', 'Masculino'), 'F', 'Feminino') as 'Sexo (Extenso)'
from
	DimCustomer

create table Clientes(
nome varchar(255),
Telefone varchar(20));
insert into Clientes (Nome, Telefone) values
('João da Silva', '(11) 987654321'),
('Maria Oliveira', '11.98765.4321'),
('Carlos Pereira', '11 98765 4321'),
('Ana Souza', '11-98765-4321');

select * from Clientes;

select translate(Telefone, '().-','    ') as telefone_padronizado from Clientes;

select 
stuff(stuff(stuff(stuff('5511987654321', 1, 0, '('), 4, 0, ')'), 8, 0, ' '), 14, 0, '-');

select
	upper(FirstName) as 'NOME',
	lower(FirstName) as 'nome',
	EmailAddress as 'E-mail'
from
	DimCustomer

select 'Raquel Moreno' as 'Nome'
select CHARINDEX('Moreno', 'Raquel Moreno') as 'Posição Sobrenome'
select SUBSTRING('Raquel Moreno', 8, 6) as 'Sobrenome'

declare @varCodigo varchar(50)
set @varCodigo = 'ABC123'	

select
	TRIM(@varCodigo) as 'Trim',
	LTRIM(@varCodigo) as 'Ltrim',
	RTRIM(@varCodigo) as 'Rtrim'

declare @varData datetime
set @vardata = '18/05/2020'

select
	day(@varData ) as 'Dia',
	month(@vardata) as 'Mês',
	year(@vardata) as 'Ano'

declare @varDia int, @varMes int, @varAno int
set @vardia = 29
set @varMes = 12
set @varAno = 2020

select
	DATEFROMPARTS(@varAno, @varMes, @varDia) as 'Data'

select getdate()
select sysdatetime()

select
	datename(day, '17-08-2025') as 'Dia',
	datename(dayofyear, '17-08-2025') as 'Dia do ano',
	datename(DW, '17-08-2025') as 'Nome Dia',
	datename(quarter, '17-08-2025') as 'Trimestre',
	datename(YY, '17-08-2025') as 'Ano'

declare @varData1 datetime, @varData2 datetime, @vardata3 datetime
set @varData1 = '10/07/2020'
set @vardata2 = '05/03/2020'
set @vardata3 = '14/11/2020'

select
	dateadd(month, -1, @vardata1) as 'Dateadd'

select
	datediff(day, @vardata2, @vardata3) as 'Dateadd'

