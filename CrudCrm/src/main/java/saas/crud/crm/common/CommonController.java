package saas.crud.crm.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	@Autowired
	CommonService commonService;
	
	//담당자팝업
	@RequestMapping(value="/popowner", method=RequestMethod.GET)
	public ModelAndView authpopUser(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetUserName(request);
		mav.setViewName("cm/popowner");
		return mav;
	}
		
	//거래처팝업
	@RequestMapping(value="/popclient", method=RequestMethod.GET)
	public ModelAndView authpopClient(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetClientName(request);
		mav.setViewName("cm/popclient");
		return mav;
	}
}
