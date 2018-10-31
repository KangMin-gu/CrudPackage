package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.MemCompanyDto;

public interface MemCompanyDao {
	
	public List<Map<String,Object>> memCompanyList (Map<String,Object> search); 
	public Map<String,Object> memCompanyRead(MemCompanyDto memCompanyDto);
	public void memCompanyUpdate(MemCompanyDto memCompanyDto);
	public int memCompanyInsert(MemCompanyDto memCompanyDto);
	public int memCompanyTotalRows(Map<String,Object> search);
	public void memCompanyDelete(MemCompanyDto memCompanyDto);

}
