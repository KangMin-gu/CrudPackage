package saas.crud.crm.sa.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

public interface SalesDao {

	
	public int salesListCount(Map<String,Object> searchVal);	
	public List<Map<String,Object>> salesList(Map<String,Object> searchVal);
	
	public Map<String,Object> salesDetail(SalesDto salesDto);
	
	public int salesInsert(SalesDto salesDto);
	
	public int salesUpdate(SalesDto salesDto);
	
	public int salesDelete(SalesDto salesDto);
	
	public List<Map<String,Object>> salesCustList(SalesDto SalesDto);
		
	public List<Map<String,Object>> cliSalesList(Map<String,Object> prm);
}
