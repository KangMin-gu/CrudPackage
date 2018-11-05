package saas.crud.crm.nt.dao;

import java.util.List;
import java.util.Map;
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
	public void noteEyeChk(NoteDto ntDto);
	public void noteImportChk(NoteDto ntDto);
	public void noteTrashChk(NoteDto ntDto);
}
