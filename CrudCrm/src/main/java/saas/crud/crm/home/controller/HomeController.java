package saas.crud.crm.home.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.home.service.HomeService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	
	//메인 화면 이동 MG
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView authmain(HttpServletRequest request){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("main");
		return mView;
	}
	
}
