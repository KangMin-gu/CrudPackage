package saas.crud.crm.vc.service;


import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.sv.dto.ServiceDto;


public interface VocService {
	
	public int vocInsert(HttpServletRequest request);

	public Map<String,Object> svcVocPopCustSelect(Map<String,Object> prm);
	public Map<String,Object> svcVocTabServiceList(HttpServletRequest request);
}
