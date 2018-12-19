package saas.crud.crm.nt.service;

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

import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteCategoryDto;
import saas.crud.crm.nt.dto.NoteDto;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao ntDao;
	
	@Autowired
	private CrudEngine crudEngine;
	
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
		//전 경로에 pop이 포함되는지 
		String referUrl = request.getHeader("referer");
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> noteVal = new HashMap<>();
		noteVal.put("siteid", siteId);
		noteVal.put("userno", userNo);
		noteVal.put("noticeid", noticeId);
		
		//통지정보
		Map<String, Object> note = ntDao.noteDetail(noteVal);
		
		System.out.println(note);
		
		//파일업로드
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
		//전 경로 얻어옴 
		mView.addObject("referUrl",referUrl);
		
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
		
		//내부통지 작성 폼 입장시, 셀렉트박스에 넣을 모든 유저정보  
		List<Map<String,String>> adminMail = ntDao.adminMail();
		
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		ModelAndView mView = new ModelAndView();
		mView.addObject("category", category);
		mView.addObject("adminMail",adminMail);
		return mView;
	}
	
	
	
	//noteform.jsp에서 넘어온 값들 ; 셋팅 
	@Override
	public HashMap<String,String> noteChosen(String[] userEmail){
		HashMap<String,String> map = new HashMap<String,String>();
		
		//;를 이어붙일 StringBuffer 생성 
		StringBuffer sbTarget = new StringBuffer();
		StringBuffer sbEmail = new StringBuffer();
		StringBuffer sbName = new StringBuffer();

		//;붙이기 
		for(int i=0;i<userEmail.length;i++) {
			//받는 사람 이름 
			String toNameAr = userEmail[i].substring(0,userEmail[i].indexOf(","));
			sbName.append(toNameAr + ";");

			//받는 사람 userno
			String toTargetAr = userEmail[i].substring(userEmail[i].indexOf(",")+1,userEmail[i].lastIndexOf(","));
			sbTarget.append(toTargetAr + ";");
			
			//이메일 
			String toUserAr = userEmail[i].substring(userEmail[i].lastIndexOf(",")+1);
			sbEmail.append(toUserAr + ";");
		}
		
		//마지막 ; 제거 
		//유저번호 
		String target = sbTarget.toString().substring(0,sbTarget.toString().length()-1);
		//이메일
		String email = sbEmail.toString().substring(0,sbEmail.toString().length()-1);
		//이름
		String name = sbName.toString().substring(0,sbName.toString().length()-1); 

		map.put("target", target);
		map.put("email", email);
		map.put("name", name);
		
		return map;
	}
	
	

	
	//통지발송
	@Override
	public int noteSend(HttpServletResponse response, HttpServletRequest request, NoteDto ntDto, MultipartHttpServletRequest multipartHttpServletRequest) {		

		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int fromUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());	
		
		ntDto.setSiteid(siteId);
		ntDto.setUserno(fromUserNo);
		List<MultipartFile> fileUpload = multipartHttpServletRequest.getFiles("file");
		
		
		List<MultipartFile> mFile = null;
		MultipartFile sFile = null;
		
		
	
		//받는 사람 이름,유저넘버,이메일이 넘어옴 
		String[] toUserEmail = request.getParameterValues("touser"); 
		String[] ccUserEmail = request.getParameterValues("ccuser");
		
		//insert 시킬 값 넣는 map
		HashMap<String, Object> map= new HashMap<String,Object>();
		
		//;를 이어붙어서 만든 userno(target),email,name값들 (받는이)  
		HashMap<String,String> toTargetMap = noteChosen(toUserEmail);
		
		//받는이
		//userno
		String toTarget = toTargetMap.get("target");
		//email
		String toUser = toTargetMap.get("email");
		//name 
		String toName = toTargetMap.get("name");
		
		
		//To ; 기준 끈기 (userNo)
		List<Integer> toAdress = crudEngine.adressQuarter(toTarget);
		//; 기준끊기 (Email)
		List<String> cutterToEmail = crudEngine.emailQuarter(toUser);
		//; 기준 끊기 (Name) 
		List<String> cutterToName = crudEngine.emailQuarter(toName);
		
		
		
		//참조 
		
		//;를 중간에 삽입한 문자열이 들어오는 곳 
		//참조 userno
		String ccTarget = null;
		//참조 email
		String ccUser = null;
		//참조 이름 
		String ccName = null;
		
		
		//참조 ;를 기준으로 잘린값들이 들어올 리스트
		List<Integer> cutterCcAdress = null;
		List<String> cutterCcEmail = null;
		List<String> cutterCcName = null;
		
		
		//참조 유저가 있다면 if문 진입  
		if(ccUserEmail != null) {
			//;를 이어붙임
			HashMap<String,String> ccTargetMap = noteChosen(ccUserEmail);
			ccTarget = ccTargetMap.get("target");
			ccUser = ccTargetMap.get("email");
			ccName = ccTargetMap.get("name");
			
			//cc ; 기준 끊기 
			
			//; 기준끊기 (userno)
			cutterCcAdress = crudEngine.adressQuarter(ccTarget);
			//; 기준끊기 (Email)
			cutterCcEmail = crudEngine.emailQuarter(ccUser);
			//; 기준 끊기 (Name) 
			cutterCcName = crudEngine.emailQuarter(ccName);
		}
		
		
		
		
		//파일테이블 업로드 실행
		//fileUpload != null
		if(fileUpload != null) {			
			String fileSearchKey = crudEngine.fileSearchKey(request);
			
			System.out.println("fileSearchKey : " + fileSearchKey);
			crudEngine.fileUpload(response, multipartHttpServletRequest, fileUpload, sFile, fileSearchKey);
			//crudEngine.fileUpload(response, multipartHttpServletRequest, mFile, sFile, fileSearchKey);
			ntDto.setFilesearchkey(fileSearchKey);
		}
		
		
		
		//통지등록, 리턴되는 값은 등록하는 사람의 통지 테이블에 자동증가된 값이 들어옴  (t_notice테이블에 등록) 
		//게시글 번호랑 비슷함 
		int noticeId = ntDao.noteSend(ntDto);
		ntDto.setNoticeid(noticeId);
	
	
		//이메일 주소와 이름 구해옴 (보내는 사람) 
		List<Map<String,String>> nameEmail = 
		ntDao.noteEmail(ntDto.getUserno());
			

		
		//userno 사이즈로 반복 
				for(int i=0; i<toAdress.size(); i++) {
					//SITEID
					map.put("siteId", siteId);
					//제목
					map.put("subject",ntDto.getTitle());
					//내용
					map.put("content",ntDto.getContent());
					//받는 사람 이메일 
					map.put("toEmail",cutterToEmail.get(i));
					//받는 사람 이름 
					map.put("cstName",cutterToName.get(i));
					
					//보내는 사람 이름,보내는 사람 이메일 : TB980010테이블에서 가져옴 
					map.put("userName", nameEmail.get(0).get("USERNAME"));
					map.put("fromEmail",nameEmail.get(0).get("EMAIL") );
					//보내는 사람 userNo
					map.put("userNo",fromUserNo);
					
					//t_mail에 넣음
					ntDao.noteSendMail(map);	
					
					//참조 유저가 있다면, 
					if(ccUserEmail != null) {
						if(cutterCcAdress.size()>0) {
						for(int j=0; j<cutterCcAdress.size(); j++) {
						//SITEID
						map.put("siteId", siteId);
						//제목
						map.put("subject",ntDto.getTitle());
						//내용
						map.put("content",ntDto.getContent());
						//받는 사람 이메일 
						map.put("toEmail",cutterCcEmail.get(j));
						//받는 사람 이름 
						map.put("cstName",cutterCcName.get(j));
						
						//보내는 사람 이름,보내는 사람 이메일 : TB980010테이블에서 가져옴 
						map.put("userName", nameEmail.get(0).get("USERNAME"));
						map.put("fromEmail",nameEmail.get(0).get("EMAIL") );
						//보내는 사람 userNo
						map.put("userNo",fromUserNo);
						
						ntDao.noteSendMail(map);	
							}
						// for문이 끝나면 리스트를 비움 
							cutterCcAdress.clear();
						}
					}
				}
				

		
		int chkcc = 1;
		
		//t_notice_02
		if( 1 <= toAdress.size()) {			
			for(int i = 0; i<toAdress.size(); i++) {
				//받아오는게 타겟 번호 = userno
			    int target = toAdress.get(i);
			    ntDto.setUserno(target);
			    //dao 타겟태우기
			    ntDao.notetoAndCc(ntDto);
			}
				if( ccTarget != null && !ccTarget.equals("")) {
					//CC가 있다면 실행
					List<Integer> ccAdress = crudEngine.adressQuarter(ccTarget);	
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
