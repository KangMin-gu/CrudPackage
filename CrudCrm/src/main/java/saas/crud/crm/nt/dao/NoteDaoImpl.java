package saas.crud.crm.nt.dao;

import java.util.HashMap;
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
import saas.crud.crm.nt.dto.NoteCategoryDto;
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
	
	//상세정보 CC / To 리스트 뽑기
	@Override
	public List<Map<String, Object>> ccList(Map<String, Object> noteTrashVal) {
		List<Map<String, Object>> ccList = session.selectList("note.ccList", noteTrashVal);
		return ccList;
	}
	
	public List<Map<String, Object>> toList(Map<String, Object> noteTrashVal){
		List<Map<String, Object>> toList = session.selectList("note.toList", noteTrashVal);
		return toList;
	}
	//읽음표시
	@Override
	public void noteEyeChk(Map<String, Object> noteVal) {
		session.update("note.noteEyeChk",noteVal);
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
	
	//카테고리화면
	@Override
	public List<Map<String, Object>> noteSet(NoteCategoryDto noteCategory) {
		List<Map<String, Object>> Category = session.selectList("note.noteCategory", noteCategory);
		return Category;
	}
	
	//발송 등록
	@Override
	public int noteSend(NoteDto ntDto) {
		session.insert("note.noteSend",ntDto);
		int noticeId = ntDto.getNoticeid();
		return noticeId;
	}
	
	//to, cc 등록
	@Override
	public void notetoAndCc(NoteDto ntDto) {
		session.insert("note.toAndCc", ntDto);
	}
	
	//첨부파일 목록
	public List<Map<String, Object>> noteFile(Map<String, Object> noteVal){
		List<Map<String, Object>> notefile = session.selectList("note.noteFile", noteVal);
		return notefile;
	}
	
	
	//발송 폼 입장시 셀렉트 박스에 넣을 정보 
	@Override
	public List<Map<String, String>> adminMail(int siteId) {
		List<Map<String, String>> noteInfo = session.selectList("note.adminMail", siteId);
		return noteInfo;
	}
	
	// 사용자번호로 이메일과 이름 받아옴 
	@Override
	public List<Map<String,String>> noteEmail(int fromUser) {
		return session.selectList("note.noteEmail",fromUser);
	}
	
	//t_mail 테이블에 정보 삽입 
	@Override
	public void noteSendMail(Map<String, Object> map) {
		session.insert("note.noteSendMail",map);
		
	}
	//상단 메세지버튼 팝업
	@Override
	public List<Map<String, Object>> noteSummary(int userNo) {
		List<Map<String, Object>> note = session.selectList("note.noteSummary",userNo);
		return note;
	}
	
	//답장버튼 
	@Override
	public Map<String, Object> noteReply(int noticeId) {
		Map<String,Object> reply = session.selectOne("note.noteReply",noticeId);
		return reply;
	}
	//휴지통상세 
	@Override
	public Map<String, Object> trashDetail(Map<String, Object> noteVal) {
		Map<String,Object> trash = session.selectOne("note.trashDetail",noteVal);
		return trash;
	}
	//통지안읽은갯수
	@Override
	public int noteCount(NoteDto ntDto) {
		int aram = session.selectOne("note.count", ntDto);
		return aram;
	}
	
	
	
	
	
}