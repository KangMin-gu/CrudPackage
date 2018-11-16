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
	AuDao auDao;
	
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

	@Override
	public ModelAndView userRead(HttpServletRequest request, int userNo) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		UserDto userDto = new UserDto();
		
		ModelAndView mView = new ModelAndView();
		userDto.setUserno(userNo);
		userDto.setSiteid(SITEID);
		
		Map<String,Object> userInfo = auDao.urRead(userDto);
		List<Map<String,Object>> menuInfo = auDao.urMenuList(SITEID);
		List<Map<String,Object>> userMenu = auDao.urUserMenuList(userDto);
		
		mView.addObject("user",userInfo);
		mView.addObject("menu",menuInfo);
		mView.addObject("userMenu",userMenu);
		return mView;
	}
 //
	@Override
	public int userInsert(HttpServletRequest request, UserDto userDto) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		userDto.setSiteid(SITEID);
		userDto.setReguser(USERNO);
		userDto.setEdtuser(USERNO);
		
		int userNo = auDao.urInsert(userDto);
		
		return userNo;
	}

	@Override
	public void userUpdate(HttpServletRequest request, UserDto userDto) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		userDto.setSiteid(SITEID);
		userDto.setEdtuser(USERNO);
		
		auDao.urUpdate(userDto);
	}

	@Override
	public void userDelete(HttpServletRequest request, int userNo) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		UserDto userDto = new UserDto();
		
		userDto.setSiteid(SITEID);
		userDto.setEdtuser(USERNO);
		userDto.setUserno(userNo);
		
		auDao.urDelete(userDto);
	}

	@Override
	public void userMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String sCheck[] = request.getParameterValues("userno");
		
		UserDto userDto = new UserDto();
		userDto.setSiteid(SITEID);
		userDto.setEdtuser(USERNO);
		
		if(sCheck.length > 0) {
			for(int i=0; i<sCheck.length; i++) {
				int userNo = Integer.parseInt(sCheck[i]);
				userDto.setUserno(userNo);
				auDao.urDelete(userDto);
			}
		}
		
	}

	@Override
	public int userIdCheck(String userId) {
		// TODO Auto-generated method stub
		int idCheck = auDao.urIdCheck(userId);
		return idCheck;
	}

	@Override
	public List<Map<String, Object>> userTopList(int siteid) {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> userList = auDao.urTopList(siteid);
		return userList;
	}

	@Override
	public List<Map<String, Object>> ModalUserList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, Object> total = new HashMap();
		
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
		total.put("page", page);
		total.put("totalRows", totalRows);
		total.put("search", search);
		
		userList.add(total);
		
		return userList;
	}

	@Override
	public void userMenuInsert(HttpServletRequest request, UserMenuDto userMenuDto) {
		// TODO Auto-generated method stub
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String menu[] = request.getParameterValues("usermenuno");

		userMenuDto.setSiteid(SITEID);
		userMenuDto.setReguser(USERNO);
		userMenuDto.setEdtuser(USERNO);
		userMenuDto.setIsdelete(0);
		
		auDao.urMenuDelete(userMenuDto);
		
		int menulen = menu.length;
		
		for (int i = 0; i < menulen; i++) {
			userMenuDto.setMenuno(Integer.parseInt(menu[i]));
			auDao.urMenuInsert(userMenuDto);
		}
	}

}