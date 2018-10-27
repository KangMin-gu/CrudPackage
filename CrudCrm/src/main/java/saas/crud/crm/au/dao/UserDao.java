package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;


public interface UserDao {
	public Map<String, Object> getData(String userId);
	public List<Map<String,String>> getMenu(String userId); 
}
