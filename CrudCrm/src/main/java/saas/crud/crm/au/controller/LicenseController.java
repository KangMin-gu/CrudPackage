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

import saas.crud.crm.au.dto.LicenseDto;
import saas.crud.crm.au.service.LicenseService;

@Controller
public class LicenseController {
	
	@Autowired
	LicenseService licenseService;
	
	private static final Logger logger = LoggerFactory.getLogger(MaController.class);
	//담당자 정보
	@ResponseBody
	@RequestMapping(value="/ma/li", method=RequestMethod.GET)
	public ModelAndView authLicenseList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li", method=RequestMethod.POST)
	public ModelAndView authLicenseSearchList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/ajax", method=RequestMethod.POST)
	public List<Map<String,Object>> authLicenseAjaxList(HttpServletRequest request) {
		List<Map<String,Object>> licenseInfo = licenseService.licenseAjaxList(request);
		return licenseInfo;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/{licenseno}", method=RequestMethod.GET)
	public Map<String,Object> authLicenseDetail(HttpServletRequest request,@PathVariable int licenseno) {
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseno);
		return licenseInfo;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/post", method=RequestMethod.POST)
	public Map<String,Object> authLicenseInsert(HttpServletRequest request, @ModelAttribute LicenseDto licenseDto) {
		int licenseNo = licenseService.licenseInsert(request, licenseDto);
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseNo);
		return licenseInfo;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/post/{licenseno}", method=RequestMethod.POST)
	public Map<String,Object> authLicenseUpdateSet(HttpServletRequest request,@ModelAttribute LicenseDto licenseDto) {
		licenseService.licenseUpdate(request, licenseDto);
		int licenseNo = licenseDto.getLicenseno(); 
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseNo);
		return licenseInfo;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/{licenseno}" ,method=RequestMethod.POST)
	public Map<String,Object> authLicenseDelete(HttpServletRequest request, @PathVariable int licenseno) {
		
		licenseService.licenseDelete(request,licenseno);
		
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseno);
		return licenseInfo;
	}
	@ResponseBody
	@RequestMapping(value="/ma/li/delete" ,method=RequestMethod.POST)
	public ModelAndView authLicenseMultiDelete(HttpServletRequest request) {
		
		licenseService.licenseMultiDelete(request);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/ma/me");
		return mView;
		
	}
	

}
