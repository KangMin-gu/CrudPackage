package saas.crud.crm.sa.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

import saas.crud.crm.sa.service.SalesService;


@Controller
public class SalesController {
	
	@Autowired 
	private SalesService salesService;
		
	//영업리스트
	@RequestMapping(value="/sales",method=RequestMethod.GET)
	public ModelAndView authsalesList(HttpServletRequest request) {
		ModelAndView mView = salesService.svcSalesList(request);
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
		mView.addObject("page",salesCustList.get("page")); //페이징
		mView.addObject("searchVal",salesCustList.get("searchVal"));//검색조건
		mView.addObject("salesCustList",salesCustList.get("salesCustList"));//리스트 데이터
		
		mView.setViewName("sa/sales/salesdetail");
		return mView;
	}	
	//영업추가. 로그인한 본인 정보 바인딩. 서비스 X 
	@RequestMapping(value="/sales/post",method=RequestMethod.GET)
	public ModelAndView authsalesForm(HttpServletRequest request) {
			
		Map<String,String> defaultMap = new HashMap<String,String>();
		ModelAndView mView= new ModelAndView();		
		
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
	
	//영업삭제
	@RequestMapping(value="/sales/delete/{salesno}",method=RequestMethod.GET)
	public String authclientDelete(HttpServletRequest request 
								,@PathVariable int salesno) {
		
		SalesDto salesDto = new SalesDto();
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());			
		salesDto.setSalesno(salesno);
		salesDto.setSiteid(siteid);
		salesService.svcSalesDelete(salesDto);
		
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
		return 0;			
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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesno",salesno);
		mav.addObject("salestate",salestate);
		mav.setViewName("sa/sales/pop/sastate");
		return mav;
	}
	
	
	//영업관련고객추가-실행
	@RequestMapping(value="/popsalestate/post",method=RequestMethod.POST)
	@ResponseBody
	public int authpopSaleStateInsert(HttpServletRequest request) {
		
		Map<String,Object> insVal = new HashMap<String,Object>();
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
				
		insVal.put("userno", userno);
		insVal.put("siteid", siteid);
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {//requeset 값이 있으면 while문 가동 
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			
			if(value == "") {
					value = null;			
			}
			insVal.put(name, value);
		}
				
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
	public ModelAndView authsaCalendarForm(HttpServletRequest request) {
	
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
	public int authsaCalendarInsert(HttpServletRequest request, @RequestParam Map<String,Object> schVal) {
		
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		schVal.put("siteid", siteid);
		schVal.put("userno", userno);
			
		int res = salesService.svcSalesSchInsert(schVal);
		
		return res;
	}
	
	//일정수정 이벤트 마우스 드래그 - 실행
	@RequestMapping(value="/sales/cal/post/{schno}",method=RequestMethod.GET)
	@ResponseBody
	public int authsaCalendarUpdate(HttpServletRequest request, @RequestParam Map<String,Object> schVal, @PathVariable int schno) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ schno / "+schno +" startdate / " +schVal.get("startdate")    );
		System.out.println(request.getParameter("startdate")+"request"  );
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
	public ModelAndView authsaCalendarDetail(HttpServletRequest request, @PathVariable int schno){
		
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
	public ModelAndView authsaCalendarDetailForm(HttpServletRequest request, @PathVariable int schno){
			
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
	public int authsaCalendarDetailUpdate(HttpServletRequest request, @RequestParam Map<String,Object> schVal, @PathVariable int schno) {
		
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
	public ModelAndView authsaCalendarComSch(HttpServletRequest request){
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/calendar/pop/comschinsert");
		return mView;
	}
	
}
