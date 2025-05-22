-- EXERCÍCIOS STRINGS E DATAS

--1 a)

use ContosoRetailDW;

SELECT 
    ProductName AS 'Nome do Produto',
	LEN(ProductName) as 'Qtde. Caracteres'
FROM 
	DimProduct
ORDER BY LEN(ProductName) DESC;

-- b)

SELECT 
    AVG(LEN(ProductName)) AS 'Média de Caracteres'
FROM DimProduct;


--c)

select * from DimProduct;

select 
	ProductName,
	BrandName,
	ColorName,
REPLACE(replace(ProductName, BrandName, ' '), ColorName, ' ') as 'Sem Informações Redidantes'
from DimProduct;

--d)

SELECT 
    AVG(LEN(REPLACE(replace(ProductName, BrandName, ' '), ColorName, ' '))) as 'Média de Caracteres'
FROM DimProduct

--2

SELECT
	ProductName,
	StyleName,
    TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') AS 'Novo Código' 
FROM DimProduct;

--3

SELECT
    CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	--FirstName + ' ' + LastName) AS 'Nome Completo',
    EmailAddress AS 'E-mail',
    LEFT(EmailAddress, CHARINDEX('@', EmailAddress)-1) AS 'Login',
    CONCAT(UPPER(FirstName), DATENAME(DAYOFYEAR, BirthDate)) AS 'Senha'
FROM DimEmployee;

--4

SELECT *FROM DimCustomer

SELECT 
    FirstName,
    EmailAddress,
    AddressLine1,
    DateFirstPurchase
FROM DimCustomer 
WHERE YEAR(DateFirstPurchase) = 2001
ORDER BY DateFirstPurchase;

--5

SELECT
    FirstName AS 'Nome',
    EmailAddress as 'E-mail',
    HireDate as 'Data de Contratação',
    DAY(HireDate) AS 'Dia_Contratacao',
    DATENAME(MONTH, HireDate) AS 'Mes_Contratacao',
    YEAR(HireDate) AS 'Ano_Contratacao'
FROM DimEmployee;

--6

SELECT TOP 1
    StoreKey,
	StoreName,
    DATEDIFF(DAY, OpenDate, GETDATE()) AS 'Dias em Atividade'
FROM DimStore 
ORDER BY 'Dias em Atividade' DESC;

--7

SELECT 
    STUFF(
        STUFF(
            REPLACE(TRANSLATE(Telefone, '().-', '    '), ' ', ''), 
            1, 0, '(' + LEFT(REPLACE(TRANSLATE(Telefone, '().-', '    '), ' ', ''), 2) + ') '
        ), 
        9, 0, '-'
    ) AS Telefone_Padronizado
FROM Clientes;




