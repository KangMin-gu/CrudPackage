package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.UserDto;

public interface AuDao {
	
	
	public List<Map<String,Object>> urList(Map<String,Object> search);
	public int urTotalRows(Map<String,Object> search);
	public Map<String,Object> urRead(UserDto userDto);
	public int urInsert(UserDto userDto);
	public void urUpdate(UserDto userDto);
	public void urDelete(UserDto userDto);
	
	public int urIdCheck(String userId);
}
