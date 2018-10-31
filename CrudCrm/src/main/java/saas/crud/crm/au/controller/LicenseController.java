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

import saas.crud.crm.au.dto.LicenseDto;
import saas.crud.crm.au.service.LicenseService;

@Controller
public class LicenseController {
	
	@Autowired
	LicenseService licenseService;
	
	private static final Logger logger = LoggerFactory.getLogger(MaController.class);
	//담당자 정보
	@RequestMapping(value="/ma/li", method=RequestMethod.GET)
	public ModelAndView authLicenseList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	@RequestMapping(value="/ma/li", method=RequestMethod.POST)
	public ModelAndView authLicenseSearchList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	
	@RequestMapping(value="/ma/li/{licenseno}", method=RequestMethod.GET)
	public ModelAndView authLicenseDetail(HttpServletRequest request,@PathVariable int licenseno) {
		ModelAndView mView = licenseService.licenseDetail(request, licenseno);
		mView.setViewName("/au/ma/li/licenseRead");
		return mView;
	}
	@RequestMapping(value="/ma/li/post", method=RequestMethod.GET)
	public ModelAndView authLicenseInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/au/ma/li/licenseInsert");
		return mView;
	}
	@RequestMapping(value="/ma/li/post", method=RequestMethod.POST)
	public ModelAndView authLicenseInsert(HttpServletRequest request, @ModelAttribute LicenseDto licenseDto) {
		ModelAndView mView = new ModelAndView();
		int licenseNo = licenseService.licenseInsert(request, licenseDto);
		mView.setViewName("redirect:/ma/li/"+licenseNo);
		return mView;
	}
	
	@RequestMapping(value="/ma/li/post/{licenseno}", method=RequestMethod.GET)
	public ModelAndView authLicenseUpdate(HttpServletRequest request,@PathVariable int licenseno) {
		ModelAndView mView = licenseService.licenseDetail(request, licenseno);
		mView.setViewName("/au/ma/li/licenseUpdate");
		return mView;
	}
	@RequestMapping(value="/ma/li/post/{licenseno}", method=RequestMethod.PUT)
	public ModelAndView authLicenseUpdateSet(HttpServletRequest request,@ModelAttribute LicenseDto licenseDto) {
		ModelAndView mView = new ModelAndView();
		licenseService.licenseUpdate(request, licenseDto);
		mView.setViewName("/au/ma/li/licenseUpdate");
		return mView;
	}
	
	@RequestMapping(value="/ma/li/{licenseno}" ,method=RequestMethod.POST)
	public ModelAndView authLicenseDelete(HttpServletRequest request, @PathVariable int licenseno) {
		
		ModelAndView mView = new ModelAndView();
		
		licenseService.licenseDelete(request,licenseno);
		
		mView.setViewName("redirect:/ma/li");
		return mView;
		
	}
	
	@RequestMapping(value="/ma/li/delete" ,method=RequestMethod.POST)
	public ModelAndView authLicenseMultiDelete(HttpServletRequest request) {
		
		ModelAndView mView = new ModelAndView();
		
		licenseService.licenseMultiDelete(request);
		
		mView.setViewName("redirect:/ma/li");
		return mView;
		
	}
	

}
