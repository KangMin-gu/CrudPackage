package saas.crud.crm.au.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.au.dto.ProductDto;

public interface ProductService {
	
	public List<ProductDto> getProductB(HttpServletRequest request);
	
	public List<ProductDto> getUpperProduct(HttpServletRequest request,int productNo);

}