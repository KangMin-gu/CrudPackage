package saas.crud.crm.au.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CodeDto;
import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.ProductDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.ProductService;
import saas.crud.crm.au.service.LicenseService;
import saas.crud.crm.au.service.MenuService;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product", method=RequestMethod.GET)
	@ResponseBody
	public List<ProductDto> authGoodsCode(HttpServletRequest request) {
		
		List<ProductDto> goodsB = productService.getProductB(request);
		
		return goodsB;
	}
	
	@RequestMapping(value="/product/upper/{productNo}",method=RequestMethod.GET)
	@ResponseBody
	public List<ProductDto> authUpperProduct(HttpServletRequest request,@PathVariable int productNo){
		
		List<ProductDto> upperProduct = productService.getUpperProduct(request,productNo);
		
		return upperProduct;
		
	}

}
