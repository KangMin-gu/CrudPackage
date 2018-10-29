package saas.crud.crm.nt.dao;

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
	public int notetotalRows(NoteDto ntDto) {
		int totalRows = session.selectOne("note.totalRows", ntDto);
		return totalRows;
	}
	
	@Override
	public ModelAndView noteInbox(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
