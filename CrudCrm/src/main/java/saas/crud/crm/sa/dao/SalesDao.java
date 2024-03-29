package saas.crud.crm.sa.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SaleStateDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

public interface SalesDao {

	
	public int salesListCount(Map<String,Object> searchVal);	
	public List<Map<String,Object>> salesList(Map<String,Object> searchVal);
	
	public Map<String,Object> salesDetail(SalesDto salesDto);	
	
	public int salesCustListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> salesCustList(Map<String,Object> searchVal);
	public int salesStateListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> salesStateList(Map<String,Object> searchVal);
	public int salesContListCnt(Map<String,Object> searchVal);
	public List<Map<String,Object>> salesContList(Map<String,Object> searchVal);
	
	public int salesInsert(SalesDto salesDto);
	
	public int salesUpdate(SalesDto salesDto);
	
	public int salesDelete(SalesDto salesDto);
	
	public int salesDelete(Map<String,Object> prm);
		
	public List<Map<String,Object>> cliSalesList(Map<String,Object> prm);
	
	
		
	public int salesCustInsert(SalesCustDto salesCustDto);
	
	public Map<String,Object> salesCustDetail(SalesCustDto salesCustDto);
	
	public int salesCustDelete(SalesCustDto salesCustDto);
	
	public int salesCustUpdate(SalesCustDto salesCustDto);
	
	
	
	public int salesStateInsert(Map<String,Object> insVal);
	public int salesStateUpdate(Map<String,Object> insVal);
	
	
	public List<Map<String,Object>> salesSchList(Map<String,Object> schVal);
	
	public int salesSchInsert(Map<String,Object> schVal);
	
	public int salesSchUpdate(Map<String,Object> schVal);
	
	public Map<String,Object> salesSchDetail(Map<String,Object> schVal);
		
	public List<Map<String,Object>> salesComSchList(Map<String,Object> schVal);
	
	public int salesComSchInsert(Map<String,Object> schVal);
	
	public Map<String,Object> salesComSchDetail(Map<String,Object> schVal);
	
	public int salesSchInsertFromCom(Map<String,Object> schVal);
	
	public void mergeSalesSch(SalesDto salesDto);
		
	public int salesComSchUpdate(Map<String,Object> schVal);

	public int custTabSalesListCnt(Map<String,Object> searchVal);

	public List<Map<String,Object>> custTabSalesList(Map<String,Object> searchVal);
	
	public int salesContInsert(Map<String, Object> contVal);
}
