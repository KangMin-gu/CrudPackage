package saas.crud.crm.sv.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.SvDto;

public interface SvService {
	
	public ModelAndView svList(HttpServletRequest request);
	
	public ModelAndView svRead(HttpServletRequest request,int serviceno);
	
	public void svUpdate(HttpServletRequest request, SvDto svDto);
	
	public int svInsert(HttpServletRequest request, SvDto svDto);
	
	public void svDelete(HttpServletRequest request, int serviceno);
	
	public void svMultiDelete(HttpServletRequest request);
	

}
