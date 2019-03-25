package saas.crud.crm.rp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.rp.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao reportDao;
	
	@Override
	public ModelAndView vcReportList(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		
		Map<String,Object> param = new HashMap<>();
		param.put("siteid", siteId);
	
		List<Map<String,Object>> vcReportList = reportDao.vcReportList(param);s

		mView.addObject("vcReportList",vcReportList);
		return mView;
	}

}
