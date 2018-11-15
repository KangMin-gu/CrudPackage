package saas.crud.crm.common;

import java.util.List;
import java.util.Map;

import saas.crud.crm.ce.FileDto;


public interface CommonDao {
	public void fileUpload(FileDto fileInfo);
	public int totalcntUser(Map<String,Object> searchVal);
	public List<Map<String,Object>> popUserList(Map<String,Object> searchVal);
	public int totalcntClient(Map<String,Object> searchVal);
	public List<Map<String,Object>> popClientList(Map<String,Object> searchVal);
}
