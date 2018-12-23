package saas.crud.crm.sv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
import saas.crud.crm.sv.dto.ServiceDto;
import saas.crud.crm.sv.service.SvService;

@Controller
public class SvController {
	
	@Autowired
	private SvService svService;
	
	@Autowired
	private CodeService codeService;
	
	//서비스 List
	@RequestMapping(value="/service", method=RequestMethod.GET)
	public ModelAndView authServiceList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);		
		mView.setViewName("sv/svList");
		
		return mView;
	}
	//서비스 검색 List
	@RequestMapping(value="/service", method=RequestMethod.POST)
	public ModelAndView authServiceListSearch(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);		
		mView.setViewName("sv/svList");
		
		return mView;
	}
	
	@RequestMapping(value="/service/{serviceNo}", method=RequestMethod.GET)
	public ModelAndView authServiceRead(HttpServletRequest request, @PathVariable int serviceNo) {
		ModelAndView mView = svService.svRead(request, serviceNo);
		mView.setViewName("sv/svRead");
		
		return mView;
	}
	
	@RequestMapping(value="/service/post",method=RequestMethod.GET)
	public ModelAndView authServiceInsert(HttpServletRequest request) {
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("sv/svInsert");
		
		return mView;
	}
	
	@RequestMapping(value="/service/post", method=RequestMethod.POST)
	public ModelAndView authServiceInsertSet(HttpServletResponse response,HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, @ModelAttribute ServiceDto serviceDto, @ModelAttribute RewardDto rewardDto, @ModelAttribute RactDto ractDto) {
		ModelAndView mView = new ModelAndView();
		
		int serviceNo = svService.svInsertUpdate(response,request,multipartHttpServletRequest,serviceDto,rewardDto,ractDto);
		
		mView.setViewName("redirect:/service/"+serviceNo);
		return mView;
	}
	
	@RequestMapping(value="/service/post/{serviceNo}",method=RequestMethod.GET)
	public ModelAndView authServiceUpdate(HttpServletRequest request,@PathVariable int serviceNo) {
		ModelAndView mView = svService.svRead(request,serviceNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("sv/svUpdate");
		return mView;
	}
	
	@RequestMapping(value="/service/post/{serviceNo}", method=RequestMethod.PUT)
	public ModelAndView authServiceUpdateSet(HttpServletResponse response,HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, @ModelAttribute ServiceDto serviceDto, @ModelAttribute RewardDto rewardDto, @ModelAttribute RactDto ractDto,@PathVariable int serviceNo) {
		ModelAndView mView = new ModelAndView();
		int no = svService.svInsertUpdate(response, request, multipartHttpServletRequest, serviceDto, rewardDto, ractDto);
		
		mView.setViewName("redirect:/service/"+no);
		return mView;
	}
	
	@RequestMapping(value="/service/{serviceNo}",method=RequestMethod.POST)
	public ModelAndView authServiceDelete(HttpServletRequest request, @PathVariable int serviceNo) {
		ModelAndView mView = new ModelAndView();
		
		svService.svDelete(request, serviceNo);
		
		mView.setViewName("redirect:/service");
		return mView;
	}
	
	@RequestMapping(value="/service/delete",method=RequestMethod.POST)
	public ModelAndView authServiceMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		svService.svMultiDelete(request);
		mView.setViewName("redirect:/service");
		
		return mView;
	}
	
	// 서비스 이관 팝업
	@RequestMapping(value="/convey/{rcvno}", method=RequestMethod.GET)
	public ModelAndView authcommonUserList(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("/sv/svConveyPopup");
		return mView;
	}
		
	// 서비스 이관 추가
	
	@RequestMapping(value="/convey",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> authSvRactInsert(HttpServletRequest request, @ModelAttribute ConveyDto conveyDto) {
		
		svService.svConveyInsert(request, conveyDto);
		int serviceNo = conveyDto.getServiceno();
		List<Map<String, Object>> tabRact = svService.svTabConvey(request,serviceNo);
		
		return tabRact;
	}
		
	// 서비스 처리 이력 탭
		
	@RequestMapping(value="/tab/ract/{serviceNo}", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> authSvTabRact(HttpServletRequest request, @PathVariable int serviceNo){
		
		List<Map<String, Object>> tabRact = svService.svTabRact(request,serviceNo);
		
		return tabRact;
		
	}
	
	// 서비스 이관 이력 탭
	@RequestMapping(value="/tab/convey/{serviceNo}", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> authSvTabConvey(HttpServletRequest request, @PathVariable int serviceNo){
		List<Map<String, Object>> tabConvey = svService.svTabConvey(request,serviceNo);
		
		return tabConvey;
		
	}
	
	@RequestMapping(value="/service/convey", method=RequestMethod.GET)
	public ModelAndView authSvConveyList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);
		mView.setViewName("sv/svList");
		return mView;
	}
}