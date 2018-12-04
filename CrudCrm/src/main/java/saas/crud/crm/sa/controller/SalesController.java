package saas.crud.crm.sa.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientDto;
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
		
		ModelAndView mView = salesService.svcSalesDetail(salesDto);
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
	
	
	
	
	//캘린더
	@RequestMapping(value="/sales/cal",method=RequestMethod.GET)
	public ModelAndView authcalendarList(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/calendar/sacalmain");
		return mView;
	}

}
