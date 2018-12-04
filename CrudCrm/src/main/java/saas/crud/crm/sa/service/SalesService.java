package saas.crud.crm.sa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesDto;

public interface SalesService {
		
	public ModelAndView svcSalesList(HttpServletRequest request);
	
	public ModelAndView svcSalesDetail(SalesDto salesDto);
	
	public int svcSalesInsert(SalesDto salesDto);
	
	
	public Map<String,Object> svcSalesDetailForm(SalesDto salesDto);
	public int svcSalesDetailUpdate(SalesDto salesDto);
	
	public int svcSalesDelete(SalesDto salesDto);
	
	
	
}
