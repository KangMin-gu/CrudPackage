package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CompanyDto;

public interface CompanyService {
	
	public ModelAndView companyList(HttpServletRequest request);
	public ModelAndView companyRead(HttpServletRequest request,int siteid);
	public void comapnyUpdate(HttpServletResponse response, HttpServletRequest request, CompanyDto companyDto);
	public int companyInsert(HttpServletResponse response, HttpServletRequest request, CompanyDto companyDto);
	public void companyDelete(HttpServletRequest request, int siteid);
	public void companyMultiDelete(HttpServletRequest request);
	public void companyLicenseInsert(HttpServletRequest request, int siteid);
}
