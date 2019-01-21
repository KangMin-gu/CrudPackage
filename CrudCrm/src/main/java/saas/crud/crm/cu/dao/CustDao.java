package saas.crud.crm.cu.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;


public interface CustDao {
			
	public int totalCnt(Map<String, Object> map);
	public List<Map<String,Object>> custList(Map<String, Object> cstVal);	
	public Map<String,Object> custDetail(Map<String,Object> cstVal);	
	public Map<String,Object> custUpdateForm(int cstid);
	public int custDelete(CustDto CustDto);	
	public int custformInsert(CustDto CustDto);
	public void custformInsertDeny(CustDenyDto custDenyDto);
	public void cliCustInsert(CustDto custDto);	
	public int getCliCustNo(int custno);
	public void mergeCliCust(CustDto custDto);	
	public int custformUpdate(CustDto CustDto);
	public int custformUpdateDeny(CustDenyDto custDenyDto);	
	public int custTabCampListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> custTabCampList(Map<String,Object> searchVal);
	
}