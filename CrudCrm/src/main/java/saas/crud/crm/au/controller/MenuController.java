package saas.crud.crm.au.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MemCompanyDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.service.MenuService;

@Controller
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(MaController.class);
	// 회원사 정보 등록 수정 삭제
	@Autowired
	MenuService menuService;
	// LIST
	@RequestMapping(value = "/ma/me", method=RequestMethod.GET)
	public ModelAndView authMenuList(HttpServletRequest request) {
		ModelAndView mView = menuService.menuList(request);
		mView.setViewName("au/ma/me/menuList");
		return mView;
	}
	@RequestMapping(value = "/ma/me", method=RequestMethod.POST)
	public ModelAndView authMenuSearchList(HttpServletRequest request) {
		ModelAndView mView = menuService.menuList(request);
		mView.setViewName("au/ma/me/menuList");
		return mView;
	}
	@RequestMapping(value="/ma/me/{menuno}",method=RequestMethod.GET)
	public ModelAndView authMenuRead(HttpServletRequest request, @PathVariable int menuno) { 
		ModelAndView mView = menuService.menuRead(request, menuno);
		mView.setViewName("au/ma/me/menuRead");
		return mView;
	}
	//Insert 입력폼
	@RequestMapping(value = "/ma/me/post", method=RequestMethod.GET)
	public ModelAndView authMenuInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("au/ma/me/menuInsert");
		return mView;
	}
	@RequestMapping(value = "/ma/me/post", method=RequestMethod.POST)
	public ModelAndView authMenuInsertSet(HttpServletRequest request, @ModelAttribute MenuDto menuDto) {
		ModelAndView mView = new ModelAndView();
		
		int menuNo = menuService.menuInsert(request,menuDto);
		mView.setViewName("redirect:/ma/me/"+menuNo);
		return mView;
	}
	//Update 입력폼
	@RequestMapping(value = "/ma/me/post/{menuno}", method=RequestMethod.GET)
	public ModelAndView authMenuUpdate(HttpServletRequest request,@PathVariable int menuno) {
		ModelAndView mView = menuService.menuRead(request, menuno);
		mView.setViewName("au/ma/me/menuUpdate");
		return mView;
	}
	@RequestMapping(value="/ma/me/post/{menuno}",method=RequestMethod.PUT)
	public ModelAndView authMenuUpdateSet(@ModelAttribute MenuDto menuDto,HttpServletRequest request) {
		menuService.menuUpdate(request, menuDto);
		
		ModelAndView mView = new ModelAndView();
		int menuNo = menuDto.getMenuno();
		mView.setViewName("redirect:/ma/me/"+menuNo);
		
		return mView;
	}
	@RequestMapping(value="/ma/me/{menuno}", method=RequestMethod.POST)
	public ModelAndView authmenuDelete(HttpServletRequest request, @PathVariable int menuno) {
		menuService.menuDelete(request,menuno);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/ma/me");
		return mView;
	}
	
	@RequestMapping(value="/ma/me/delete", method=RequestMethod.POST)
	public ModelAndView authmenuMultiDelete(HttpServletRequest request) {
		menuService.menuMultiDelete(request);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/ma/me");
		return mView;
	}
	
}
