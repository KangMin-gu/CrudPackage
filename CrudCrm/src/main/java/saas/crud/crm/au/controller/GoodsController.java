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
import saas.crud.crm.au.dto.GoodsDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.GoodsService;
import saas.crud.crm.au.service.LicenseService;
import saas.crud.crm.au.service.MenuService;

@Controller
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="/goods/code", method=RequestMethod.GET)
	@ResponseBody
	public List<GoodsDto> authGoodsCode(HttpServletRequest request) {
		
		List<GoodsDto> goodsB = goodsService.getGoodsB(request);
		
		return goodsB;
	}

}
