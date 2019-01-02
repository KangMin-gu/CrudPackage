package saas.crud.crm.sa.controller;

import java.util.Enumeration;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.controller.UserController;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

import saas.crud.crm.sa.service.SalesService;


@Controller
public class SalesController {
	
	@Autowired 
	private SalesService salesService;
	@Autowired
	private CrudEngine crud;
	@Autowired
	private CodeService codeService;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//영업리스트
	@RequestMapping(value="/sales",method=RequestMethod.GET)
	public ModelAndView authsalesList(HttpServletRequest request) {		
		ModelAndView mView = salesService.svcSalesList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("sa/sales/saleslist");
		return mView;
	}
		
	//영업상세
	@RequestMapping(value="/sales/view/{salesno}",method=RequestMethod.GET)
	public ModelAndView authsalesDetail(HttpServletRequest request 
			 							,@PathVariable int salesno, @ModelAttribute SalesDto salesDto) {
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		salesDto.setSiteid(siteid);
		request.setAttribute("salesno", salesno);//서비스 전달용
		
		ModelAndView mView = salesService.svcSalesDetail(salesDto);
		
		//관련고객 리스트 추출
		Map<String,Object> salesCustList = salesService.svcSalesCustList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		
		mView.addObject("page",salesCustList.get("page")); //페이징
		mView.addObject("searchVal",salesCustList.get("searchVal"));//검색조건
		mView.addObject("salesCustList",salesCustList.get("salesCustList"));//관련고객
		
		mView.setViewName("sa/sales/salesdetail");
		return mView;
	}
	
	//영업상세-2탭-영업단계리스트
	@RequestMapping(value="/sales/view/tab/state",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authsalesTabState(HttpServletRequest request) {
		Map<String,Object> stateTab = salesService.svcSalesDetailStateTabList(request);
		return stateTab;
	}
	
	//영업,거래처 상세-3탭-접촉리스트
	@RequestMapping(value="/sales/view/tab/contect",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authsalesTabContect(HttpServletRequest request) {
		Map<String,Object> contectTab = salesService.svcSalesDetailContectTabList(request);
		return contectTab;
	}
	
	//영업추가. 로그인한 본인 정보 바인딩. 서비스 X 
	@RequestMapping(value="/sales/post",method=RequestMethod.GET)
	public ModelAndView authsalesForm(HttpServletRequest request,@ModelAttribute SalesDto SalesDto) {
			
		Map<String,String> defaultMap = new HashMap<String,String>();
		ModelAndView mView= new ModelAndView();		
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		
		defaultMap.put("USERNO", request.getSession().getAttribute("USERNO").toString());
		defaultMap.put("USERNAME", request.getSession().getAttribute("USERNAME").toString());
		mView.addObject("salesInsert",defaultMap);
		mView.setViewName("sa/sales/salesinsert");
		return mView;
	}
	
	//영업추가실행
	@RequestMapping(value="/sales/post",method=RequestMethod.POST)
	public String authsalesInsert(HttpServletRequest request,@ModelAttribute SalesDto SalesDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		SalesDto.setReguser(userno);
		SalesDto.setEdituser(userno);
		SalesDto.setSiteid(siteid);
		SalesDto.setIsdelete(0);
					
		int salesNo = salesService.svcSalesInsert(SalesDto);		
		return "redirect:/sales/view/"+salesNo; 
	}
	
	//영업수정폼
	@RequestMapping(value="/sales/post/{salesno}",method=RequestMethod.GET)
	public ModelAndView authsalesDetailForm(HttpServletRequest request 
												,@PathVariable int salesno, @ModelAttribute SalesDto salesDto) {
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());			
		salesDto.setSiteid(siteid);
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.addObject("salesUpdate",salesService.svcSalesDetailForm(salesDto));
		mView.setViewName("sa/sales/salesupdate");
		return mView;
	}
	//영업수정실행
	@RequestMapping(value="/sales/post/{salesno}",method=RequestMethod.POST)
	public String authsalesDetailUpdate(HttpServletRequest request,@ModelAttribute SalesDto salesDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		salesDto.setEdituser(userno);
		salesDto.setSiteid(siteid);
					
		int salesNo = salesService.svcSalesDetailUpdate(salesDto);
			
		return "redirect:/sales/view/"+salesNo; 
	}
	
	//영업삭제-단일
	@RequestMapping(value="/sales/del/{salesno}",method=RequestMethod.GET)
	public String authclientDelete(HttpServletRequest request,@PathVariable int salesno) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());		
		String[] arraySalesnoStr = {salesno+""};
		
		Map<String,Object> prmMap = new HashMap<String,Object>();
		prmMap.put("arraySalesnoStr", arraySalesnoStr);
		prmMap.put("userno", userNo);
		prmMap.put("siteid", siteId);
		
		salesService.svcSalesDelete(prmMap);
		return "redirect:/sales";
	}
	
	//영업리스트 (영업삭제-멀티)
	@RequestMapping(value="/sales/del", method=RequestMethod.PUT)
	public String authsalesDelete(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());		
		String[] arraySalesnoStr = request.getParameterValues("salesno");
		
		Map<String,Object> prmMap = new HashMap<String,Object>();
		prmMap.put("arraySalesnoStr", arraySalesnoStr);
		prmMap.put("userno", userNo);
		prmMap.put("siteid", siteId);
		
		salesService.svcSalesDelete(prmMap);
		return "redirect:/sales";
	}
	
	//영업관련고객상세-팝업창
	@RequestMapping(value="/popsalescust/view/{salescustno}", method=RequestMethod.GET)
	public ModelAndView authpopSalesCustDetail(HttpServletRequest request, @PathVariable int salescustno) {			
		SalesCustDto salesCustDto = new SalesCustDto();
		salesCustDto.setSalescustno(salescustno);
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		salesCustDto.setSiteid(siteid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesCustDetail",salesService.svcSalesCustDetail(salesCustDto));	
		mav.setViewName("sa/sales/pop/sacustdetail");
		return mav;
	}
	
	//영업관련고객추가-팝업창
	@RequestMapping(value="/popsalescust/{salesno}", method=RequestMethod.GET)
	public ModelAndView authpopSalesCust(HttpServletRequest request, @PathVariable int salesno) {			
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesno",salesno);	
		mav.setViewName("sa/sales/pop/sacustinsert");
		return mav;
	}
	
	//영업관련고객추가-실행
	@RequestMapping(value="/popsalescust/post",method=RequestMethod.POST)
	@ResponseBody
	public int authpopRelatedCustInsert(HttpServletRequest request,@ModelAttribute SalesCustDto salesCustDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		salesCustDto.setEdtuser(userno);
		salesCustDto.setSiteid(siteid);
			
		int salesNo = salesService.svcSalesCustInsert(salesCustDto);//관련고객추가 서비스 실행
		return salesNo;			
	}
	
	//팝업영업관련고객-삭제
	@RequestMapping(value="/popsalescust/del/{salescustno}",method=RequestMethod.GET)
	@ResponseBody
	public int authsalesCustDelete(HttpServletRequest request 
									,@PathVariable int salescustno) {
		SalesCustDto salesCustDto = new SalesCustDto();	
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		salesCustDto.setEdtuser(userno);
		salesCustDto.setSiteid(siteid);	
		salesCustDto.setSalescustno(salescustno);
	
		int res = salesService.svcSalesCustDelete(salesCustDto);
			
		return res;
	}
	
	
	//영업관련고객수정-팝업창
	@RequestMapping(value="/popsalescust/post/{salescustno}", method=RequestMethod.GET)
	public ModelAndView authpopSalesCustDetailForm(HttpServletRequest request, @PathVariable int salescustno) {			
		SalesCustDto salesCustDto = new SalesCustDto();
		salesCustDto.setSalescustno(salescustno);
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		salesCustDto.setSiteid(siteid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesCustUpdate",salesService.svcSalesCustDetail(salesCustDto));	
		mav.setViewName("sa/sales/pop/sacustupdate");
		return mav;
	}	
	
	
	//팝업영업관련고객-수정 실행
	@RequestMapping(value="/popsalescust/post/{salescustno}",method=RequestMethod.POST)
	@ResponseBody
	public int authsalesCustDelete(HttpServletRequest request 
										,@PathVariable int salescustno,@ModelAttribute SalesCustDto salesCustDto) {
			
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		salesCustDto.setEdtuser(userno);
		salesCustDto.setSiteid(siteid);	
		salesCustDto.setSalescustno(salescustno);
		
		int res = salesService.svcSalesCustUpdate(salesCustDto);
				
		return res;
	}
	
	//팝업영업단계-추가
	@RequestMapping(value="/popsalesstate/{salesno}", method=RequestMethod.GET)
	public ModelAndView authpopSalesState(HttpServletRequest request, @PathVariable int salesno, @RequestParam int salestate) {			
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.addObject("salesno",salesno);
		mView.addObject("salestate",salestate);
		mView.setViewName("sa/sales/pop/sastate");
		return mView;
	}
	
	
	//영업관련고객추가-실행
	@RequestMapping(value="/popsalestate/post",method=RequestMethod.POST)
	@ResponseBody
	public int authpopSaleStateInsert(HttpServletRequest request) {
		
		Map<String,Object> insVal = crud.searchParam(request);
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
				
		insVal.put("userno", userno);
		insVal.put("siteid", siteid);
								
		int res = salesService.svcSalesStateInsert(insVal);//관련고객추가 서비스 실행
		return res;			
	}
	
	//캘린더메인-리스트
	@RequestMapping(value="/sales/cal",method=RequestMethod.GET)
	public ModelAndView authsaCalendar(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		//세션값으로 파라미터 준비		
		Map<String,Object> schVal = new HashMap<String,Object>();
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int chkauth = Integer.parseInt(request.getSession().getAttribute("CHKAUTH").toString());
		
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
		schVal.put("chkauth", chkauth);		
		
		String jsonSchList = salesService.svcSalesSchList(schVal);//캘린더 스케쥴 생성.
		
		mView.addObject("schList",jsonSchList);//캘린더 스케쥴
		mView.addObject("comSchList",salesService.svcSalesComSchList(schVal));//캘린더 틀 목록. 
		mView.setViewName("sa/calendar/sacalmain");
		return mView;
	}
	//일정추가 팝업열기
	@RequestMapping(value="/sales/cal/post",method=RequestMethod.GET)
	public ModelAndView authsaCalForm(HttpServletRequest request) {
	
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String username = request.getSession().getAttribute("USERNAME").toString();
		String startdate = request.getParameter("startdate");
		
		
		ModelAndView mView = new ModelAndView();
		//일정의 소유자 기본값 바인딩 데이터
		mView.addObject("userno",userno);
		mView.addObject("username",username);
		mView.addObject("startdate",startdate);
		mView.setViewName("sa/calendar/pop/schinsert");
		return mView;
	}
	
	//일정추가 실행
	@RequestMapping(value="/sales/cal/post",method=RequestMethod.POST)
	@ResponseBody
	public int authsaCalInsert(HttpServletRequest request, @RequestParam Map<String,Object> schVal) {
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
			
		int res = salesService.svcSalesSchInsert(schVal);
		
		return res;
	}
	
	//일정추가 실행(공통스케쥴에서 Drag) 
	@RequestMapping(value="/sales/cal/com/post/{comschno}",method=RequestMethod.POST)
	@ResponseBody
	public String authsaCalInsertFromCom(HttpServletRequest request, @RequestBody Map<String,Object> schVal, @PathVariable int comschno) {
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
		schVal.put("comschno", comschno);
				
		String jsonStr = salesService.svcSalesSchInsertFromCom(schVal);		
		System.out.println(jsonStr);
		return jsonStr;
	}
	
	//일정수정 이벤트 마우스 드래그 - 실행
	@RequestMapping(value="/sales/cal/post/{schno}",method=RequestMethod.GET)
	@ResponseBody
	public int authsaCalUpdate(HttpServletRequest request, @RequestParam Map<String,Object> schVal, @PathVariable int schno) {
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
		schVal.put("schno", schno);
		
		int res = salesService.svcSalesSchUpdate(schVal);
		System.out.println("update move move move "+res);	
		return res;
	}
	
	
	//캘린더 - 이벤트 상세보기
	@RequestMapping(value="/sales/cal/view/{schno}", method=RequestMethod.GET)
	public ModelAndView authsaCalDetail(HttpServletRequest request, @PathVariable int schno){
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> prmMap = new HashMap<String,Object>();
		
		prmMap.put("siteid", siteid);
		prmMap.put("schno", schno);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("schDetail",salesService.svcSalesSchDetail(prmMap));
		mView.setViewName("sa/calendar/pop/schdetail");
		return mView;	
	}
	
	//캘린더 - 이벤트 팝업 수정 폼
	@RequestMapping(value="/sales/cal/view/post/{schno}", method=RequestMethod.GET)
	public ModelAndView authsaCalDetailForm(HttpServletRequest request, @PathVariable int schno){
			
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			
		Map<String,Object> prmMap = new HashMap<String,Object>();
			
		prmMap.put("siteid", siteid);
		prmMap.put("schno", schno);
			
		ModelAndView mView = new ModelAndView();
		mView.addObject("schUpdate",salesService.svcSalesSchDetail(prmMap));
		mView.setViewName("sa/calendar/pop/schupdate");
		return mView;	
	}
	
	//일정수정 팝업 - 실행
	@RequestMapping(value="/sales/cal/post/{schno}",method=RequestMethod.POST)
	@ResponseBody
	public int authsaCalDetailUpdate(HttpServletRequest request, @RequestParam Map<String,Object> schVal, @PathVariable int schno) {
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
				
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
		schVal.put("schno", schno);
			
		int res = salesService.svcSalesSchUpdate(schVal);
		System.out.println("update2222222 move move move "+res);			
		return res;
	}
	
	//캘린더 - 회원사공통스케쥴 팝업 입력폼
	@RequestMapping(value="/sales/cal/com/post", method=RequestMethod.GET)
	public ModelAndView authsaCalComSch(HttpServletRequest request){
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/calendar/pop/comschinsert");
		return mView;
	}

	//캘린더 - 회원사공통스케쥴 팝업 입력 실행
	@RequestMapping(value="/sales/cal/com/post", method=RequestMethod.POST)
	@ResponseBody
	public int authsaCalComSchInsert(HttpServletRequest request, @RequestParam Map<String,Object> schVal){
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
		
		int res = salesService.scvSalesComSchInsert(schVal);
		return res;
	}
	
	
	//캘린더 - 공통스케쥴 상세 
	@RequestMapping(value="/sales/cal/com/view/{comschno}", method=RequestMethod.GET)
	public ModelAndView authsaCalComSchDetail(HttpServletRequest request, @PathVariable int comschno) {
		Map<String,Object> prmMap = new HashMap<String,Object>();
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		prmMap.put("siteid",siteid);
		prmMap.put("comschno", comschno);
	
		ModelAndView mView = new ModelAndView();
		mView.addObject("schDetail",salesService.svcSalesComSchDetail(prmMap));
		mView.setViewName("sa/calendar/pop/comschdetail");
		return mView;
	}
	
	//캘린더 - 공통스케쥴 수정폼 
	@RequestMapping(value="/sales/cal/com/post/{comschno}", method=RequestMethod.GET)
	public ModelAndView authsaCalComSchUpdateForm(HttpServletRequest request, @PathVariable int comschno) {		
		Map<String,Object> prmMap = new HashMap<String,Object>();
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		prmMap.put("siteid",siteid);
		prmMap.put("comschno", comschno);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("schUpdate",salesService.svcSalesComSchDetail(prmMap));
		mView.setViewName("sa/calendar/pop/comschupdate");
		return mView;
	}
	
	//캘린더 - 공통스케쥴 수정-실행 
	@RequestMapping(value="/sales/cal/com/view/post/{comschno}", method=RequestMethod.POST)
	@ResponseBody
	public int authsaCalComSchUpdate(HttpServletRequest request, @PathVariable int comschno, @RequestParam Map<String,Object> schVal) {		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		schVal.put("siteid",siteid);
		schVal.put("userno",userno);
		schVal.put("comschno", comschno);				
		int res = salesService.scvSalesComSchUpdate(schVal);
		return res;
	}
	
	//고객 상세탭  - 영업 리스트 
	//영업,거래처 상세-3탭-접촉리스트
	@RequestMapping(value="/cust/view/tab/sales",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authcustTabSalesList(HttpServletRequest request) {
		Map<String,Object> salesTab = salesService.svcCustTabSalesList(request);
		return salesTab;
	}
	


}
