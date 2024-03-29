package saas.crud.crm.cu.controller;


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

import saas.crud.crm.au.controller.UserController;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;
import saas.crud.crm.cu.service.CustService;



@Controller
public class CustController {
	
	@Autowired
	private CustService custService;
	@Autowired
	private CodeService codeService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	//고객리스트
	@RequestMapping(value="/cust", method=RequestMethod.GET)
	public ModelAndView authcustList(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cu/custlist");
		return mView;
	}
	
	//고객리스트(검색조건)
	@RequestMapping(value="/cust", method=RequestMethod.POST)
	public ModelAndView authcustListSearch(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cu/custlist");
		return mView;
	}
	
	
	//고객리스트 (고객삭제-멀티)
	@RequestMapping(value="/cust", method=RequestMethod.PUT)
	public String authcustDelete(HttpServletRequest request,HttpServletResponse response) {
		int res = custService.svcCustDelete(request);
		return "redirect:/cust";
	}
	
	
	//고객 상세페이지(기본)
	@RequestMapping(value="/cust/view/{custno}", method=RequestMethod.GET)
	public ModelAndView authcustDetail(HttpServletRequest request 
								 ,@PathVariable int custno) {
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ModelAndView mView = new ModelAndView();
		mView = custService.svcCustDetail(custno,siteid);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cu/custdetail");
		return mView;
	}
	
	
	//고객상세(고객삭제-단일)
	@RequestMapping(value="/cust/view/{custno}", method=RequestMethod.PUT)
	public String authcustDetailDelete(HttpServletRequest request 
								 ,@PathVariable int custno) {
		int res = custService.svcCustDelete(request);
		return "redirect:/cust";
	}
	
	
	//고객 상세페이지(수정폼)
	@RequestMapping(value="/cust/post/{custno}", method=RequestMethod.GET)
	public ModelAndView authcustDetailForm(HttpServletRequest request, @PathVariable int custno) {
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.addObject("custUpdate",custService.svcCustDetailForm(custno));
		mView.setViewName("cu/custupdate");
		return mView;
	}
	
	//고객 상세페이지 (수정 실행)	
	@RequestMapping(value="/cust/post/{custno}", method=RequestMethod.POST)
	public String authcustDetailUpdate(HttpServletRequest request, @PathVariable int custno 
									,@ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		custDto.setEdituser(userno); //수정자는 로그인한 본인
		custDto.setSiteid(siteid);
		
		custDenyDto.setEdituser(userno);
		
		int res = custService.svcCustformUpdate(custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		return "redirect:/cust/view/"+res;
	}
	

	//고객 insert 폼 	
	@RequestMapping(value="/cust/post", method=RequestMethod.GET)
	public ModelAndView authcustForm(HttpServletRequest request, @ModelAttribute CustDto custDto) {
		ModelAndView mView = new ModelAndView();
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String username = request.getSession().getAttribute("USERNAME").toString();//담당자는 로그인한 유저명으로 기본설정
		mView.addObject("SESSIONUSERNO",userno);
		mView.addObject("SESSIONUSERNAME",username);
		
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cu/custinsert");
		return mView;
	}
	
	//고객 insert (실행)	
	@RequestMapping(value="/cust/post", method=RequestMethod.POST)
	public String authcustInsert(HttpServletRequest request, @ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {		
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		custDto.setReguser(userno);
		custDto.setEdituser(userno);
		custDto.setSiteid(siteid);
		
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
		int res = custService.svcCustformInsert(custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		mview.setViewName("cu/custinsert");
		return "redirect:/cust/view/"+res;
	}
		
	//고객 상세- 탭 캠페인 리스트	
	@RequestMapping(value="/cust/view/tab/camp",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authcustTabCampList(HttpServletRequest request) {
		Map<String,Object> campTab = custService.svcCustTabCampList(request);
		return campTab;
	}
	

	

}
