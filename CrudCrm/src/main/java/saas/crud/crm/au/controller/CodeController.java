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

import saas.crud.crm.au.dto.CodeDto;
import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.LicenseService;
import saas.crud.crm.au.service.MenuService;

@Controller
public class CodeController {

	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	@Autowired
	private CodeService codeService;
	// 코드 List 화면
	@RequestMapping(value="/ad/code", method=RequestMethod.GET)
	public ModelAndView authCodeList(HttpServletRequest request) {
	
		ModelAndView mView = codeService.codeList(request);	
		mView.setViewName("au/ma/code/codeList");
		return mView;
	}
	// 코드 List 검색
	@RequestMapping(value="/ad/code", method=RequestMethod.POST)
	public ModelAndView authCodeSearchList(HttpServletRequest request) {
	
		ModelAndView mView = codeService.codeList(request);	
		mView.setViewName("au/ma/code/codeList");
		return mView;
	}
	// 코드 상세
	@ResponseBody
	@RequestMapping(value="/ad/code/{codeno}", method=RequestMethod.GET)
	public Map<String,Object> authCodeRead(HttpServletRequest request, @PathVariable int codeno){
		
		Map<String,Object> codeInfo = codeService.codeRead(request, codeno);
		
		return codeInfo;
		
	}
	// 코드 추가
	@ResponseBody
	@RequestMapping(value="/ad/code/post", method=RequestMethod.POST)
	public Map<String,Object> authCodeInsert(HttpServletRequest request,@ModelAttribute CodeDto codeDto){
		int codeNo = codeService.codeInsert(request, codeDto);
		
		Map<String,Object> codeInfo = codeService.codeRead(request, codeNo);
		
		return codeInfo;
	}
	// 코드 수정
	@ResponseBody
	@RequestMapping(value="/ad/code/post/{codeno}", method=RequestMethod.POST)
	public Map<String,Object> authCodeUpdate(HttpServletRequest request,@ModelAttribute CodeDto codeDto){
		
		codeService.codeUpdate(request, codeDto);
		int codeNo = codeDto.getCodeno();
		Map<String,Object> codeInfo = codeService.codeRead(request, codeNo);
		return codeInfo;
	}
	// 코드 단일삭제
	@ResponseBody
	@RequestMapping(value="/ad/code/{codeno}", method=RequestMethod.POST)
	public Map<String,Object> authCodeDelete(HttpServletRequest request,@PathVariable int codeno){
		
		codeService.codeDelete(request, codeno);
		
		Map<String,Object> codeInfo = codeService.codeRead(request, codeno);
		
		return codeInfo;
	}
	// 코드 팝업 공용(상위코드 검색할때 필요)
	@RequestMapping(value="/common/code", method=RequestMethod.POST)
	public ModelAndView authUpperCodeList(HttpServletRequest request) {
		ModelAndView mView = codeService.codeUpperList(request);
		mView.setViewName("common/code/codeList");
		
		return mView;
	}
	// 코드 팝업 검색
	@RequestMapping(value="/common/code", method=RequestMethod.GET)
	public ModelAndView authUpperCodeGetList(HttpServletRequest request) {
		ModelAndView mView = codeService.codeUpperList(request);
		mView.setViewName("common/code/codeList");
		
		return mView;
	}

}
