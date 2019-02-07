package saas.crud.crm.au.controller;

import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.MemCompanyDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.CompanyService;

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	// 회원사 정보 등록 수정 삭제
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private CodeService codeService;
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
		//ModelAndView mView = companyService.companyRead(request, siteId);
		
		Map<String,Object> code = codeService.getCode();
		
		ModelAndView mView = companyService.companyRead(request, siteId);
		
		mView.addAllObjects(code);
		mView.setViewName("au/ma/mc/masterUpdate"); 
		return mView;
	}

	// 회원사 UPDATE 실행
	@RequestMapping(value="/ma/company/post/{siteId}",method=RequestMethod.POST)
	public ModelAndView authCompanyUpdateSet(@ModelAttribute CompanyDto CompanyDto,HttpServletRequest request, HttpServletResponse response,
			@RequestParam("files") MultipartFile file) {
		companyService.comapnyUpdate(request, response, CompanyDto, file);	
		ModelAndView mView = new ModelAndView();
		int siteId = CompanyDto.getSiteid();
		mView.setViewName("redirect:/ma/company/"+siteId);
		return mView;
	}
	
	// 회원사 INSERT 화면
	@RequestMapping(value="/ma/company/post", method=RequestMethod.GET)
	public ModelAndView authCompanyInsert(@ModelAttribute CompanyDto CompanyDto) {
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code  =codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("au/ma/mc/masterInsert");
		return mView;
	}
	// 회원사 INSERT 실행
	@RequestMapping(value="/ma/company/post", method=RequestMethod.POST)
	public ModelAndView authCompanyInsertSet(HttpServletResponse response, @ModelAttribute CompanyDto CompanyDto,HttpServletRequest request,
			@RequestParam("files") MultipartFile file) {
		ModelAndView mView = new ModelAndView();
		int siteid = companyService.companyInsert(response,request,CompanyDto, file);
		
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
	@ResponseBody
	public int authComapnyLicense(HttpServletRequest request,@PathVariable int siteid) {
		companyService.companyLicenseInsert(request,siteid);
		
		return 0;
	}
	//회원사 관리 admin 비밀번호 초기화
	@RequestMapping(value="/adminpwdreset/{siteId}", method=RequestMethod.GET)
	public ModelAndView adminPwdReset (HttpServletRequest request, @PathVariable int siteId) {
		ModelAndView mView = companyService.adminPwdReset(request, siteId);
		mView.setViewName("au/myinforesult");
		return mView;
	}
	
	@RequestMapping(value="/ma/company/licensecnt",method=RequestMethod.GET)
	@ResponseBody
	public int authCompanyLicenseCnt(HttpServletRequest request) {
		
		int cnt = companyService.licenseCnt(request);
		
		return cnt;
	}
	
}
