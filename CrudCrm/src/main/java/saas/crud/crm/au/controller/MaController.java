package saas.crud.crm.au.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MemCompanyDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.service.MemCompanyService;
import saas.crud.crm.au.service.UserService;

@Controller
public class MaController {
	
	private static final Logger logger = LoggerFactory.getLogger(MaController.class);
	// 회원사 정보 등록 수정 삭제
	@Autowired
	private MemCompanyService memCompanyService;
	// LIST
	@RequestMapping(value = "/ma/mc", method=RequestMethod.GET)
	public ModelAndView authMemCompanyList(HttpServletRequest request) {
		ModelAndView mView = memCompanyService.memCompanyList(request);
		mView.setViewName("au/ma/mc/masterList");
		return mView;
	}
	// LIST
	@RequestMapping(value = "/ma/mc", method=RequestMethod.POST)
	public ModelAndView authMemCompanySearchList(HttpServletRequest request) {
		ModelAndView mView = memCompanyService.memCompanyList(request);
		mView.setViewName("au/ma/mc/masterList");
		return mView;
	}
	// READ
	@RequestMapping(value="/ma/mc/{siteId}",method=RequestMethod.GET)
	public ModelAndView authMemCompanyRead(@PathVariable int siteId, HttpServletRequest request) {
		ModelAndView mView = memCompanyService.memCompanyRead(request, siteId);
		mView.setViewName("au/ma/mc/masterRead");
		return mView;
	}
	// UPDATE 화면
	@RequestMapping(value="/ma/mc/post/{siteId}",method=RequestMethod.GET)
	public ModelAndView authMemCompanyUpdate(@PathVariable int siteId, HttpServletRequest request) {
		ModelAndView mView = memCompanyService.memCompanyRead(request, siteId);
		mView.setViewName("au/ma/mc/masterUpdate"); 
		return mView;
	}
	//UPDATE 실행
	@RequestMapping(value="/ma/mc/post/{siteId}",method=RequestMethod.PUT)
	public ModelAndView authMemCompanyUpdateSet(@ModelAttribute MemCompanyDto memCompanyDto,HttpServletRequest request) {
		memCompanyService.memComapnyUpdate(request, memCompanyDto);
		
		ModelAndView mView = new ModelAndView();
		int siteId = memCompanyDto.getSiteid();
		mView.setViewName("redirect:/ma/mc/"+siteId);
		return mView;
	}
	// INSERT 화면
	@RequestMapping(value="/ma/mc/post", method=RequestMethod.GET)
	public ModelAndView authMemCompanyInsert() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("au/ma/mc/masterInsert");
		return mView;
	}
	// INSERT 실행
	@RequestMapping(value="/ma/mc/post", method=RequestMethod.POST)
	public ModelAndView authMemCompanyInsertSet(@ModelAttribute MemCompanyDto memCompanyDto,HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		int siteid = memCompanyService.memCompanyInsert(request,memCompanyDto);
		
		mView.setViewName("redirect:/ma/"+siteid);
		
		return mView;
	}
	// INSERT 실행
	@RequestMapping(value="/ma/mc/{siteId}", method=RequestMethod.POST)
	public ModelAndView authMemCompanyDelete(@PathVariable int siteId,HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		memCompanyService.memCompanyDelete(request,siteId);
		
		mView.setViewName("redirect:/ma/mc");
		return mView;
	}
	// LIST에서 멀티 삭제
	@RequestMapping(value="/ma/mc/delete", method=RequestMethod.POST)
	public ModelAndView authMemCompanyMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		memCompanyService.memCompanyMultiDelete(request);
		
		mView.setViewName("redirect:/ma/mc");
		return mView;
	}
	
	
	
}
