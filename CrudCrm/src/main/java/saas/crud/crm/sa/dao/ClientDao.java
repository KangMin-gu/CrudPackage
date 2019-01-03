package saas.crud.crm.sa.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.sa.dto.ClientCustDto;
import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesCustDto;

public interface ClientDao {

	public int cliListCount(Map<String,Object> searchVal);	
	public List<Map<String,Object>> clientList(Map<String,Object> searchVal);
	
	public Map<String,Object> clientDetail(Map<String,Object> prm);
	
	
	public int clientInsert(ClientDto clientDto);
	
	public int clientUpdate(ClientDto clientDto);
	
	public int cliDelete(Map<String,Object> prm);
	
	public int cliCustListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> cliCustList(Map<String,Object> prm);
	
	public int cliCustInsert(ClientCustDto clientCustDto);
	
	public Map<String,Object> cliCustDetail(ClientCustDto clientCustDto);
	
	public int cliCustDelete(ClientCustDto clientCustDto);
	
	public int cliCustUpdate(ClientCustDto clientCustDto);
}
