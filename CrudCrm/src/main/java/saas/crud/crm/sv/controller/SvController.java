package saas.crud.crm.sv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RcvDto;
import saas.crud.crm.sv.service.SvService;

@Controller
public class SvController {
	
	@Autowired
	private SvService svService;
	// 서비스 list 
	@RequestMapping(value="/service",method=RequestMethod.GET)
	public ModelAndView authSvList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);
		mView.setViewName("sv/svList");
		return mView;
	}
	//서비스 List 검색
	@RequestMapping(value="/service",method=RequestMethod.POST)
	public ModelAndView authSvSearchList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);
		mView.setViewName("sv/svList");
		return mView;
	}
	// 서비스 상세 정보
	@RequestMapping(value="/service/{rcvno}",method=RequestMethod.GET)
	public ModelAndView authSvRead(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("sv/svRead");
		return mView;
	}
	// 서비스 수정화면
	@RequestMapping(value="/service/post/{rcvno}",method=RequestMethod.GET)
	public ModelAndView authSvUpdate(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("sv/svUpdate");
		return mView;
	}
	// 서비스 수정
	@RequestMapping(value="/service/post/{rcvno}",method=RequestMethod.PUT)
	public ModelAndView authSvUpdateSet(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = new ModelAndView();
		svService.svUpdate(request);
		mView.setViewName("redirect:/service/"+rcvno);
		return mView;
	}
	// 서비스 추가 화면
	@RequestMapping(value="/service/post", method=RequestMethod.GET)
	public ModelAndView authSvInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sv/svInsert");
		
		return mView;
	}
	// 서비스 추가
	@RequestMapping(value="/service/post", method=RequestMethod.POST)
	public ModelAndView authSvInsertSet(HttpServletRequest request, @ModelAttribute RcvDto rcvDto) {
		ModelAndView mView = new ModelAndView();
		
		int rcvNo = svService.svInsert(request,rcvDto);
		
		mView.setViewName("redirect:/service/"+rcvNo);
		
		return mView;
	}
	// 서비스 멀티 삭제
	@RequestMapping(value="/service/delete", method=RequestMethod.POST)
	public ModelAndView authSvMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		svService.svMultiDelete(request);
		
		mView.setViewName("redirect:/service");
		
		return mView;
	}
	// 서비스 단일 삭제
	@RequestMapping(value="/service/{rcvno}", method=RequestMethod.POST)
	public ModelAndView authSvDelete(HttpServletRequest request,@PathVariable int rcvno) {
		ModelAndView mView = new ModelAndView();
		
		svService.svDelete(request,rcvno);
		
		mView.setViewName("redirect:/service");
		
		return mView;
	}
	
	// 서비스 이관 팝업
	@RequestMapping(value="/convey/{rcvno}", method=RequestMethod.GET)
	public ModelAndView authcommonUserList(HttpServletRequest request,@PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("/sv/svConveyPopup");
		return mView;
	}
	
	// 서비스 이관 추가
	@ResponseBody
	@RequestMapping(value="/convey",method=RequestMethod.POST)
	public List<Map<String,Object>> authSvRactInsert(HttpServletRequest request, @ModelAttribute ConveyDto conveyDto) {
		
		svService.svConveyInsert(request, conveyDto);
		int rcvno = conveyDto.getRcvno();
		List<Map<String, Object>> tabRact = svService.svTabConvey(request,rcvno);
		
		return tabRact;
	}
	
	// 서비스 처리 이력 탭
	@ResponseBody
	@RequestMapping(value="/tab/ract/{rcvno}", method=RequestMethod.GET)
	public List<Map<String, Object>> authSvTabRact(HttpServletRequest request, @PathVariable int rcvno){
		
		List<Map<String, Object>> tabRact = svService.svTabRact(request,rcvno);
		
		return tabRact;
		
	}
	
	// 서비스 이관 이력 탭
	@ResponseBody
	@RequestMapping(value="/tab/convey/{rcvno}", method=RequestMethod.GET)
	public List<Map<String, Object>> authSvTabConvey(HttpServletRequest request, @PathVariable int rcvno){
		
		List<Map<String, Object>> tabRact = svService.svTabConvey(request,rcvno);
		
		return tabRact;
		
	}


}
