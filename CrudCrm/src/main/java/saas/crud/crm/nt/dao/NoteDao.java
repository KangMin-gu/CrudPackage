package saas.crud.crm.nt.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.dto.NoteDto;

public interface NoteDao {
	public int notetotalRows(NoteDto ntDto);
	public ModelAndView noteInbox(HttpServletRequest request);
	
}
