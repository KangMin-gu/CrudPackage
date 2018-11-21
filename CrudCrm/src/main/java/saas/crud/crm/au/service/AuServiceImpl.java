package saas.crud.crm.au.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;
import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.ce.SearchRequest;


@Service
public class AuServiceImpl implements AuService{
	
	@Autowired
	private AuDao auDao;
	
	// 사용자 List 검색 
	@Override
	public ModelAndView userList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		
		SearchRequest searchRequest = new SearchRequest();
		
		Map<String, Object> search = searchRequest.Search(request);

		int totalRows = auDao.urTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> userList = auDao.urList(search);
		
		mView.addObject("user",userList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	//사용자 상세 정보
	@Override
	public ModelAndView userRead(HttpServletRequest request, int userNo) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		UserDto userDto = new UserDto();
		
		ModelAndView mView = new ModelAndView();
		userDto.setUserno(userNo);
		userDto.setSiteid(siteId);
		
		Map<String,Object> userInfo = auDao.urRead(userDto);
		List<Map<String,Object>> menuInfo = auDao.urMenuList(siteId);
		List<Map<String,Object>> userMenu = auDao.urUserMenuList(userDto);
		
		mView.addObject("user",userInfo);
		mView.addObject("menu",menuInfo);
		mView.addObject("userMenu",userMenu);
		return mView;
	}
 
	// 사용자 추가
	@Override
	public int userInsert(HttpServletRequest request, UserDto userDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		userDto.setSiteid(siteId);
		userDto.setReguser(userNo);
		userDto.setEdtuser(userNo);
		
		int insertUserNo = auDao.urInsert(userDto);
		
		return insertUserNo;
	}
	
	// 사용자 수정
	@Override
	public void userUpdate(HttpServletRequest request, UserDto userDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		userDto.setSiteid(siteId);
		userDto.setEdtuser(userNo);
		
		auDao.urUpdate(userDto);
	}

	// 사용자 삭제
	@Override
	public void userDelete(HttpServletRequest request, int userNo) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int loginUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		UserDto userDto = new UserDto();
		
		userDto.setSiteid(siteId);
		userDto.setEdtuser(loginUserNo);
		userDto.setUserno(userNo);
		
		auDao.urDelete(userDto);
	}

	// 사용자 멀티 삭제
	@Override
	public void userMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int loginUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String sCheck[] = request.getParameterValues("userno");
		
		UserDto userDto = new UserDto();
		userDto.setSiteid(siteId);
		userDto.setEdtuser(loginUserNo);
		
		if(sCheck.length > 0) {
			for(int i=0; i<sCheck.length; i++) {
				int userNo = Integer.parseInt(sCheck[i]);
				userDto.setUserno(userNo);
				auDao.urDelete(userDto);
			}
		}
		
	}

	// 사용자 Id 중복 체크
	@Override
	public int userIdCheck(String userId) {
		// TODO Auto-generated method stub
		int idCheck = auDao.urIdCheck(userId);
		return idCheck;
	}

	// 사용자 탭
	@Override
	public List<Map<String, Object>> userTopList(int siteid) {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> userList = auDao.urTopList(siteid);
		return userList;
	}

	// 사용자에게 메뉴 추가
	@Override
	public void userMenuInsert(HttpServletRequest request, UserMenuDto userMenuDto) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int loginUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String menu[] = request.getParameterValues("usermenuno");

		userMenuDto.setSiteid(siteId);
		userMenuDto.setReguser(loginUserNo);
		userMenuDto.setEdtuser(loginUserNo);
		userMenuDto.setIsdelete(0);
		
		auDao.urMenuDelete(userMenuDto);
		
		int menulen = menu.length;
		
		for (int i = 0; i < menulen; i++) {
			userMenuDto.setMenuno(Integer.parseInt(menu[i]));
			auDao.urMenuInsert(userMenuDto);
		}
	}

}
