package saas.crud.crm.rp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.rp.service.ReportService;


@Controller
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/vc/report", method=RequestMethod.GET)
	public ModelAndView authVcReport(HttpServletRequest request) {
		ModelAndView mView = reportService.vcReportList(request);
		
		mView.setViewName("rp/vocList");
		return mView;
	}
}
