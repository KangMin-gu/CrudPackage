package saas.crud.crm.nt.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface NoteService {
	public ModelAndView noteInbox(HttpServletRequest request);
}
