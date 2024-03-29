package saas.crud.crm.au.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import saas.crud.crm.au.dto.CodeDto;
import saas.crud.crm.au.dto.NoticeDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;
import saas.crud.crm.au.service.AuService;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.CompanyService;

@Controller
public class AuController {
	
	@Autowired
	private AuService auService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private CodeService codeService;
	
	private static final Logger logger = LoggerFactory.getLogger(AuController.class); 
	// 담당자 팝업 검색
	@RequestMapping(value="/common/user", method=RequestMethod.GET)
	public ModelAndView authcommonUserList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	// 담당자 팝업 검색
	@RequestMapping(value="/common/user", method=RequestMethod.POST)
	public ModelAndView authcommonUserSearchList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/common/user/userList");
		return mView;
	}
	//회원 정보 List
	@RequestMapping(value="/ad/user", method=RequestMethod.GET)
	public ModelAndView authAdminUserList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/au/ad/adminList");
		return mView;
	}
	//회원 정보 List 검색
	@RequestMapping(value="/ad/user", method=RequestMethod.POST)
	public ModelAndView authAdminUserSearchList(HttpServletRequest request) {
		ModelAndView mView = auService.userList(request);
		mView.setViewName("/au/ad/adminList");
		return mView;
	}
	//회원 정보 상세 
	@RequestMapping(value="/ad/user/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserRead(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		mView.setViewName("/au/ad/adminRead");
		return mView;
	}
	// 회원 정보 추가 화면
	@RequestMapping(value="/ad/user/post", method=RequestMethod.GET)
	public ModelAndView authAdminUserInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		//Map<String,Object> code = codeService.getCode();
		UserDto userDto = new UserDto();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.addObject("userDto",userDto);
		mView.setViewName("/au/ad/adminInsert");
		return mView;
	}
	// 회원 정보 추가
	@RequestMapping(value="/ad/user/post", method=RequestMethod.POST)
	public ModelAndView authAdminUserInsertSet(HttpServletRequest request, @ModelAttribute UserDto userDto) {
		ModelAndView mView = new ModelAndView();
		int userNo = auService.userInsert(request, userDto);
		mView.setViewName("redirect:/ad/user/"+userNo);
		return mView;
	}
	// 회원 정보 수정 화면
	@RequestMapping(value="/ad/user/post/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserUpdate(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("/au/ad/adminUpdate");
		return mView;
	}
	// 회원 정보 수정
	@RequestMapping(value="/ad/user/post/{userno}", method=RequestMethod.PUT)
	public ModelAndView authAdminUserUpdateSet(HttpServletRequest request, @ModelAttribute UserDto userDto) {
		ModelAndView mView = new ModelAndView();
		auService.userUpdate(request, userDto);
		int userNo = userDto.getUserno();
		mView.setViewName("redirect:/ad/user/"+userNo);
		return mView;
	}
	// 회원 단일 삭제
	@RequestMapping(value="/ad/user/{userno}", method=RequestMethod.POST)
	public ModelAndView authAdminUserDelete(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = new ModelAndView();
		auService.userDelete(request,userno);
		mView.setViewName("redirect:/ad/user");
		return mView;
	}
	// 회원 멀티 삭제
	@RequestMapping(value="/ad/user/delete", method=RequestMethod.POST)
	public ModelAndView authAdminUserDeleteSet(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		auService.userMultiDelete(request);
		mView.setViewName("redirect:/ad/user");
		return mView;
	}
	// 회원 중복ID 체크
	@RequestMapping(value="/user/idcheck/{userid}",method=RequestMethod.GET)
	@ResponseBody
	public int authAdminUserIdCheck(@PathVariable String userid) {
		int userId = auService.userIdCheck(userid);
		return userId;
	}
	// 사용자 탭
	@RequestMapping(value="/user/tab/{siteid}", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> authTabTopList(HttpServletRequest request,@PathVariable int siteid){
		
		List<Map<String,Object>> userTopList = auService.userTopList(siteid);
		
		return userTopList;
	}
	// 회원에게 메뉴 부여 화면
	@RequestMapping(value="/ad/user/menu/{userno}", method=RequestMethod.GET)
	public ModelAndView authAdminUserMenuInsert(HttpServletRequest request, @PathVariable int userno) {
		ModelAndView mView = auService.userRead(request, userno);
		mView.setViewName("/au/ad/adminMenuUpdate");
		return mView;
	}
	// 회원에게 메뉴 부여
	@RequestMapping(value="/ad/user/menu",method=RequestMethod.POST)
	public ModelAndView authAdminUserMenuInsertSet(HttpServletRequest request, @ModelAttribute UserMenuDto userMenuDto) {
		int userNo = userMenuDto.getUserno();
		ModelAndView mView = new ModelAndView();
		auService.userMenuInsert(request, userMenuDto);
		mView.setViewName("redirect:/ad/user/"+userNo+"/#wizard-t-1");
		return mView;
	}
	// 회원이 보는 회원사 상세
	@RequestMapping(value="/ad/company/{siteId}",method=RequestMethod.GET)
	public ModelAndView authCompanyRead(@PathVariable int siteId, HttpServletRequest request) {
		ModelAndView mView = companyService.companyRead(request, siteId);
		mView.setViewName("au/ma/mc/masterRead");
		return mView;
	}
	// 내 정보
	@RequestMapping(value="/myinfo/{userNo}",method=RequestMethod.GET)
	public ModelAndView myInfoRead(HttpServletRequest request, @PathVariable int userNo) {
		ModelAndView mView = auService.userRead(request, userNo);		
		mView.setViewName("au/myinfo");
		return mView;
	}
	
	//내정보 수정 (수정폼)
	@RequestMapping(value="/myinfo/post/{userNo}",method=RequestMethod.GET)
	public ModelAndView authmyInfoReadSet(HttpServletRequest request, @PathVariable int userNo) {
		ModelAndView mView = auService.userRead(request,userNo);
		mView.setViewName("au/myinfoupdate");
		return mView;
	}
		
	//내정보 수정(수정실행)
	@RequestMapping(value="/myinfo/post/{userNo}",method=RequestMethod.POST)
	public ModelAndView authmyInfoReadSet(HttpServletRequest request, @ModelAttribute UserDto userDto, @PathVariable int userNo) {
		ModelAndView mView = auService.myInfoReadSet(request, userDto);
		mView.setViewName("au/myinforesult");
		return mView;
	}
	
	//회원 비밀번호 초기화
	@RequestMapping(value="/pwdreset/{userNo}", method=RequestMethod.GET)
	public ModelAndView authuserPwdReset(HttpServletRequest request, @PathVariable int userNo) {
		ModelAndView mView = auService.userPwdReset(request,userNo);
		mView.setViewName("au/myinforesult");
		return mView;
	}
	
	//이용 중인 유저 확인
	@RequestMapping(value="/ma/sitechk",method=RequestMethod.GET)
	public ModelAndView authuseSessionList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = auService.useSessionList(request, response);
		mView.setViewName("au/ma/check/sitecheck");
		return mView;
	}
	//접속중유저 확인
	@RequestMapping(value="/ma/sitecehck/{userId}", method=RequestMethod.GET)
	public ModelAndView authSession(HttpServletRequest request, @PathVariable String userId) {
		ModelAndView mView = auService.session(request, userId);
		return mView;
	}
	//회원사 공지사항
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public ModelAndView authNotice(HttpServletRequest request) {
		ModelAndView mView = auService.notice(request);
		mView.setViewName("au/ad/notice");
		return mView;
	}
	
	//회원사 공지사항 검색
	@RequestMapping(value="/notice", method=RequestMethod.POST)
	public ModelAndView authNoticeSearch(HttpServletRequest request) {
		ModelAndView mView = auService.notice(request);
		mView.setViewName("au/ad/notice");
		return mView;
	}
	
	//회원사 공지사항 상세보기
	@RequestMapping(value="/notice/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authNoticeDetail(HttpServletRequest request, @PathVariable int noticeId) {
		ModelAndView mView = auService.noticeDetail(request, noticeId);
		mView.setViewName("au/ad/noticedetail");
		return mView;
	}
	
	//회원사 공지폼
	@RequestMapping(value="/notice/post", method=RequestMethod.GET)
	public String authNoticeForm() {
		return "au/ad/noticeform";
	}

	//회원사 공지등록 
	@RequestMapping(value="/notice/post", method=RequestMethod.POST)
	public ModelAndView authNoticeInsert(HttpServletRequest request, @ModelAttribute NoticeDto noticeDto) {
		int noticeNo = auService.noticeInsert(request, noticeDto);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/notice/"+noticeNo);
		return mView;
	}
	
	//회원사 공지 수정폼
	@RequestMapping(value="/notice/post/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authNoticeUpdateForm(HttpServletRequest request, @PathVariable int noticeId) {
		ModelAndView mView = auService.noticeDetail(request, noticeId);
		mView.setViewName("au/ad/noticeupdate");
		return mView;
	}
	
	//회원사 공지수정
	@RequestMapping(value="/notice/post/{noticeId}", method=RequestMethod.PUT)
	public String authNoticeUpdate(HttpServletRequest request, @ModelAttribute NoticeDto noticeDto, @PathVariable int noticeId) {
		return "redirect:/notice/"+noticeId;
	}
	
	//회원사 공지 삭제
	@RequestMapping(value="/notice/trash/{noticeId}", method=RequestMethod.PUT)
	public String authNoticeDelete(HttpServletRequest request, @PathVariable int noticeId) {
		auService.noticeDelete(request, noticeId);
		return "redirect:/notice";
	}
	
	
	
	//데시보드설정 화면
	@RequestMapping(value="/dashboard/set", method=RequestMethod.GET)
	public String authDashboardSet(HttpServletRequest request) {
		return "au/db/dashboard";
	}
	
	
	//데시보드설정 화면
	@RequestMapping(value="/dashboard/set2", method=RequestMethod.GET)
	public String authDashboardSet2(HttpServletRequest request) {
		return "au/db/dashboard2";
	}
}