package saas.crud.crm.cm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface CommonService {

	public ModelAndView svcPopGetUserName(HttpServletRequest request);
	
	public ModelAndView svcPopGetClientName(HttpServletRequest request);

}
