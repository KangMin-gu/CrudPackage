package saas.crud.crm.rp.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface ReportService {

	public ModelAndView vcReportList(HttpServletRequest request);
	
	
	public ModelAndView vcReportDetail(HttpServletRequest request);
}
