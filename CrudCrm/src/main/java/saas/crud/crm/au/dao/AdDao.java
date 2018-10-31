package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

public interface AdDao {
	
	
	public List<Map<String,Object>> urList(Map<String,Object> search);
	public int urTotalRows(Map<String,Object> search);
}
