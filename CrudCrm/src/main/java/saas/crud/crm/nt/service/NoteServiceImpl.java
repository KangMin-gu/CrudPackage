package saas.crud.crm.nt.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.common.PagingCommon;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteDto;

@Service
public class NoteServiceImpl implements NoteService{
	
	private static final int HashMap = 0;
	@Autowired
	private NoteDao ntDao;
	
	//inbox
	@Override
	public ModelAndView noteInbox(HttpServletRequest request) {
		//세션에서 사용자정보를 가져온다.
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int touserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 14;	
		
		ModelAndView mView = new ModelAndView();
		Map<String, Object> noteVal = new HashMap<>();
		
		if(keyword != null){ //검색어가 전달된 경우
			if(condition.equals("titleContent")){ //제목+내용 검색
				noteVal.put("title", keyword);
				noteVal.put("contents", keyword);
			}else if(condition.equals("title")){//제목 검색
				noteVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteVal.put("sender", keyword);
			}else if(condition.equals("sendDate")){//수신일 검색
				noteVal.put("sendDate", keyword);
			}
			
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
		}
		
		//Mapper 검색 조건 담기
		noteVal.put("siteid", siteId);
		noteVal.put("touserno", touserNo);
		
		//토탈로우 디비컨넥션
		int totalRows = ntDao.notetotalRows(noteVal);
		
		//페이징 생성자 호출 후 로직실행
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		//받은메세지 리스트 추출
		noteVal.put("startRowNum", startRowNum);
		noteVal.put("endRowNum", endRowNum);
		
		//받은통지 리스트 출력
		List<Map<String, Object>> note = ntDao.noteInbox(noteVal);			
		
		//받은 메세지 중 안읽은 메세지 갯수 추출
		int notReadVal = ntDao.notReadVal(noteVal);
		
		
		mView.addObject("page", page); //페이징처리
		mView.addObject("noteList", note); //리스트처리
		mView.addObject("NOTENAME","받은 통지"); //대메뉴이름 처리
		mView.addObject("notReadVal", notReadVal); //읽지않은 메세지 갯수 처리
		return mView;
	}

}
