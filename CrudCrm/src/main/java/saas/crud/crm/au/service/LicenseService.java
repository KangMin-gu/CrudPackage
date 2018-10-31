package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.LicenseDto;

public interface LicenseService {
	
	public ModelAndView licenseList(HttpServletRequest request);
	public ModelAndView licenseDetail(HttpServletRequest request,int licenseno);
	public int licenseInsert(HttpServletRequest request,LicenseDto licenseDto);
	public void licenseUpdate(HttpServletRequest request,LicenseDto licenseDto);
	public void licenseDelete(HttpServletRequest request,int licenseno);
	public void licenseMultiDelete(HttpServletRequest request);
	

}
