package saas.crud.crm.au.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.common.PagingCommon;

@Service
public class AuServiceImpl implements AuService{
	
	@Autowired
	AuDao auDao;
	
	@Override
	public ModelAndView userList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		ModelAndView mView = new ModelAndView();
		
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		String userName = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String userId = request.getParameter("userid");
		String isDelete = request.getParameter("isdelete");
		String strDate = request.getParameter("strdate");
		String endDate = request.getParameter("enddate");
		
		Map<String, Object> search = new HashMap();
		
		if(userName=="") {
			userName = null;
		}
		if(mobile=="") {
			mobile = null;
		}
		if(userId=="") {
			userId = null;
		}
		if(isDelete=="") {
			isDelete = null;
		}
		if(strDate=="") {
			strDate = null;
		}
		if(endDate=="") {
			endDate = null;
		}
		
		
		search.put("siteid",SITEID);
		search.put("username", userName);
		search.put("mobile", mobile);
		search.put("userid", userId);
		search.put("isdelete",isDelete);
		search.put("strdate", strDate);
		search.put("enddate", endDate);
		
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
		
		mView.addObject("user",userInfo);
		return mView;
	}

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

}
