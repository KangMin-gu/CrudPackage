package saas.crud.crm.ce;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class SearchRequest {
	
	public Map<String, Object> Search(HttpServletRequest request) {
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> search = new HashMap();
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}else {
				if(name.contains("desc")) {
					value = value.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				}
			}
			search.put(name, value);
		}
		
		search.put("siteid", SITEID);
		
		return search;
		
	}

}
