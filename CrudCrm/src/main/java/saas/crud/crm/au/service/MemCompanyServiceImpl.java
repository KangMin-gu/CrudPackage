package saas.crud.crm.au.service;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.MemCompanyDao;
import saas.crud.crm.au.dto.MemCompanyDto;
import saas.crud.crm.common.PagingCommon;

@Service
public class MemCompanyServiceImpl implements MemCompanyService{

	@Autowired
	MemCompanyDao memCompanyDao;
	
	@Override
	public ModelAndView memCompanyList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		//int SITEID = Integer.parseInt((String)request.getSession().getAttribute("SITEID"));
		ModelAndView mView = new ModelAndView();
		
		
		Map<String, Object> search = new HashMap();
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}
			search.put(name, value);
		}
		
		int totalRows = memCompanyDao.memCompanyTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 5;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);

		List<Map<String,Object>> memCompany = memCompanyDao.memCompanyList(search);
		
		mView.addObject("memCompany",memCompany);	
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		mView.addObject("search",search);
		
		return mView;
	}
	@Override
	public ModelAndView memCompanyRead(HttpServletRequest request, int siteId) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		MemCompanyDto memCompanyDto = new MemCompanyDto();
		memCompanyDto.setSiteid(siteId);
		Map<String,Object> memCompanyInfo = memCompanyDao.memCompanyRead(memCompanyDto);
		
		mView.addObject("memCompany",memCompanyInfo);
		
		return mView;
	}
	@Override
	public void memComapnyUpdate(HttpServletRequest request, MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		memCompanyDto.setEdtuser(USERNO);
		memCompanyDao.memCompanyUpdate(memCompanyDto);
	}
	
	@Override
	public int memCompanyInsert(HttpServletRequest request, MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		memCompanyDto.setReguser(USERNO);
		memCompanyDto.setEdtuser(USERNO);
		int siteid = memCompanyDao.memCompanyInsert(memCompanyDto);
		memCompanyDto.setSiteid(siteid);
		
		return siteid;
	}
	@Override
	public void memCompanyDelete(HttpServletRequest request, int siteid) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		MemCompanyDto memCompanyDto = new MemCompanyDto();
		memCompanyDto.setEdtuser(USERNO);
		
		memCompanyDto.setSiteid(siteid);
		memCompanyDao.memCompanyDelete(memCompanyDto);
	}
	
	@Override
	public void memCompanyMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String sCheck[] = request.getParameterValues("siteid");
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		MemCompanyDto memCompanyDto = new MemCompanyDto();
		
		memCompanyDto.setEdtuser(USERNO);
		int length = sCheck.length;
		if(length > 0) {
			for(int i=0;i<length;i++) {
				int siteid = Integer.parseInt(sCheck[i]); 
				memCompanyDto.setSiteid(siteid);
				memCompanyDao.memCompanyDelete(memCompanyDto);
			}
		}
	}
}
