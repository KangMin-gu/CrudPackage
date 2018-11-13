package saas.crud.crm.au.controller;

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

import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.service.LicenseService;
import saas.crud.crm.au.service.MenuService;

@Controller
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	// 회원사 정보 등록 수정 삭제
	@Autowired
	MenuService menuService;
	
	@Autowired
	LicenseService licenseService;
	// LIST
	@RequestMapping(value = "/menu", method=RequestMethod.GET)
	public ModelAndView authMenuList(HttpServletRequest request) {
		ModelAndView mView = menuService.menuList(request);
		mView.setViewName("au/ma/me/menuList");
		return mView;
	}
	@RequestMapping(value = "/menu", method=RequestMethod.POST)
	public ModelAndView authMenuSearchList(HttpServletRequest request) {
		ModelAndView mView = menuService.menuList(request);
		mView.setViewName("au/ma/me/menuList");
		return mView;
	}
	@ResponseBody
	@RequestMapping(value="/menu/{menuno}",method=RequestMethod.GET)
	public Map<String,Object> authMenuRead(HttpServletRequest request, @PathVariable int menuno) { 
		Map<String,Object> menuInfo = menuService.menuRead(request, menuno);
		return menuInfo;
	}
	@ResponseBody
	@RequestMapping(value = "/menu/post", method=RequestMethod.POST)
	public Map<String,Object> authMenuInsertSet(HttpServletRequest request, @ModelAttribute MenuDto menuDto) {

		
		int menuNo = menuService.menuInsert(request,menuDto);
		Map<String,Object> menuInfo = menuService.menuRead(request, menuNo);
		return menuInfo;
	}
	@ResponseBody
	@RequestMapping(value="/menu/post/{menuno}",method=RequestMethod.POST)
	public Map<String,Object> authMenuUpdateSet(@ModelAttribute MenuDto menuDto,HttpServletRequest request) {
		menuService.menuUpdate(request, menuDto);
		
		int menuNo = menuDto.getMenuno();
		Map<String,Object> menuInfo = menuService.menuRead(request, menuNo);
		return menuInfo;
	}
	@ResponseBody
	@RequestMapping(value="/menu/{menuno}", method=RequestMethod.POST)
	public Map<String,Object> authmenuDelete(HttpServletRequest request, @PathVariable int menuno) {
		menuService.menuDelete(request,menuno);
		
		Map<String,Object> menuInfo = menuService.menuRead(request, menuno);
		return menuInfo;
		
		
	}
	
	@RequestMapping(value="/menu/delete", method=RequestMethod.POST)
	public ModelAndView authmenuMultiDelete(HttpServletRequest request) {
		menuService.menuMultiDelete(request);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/menu");
		return mView;
	}
	
}
