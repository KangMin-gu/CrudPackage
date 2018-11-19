package saas.crud.crm.sv.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RcvDto;

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
	public ModelAndView svRead(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		RcvDto svDto = new RcvDto();
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		svDto.setSiteid(SITEID);
		svDto.setRcvno(rcvno);
		Map<String,Object> serviceInfo = svDao.svRead(svDto);
		
		mView.addObject("serviceInfo",serviceInfo);
		
		return mView;
	}

	@Override
	public void svUpdate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int CHKAUTH = Integer.parseInt(request.getSession().getAttribute("CHKAUTH").toString());
		
		Enumeration params = request.getParameterNames();
		
		Map<String,Object> data = new HashMap<>();
		String ractdate = request.getParameter("ractdate");
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}
			data.put(name, value);
		}
		
		data.put("siteid", SITEID);
		data.put("edtuser", USERNO);
		data.put("reguser", USERNO);
		
		//권한이 10, 즉 사용자 권한이면 처리정보만 update 처리
		if(CHKAUTH == 10) {
			svDao.svUpdate(data);
		}else {
			// 10이 아닌 경우에는 admin 혹은 MasterAdmin 이므로 모든 부분 수정 가능하게
			svDao.svTotalUpdate(data);
		}
		
		if(ractdate !="") {
			svDao.svRactInser(data);
		}
	}

	@Override
	public int svInsert(HttpServletRequest request, RcvDto rcvDto) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Enumeration params = request.getParameterNames();
		
		Map<String,Object> data = new HashMap<>();
		String ractdate = request.getParameter("ractdate");
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}
			data.put(name, value);
		}
		data.put("siteid", SITEID);
		data.put("reguser", USERNO);
		data.put("edtuser", USERNO);
		
		
		rcvDto.setSiteid(SITEID);
		rcvDto.setReguser(USERNO);
		rcvDto.setEdtuser(USERNO);
		
		int rcvNo = svDao.svInsert(rcvDto);
		
		if(ractdate != "") {
			data.put("rcvno", rcvNo);
			svDao.svRactInser(data);
		}

		//int serviceNo = svDao.svInsert(svDto);
		
		return rcvNo;
	}

	@Override
	public void svDelete(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		RcvDto svDto = new RcvDto();
		
		svDto.setSiteid(SITEID);
		svDto.setEdtuser(USERNO);
		svDto.setRcvno(rcvno);
		
		svDao.svDelete(svDto);
	}

	@Override
	public void svMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String sCheck[] = request.getParameterValues("rcvno");
		
		RcvDto svDto = new RcvDto();
		
		svDto.setSiteid(SITEID);
		svDto.setEdtuser(USERNO);
		
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int rcvno = Integer.parseInt(sCheck[i]);
			svDto.setRcvno(rcvno);
			svDao.svDelete(svDto);
		}
		
	}

	@Override
	public List<Map<String, Object>> svTabRact(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		RactDto ractDto = new RactDto();
		ractDto.setSiteid(SITEID);
		ractDto.setRcvno(rcvno);
		
		List<Map<String, Object>> tabRact = svDao.svTabRact(ractDto);
		
		return tabRact;
	}

	@Override
	public List<Map<String, Object>> svTabConvey(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ConveyDto conveyDto = new ConveyDto();
		conveyDto.setRcvno(rcvno);
		conveyDto.setSiteid(SITEID);
		List<Map<String,Object>> tabConvey = svDao.conveyTabList(conveyDto);
		
		return tabConvey;
	}

	@Override
	public void svConveyInsert(HttpServletRequest request, ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		conveyDto.setSiteid(SITEID);
		conveyDto.setReguser(USERNO);
		conveyDto.setEdtuser(USERNO);
		
		
		
		svDao.conveyInsert(conveyDto);
		
	}

}
