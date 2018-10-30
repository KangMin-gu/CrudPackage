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
	
	//게시판 총 갯수
	@Override
	public int notetotalRows(Map<String, Object> noteVal) {
		int totalRows = session.selectOne("note.totalRows", noteVal);
		return totalRows;
	}
	
	@Override
	public List<Map<String, Object>> noteInbox(Map<String, Object> inBoxVal) {
		List<Map<String, Object>> note = session.selectList("note.inbox", inBoxVal);
		return note;
	}

	@Override
	public int notReadVal(Map<String, Object> noteVal) {
		int notReadVal = session.selectOne("note.notReadVal", noteVal);
		return notReadVal;
	}

	

}
