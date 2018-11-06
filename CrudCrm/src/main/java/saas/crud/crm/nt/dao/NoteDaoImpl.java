package saas.crud.crm.nt.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.controller.NoteController;
import saas.crud.crm.nt.dto.NoteDto;
import saas.crud.crm.nt.service.NoteService;


@Repository
public class NoteDaoImpl implements NoteDao{
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);
	
	@Autowired
	private SqlSession session;
	
	//받은통지 총 갯수
	@Override
	public int notetotalRows(Map<String, Object> noteVal) {
		int totalRows = session.selectOne("note.totalRows", noteVal);
		return totalRows;
	}
	//받은 통지 리스트
	@Override
	public List<Map<String, Object>> noteInbox(Map<String, Object> inBoxVal) {
		List<Map<String, Object>> note = session.selectList("note.inbox", inBoxVal);
		return note;
	}
	//받은통지 안읽은 갯수
	@Override
	public int noteReadVal(Map<String, Object> noteVal) {
		int notReadVal = session.selectOne("note.noteReadVal", noteVal);
		return notReadVal;
	}
	//보낸 통지 총 갯수 
	@Override
	public int noteOuttalRows(Map<String, Object> noteOutVal) {
		int totalRows = session.selectOne("note.outTotalRows", noteOutVal);
		return totalRows;
	}
	//보낸 통지 리스트
	@Override
	public List<Map<String, Object>> noteOutbox(Map<String, Object> noteOutVal) {
		List<Map<String, Object>> note = session.selectList("note.outbox", noteOutVal);
		return note;
	}
	//보낸 통지중 안읽은통지
	@Override
	public int noteOutReadVal(Map<String, Object> noteOutVal) {
		int notOutReadVal = session.selectOne("note.noteOutReadVal", noteOutVal);
		return notOutReadVal;
	}
	
	//중요 통지 총 갯수
	@Override
	public int notetotalImportRows(Map<String, Object> noteImportVal) {
		int totalRows = session.selectOne("note.importTotalRows", noteImportVal);
		return totalRows;
	}
	
	//중요 통지 리스트
	@Override
	public List<Map<String, Object>> noteImport(Map<String, Object> noteImportVal) {
		List<Map<String, Object>> note = session.selectList("note.importbox", noteImportVal);
		return note;
	}
	
	//중요 통지 안읽은 갯수
	@Override
	public int noteImportReadVal(Map<String, Object> noteImportVal) {
		int notImportReadVal = session.selectOne("note.noteimportReadVal", noteImportVal);
		return notImportReadVal;
	}
	
	//휴지통 총 갯수
	@Override
	public int notetotalTrashRows(Map<String, Object> noteTrashVal) {
		int totalRows = session.selectOne("note.trashTotalRows", noteTrashVal);
		return totalRows;
	}
	
	//휴지통 리스트
	@Override
	public List<Map<String, Object>> noteTrash(Map<String, Object> noteTrashVal) {
		List<Map<String, Object>> note = session.selectList("note.trashbox", noteTrashVal);
		return note;
	}
	
	//휴지통 안읽은 갯수
	@Override
	public int noteTrashReadVal(Map<String, Object> noteTrashVal) {
		int notImportReadVal = session.selectOne("note.notetrashReadVal", noteTrashVal);
		return notImportReadVal;
	}
	
	//상세 정보
	@Override
	public Map<String, Object> noteDetail(Map<String, Object> noteVal) {
		Map<String, Object> note = session.selectOne("note.noteDetail", noteVal);
		return note;
	}
	
	//읽음표시
	@Override
	public void noteEyeChk(NoteDto ntDto) {
		session.update("note.noteEyeChk",ntDto);
	}
	//중요표시
	@Override
	public void noteImportChk(NoteDto ntDto) {
		session.update("note.noteImportChk",ntDto);
	}
	//휴지통 이동
	@Override
	public void noteTrashChk(NoteDto ntDto) {
		session.update("note.noteTrashChk",ntDto);
	}
	//통지삭제
	@Override
	public void noteDeleteChk(NoteDto ntDto) {
		session.update("note.noteDeleteChk",ntDto);
	}
	//보관함으로 이동
	@Override
	public void noteReturnChk(NoteDto ntDto) {
		session.update("note.noteReturnChk",ntDto);
		
	}

}
