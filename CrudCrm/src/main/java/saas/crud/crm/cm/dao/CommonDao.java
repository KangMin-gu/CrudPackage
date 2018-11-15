package saas.crud.crm.cm.dao;

import java.util.List;
import java.util.Map;

public interface CommonDao {
	public int totalcntUser(Map<String,Object> searchVal);
	public List<Map<String,Object>> popUserList(Map<String,Object> searchVal);
	
	public int totalcntClient(Map<String,Object> searchVal);
	public List<Map<String,Object>> popClientList(Map<String,Object> searchVal);
}
