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
	@RequestMapping(value="/custlist", method=RequestMethod.GET)
	public ModelAndView authcustList(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
		mView.setViewName("cu/custlist");
		return mView;
	}
	
	//고객리스트(검색조건)
	@RequestMapping(value="/custlist", method=RequestMethod.POST)
	public ModelAndView authcustListSearch(HttpServletRequest request) {
		ModelAndView mView = custService.svcCustList(request);
		mView.setViewName("cu/custlist");
		return mView;
	}
	
	
	//고객리스트 (고객삭제-멀티)
	@RequestMapping(value="/custlist", method=RequestMethod.DELETE)
	public String authcustDelete(HttpServletRequest request,HttpServletResponse response) {
		int res = custService.svcCustDelete(request);
		return "redirect:/custlist";
	}
	
	
	//고객 상세페이지(기본)
	@RequestMapping(value="/custdetail/{CUSTNO}", method=RequestMethod.GET)
	public ModelAndView authcustDetail(HttpServletRequest request 
								 ,@PathVariable int CUSTNO) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("custDetail",custService.svcCustDetail(CUSTNO));
		mView.setViewName("cu/custdetail");
		return mView;
	}
	
	
	//고객상세(고객삭제-단일)
	@RequestMapping(value="/custdetail/{CUSTNO}", method=RequestMethod.DELETE)
	public String authcustDetailDelete(HttpServletRequest request 
								 ,@PathVariable int CUSTNO) {
		int res = custService.svcCustDelete(request);
		return "redirect:/custlist";
	}
	
	
	//고객 상세페이지(수정폼)
	@RequestMapping(value="/custform/{CUSTNO}", method=RequestMethod.GET)
	public ModelAndView authcustUpdateForm(HttpServletRequest request, @PathVariable int CUSTNO) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("custUpdate",custService.svcCustUpdateForm(CUSTNO));
		mView.setViewName("cu/custupdate");
		return mView;
	}
	
	//고객 상세페이지 (수정 실행)	
	@RequestMapping(value="/custform/{CUSTNO}", method=RequestMethod.POST)
	public String authcustFormUpdate(HttpServletRequest request, @PathVariable int CUSTNO 
									,@ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {
		int res = custService.svcCustformUpdate(request, custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		return "redirect:/custdetail/"+res;
	}
	
	
	
	//고객 insert 폼 	
	@RequestMapping(value="/custform", method=RequestMethod.GET)
	public ModelAndView authcustForm(HttpServletRequest request) {
		ModelAndView mview = custService.svcCustForm(request);		
		mview.setViewName("cu/custinsert");
		return mview;
	}
	
	//고객 insert (실행)	
	@RequestMapping(value="/custform", method=RequestMethod.POST)
	public String authcustFormInsert(HttpServletRequest request, @ModelAttribute CustDto custDto, @ModelAttribute CustDenyDto custDenyDto) {
		int res = custService.svcCustformInsert(request, custDto,custDenyDto);
		ModelAndView mview = new ModelAndView();		
		mview.setViewName("cu/custinsert");
		return "redirect:/custdetail/"+res;
	}

		
	//담당자팝업
	@RequestMapping(value="/popowner", method=RequestMethod.GET)
	public ModelAndView authpopUser(HttpServletRequest request) {			
		ModelAndView mav = custService.svcPopGetUserName(request);
		mav.setViewName("cm/popowner");
		return mav;
	}
		
	//거래처팝업
	@RequestMapping(value="/popclient", method=RequestMethod.GET)
	public ModelAndView authpopClient(HttpServletRequest request) {			
		ModelAndView mav = custService.svcPopGetClientName(request);
		mav.setViewName("cm/popclient");
		return mav;
	}
		
		


	

	

}
