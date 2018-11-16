package saas.crud.crm.au.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;
import saas.crud.crm.au.service.AuService;

@Controller
public class AuController {
	
	@Autowired
	AuService auService;
	
	private static final Logger logger = LoggerFactory.getLogger(AuController.class);
	//담당자 정보
	@RequestMapping(value="/common/user", method=RequestMethod.GET)
	public ModelAndView authcommonUserList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	
	@RequestMapping(value="/common/user", method=RequestMethod.POST)
	public ModelAndView authcommonUserSearchList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	
	@RequestMapping(value="/ad/user", method=RequestMethod.GET)
	public ModelAndView authAdminUserList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/au/ad/adminList");
		return mView;
	}
	
	@RequestMapping(value="/ad/user", method=RequestMethod.POST)
	public ModelAndView authAdminUserSearchList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/au/ad/adminList");
		return mView;
	}
	
	@RequestMapping(value="/ad/user/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserRead(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		mView.setViewName("/au/ad/adminRead");
		return mView;
	}
	@RequestMapping(value="/ad/user/post", method=RequestMethod.GET)
	public ModelAndView authAdminUserInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/au/ad/adminInsert");
		return mView;
	}
	
	@RequestMapping(value="/ad/user/post", method=RequestMethod.POST)
	public ModelAndView authAdminUserInsertSet(HttpServletRequest request, @ModelAttribute UserDto userDto) {
		ModelAndView mView = new ModelAndView();
		int userNo = auService.userInsert(request, userDto);
		mView.setViewName("redirect:/ad/user/"+userNo);
		return mView;
	}
	
	@RequestMapping(value="/ad/user/post/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserUpdate(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		mView.setViewName("/au/ad/adminUpdate");
		return mView;
	}
	
	@RequestMapping(value="/ad/user/post/{userno}", method=RequestMethod.PUT)
	public ModelAndView authAdminUserUpdateSet(HttpServletRequest request, @ModelAttribute UserDto userDto) {
		ModelAndView mView = new ModelAndView();
		auService.userUpdate(request, userDto);
		int userNo = userDto.getUserno();
		mView.setViewName("redirect:/ad/user/"+userNo);
		return mView;
	}
	
	@RequestMapping(value="/ad/user/{userno}", method=RequestMethod.POST)
	public ModelAndView authAdminUserDelete(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = new ModelAndView();
		auService.userDelete(request,userno);
		mView.setViewName("redirect:/ad/user");
		return mView;
	}
	
	@RequestMapping(value="/ad/user/delete", method=RequestMethod.POST)
	public ModelAndView authAdminUserDeleteSet(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		auService.userMultiDelete(request);
		mView.setViewName("redirect:/ad/user");
		return mView;
	}
	
	@ResponseBody
	@RequestMapping(value="/user/idcheck/{userid}",method=RequestMethod.GET)
	public int authAdminUserIdCheck(@PathVariable String userid) {
		int userId = auService.userIdCheck(userid);
		return userId;
	}
	
	@ResponseBody
	@RequestMapping(value="/user/tab/{siteid}", method=RequestMethod.GET)
	public List<Map<String,Object>> authTabTopList(HttpServletRequest request,@PathVariable int siteid){
		
		List<Map<String,Object>> userTopList = auService.userTopList(siteid);
		
		return userTopList;
	}
	
	@RequestMapping(value="/ad/user/menu/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserMenuInsert(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		mView.setViewName("/au/ad/adminMenuUpdate");
		return mView;
	}
	
	@RequestMapping(value="/ad/user/menu",method=RequestMethod.POST)
	public ModelAndView authAdminUserMenuInsertSet(HttpServletRequest request, @ModelAttribute UserMenuDto userMenuDto) {
		int userNo = userMenuDto.getUserno();
		ModelAndView mView = new ModelAndView();
		auService.userMenuInsert(request, userMenuDto);
		mView.setViewName("redirect:/ad/user/"+userNo);
		return mView;
		
	}

}