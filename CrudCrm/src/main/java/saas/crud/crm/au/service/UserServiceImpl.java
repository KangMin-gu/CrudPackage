package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView login(HttpServletRequest request, UserDto urDto) {
		
		UserDto resultDto = urDao.getData(urDto.getUSERID());
		String pwd = urDto.getUSERPASSWORD();
		
		boolean isValid = false;
		
		if(resultDto != null) {
			//boolean isMatch=encoder.matches(urDto.getUSERPASSWORD(), resultDto.getUSERPASSWORD());
			boolean isMatch = pwd.equals(resultDto.getUSERPASSWORD());
			if(isMatch) {
				isValid = true;
			}
		}
		
		ModelAndView mView = new ModelAndView();
		String url=request.getParameter("url");
				
		if(isValid){	
			//세션 등록 
			request.getSession().setAttribute("USERID", resultDto.getUSERID()); //사용자아이디
			request.getSession().setAttribute("USERNAME", resultDto.getUSERNAME()); //사용자이름
			request.getSession().setAttribute("USERNO", resultDto.getUSERNO()); //사용자 PK
			request.getSession().setAttribute("SITEID", resultDto.getSITEID()); //사용자 사이트번호
			request.getSession().setAttribute("USERLANG", resultDto.getUSERLANG()); //사용자 언어
			request.getSession().setAttribute("CHK_AUTH", resultDto.getCHK_AUTH()); //사용자 권한
			
			mView.addObject("msg", resultDto.getUSERID()+" 님 로그인 되었습니다.");
			mView.addObject("url", url);
		}else{//아이디 혹은 비밀번호가 틀린 경우 
			mView.addObject("msg", "아이디 혹은 비밀번호가 틀려요");
			String location=request.getContextPath();
			mView.addObject("url", location);		
		}
				
		return mView;
	}
	
}
