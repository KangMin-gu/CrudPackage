package saas.crud.crm.sa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalesController {
	//거래처리스트
	@RequestMapping(value="/sales/client",method=RequestMethod.GET)
	public ModelAndView clientList(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/client/clilist");
		return mView;
	}
	//거래처상세
	@RequestMapping(value="/sales/client/view/{clino}",method=RequestMethod.GET)
	public ModelAndView clientDetail(HttpServletRequest request 
			 ,@PathVariable int clino) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/client/clidetail");
		return mView;
	}
	//거래처추가
	@RequestMapping(value="/sales/client/post",method=RequestMethod.GET)
	public ModelAndView clientInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/client/cliinsert");
		return mView;
	}
	//영업리스트
	@RequestMapping(value="/sales",method=RequestMethod.GET)
	public ModelAndView salesList(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/sales/saleslist");
		return mView;
	}
	//영업상세
	@RequestMapping(value="/sales/view/{salesno}",method=RequestMethod.GET)
	public ModelAndView salesDetail(HttpServletRequest request 
			 ,@PathVariable int salesno) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/sales/salesdetail");
		return mView;
	}	
	//영업추가
	@RequestMapping(value="/sales/post",method=RequestMethod.GET)
	public ModelAndView salesInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/sales/salesinsert");
		return mView;
	}	
	
	//캘린더
	@RequestMapping(value="/sales/cal",method=RequestMethod.GET)
	public ModelAndView calendarList(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sa/calendar/sacalmain");
		return mView;
	}

}
