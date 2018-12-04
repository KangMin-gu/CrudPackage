package saas.crud.crm.sa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientDto;

public interface ClientService {
	
	public ModelAndView svcCliList(HttpServletRequest request);
	
	public ModelAndView svcCliDetail(HttpServletRequest request);
	
	public int svcCliInsert(ClientDto clientDto);
	
	public Map<String,Object> svcCliDetailForm(int siteid,int clino);
	public int svcCliDetailUpdate(ClientDto clientDto);

	public int svcCliDelete(ClientDto clientDto);
	
	
	public Map<String,Object> svcRelatedCustList(HttpServletRequest request);
	
}
