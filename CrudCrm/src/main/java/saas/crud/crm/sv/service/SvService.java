package saas.crud.crm.sv.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RcvDto;

public interface SvService {
	
	public ModelAndView svList(HttpServletRequest request);
	
	public ModelAndView svRead(HttpServletRequest request,int rcvno);
	
	public void svUpdate(HttpServletRequest request);
	
	public int svInsert(HttpServletRequest request, RcvDto rcvDto);
	
	public void svDelete(HttpServletRequest request, int rcvno);
	
	public void svMultiDelete(HttpServletRequest request);
	
	public List<Map<String, Object>> svTabRact(HttpServletRequest request,int rcvno);
	
	public List<Map<String,Object>> svTabConvey(HttpServletRequest request,int rcvno);
	
	public void svConveyInsert(HttpServletRequest request,ConveyDto conveyDto);
	

}
