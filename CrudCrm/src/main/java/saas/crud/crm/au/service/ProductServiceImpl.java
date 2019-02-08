package saas.crud.crm.au.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saas.crud.crm.au.dao.ProductDao;
import saas.crud.crm.au.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<ProductDto> getProductB(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ProductDto productDto = new ProductDto();
		productDto.setSiteid(siteId);
		
		List<ProductDto> productB = productDao.getProductB(productDto);

		return productB;
	}
	
	@Override
	public List<ProductDto> getUpperProduct(HttpServletRequest request,int productNo){
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ProductDto productDto = new ProductDto();
		productDto.setSiteid(siteId);
		productDto.setUpperprdno(productNo);
		
		List<ProductDto> upperProduct = productDao.getUpperProduct(productDto);
		
		return upperProduct;
		
	}

}
