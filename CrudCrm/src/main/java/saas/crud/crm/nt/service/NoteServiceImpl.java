package saas.crud.crm.nt.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.common.PagingCommon;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteDto;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao ntDao;
	
	@Override
	public ModelAndView noteInbox(HttpServletRequest request) {
		
		int siteId = Integer.parseInt((String)request.getSession().getAttribute("SITEID"));
		String userNo = (String)request.getSession().getAttribute("USERNO");
		
		NoteDto ntDto = new NoteDto();
		ntDto.setSITEID(siteId);
		ntDto.setTOUSERNO(userNo);
		
		//토탈로우 디비컨넥션
		int totalRows = ntDao.notetotalRows(ntDto);
		
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 10;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows,PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page", page); //페이징처리
		
		return mView;
	}

}
