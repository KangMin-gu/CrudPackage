package saas.crud.crm.nt.service;

import java.util.Map;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.AdressQuarter;
import saas.crud.crm.ce.EUploadLogical;
import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteCategoryDto;
import saas.crud.crm.nt.dto.NoteDto;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao ntDao;
	
	@Autowired
	private EUploadLogical upload;
	
	//inbox
	//@Cacheable("test")
	@Override
	public ModelAndView noteInbox(HttpServletRequest request) {
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
		noteVal.put("userno", userNo);
		
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
		
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		
		mView.addObject("category", category);
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
		Map<String, Object> noteOutVal = new HashMap<>();
		if(keyword != null && !keyword.equals("")){ //검색어가 전달된 경우
			if(condition.equals("title")){//제목 검색
				noteOutVal.put("title", keyword);
			}else if(condition.equals("sender")){//작성자 검색
				noteOutVal.put("recipient", keyword);
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
		noteOutVal.put("userno", userNo);
				
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
		
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		
		mView.addObject("category", category);
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
		noteImportVal.put("userno", userNo);
						
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
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		
		mView.addObject("category", category);				
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
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		
		mView.addObject("category", category);				
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
		
		//통지정보
		Map<String, Object> note = ntDao.noteDetail(noteVal);
		
		String fileSearchKey = note.get("FILESEARCHKEY").toString();		
		noteVal.put("filesearchkey", fileSearchKey);
		
		//첨부파일정보
		List<Map<String, Object>> notefile = ntDao.noteFile(noteVal);
		//받는이
		List<Map<String, Object>> toList = ntDao.toList(noteVal); 
		//CC
		List<Map<String, Object>> ccList = ntDao.ccList(noteVal); 
		
		ntDao.noteEyeChk(noteVal);
	
		mView.addObject("note", note);
		mView.addObject("noteFile", notefile);
		mView.addObject("ccList", ccList);
		mView.addObject("toList", toList);
		return mView;
	}
	
	//읽은으로 체크
	@Override
	public void noteEyeChk(HttpServletRequest request, List<Integer> noticeid) {
		Map<String, Object> noteVal = new HashMap<>();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		for(int i = 0; i<noticeid.size(); i++) {
			noteVal.put("siteid", siteId);
			noteVal.put("noticeid", noticeid.get(i));
			ntDao.noteEyeChk(noteVal);
			noteVal.clear();
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
	
	//통지 삭제
	@Override
	public void noteDeleteChk(HttpServletRequest request, List<Integer> noticeid) {
		NoteDto ntDto = new NoteDto();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ntDto.setSiteid(siteId);
		for(int i = 0; i<noticeid.size(); i++) {
			ntDto.setNoticeid(noticeid.get(i));
			ntDao.noteDeleteChk(ntDto);
		}	
	}
	
	//휴지통 되돌리기
	@Override
	public void noteReturnChk(HttpServletRequest request, List<Integer> noticeid) {
		NoteDto ntDto = new NoteDto();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		ntDto.setSiteid(siteId);
		for(int i = 0; i<noticeid.size(); i++) {
			ntDto.setNoticeid(noticeid.get(i));
			ntDao.noteReturnChk(ntDto);
		}	
		
	}
	
	//카테고리화면
	@Override
	public ModelAndView noteSet(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		ModelAndView mView = new ModelAndView();
		mView.addObject("category", category);
		return mView;
	}
	
	//통지발송
	@Override
	public int noteSend(HttpServletResponse response, HttpServletRequest request, NoteDto ntDto, MultipartHttpServletRequest multipartHttpServletRequest) {		
		
		String toTarget = request.getParameter("touser");
		String ccTarget = request.getParameter("ccuser");
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int fromUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		ntDto.setSiteid(siteId);
		ntDto.setUserno(fromUserNo);
		List<MultipartFile> fileUpload = multipartHttpServletRequest.getFiles("file");
		
		//파일테이블 업로드 실행
		if(fileUpload != null) {			
			String fileSearchKey = upload.fileSearchKey(multipartHttpServletRequest);
			upload.fileUpload(response, request, fileUpload, fileSearchKey);
			ntDto.setFilesearchkey(fileSearchKey);
		}
		
		//본문입력
		int noticeId = ntDao.noteSend(ntDto);
		
		ntDto.setNoticeid(noticeId);
				
		//To ; 기준 끈기
		AdressQuarter quarter = new AdressQuarter();
		List<Integer> toAdress = quarter.quarter(toTarget);
		
		int chkcc = 1;
		
		if( 1 <= toAdress.size()) {			
			for(int i = 0; i<toAdress.size(); i++) {
			    int target = toAdress.get(i);
			    ntDto.setUserno(target);
			    //dao 타겟태우기
			    ntDao.notetoAndCc(ntDto);
			}
				if( ccTarget != null && !ccTarget.equals("")) {
					//CC가 있다면 실행
					List<Integer> ccAdress = quarter.quarter(ccTarget);	
					for(int i = 0; i<ccAdress.size(); i++) {					
					    int target = ccAdress.get(i);
					    ntDto.setUserno(target);
					    ntDto.setChkcc(chkcc);
					    //dao 타겟태우기				   
					    ntDao.notetoAndCc(ntDto);
					}			
				}
		}
		
		return noticeId;
	}

}
