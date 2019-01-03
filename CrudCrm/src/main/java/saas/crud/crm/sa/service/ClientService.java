package saas.crud.crm.sa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientCustDto;
import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesCustDto;

public interface ClientService {
	
	public ModelAndView svcCliList(HttpServletRequest request);
	
	public ModelAndView svcCliDetail(HttpServletRequest request);
	
	public int svcCliInsert(ClientDto clientDto);
	
	public Map<String,Object> svcCliDetailForm(int siteid,int clino);
	public int svcCliDetailUpdate(ClientDto clientDto);

	public int svcCliDelete(Map<String,Object> prmMap);
		
	public Map<String,Object> svcCliCustList(HttpServletRequest request);
	
	
	
	
	
	
	public int svcCliCustInsert(ClientCustDto clientCustDto);
	
	public Map<String,Object> svcCliCustDetail(ClientCustDto clientCustDto);
	
	public int svcCliCustDelete(ClientCustDto clientCustDto);
	
	public int svcCliCustUpdate(ClientCustDto clientCustDto);
	
}
