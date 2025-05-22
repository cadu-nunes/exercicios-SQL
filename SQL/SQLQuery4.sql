
use ContosoRetailDW


--Questão 1

	select productkey as 'ID produto', productname as 'Produto', ProductSubcategoryName as 'Subcategoria'
	from DimProduct
	inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	go

--Questão 2

	select DimProductSubcategory.*, DimProductCategory.ProductCategoryName
	from DimProductSubcategory
	left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;
	
--Questão 3

	select DimStore.StoreKey, DimStore.StoreName, DimStore.EmployeeCount, DimGeography.ContinentName, DimGeography.RegionCountryName
	from DimStore
	left join DimGeography
	on DimStore.GeographyKey = DimGeography.GeographyKey;
	
--Questão 4

	

--Questão 5

