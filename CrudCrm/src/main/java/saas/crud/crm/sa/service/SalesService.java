package saas.crud.crm.sa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SaleStateDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

public interface SalesService {
		
	public ModelAndView svcSalesList(HttpServletRequest request);
	public Map<String,Object> svcCliSalesList(HttpServletRequest request);
	
	public ModelAndView svcSalesDetail(SalesDto salesDto);
	public Map<String,Object> svcSalesDetailStateTabList(HttpServletRequest request);
	public Map<String,Object> svcSalesDetailContectTabList(HttpServletRequest request);
	
	
	public int svcSalesInsert(SalesDto salesDto);
	
	
	public Map<String,Object> svcSalesDetailForm(SalesDto salesDto);
	public int svcSalesDetailUpdate(SalesDto salesDto);
	
	public int svcSalesDelete(Map<String,Object> prmMap); 
	
	public Map<String,Object> svcSalesCustList(HttpServletRequest request);
	
	public int svcSalesCustInsert(SalesCustDto salesCustDto);
	
	public Map<String,Object> svcSalesCustDetail(SalesCustDto salesCustDto);
	
	public int svcSalesCustDelete(SalesCustDto salesCustDto);
	
	public int svcSalesCustUpdate(SalesCustDto salesCustDto);
	
	public int svcSalesStateInsert(Map<String,Object> insVal);
	
	public String svcSalesSchList(Map<String,Object> schVal);
	
	public int svcSalesSchInsert(Map<String,Object> schVal);
	
	public int svcSalesSchUpdate(Map<String,Object> schVal);
	
	public Map<String,Object> svcSalesSchDetail(Map<String,Object> schVal);
	
	public List<Map<String,Object>> svcSalesComSchList(Map<String,Object> schVal);
	
	public int scvSalesComSchInsert(Map<String,Object> schVal);
	
	public Map<String,Object> svcSalesComSchDetail(Map<String,Object> schVal);
	
	public String svcSalesSchInsertFromCom(Map<String,Object> schVal);
	
	public int scvSalesComSchUpdate(Map<String,Object> schVal);

	public Map<String,Object> svcCustTabSalesList(HttpServletRequest request);
}
