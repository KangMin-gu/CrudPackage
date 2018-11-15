package saas.crud.crm.cu.controller;


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
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.controller.UserController;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;
import saas.crud.crm.cu.service.CustService;



@Controller
public class CustController {
	
	@Autowired
	CustService custService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	//고객리스트
	@RequestMapping(value="/cust", method=RequestMethod.GET)
	public ModelAndView authcustList(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
		mView.setViewName("cu/custlist");
		return mView;
	}
	
	//고객리스트(검색조건)
	@RequestMapping(value="/cust", method=RequestMethod.POST)
	public ModelAndView authcustListSearch(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
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
		mView.addObject("custDetail",custService.svcCustDetail(custno,siteid));
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
	public ModelAndView authcustUpdateForm(HttpServletRequest request, @PathVariable int custno) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("custUpdate",custService.svcCustUpdateForm(custno));
		mView.setViewName("cu/custupdate");
		return mView;
	}
	
	//고객 상세페이지 (수정 실행)	
	@RequestMapping(value="/cust/post/{custno}", method=RequestMethod.POST)
	public String authcustFormUpdate(HttpServletRequest request, @PathVariable int custno 
									,@ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {
		int res = custService.svcCustformUpdate(request, custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		return "redirect:/cust/view/"+res;
	}
	

	//고객 insert 폼 	
	@RequestMapping(value="/cust/post", method=RequestMethod.GET)
	public ModelAndView authcustForm(HttpServletRequest request) {
		ModelAndView mview = custService.svcCustForm(request);		
		mview.setViewName("cu/custinsert");
		return mview;
	}
	
	//고객 insert (실행)	
	@RequestMapping(value="/cust/post", method=RequestMethod.POST)
	public String authcustFormInsert(HttpServletRequest request, @ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {
		int res = custService.svcCustformInsert(request, custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		mview.setViewName("cu/custinsert");
		return "redirect:/cust/view/"+res;
	}


		


	

	

}
