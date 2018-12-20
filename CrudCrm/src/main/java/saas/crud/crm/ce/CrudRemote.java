package saas.crud.crm.ce;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CrudRemote {
	
	public Map<String,Object> getRemote(HttpServletRequest request);
}
