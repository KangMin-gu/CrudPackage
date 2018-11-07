package saas.crud.crm.sv.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.common.PagingCommon;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.SvDto;

@Service
public class SvServiceImpl implements SvService{
	
	@Autowired
	SvDao svDao;

	@Override
	public ModelAndView svList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Map<String,Object> search = new HashMap<>();
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}
			search.put(name, value);
		}
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		search.put("siteid",SITEID);
		
		int totalRows = svDao.svTotalRows(search);
		int PAGE_ROW_COUNT = 20;
		int PAGE_DISPLAY_COUNT = 10;
		
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		ModelAndView mView = new ModelAndView();
		
		List<Map<String,Object>> svList = svDao.svList(search);
		
		mView.addObject("svList",svList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	@Override
	public ModelAndView svRead(HttpServletRequest request, int serviceno) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		SvDto svDto = new SvDto();
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		svDto.setSiteid(SITEID);
		svDto.setServiceno(serviceno);
		Map<String,Object> serviceInfo = svDao.svRead(svDto);
		
		mView.addObject("serviceInfo",serviceInfo);
		
		return mView;
	}

	@Override
	public void svUpdate(HttpServletRequest request, SvDto svDto) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		svDto.setSiteid(SITEID);
		svDto.setEdtuser(USERNO);
		svDao.svUpdate(svDto);
	}

	@Override
	public int svInsert(HttpServletRequest request, SvDto svDto) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		svDto.setSiteid(SITEID);
		svDto.setReguser(USERNO);
		svDto.setEdtuser(USERNO);
		
		int serviceNo = svDao.svInsert(svDto);
		
		return serviceNo;
	}

	@Override
	public void svDelete(HttpServletRequest request, int serviceno) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		SvDto svDto = new SvDto();
		
		svDto.setSiteid(SITEID);
		svDto.setEdtuser(USERNO);
		svDto.setServiceno(serviceno);
		
		svDao.svDelete(svDto);
	}

	@Override
	public void svMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		SvDto svDto = new SvDto();
		
		svDto.setSiteid(SITEID);
		svDto.setEdtuser(USERNO);
		
		String sCheck[] = request.getParameterValues("serviceno");
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int serviceNo = Integer.parseInt(sCheck[i]);
			svDto.setServiceno(serviceNo);
			svDao.svDelete(svDto);
		}
		
	}

}
