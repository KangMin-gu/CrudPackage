package saas.crud.crm.au.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.LoginManager;


@Service
public class AuServiceImpl implements AuService{
	
	@Autowired
	private AuDao auDao;
	
	@Autowired
	private UserDao urDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private CrudEngine crud;
	
	// 사용자 List 검색 
	@Override
	public ModelAndView userList(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);

		int totalRows = auDao.urTotalRows(search);
		
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String hash = encoder.encode(userDto.getUserpassword());
		userDto.setUserpassword(hash);
		userDto.setSiteid(siteId);
		userDto.setReguser(userNo);
		userDto.setEdtuser(userNo);
		
		int insertUserNo = auDao.urInsert(userDto);
		
		return insertUserNo;
	}
	
	// 사용자 수정
	@Override
	public void userUpdate(HttpServletRequest request, UserDto userDto) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		userDto.setSiteid(siteId);
		userDto.setEdtuser(userNo);
		auDao.urUpdate(userDto);
	}

	// 사용자 삭제
	@Override
	public void userDelete(HttpServletRequest request, int userNo) {
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
		int idCheck = auDao.urIdCheck(userId);
		return idCheck;
	}

	// 사용자 탭
	@Override
	public List<Map<String, Object>> userTopList(int siteid) {
		List<Map<String,Object>> userList = auDao.urTopList(siteid);
		return userList;
	}

	// 사용자에게 메뉴 추가
	@Override
	public void userMenuInsert(HttpServletRequest request, UserMenuDto userMenuDto) {
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
	
	//내 정보 수정
	@Override
	public ModelAndView myInfoReadSet(HttpServletRequest request, UserDto userDto) {
		String newPwd = request.getParameter("newpwd");
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String userId = request.getSession().getAttribute("USERID").toString();
		
		userDto.setUserno(userNo);
		userDto.setSiteid(siteId);
		userDto.setUserid(userId);
		String beforePwd = userDto.getUserpassword();
		Map<String, Object> urInfo = urDao.getData(userId);
		
		ModelAndView mView = new ModelAndView();
		
		boolean isMatch=encoder.matches(userDto.getUserpassword(), urInfo.get("USERPASSWORD").toString());		
		if(isMatch) {
			if(newPwd != null) {
				String hash=encoder.encode(newPwd);
				userDto.setUserpassword(hash);
			}
			auDao.urUpdate(userDto);
			mView.addObject("msg", "수정되었습니다.");
			mView.addObject("url","myinfo/"+userNo);
		}else {
			mView.addObject("msg", "사용자 비밀번호를 확인 해주세요.");
			mView.addObject("url","myinfo/post/"+userNo);
		}
		return mView;
	}
	
	//사용자 비밀번호 초기화
	@Override
	public ModelAndView userPwdReset(HttpServletRequest request, int userNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int resetUserNo = userNo;
		int adminNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		//StringBuffer type의 temp에 랜덤 숫자와 문자열을 담는다.
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}	
		
		//String 타입으로 읽을수 있게 형변환한다.
		String newPwd = temp.toString();
		String hash = encoder.encode(newPwd);
		
		UserDto resetUserDto = new UserDto();
		resetUserDto.setUserno(resetUserNo);
		resetUserDto.setUserpassword(hash);
		resetUserDto.setSiteid(siteId);
		
		UserDto adminUserDto = new UserDto();
		adminUserDto.setUserno(adminNo);
		adminUserDto.setSiteid(siteId);
		
		Map<String, Object> resetUserInfo = auDao.urRead(resetUserDto);
		Map<String, Object> adminUserInfo = auDao.urRead(adminUserDto);
		Map<String, Object> sendPwdInfo = new HashMap<>();
		
		
		StringBuffer buf = new StringBuffer();
		buf.append("초기화된 비밀번호는 : "+newPwd+" 입니다.");
		//초기화된 비밀번호 업데이트
		auDao.userPwdReset(resetUserDto);
		//초기화된 비밀번호 이메일테이블 인서트
		sendPwdInfo.put("adminid",adminNo);
		sendPwdInfo.put("userid",resetUserInfo.get("USERID"));
		sendPwdInfo.put("siteid",siteId);
		sendPwdInfo.put("toemail",resetUserInfo.get("EMAIL"));
		sendPwdInfo.put("username",resetUserInfo.get("USERNAME"));
		sendPwdInfo.put("content", buf.toString());
		sendPwdInfo.put("subject", "IDEA CRM의 비밀번호가 초기화 되었습니다.");
		sendPwdInfo.put("cstname",adminUserInfo.get("USERNAME"));
		sendPwdInfo.put("fromemail",adminUserInfo.get("EMAIL"));
		sendPwdInfo.put("userno", resetUserInfo.get("USERNO"));
		auDao.userPwdResetsend(sendPwdInfo);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("msg","비밀번호 초기화 되었습니다. 사용자의 메일로 초기화된 비밀번호가 발송됩니다.");
		mView.addObject("url","ad/user/"+resetUserNo);
		return mView;
	}
	
	//사용중인 유저 확인
	@Override
	public ModelAndView useSessionList(HttpServletRequest reuqest, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("in");
		LoginManager loginManager = LoginManager.getInstance();
		List<Map<String, String>> loginUserss = loginManager.allSession();		
		
		List<Map<String, Object>> listSender = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapSender = new HashMap<>();
		
		for(int i = 0; i< loginUserss.size(); i++) {
			loginUserss.get(i);
			System.out.println(loginUserss.get(i));
			
		}
		 
		ModelAndView mView = new ModelAndView();
		mView.addObject("sessionList", listSender);
		return mView;
	}

}
