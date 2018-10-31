package saas.crud.crm.au.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.service.AdService;

@Controller
public class AdController {
	
	@Autowired
	AdService adService;
	
	private static final Logger logger = LoggerFactory.getLogger(MaController.class);
	//담당자 정보
	@RequestMapping(value="/common/user", method=RequestMethod.GET)
	public ModelAndView commonUserList(HttpServletRequest request) {
		ModelAndView mView = adService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	@RequestMapping(value="/common/user", method=RequestMethod.POST)
	public ModelAndView commonUserSearchList(HttpServletRequest request) {
		ModelAndView mView = adService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	

}
