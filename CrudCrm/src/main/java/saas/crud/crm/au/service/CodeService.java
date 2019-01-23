package saas.crud.crm.au.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.CodeDto;

public interface CodeService {
	
	public ModelAndView codeList(HttpServletRequest request);

	public Map<String,Object> codeRead(HttpServletRequest request, int codeNo);
	
	public void codeUpdate(HttpServletRequest request, CodeDto codeDto);
	
	public void codeDelete(HttpServletRequest request, int codeNo);
	
	public int codeInsert(HttpServletRequest request, CodeDto codeDto);
	
	public ModelAndView codeUpperList(HttpServletRequest request);
	
	public Map<String,Object> getCode();
	
	public List<CodeDto> getUpperCodeGrp(HttpServletRequest request);
}