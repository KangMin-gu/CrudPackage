package saas.crud.crm.nt.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.dto.NoteCategoryDto;
import saas.crud.crm.nt.dto.NoteDto;

public interface NoteDao {
	public int notetotalRows(Map<String, Object> noteVal);
	public List<Map<String, Object>> noteInbox(Map<String, Object> inBoxVal);
	public int noteReadVal(Map<String, Object> noteVal);
	public int noteOuttalRows(Map<String, Object> noteOutVal);
	public List<Map<String, Object>> noteOutbox(Map<String, Object> outBoxVal);
	public int noteOutReadVal(Map<String, Object> noteOutVal);
	public int notetotalImportRows(Map<String, Object> noteImportVal);
	public List<Map<String, Object>> noteImport(Map<String, Object> noteImportVal);
	public int noteImportReadVal(Map<String, Object> noteImportVal);
	public int notetotalTrashRows(Map<String, Object> noteTrashVal);
	public List<Map<String, Object>> noteTrash(Map<String, Object> noteTrashVal);
	public int noteTrashReadVal(Map<String, Object> noteTrashVal);
	public Map<String, Object> noteDetail(Map<String, Object> noteVal);
	public List<Map<String, Object>> ccList(Map<String, Object> noteTrashVal);
	public List<Map<String, Object>> toList(Map<String, Object> noteTrashVal);
	public void noteEyeChk(Map<String, Object> noteVal);
	public void noteImportChk(NoteDto ntDto);
	public void noteTrashChk(NoteDto ntDto);
	public void noteDeleteChk(NoteDto ntDto);
	public void noteReturnChk(NoteDto ntDto);
	public List<Map<String, Object>> noteSet(NoteCategoryDto noteCategory);
	public int noteSend(NoteDto ntDto);
	public void notetoAndCc(NoteDto ntDto);
	public List<Map<String, Object>> noteFile(Map<String, Object> noteVal);
}
