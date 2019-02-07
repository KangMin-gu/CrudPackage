package saas.crud.crm.nt.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.common.CommonDao;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteCategoryDto;
import saas.crud.crm.nt.dto.NoteDto;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao ntDao;
	
	//실험
	@Autowired
	private CommonDao commonDao;
	
	@Autowired
	private CrudEngine crudEngine;
	
	@Autowired
	private UserDao urDao;
	
	
	 
	//inbox
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
		Map<String, Integer> page = crudEngine.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
		Map<String, Integer> page = crudEngine.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
	
	//상단 메세지버튼 클릭 시
	@Override
	public List<Map<String,Object>> noteSummary(HttpServletRequest request) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		List<Map<String,Object>> subject = ntDao.noteSummary(userNo);
		
		int size = subject.size();
		String rltDate = null;
		if(size > 0) {
			for(int i = 0; i < size; i++) {
				rltDate = subject.get(i).get("RLTDATE").toString();
				// UTC로 나오는 부분으로 인해서 해당 부분으로 처리 추후 SQL에서 UTC 처리 예정
				subject.get(i).put("RLTSTR", rltDate);
			}
		}
		return subject;
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
		Map<String, Integer> page = crudEngine.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
		Map<String, Integer> page = crudEngine.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
		String referUrl = request.getHeader("REFERER");
		String curUrl = request.getRequestURL().toString();
		ModelAndView mView = new ModelAndView();
		
		
		Map<String, Object> noteVal = new HashMap<>();
		noteVal.put("siteid", siteId);
		noteVal.put("userno", userNo);
		noteVal.put("noticeid", noticeId);
		
		//통지정보
		Map<String, Object> note = null;
		
		
		//휴지통 상세 (isDelete = 2)
		if(referUrl.contains("note/trash")) {
			note = ntDao.trashDetail(noteVal);
		//기본 상세 
		}else {
			note = ntDao.noteDetail(noteVal);
		}
		
		
		//파일업로드
		//if문 추가
		if(note.get("FILESEARCHKEY") != null) {
		String fileSearchKey = note.get("FILESEARCHKEY").toString();		
		noteVal.put("filesearchkey", fileSearchKey);
		}
		boolean tt = curUrl.contains("forward");
		boolean ss = note.get("FILESEARCHKEY") != null;
		
		
		//전달, 파일서치키가 null이 아니면 
		if(curUrl.contains("forward") && note.get("FILESEARCHKEY") != null) {
			String fileSearchKey = note.get("FILESEARCHKEY").toString();
			noteVal.put("filesearchkey", fileSearchKey);
			//파일정보 읽어옴 
			List<Map<String, Object>> replyFile = ntDao.noteFile(noteVal);
			
			
			
			for(int i=0; i < replyFile.size(); i++) {
				//파일 경로 
				String filePath = replyFile.get(i).get("PATH").toString();
				String orgFileName = replyFile.get(i).get("ORGFILENAME").toString();
				
				//파일생성 
				File file = new File(filePath);		
				
				mView.addObject("replyFile",file);
				mView.addObject("orgFileName",orgFileName);
				
				
			}
			
			
			
		}
		
		//첨부파일정보
		List<Map<String, Object>> notefile = ntDao.noteFile(noteVal);
		//받는이
		List<Map<String, Object>> toList = ntDao.toList(noteVal); 
		//CC
		List<Map<String, Object>> ccList = ntDao.ccList(noteVal); 
		//전달시 셀렉트 박스 
		List<Map<String,String>> adminMail = ntDao.adminMail(siteId);
		
		
		//통지작성에서 넘어온거면 읽음체크 안함 
		if(!referUrl.contains("note/send")) {
			ntDao.noteEyeChk(noteVal);
		}
		
		

		mView.addObject("adminMail",adminMail);
		mView.addObject("note", note);
		mView.addObject("noteFile", notefile);
		mView.addObject("ccList", ccList);
		mView.addObject("toList", toList);
		mView.addObject("referUrl",referUrl);
		mView.addObject("curUrl",curUrl);
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
	
	//통지발송
	@Override
	public int noteSend(HttpServletResponse response, HttpServletRequest request, NoteDto ntDto, MultipartHttpServletRequest multipartHttpServletRequest) {		
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int fromUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());			
		String toUserList[] = request.getParameterValues("touser");
		String ccUserList[] = request.getParameterValues("ccuser");
		ntDto.setSiteid(siteId);
		//ntDto 셋팅
		//보낸이
		ntDto.setFromuserno(fromUserNo);	
		
		//파일첨부
		List<MultipartFile> mFile = ((MultipartHttpServletRequest)request).getFiles("file");
		if(mFile.size() != 0) {			
			//첨부파일			
			String fileSearchKey = crudEngine.multiUpload(response, multipartHttpServletRequest, mFile);
			ntDto.setFilesearchkey(fileSearchKey);

		}
		
		int noticeId = ntDao.noteSend(ntDto); //통지내용등록
		
		for(String a : toUserList) {
				int toUserNo = Integer.parseInt(a);
				ntDto.setUserno(toUserNo);				
				ntDao.notetoAndCc(ntDto); // to 등록
		}

		if(ccUserList != null) {
			for(String b : ccUserList) {
				int ccUserNo = Integer.parseInt(b);
				ntDto.setUserno(ccUserNo);
				ntDto.setChkcc(1);
				ntDao.notetoAndCc(ntDto); //cc 등록
			}
		}
		
		/*
		//이메일보낸이
		Map<String, Object> fromInfo = urDao.userInfo(fromUserNo);
			String fromEmail = fromInfo.get("EMAIL").toString();
			String fromName = fromInfo.get("USERNAME").toString();
		*/
		
			
		return noticeId;
	}

			
	//안읽은 내부통지 갯수
	@Override
	public int noteCount(NoteDto ntDto) {
		int noteCount = ntDao.noteCount(ntDto);	
		return noteCount;
	}



	//통지 발송 화면
	@Override
	public ModelAndView noteSendForm(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		List<Map<String,String>> adminMail = ntDao.adminMail(siteId);
		ModelAndView mView = new ModelAndView();
		mView.addObject("adminMail", adminMail);
		return mView;
	}


}