package saas.crud.crm.au.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.LicenseDto;

public interface LicenseService {
	
	public ModelAndView licenseList(HttpServletRequest request);
	public Map<String,Object> licenseDetail(HttpServletRequest request,int licenseno);
	public int licenseInsert(HttpServletRequest request,LicenseDto licenseDto);
	public void licenseUpdate(HttpServletRequest request,LicenseDto licenseDto);
	public void licenseDelete(HttpServletRequest request,int licenseno);
	public void licenseMultiDelete(HttpServletRequest request);
	
	public List<Map<String,Object>> licenseAjaxList(HttpServletRequest request);
	public List<Map<String,Object>> licenseTopList(int siteid);
	
	
	
	

}
