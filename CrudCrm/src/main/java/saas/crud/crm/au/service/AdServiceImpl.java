package saas.crud.crm.au.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AdDao;
import saas.crud.crm.common.PagingCommon;

@Service
public class AdServiceImpl implements AdService{
	
	@Autowired
	AdDao adDao;
	
	@Override
	public ModelAndView userList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		ModelAndView mView = new ModelAndView();
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		String userName = request.getParameter("userName");
		String mobile = request.getParameter("mobile");
		
		Map<String, Object> search = new HashMap();
		
		if(userName=="") {
			userName = null;
		}
		if(mobile=="") {
			mobile = null;
		}
		
		search.put("siteid",SITEID);
		search.put("userName", userName);
		search.put("mobile", mobile);
		
		int totalRows = adDao.urTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> userList = adDao.urList(search);
		
		mView.addObject("user",userList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		
		return mView;
	}

}
