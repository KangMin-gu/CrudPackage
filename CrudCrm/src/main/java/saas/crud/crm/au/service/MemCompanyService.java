package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MemCompanyDto;

public interface MemCompanyService {
	
	public ModelAndView memCompanyList(HttpServletRequest request);
	public ModelAndView memCompanyRead(HttpServletRequest request,int siteid);
	public void memComapnyUpdate(HttpServletRequest request, MemCompanyDto memCompanyDto);
	public int memCompanyInsert(HttpServletRequest request, MemCompanyDto memCompanyDto);
	public void memCompanyDelete(HttpServletRequest request, int siteid);
	public void memCompanyMultiDelete(HttpServletRequest request);

}
