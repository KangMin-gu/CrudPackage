package saas.crud.crm.sa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SaleStateDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

public interface SalesService {
		
	public ModelAndView svcSalesList(HttpServletRequest request);
	
	public ModelAndView svcSalesDetail(SalesDto salesDto);
	
	public int svcSalesInsert(SalesDto salesDto);
	
	
	public Map<String,Object> svcSalesDetailForm(SalesDto salesDto);
	public int svcSalesDetailUpdate(SalesDto salesDto);
	
	public int svcSalesDelete(SalesDto salesDto);
	
	
	public Map<String,Object> svcSalesCustList(HttpServletRequest request);
	
	public int svcSalesCustInsert(SalesCustDto salesCustDto);
	
	public Map<String,Object> svcSalesCustDetail(SalesCustDto salesCustDto);
	
	public int svcSalesCustDelete(SalesCustDto salesCustDto);
	
	public int svcSalesCustUpdate(SalesCustDto salesCustDto);
	
	public int svcSalesStateInsert(Map<String,Object> insVal);
}
