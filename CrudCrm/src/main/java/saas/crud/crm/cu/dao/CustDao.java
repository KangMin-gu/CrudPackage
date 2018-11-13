package saas.crud.crm.cu.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;


public interface CustDao {
			
	public int totalCnt(Map<String, Object> map);
	
	public List<Map<String,Object>> custList(Map<String, Object> cstVal);
	
	public Map<String,Object> custDetail(int CUSTNO);
	
	public Map<String,Object> custUpdateForm(int CSTID);

	public int custDelete(CustDto CustDto);
	
	public int custformInsert(CustDto CustDto);
	public int custformInsertDeny(CustDenyDto custDenyDto);
	
	public int custformUpdate(CustDto CustDto);
	public int custformUpdateDeny(CustDenyDto custDenyDto);
	
	public int totalcntUser(Map<String,Object> searchVal);
	public List<Map<String,Object>> popUserList(Map<String,Object> searchVal);
	
	public int totalcntClient(Map<String,Object> searchVal);
	public List<Map<String,Object>> popClientList(Map<String,Object> searchVal);
}