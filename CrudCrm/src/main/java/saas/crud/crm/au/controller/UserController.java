package saas.crud.crm.au.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService urService;
	
	@Autowired
	private CodeService codeService;
	
	//로그인폼요청
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request) {
		
		String url=request.getParameter("url");
		
		if(url==null){        
			url=request.getContextPath()+"/"; 
		}
		//로그인후 이동할 url 정보를 ModelAndView 객체에 담고
		//ModelAndView mView = urService.crudNotice(request);
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.addObject("url", url);
		mView.setViewName("au/login");
		return mView;
	}
	
	//로그인 요청
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login(HttpServletResponse response, HttpServletRequest request, @ModelAttribute UserDto urDto) {		
		 urService.login(response, request, urDto); 
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	
}
