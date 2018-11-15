package saas.crud.crm.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface CommonService {
	public ModelAndView svcPopGetUserName(HttpServletRequest request);
	public ModelAndView svcPopGetClientName(HttpServletRequest request);
	public ModelAndView noteDownload(HttpServletRequest request, int fileId);
}
