package saas.crud.crm.cu.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;


public interface CustService {
	
	public ModelAndView svcCustList(HttpServletRequest request);
	
	public int svcCustDelete(HttpServletRequest request);
		
	public ModelAndView svcCustDetail(int custno, int siteid);
	
	public Map<String,Object> svcCustUpdateForm(int CUSTNO);
	
	public int svcCustformInsert(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto);
	
	public ModelAndView svcCustForm(HttpServletRequest request);
	
	public int svcCustformUpdate(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto);
	
	public Map<String,Object> svcCustTabCampList(HttpServletRequest request);
	
}
