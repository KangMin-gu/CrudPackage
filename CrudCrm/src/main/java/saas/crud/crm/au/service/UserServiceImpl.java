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

import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.au.dto.UserDto;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao urDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public ModelAndView login(HttpServletResponse response, HttpServletRequest request, UserDto urDto) {
		
		Map<String, Object> urInfo = urDao.getData(urDto.getUserid());
		String pwd = urDto.getUserpassword();
		
		boolean isValid = false;
		
		if(urInfo != null) {
			//boolean isMatch=encoder.matches(urDto.getUSERPASSWORD(), urInfo.get("USERPASSWORD"));
			boolean isMatch = pwd.equals(urInfo.get("USERPASSWORD"));
			if(isMatch) {
				isValid = true;
			}
		}
		
		ModelAndView mView = new ModelAndView();
		String url=request.getParameter("url");
		StringBuffer buf = new StringBuffer();
		
		if(isValid){
			
			List<Map<String,String>> urMenu = urDao.getMenu(urDto.getUserid());
			
			
		
			for(int i=0; i<urMenu.size(); i++) {	
				
				String menVal = urMenu.get(i).get("MENUVAL");
				//메뉴 코드 세션 분기처리
				if(menVal.equals("10000")) {
					request.getSession().setAttribute("cm", menVal);
				}else if(menVal.equals("20000")) {
					request.getSession().setAttribute("sa", menVal);
				}else if(menVal.equals("30000")) {
					request.getSession().setAttribute("sv", menVal);
				}else if(menVal.equals("40000")) {
					request.getSession().setAttribute("cp", menVal);
				}else if(menVal.equals("50000")) {
					request.getSession().setAttribute("vc", menVal);
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
				
		}else{//아이디 혹은 비밀번호가 틀린 경우 
			//추후 contextPath 를 쓸지 requestURI 를쓸지 세션로그아웃시 있던페이지로가는 URL 체크해야함.
			//String location=request.getContextPath();
			String location=request.getRequestURI();
			
			buf.append("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); location.href='");
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
				
		return mView;
	}
	
}
