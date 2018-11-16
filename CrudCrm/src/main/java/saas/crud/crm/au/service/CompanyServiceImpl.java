package saas.crud.crm.au.service;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.CompanyDao;
import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.common.PagingCommon;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	CompanyDao companyDao;
	
	@Override
	public ModelAndView companyList(HttpServletRequest request) {
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
		
		int totalRows = companyDao.companyTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 5;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);

		List<Map<String,Object>> memCompany = companyDao.companyList(search);
		
		mView.addObject("memCompany",memCompany);	
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		mView.addObject("search",search);
		
		return mView;
	}
	@Override
	public ModelAndView companyRead(HttpServletRequest request, int siteId) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		CompanyDto companyDto = new CompanyDto();
		companyDto.setSiteid(siteId);
		Map<String,Object> memCompanyInfo = companyDao.companyRead(companyDto);
		
		mView.addObject("memCompany",memCompanyInfo);
		
		return mView;
	}
	@Override
	public void comapnyUpdate(HttpServletRequest request, CompanyDto companyDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		companyDto.setEdtuser(USERNO);
		companyDao.companyUpdate(companyDto);
	}
	
	@Override
	public int companyInsert(HttpServletRequest request, CompanyDto companyDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		companyDto.setReguser(USERNO);
		companyDto.setEdtuser(USERNO);
		int siteid = companyDao.companyInsert(companyDto);
		companyDto.setSiteid(siteid);
		
		return siteid;
	}
	@Override
	public void companyDelete(HttpServletRequest request, int siteid) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CompanyDto companyDto = new CompanyDto();
		companyDto.setEdtuser(USERNO);
		
		companyDto.setSiteid(siteid);
		companyDao.companyDelete(companyDto);
	}
	
	@Override
	public void companyMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String sCheck[] = request.getParameterValues("siteid");
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		CompanyDto companyDto = new CompanyDto();
		
		companyDto.setEdtuser(USERNO);
		int length = sCheck.length;
		if(length > 0) {
			for(int i=0;i<length;i++) {
				int siteid = Integer.parseInt(sCheck[i]); 
				companyDto.setSiteid(siteid);
				companyDao.companyDelete(companyDto);
			}
		}
	}
	@Override
	public void companyLicenseInsert(HttpServletRequest request, int siteid) {
		// TODO Auto-generated method stub
		
		
		Map<String, Object> data = new HashMap();
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}
			data.put(name, value);
		}
		data.put("reguser", USERNO);
		data.put("edtuser", USERNO);
		data.put("siteid", siteid);
		
		companyDao.companyLicenseInsert(data);
		
	}
}
