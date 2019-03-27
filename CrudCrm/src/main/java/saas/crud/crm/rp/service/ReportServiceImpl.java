package saas.crud.crm.rp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.rp.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao reportDao;
	@Autowired
	private CrudEngine crud;
	
	@Override
	public ModelAndView vcReportList(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		
		Map<String,Object> param = new HashMap<>();
		param.put("siteid", siteId);
	
		List<Map<String,Object>> vcReportList = reportDao.vcReportList(param);

		mView.addObject("vcReportList",vcReportList);
		return mView;
	}

	@Override
	public ModelAndView vcReportDetail(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> param = crud.searchParam(request);
		param.put("siteid", siteId);
		
		List<Map<String,Object>> vcServiceCodeReport = reportDao.vcServiceCodeReport(param);
		int vcServiceCodeReportCnt = reportDao.vcServiceCodeReportCnt(param);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(vcServiceCodeReport);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		mView.addObject("serviceCodeReport",vcServiceCodeReport);
		mView.addObject("serviceCodeReportJson",jsonStr.toString());
		mView.addObject("serviceCodeReportCnt",vcServiceCodeReportCnt);
		return mView;
	}

}
