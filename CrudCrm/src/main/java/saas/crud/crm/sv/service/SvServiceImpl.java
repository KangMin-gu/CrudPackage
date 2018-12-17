package saas.crud.crm.sv.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RcvDto;

@Service
public class SvServiceImpl implements SvService{
	
	@Autowired
	private SvDao svDao;
	
	@Autowired
	private CrudEngine crud;

	// 서비스 List 검색
	@Override
	public ModelAndView svList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Map<String, Object> search = crud.searchParam(request);
		
		int totalRows = svDao.svTotalRows(search);
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT);
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

	// 서비스 상세정보
	@Override
	public ModelAndView svRead(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		RcvDto svDto = new RcvDto();
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		svDto.setSiteid(siteId);
		svDto.setRcvno(rcvno);
		Map<String,Object> serviceInfo = svDao.svRead(svDto);
		
		mView.addObject("serviceInfo",serviceInfo);
		
		return mView;
	}

	// 서비스 수정
	@Override
	public void svUpdate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int chkAuth = Integer.parseInt(request.getSession().getAttribute("CHKAUTH").toString());
		String ractdate = request.getParameter("ractdate");
		
		Map<String, Object> data = crud.searchParam(request);
		data.put("edtuser", userNo);
		//권한이 10, 즉 사용자 권한이면 처리정보만 update 처리
		if(chkAuth == 10) {
			svDao.svUpdate(data);
		}else {
			// 10이 아닌 경우에는 admin 혹은 MasterAdmin 이므로 모든 부분 수정 가능하게
			svDao.svTotalUpdate(data);
		}
		
		if(ractdate !="") {
			data.put("reguser", userNo);
			svDao.svRactInsert(data);
		}
	}

	// 서비스 추가
	@Override
	public int svInsert(HttpServletRequest request, RcvDto rcvDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String ractdate = request.getParameter("ractdate");
		
		Map<String, Object> data = crud.searchParam(request);
		
		rcvDto.setSiteid(siteId);
		rcvDto.setReguser(userNo);
		rcvDto.setEdtuser(userNo);
		
		int rcvNo = svDao.svInsert(rcvDto);
		
		data.put("reguser", userNo);
		data.put("edtuser", userNo);
		if(ractdate != "") {
			data.put("prcstate", 2);
			// 2 -> 처리상태 = 처리
			data.put("rcvno", rcvNo);
			svDao.svRactInsert(data);
			svDao.svPrcState(data);
		}
		
		return rcvNo;
	}

	// 서비스 단일 삭제
	@Override
	public void svDelete(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		RcvDto svDto = new RcvDto();
		
		svDto.setSiteid(siteId);
		svDto.setEdtuser(userNo);
		svDto.setRcvno(rcvno);
		
		svDao.svDelete(svDto);
	}

	// 서비스 멀티 삭제
	@Override
	public void svMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String sCheck[] = request.getParameterValues("rcvno");
		
		RcvDto svDto = new RcvDto();
		
		svDto.setSiteid(siteId);
		svDto.setEdtuser(userNo);
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int rcvno = Integer.parseInt(sCheck[i]);
			svDto.setRcvno(rcvno);
			svDao.svDelete(svDto);
		}
		
	}

	// 서비스 처리이력 탭
	@Override
	public List<Map<String, Object>> svTabRact(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		RactDto ractDto = new RactDto();
		ractDto.setSiteid(siteId);
		ractDto.setRcvno(rcvno);
		
		List<Map<String, Object>> tabRact = svDao.svTabRact(ractDto);
		
		return tabRact;
	}

	// 서비스 이관 이력 탭
	@Override
	public List<Map<String, Object>> svTabConvey(HttpServletRequest request, int rcvno) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ConveyDto conveyDto = new ConveyDto();
		conveyDto.setRcvno(rcvno);
		conveyDto.setSiteid(siteId);
		List<Map<String,Object>> tabConvey = svDao.conveyTabList(conveyDto);
		
		return tabConvey;
	}

	// 서비스 이관 추가
	@Override
	public void svConveyInsert(HttpServletRequest request, ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Map<String,Object> param = new HashMap();
		param.put("siteid", siteId);
		param.put("prcstate", 3);
		// 3 -> 처리상태 = 이관
		param.put("userno", userNo);
		param.put("rcvno", conveyDto.getRcvno());
		
		svDao.svPrcState(param);
		
		conveyDto.setSiteid(siteId);
		conveyDto.setReguser(userNo);
		conveyDto.setEdtuser(userNo);
		
		svDao.conveyInsert(conveyDto);
		
	}

}
