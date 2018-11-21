package saas.crud.crm.au.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.service.CompanyService;

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	// 회원사 정보 등록 수정 삭제
	@Autowired
	private CompanyService companyService;
	// 회원사 List
	@RequestMapping(value = "/ma/company", method=RequestMethod.GET)
	public ModelAndView authCompanyList(HttpServletRequest request) {
		ModelAndView mView = companyService.companyList(request);
		mView.setViewName("au/ma/mc/masterList");
		return mView;
	}
	// 회원사 List 검색
	@RequestMapping(value = "/ma/company", method=RequestMethod.POST)
	public ModelAndView authCompanySearchList(HttpServletRequest request) {
		ModelAndView mView = companyService.companyList(request);
		mView.setViewName("au/ma/mc/masterList");
		return mView;
	}
	// 회원사 상세 정보
	@RequestMapping(value="/ma/company/{siteId}",method=RequestMethod.GET)
	public ModelAndView authCompanyRead(@PathVariable int siteId, HttpServletRequest request) {
		ModelAndView mView = companyService.companyRead(request, siteId);
		mView.setViewName("au/ma/mc/masterRead");
		return mView;
	}
	// 회원사 UPDATE 화면
	@RequestMapping(value="/ma/company/post/{siteId}",method=RequestMethod.GET)
	public ModelAndView authCompanyUpdate(@PathVariable int siteId, HttpServletRequest request) {
		ModelAndView mView = companyService.companyRead(request, siteId);
		mView.setViewName("au/ma/mc/masterUpdate"); 
		return mView;
	}

	// 회원사 UPDATE 실행
	@RequestMapping(value="/ma/company/post/{siteId}",method=RequestMethod.PUT)
	public ModelAndView authCompanyUpdateSet(HttpServletResponse response,@ModelAttribute CompanyDto CompanyDto,HttpServletRequest request) {
		companyService.comapnyUpdate(response, request, CompanyDto);	
		ModelAndView mView = new ModelAndView();
		int siteId = CompanyDto.getSiteid();
		mView.setViewName("redirect:/ma/company/"+siteId);
		return mView;
	}
	// 회원사 INSERT 화면
	@RequestMapping(value="/ma/company/post", method=RequestMethod.GET)
	public ModelAndView authCompanyInsert() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("au/ma/mc/masterInsert");
		return mView;
	}
	// 회원사 INSERT 실행
	@RequestMapping(value="/ma/company/post", method=RequestMethod.POST)
	public ModelAndView authCompanyInsertSet(HttpServletResponse response, @ModelAttribute CompanyDto memCompanyDto,HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		int siteid = companyService.companyInsert(response,request,memCompanyDto);
		
		mView.setViewName("redirect:/ma/company/"+siteid);
		
		return mView;
	}
	// 회원사 단일 삭제
	@RequestMapping(value="/ma/company/{siteId}", method=RequestMethod.POST)
	public ModelAndView authCompanyDelete(@PathVariable int siteId,HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		companyService.companyDelete(request,siteId);
		
		mView.setViewName("redirect:/ma/company");
		return mView;
	}
	// 회원사 멀티 삭제
	@RequestMapping(value="/ma/company/delete", method=RequestMethod.POST)
	public ModelAndView authCompanyMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		companyService.companyMultiDelete(request);
		
		mView.setViewName("redirect:/ma/company");
		return mView;
	}
	
	// 회원사 라이센스 부여 팝업
	@RequestMapping(value="/ma/company/license/{siteid}", method=RequestMethod.GET)
	public ModelAndView authCompanyLicense(HttpServletRequest request, @PathVariable int siteid) {
	ModelAndView mView = companyService.companyRead(request, siteid);
	
	mView.setViewName("au/ma/mc/masterLiPopUp");
	
	return mView;
	}
	// 회원사 라이센스 부여
	@RequestMapping(value="/ma/company/license/{siteid}", method=RequestMethod.POST)
	public void authComapnyLicense(HttpServletRequest request,@PathVariable int siteid) {
		companyService.companyLicenseInsert(request,siteid);
	}
	
}
