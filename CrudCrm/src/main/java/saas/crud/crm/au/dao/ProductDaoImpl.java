package saas.crud.crm.au.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ProductDto> getProductB(ProductDto productDto) {
		List<ProductDto> productB = session.selectList("product.getProductB",productDto);
		return productB;
	}
	
	@Override
	public List<ProductDto> getUpperProduct(ProductDto productDto){
		List<ProductDto> upperProduct = session.selectList("product.upperProduct",productDto);
		return upperProduct;
	}

}
