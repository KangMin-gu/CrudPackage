package saas.crud.crm.au.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.CodeDao;
import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.ce.CrudRemote;
import saas.crud.crm.ce.LoginManager;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao urDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private CrudRemote crudRemote;
	
	@Override
	public ModelAndView login(HttpServletResponse response, HttpServletRequest request, UserDto urDto) {
		
		Map<String, Object> urInfo = urDao.getData(urDto.getUserid());
		String userId = urInfo.get("USERID").toString();
		String pwd = urDto.getUserpassword();
		LoginManager loginManager = LoginManager.getInstance();
		StringBuffer buf = new StringBuffer();
		String location=request.getRequestURI();
		String url = request.getParameter("url"); 
		
		boolean isValid = false;  		
		if(urInfo != null) {
			boolean isMatch=encoder.matches(pwd,urInfo.get("USERPASSWORD").toString());			
			if(isMatch) {
				isValid = true;
				
				if(!loginManager.isUsing(userId)) {
					
					loginManager.setSession(request.getSession(),urInfo.get("USERID").toString()); // 로그인정보 로그인매니저등록
				
				}else {			
					loginManager.removeSession(userId);
					buf.append("<script>alert('다른 사용자가 로그인 되어 있습니다. 이전 사용자를 로그아웃 합니다.'); location.href='");
				 	buf.append(location);
				 	buf.append("';</script>");							 		
					response.setContentType("text/html; charset=UTF-8");
					 
					PrintWriter out;
					try {
						out = response.getWriter();
						out.println(buf);					 
						out.flush();
					} catch (IOException e) {
					
						e.printStackTrace();
					}
				}										
			}
		}
		
		ModelAndView mView = new ModelAndView();
		if(isValid){
			
			Map<String,Object> param = crudRemote.getRemote(request);
			param.put("userno", urInfo.get("USERNO"));
			param.put("siteid", urInfo.get("SITEID"));
			
			urDao.userHistory(param);
			
			List<Map<String,String>> urMenu = urDao.getMenu(urDto.getUserid());
			
			
		
			for(int i=0; i<urMenu.size(); i++) {	
				
				String menVal = urMenu.get(i).get("MENUVAL");
				//메뉴 코드 세션 분기처리
				if(menVal.equals("10000")) {
					request.getSession().setAttribute("cm", menVal);
				}else if(menVal.equals("11000")) {
					request.getSession().setAttribute("cm1", menVal);
				}else if(menVal.equals("20000")) {
					request.getSession().setAttribute("sa", menVal);
				}else if(menVal.equals("21000")) {
					request.getSession().setAttribute("sa1", menVal);
				}else if(menVal.equals("22000")) {
					request.getSession().setAttribute("sa2", menVal);
				}else if(menVal.equals("23000")) {
					request.getSession().setAttribute("sa3", menVal);
				}else if(menVal.equals("30000")) {
					request.getSession().setAttribute("sv", menVal);
				}else if(menVal.equals("31000")) {
					request.getSession().setAttribute("sv1", menVal);
				}else if(menVal.equals("32000")) {
					request.getSession().setAttribute("sv2", menVal);
				}else if(menVal.equals("33000")) {
					request.getSession().setAttribute("sv3", menVal);
				}else if(menVal.equals("34000")) {
					request.getSession().setAttribute("sv4", menVal);
				}else if(menVal.equals("35000")) {
					request.getSession().setAttribute("sv5", menVal);
				}else if(menVal.equals("40000")) {
					request.getSession().setAttribute("cp", menVal);
				}else if(menVal.equals("41000")) {
					request.getSession().setAttribute("cp1", menVal);
				}else if(menVal.equals("42000")) {
					request.getSession().setAttribute("cp2", menVal);
				}else if(menVal.equals("43000")) {
					request.getSession().setAttribute("cp3", menVal);
				}else if(menVal.equals("44000")) {
					request.getSession().setAttribute("cp4", menVal);
				}else if(menVal.equals("50000")) {
					request.getSession().setAttribute("vc", menVal);
				}else if(menVal.equals("51000")) {
					request.getSession().setAttribute("vc1", menVal);
				}else if(menVal.equals("60000")) {
					request.getSession().setAttribute("rp", menVal);
				}else if(menVal.equals("90000")) {
					request.getSession().setAttribute("au", menVal);
				}

			}
			
			//사용자정보 세션 등록 
			request.getSession().setAttribute("USERID", urInfo.get("USERID")); //사용자아이디
			request.getSession().setAttribute("USERNAME", urInfo.get("USERNAME")); //사용자이름
			request.getSession().setAttribute("USERNO", urInfo.get("USERNO")); //사용자 PK
			request.getSession().setAttribute("SITEID", urInfo.get("SITEID")); //사용자 사이트번호
			request.getSession().setAttribute("SITENAME", urInfo.get("SITENAME")); //사이트 이름
			request.getSession().setAttribute("CALLNAME", urInfo.get("CALLNAME")); //사이트 약어
			request.getSession().setAttribute("USERLANG", urInfo.get("USERLANG")); //사용자 언어
			request.getSession().setAttribute("CHKAUTH", urInfo.get("CHKAUTH")); //사용자 권한
			request.getSession().setAttribute("SITELOGO", urInfo.get("IMGPATH")); //회사 로고
			request.getSession().setAttribute("SIDESTATES","1");
			
			if(url != null) {
				buf.append("<script>location.href='");
			 	buf.append(url);
			 	buf.append("';</script>");
			}else {
				buf.append("<script>location.href='/';</script>");
			}
			 		
			response.setContentType("text/html; charset=UTF-8");
				 
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println(buf);					 
				out.flush();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
				
		}else{
			
			if(url != null) {
				
				buf.append("<script>alert('아이디 혹은 비밀번호가 틀립니다.');");
				buf.append("location.href='/login?url=");
				buf.append(url);
				buf.append("';</script>");
				
			}else {
				
				buf.append("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); location.href='");
			 	buf.append(location);
			 	buf.append("';</script>");
			}
			
		 	response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println(buf);					 
				out.flush();
			} catch (IOException e) {					
				e.printStackTrace();
			}
		}
				
		return mView;
	}
	
	//공지사항
	@Override
	public ModelAndView crudNotice(HttpServletRequest request) {
		List<Map<String, Object>> crudNotice = urDao.crudNotice();
		ModelAndView mView = new ModelAndView();
		mView.addObject("crudNotice", crudNotice);
		return mView;
	}
	
	//사이드바 상태 업데이트
	@Override
	public String sideStatus(HttpServletRequest request, String userId) {
		String sidestates = request.getSession().getAttribute("SIDESTATES").toString();
		if(sidestates.equals("1")) {
			request.getSession().setAttribute("SIDESTATES","0");
		}else {
			request.getSession().setAttribute("SIDESTATES","1");	
		}	
		String states = request.getSession().getAttribute("SIDESTATES").toString();
		return states;
	}
	
	
}