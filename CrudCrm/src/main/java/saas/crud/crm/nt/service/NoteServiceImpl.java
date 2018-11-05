package saas.crud.crm.nt.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.StringUtils;
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
	
	//inbox
	@Override
	public ModelAndView noteInbox(HttpServletRequest request) {
		//세션에서 사용자정보를 가져온다.
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int toUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 14;	
		
		ModelAndView mView = new ModelAndView();
		Map<String, Object> noteVal = new HashMap<>();
		if(keyword != null && !keyword.equals("")){ //검색어가 전달된 경우
			if(condition.equals("title")){//제목 검색
				noteVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteVal.put("sender", keyword);
			}
			 
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);	
		}
		//날짜검색
		if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
			
			noteVal.put("startdate", startDate);
			noteVal.put("enddate", endDate);
			mView.addObject("startdate", startDate);
			mView.addObject("enddate", endDate);
			
		}
		
		//Mapper 검색 조건 담기
		noteVal.put("siteid", siteId);
		noteVal.put("touserno", toUserNo);
		
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
		int noteReadVal = ntDao.noteReadVal(noteVal);
		
		mView.addObject("url", "note/inbox");
		mView.addObject("page", page); //페이징처리
		mView.addObject("noteList", note); //리스트처리
		mView.addObject("NOTENAME","받은 통지"); //대메뉴이름 처리
		mView.addObject("notReadVal", noteReadVal); //읽지않은 메세지 갯수 처리
		return mView;
	}

	//보낸통지
	@Override
	public ModelAndView noteOutbox(HttpServletRequest request) {
		//세션에서 사용자정보를 가져온다.
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int fromUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
				
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 14;	
				
		ModelAndView mView = new ModelAndView();
		Map<String, Object> noteOutVal = new HashMap<>();
		if(keyword != null && !keyword.equals("")){ //검색어가 전달된 경우
			if(condition.equals("title")){//제목 검색
				noteOutVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteOutVal.put("sender", keyword);
			}
					
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
					
		}
				
		if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
					
			noteOutVal.put("startdate", startDate);
			noteOutVal.put("enddate", endDate);
			mView.addObject("startdate", startDate);
			mView.addObject("enddate", endDate);
				
		}
				
		//Mapper 검색 조건 담기
		noteOutVal.put("siteid", siteId);
		noteOutVal.put("fromuserno", fromUserNo);
				
		//토탈로우 디비컨넥션
		int totalRows = ntDao.noteOuttalRows(noteOutVal);
				
		//페이징 생성자 호출 후 로직실행
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
				
		//받은메세지 리스트 추출
		noteOutVal.put("startRowNum", startRowNum);
		noteOutVal.put("endRowNum", endRowNum);
				
		//보낸통지 리스트 출력
		List<Map<String, Object>> note = ntDao.noteOutbox(noteOutVal);			
				
		//받은 메세지 중 안읽은 메세지 갯수 추출
		int noteReadVal = ntDao.noteOutReadVal(noteOutVal);
				
		mView.addObject("url", "note/outbox");		
		mView.addObject("page", page); //페이징처리
		mView.addObject("noteList", note); //리스트처리
		mView.addObject("NOTENAME","보낸 통지"); //대메뉴이름 처리
		mView.addObject("notReadVal", noteReadVal); //읽지않은 메세지 갯수 처리
		return mView;
	}

	//중요 통지
	@Override
	public ModelAndView noteImport(HttpServletRequest request) {
				//세션에서 사용자정보를 가져온다.
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int toUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
						
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 14;	
						
		ModelAndView mView = new ModelAndView();
		Map<String, Object> noteImportVal = new HashMap<>();
		if(keyword != null && !keyword.equals("")){ //검색어가 전달된 경우
			if(condition.equals("title")){//제목 검색
				noteImportVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteImportVal.put("sender", keyword);
			}			
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
					
		}
						
		if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
							
			noteImportVal.put("startdate", startDate);
			noteImportVal.put("enddate", endDate);
			mView.addObject("startdate", startDate);
			mView.addObject("enddate", endDate);
						
		}
						
		//Mapper 검색 조건 담기
		noteImportVal.put("siteid", siteId);
		noteImportVal.put("touserno", toUserNo);
						
		//토탈로우 디비컨넥션
		int totalRows = ntDao.notetotalImportRows(noteImportVal);
						
		//페이징 생성자 호출 후 로직실행
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
						
		//받은메세지 리스트 추출
		noteImportVal.put("startRowNum", startRowNum);
		noteImportVal.put("endRowNum", endRowNum);
						
		//보낸통지 리스트 출력
		List<Map<String, Object>> note = ntDao.noteImport(noteImportVal);			
						
		//받은 메세지 중 안읽은 메세지 갯수 추출
		int noteReadVal = ntDao.noteImportReadVal(noteImportVal);
						
		mView.addObject("url", "note/import");		
		mView.addObject("page", page); //페이징처리
		mView.addObject("noteList", note); //리스트처리
		mView.addObject("NOTENAME","중요 통지"); //대메뉴이름 처리
		mView.addObject("notReadVal", noteReadVal); //읽지않은 메세지 갯수 처리
		return mView;		
	}

	//휴지통 통지
	@Override
	public ModelAndView noteTrash(HttpServletRequest request) {
		//세션에서 사용자정보를 가져온다.
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
						
		//한 페이지에 나타낼 갯수 설정
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 14;	
						
		ModelAndView mView = new ModelAndView();
		Map<String, Object> noteTrashVal = new HashMap<>();
		if(keyword != null && !keyword.equals("")){ //검색어가 전달된 경우
			if(condition.equals("title")){//제목 검색
				noteTrashVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteTrashVal.put("sender", keyword);
			}			
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
					
		}
						
		if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
							
			noteTrashVal.put("startdate", startDate);
			noteTrashVal.put("enddate", endDate);
			mView.addObject("startdate", startDate);
			mView.addObject("enddate", endDate);
						
		}
						
		//Mapper 검색 조건 담기
		noteTrashVal.put("siteid", siteId);
		noteTrashVal.put("userno", userNo);
						
		//토탈로우 디비컨넥션
		int totalRows = ntDao.notetotalTrashRows(noteTrashVal);
						
		//페이징 생성자 호출 후 로직실행
		PagingCommon pages = new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
						
		//받은메세지 리스트 추출
		noteTrashVal.put("startRowNum", startRowNum);
		noteTrashVal.put("endRowNum", endRowNum);
						
		//보낸통지 리스트 출력
		List<Map<String, Object>> note = ntDao.noteTrash(noteTrashVal);			
						
		//받은 메세지 중 안읽은 메세지 갯수 추출
		int noteReadVal = ntDao.noteTrashReadVal(noteTrashVal);
						
		mView.addObject("url", "note/trash");		
		mView.addObject("page", page); //페이징처리
		mView.addObject("noteList", note); //리스트처리
		mView.addObject("NOTENAME","휴지통"); //대메뉴이름 처리
		mView.addObject("notReadVal", noteReadVal); //읽지않은 메세지 갯수 처리
		return mView;		
	}	

	//받은통지 상세
	@Override
	public ModelAndView noteDetail(int noticeId, HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> noteVal = new HashMap<>();
		noteVal.put("siteid", siteId);
		noteVal.put("userno", userNo);
		noteVal.put("noticeid", noticeId);

		
		Map<String, Object> note = ntDao.noteDetail(noteVal);
		
		mView.addObject("note", note);
		
		return mView;
	}
	
	//읽은으로 체크
	@Override
	public void noteEyeChk(HttpServletRequest request, List<Integer> noticeid) {
		NoteDto ntDto = new NoteDto();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ntDto.setSiteid(siteId);
		for(int i = 0; i<noticeid.size(); i++) {
			ntDto.setNoticeid(noticeid.get(i));
			ntDao.noteEyeChk(ntDto);
		}
	}
	//중요 체크
	@Override
	public void noteImportChk(HttpServletRequest request, List<Integer> noticeid) {
		NoteDto ntDto = new NoteDto();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ntDto.setSiteid(siteId);
		for(int i = 0; i<noticeid.size(); i++) {
			ntDto.setNoticeid(noticeid.get(i));
			ntDao.noteImportChk(ntDto);
		}
		
	}
	
	//휴지통 이동
	@Override
	public void noteTrashChk(HttpServletRequest request, List<Integer> noticeid) {
		NoteDto ntDto = new NoteDto();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ntDto.setSiteid(siteId);
		for(int i = 0; i<noticeid.size(); i++) {
			ntDto.setNoticeid(noticeid.get(i));
			ntDao.noteTrashChk(ntDto);
		}		
	}

}
