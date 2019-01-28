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
	
	public Map<String,Object> svcCustDetailForm(int CUSTNO);
	
	public int svcCustformInsert(CustDto custDto, CustDenyDto custDenyDto);
	
	public int svcCustformUpdate(CustDto custDto, CustDenyDto custDenyDto);
	
	public Map<String,Object> svcCustTabCampList(HttpServletRequest request);
	
	public int svcVocCustUpdate(Map<String,Object> prmMap);
	
}
