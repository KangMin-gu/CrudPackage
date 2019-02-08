package saas.crud.crm.au.dao;

import java.util.List;

import saas.crud.crm.au.dto.ProductDto;

public interface ProductDao {
	
	public List<ProductDto> getProductB(ProductDto productDto);
	
	public List<ProductDto> getUpperProduct(ProductDto productDto);

}
