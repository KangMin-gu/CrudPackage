package saas.crud.crm.nt.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.dto.NoteDto;

public interface NoteDao {
	public int notetotalRows(Map<String, Object> noteVal);
	public List<Map<String, Object>> noteInbox(Map<String, Object> inBoxVal);
	public int notReadVal(Map<String, Object> noteVal);
}
