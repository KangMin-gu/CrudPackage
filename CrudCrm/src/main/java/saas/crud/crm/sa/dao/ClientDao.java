package saas.crud.crm.sa.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.sa.dto.ClientDto;

public interface ClientDao {

	public int cliListCount(Map<String,Object> searchVal);	
	public List<Map<String,Object>> clientList(Map<String,Object> searchVal);
	
	public Map<String,Object> clientDetail(Map<String,Object> prm);
	
	
	public int clientInsert(ClientDto clientDto);
	
	public int clientUpdate(ClientDto clientDto);
	
	public int cliDelete(ClientDto clientDto);
	
	public int cliCustListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> cliCustList(Map<String,Object> prm);
}
