package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CompanyDto;

public interface CompanyService {
	
	public ModelAndView companyList(HttpServletRequest request);
	public ModelAndView companyRead(HttpServletRequest request,int siteid);
	public void comapnyUpdate(HttpServletRequest request, HttpServletResponse response, CompanyDto companyDto, MultipartFile file);
	public int companyInsert(HttpServletResponse response, HttpServletRequest request, CompanyDto companyDto, MultipartFile file);
	public void companyDelete(HttpServletRequest request, int siteid);
	public void companyMultiDelete(HttpServletRequest request);
	public void companyLicenseInsert(HttpServletRequest request, int siteid);
	public ModelAndView adminPwdReset (HttpServletRequest request, int siteId);
	public int licenseCnt(HttpServletRequest request);
}
