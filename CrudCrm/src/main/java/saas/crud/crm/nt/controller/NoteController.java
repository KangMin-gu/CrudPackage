package saas.crud.crm.nt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.common.CommonService;
import saas.crud.crm.nt.dto.NoteDto;
import saas.crud.crm.nt.service.NoteService;

@Controller
public class NoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);
	
	@Autowired
	private NoteService ntService;
	
	@Autowired
	private CommonService commonService;
	
	//받은 통지
	@RequestMapping(value="/note/inbox", method=RequestMethod.GET)
	public ModelAndView authNoteInbox(HttpServletRequest request) {
		ModelAndView mView = ntService.noteInbox(request);		
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 검색
	@RequestMapping(value="/note/inbox", method=RequestMethod.POST)
	public ModelAndView authNoteInsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteInbox(request);	
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 상세
	@RequestMapping(value="/note/inbox/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//보낸 통지
	@RequestMapping(value="/note/outbox", method=RequestMethod.GET)
	public ModelAndView authnoteOutbox(HttpServletRequest request) {
		ModelAndView mView = ntService.noteOutbox(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 검색
	@RequestMapping(value="/note/outbox", method=RequestMethod.POST)
	public ModelAndView authNoteOutsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteOutbox(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//보낸 통지상세
	@RequestMapping(value="/note/outbox/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteOutDetail(@PathVariable int noticeId, HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//중요 메세지함
	@RequestMapping(value="/note/import", method=RequestMethod.GET)
	public ModelAndView authnoteImport(HttpServletRequest request) {
		ModelAndView mView = ntService.noteImport(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//중요 메세지함 검색
	@RequestMapping(value="/note/import", method=RequestMethod.POST)
	public ModelAndView authnoteImportsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteImport(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//중요 통지 상세
	@RequestMapping(value="/note/import/{noticeId}", method=RequestMethod.GET)
	public ModelAndView noteImportDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//휴지통 메세지함
	@RequestMapping(value="/note/trash", method=RequestMethod.GET)
	public ModelAndView authnoteTrash(HttpServletRequest request) {
		ModelAndView mView = ntService.noteTrash(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//휴지통 메세지함 검색
	@RequestMapping(value="/note/trash", method=RequestMethod.POST)
	public ModelAndView authnoteTrashsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteTrash(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//상세보기 휴지통 이동 
	@RequestMapping(value="/note/intrash/{noticeId}",method=RequestMethod.GET)
	public String authnoteTrashInbox(@PathVariable int noticeId,HttpServletRequest request) {
		List<Integer> noticeid = new ArrayList<>();
		noticeid.add(noticeId);
		ntService.noteTrashChk(request, noticeid);
		return "redirect:/note/inbox";
	}
	
	//휴지통 상세보기  완전삭제 
	@RequestMapping(value="/note/indelete/{noticeId}",method=RequestMethod.GET)
	public String authnoteDeleteInbox(@PathVariable int noticeId,HttpServletRequest request) {
		List<Integer> noticeid = new ArrayList<>();
		noticeid.add(noticeId);
		ntService.noteDeleteChk(request, noticeid);
		return "redirect:/note/trash";
	}
	
	//휴지통 통지 상세
	@RequestMapping(value="/note/trash/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteTrashDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//메일 발송 화면
	@RequestMapping(value="/note/send", method=RequestMethod.GET)
	public ModelAndView authnoteSendForm(HttpServletRequest request) {
		ModelAndView mView = ntService.noteSet(request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/noteform");
		return mView;
	}
	//답장 화면 
	@RequestMapping(value="/note/send/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteSendForm(HttpServletRequest request,@PathVariable int noticeId) {
		ModelAndView mView = ntService.noteReply(request,noticeId);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));	
		mView.setViewName("nt/noteform");
		return mView;
	}
	
	//전달 화면 
	@RequestMapping(value="/note/forward/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteForwardForm(HttpServletRequest request,@PathVariable int noticeId) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.addObject("noteCommonRows",ntService.noteCommonRows(request));
		mView.setViewName("nt/noteform");
		return mView;
	}
	
	
	//메일 발송
	@RequestMapping(value="/note/send", method=RequestMethod.POST)
	public String authnoteSend(HttpServletResponse response, HttpServletRequest request, @ModelAttribute NoteDto ntDto, MultipartHttpServletRequest multipartHttpServletRequest) {
		int noticeId= ntService.noteSend(response, request, ntDto, multipartHttpServletRequest);
		return "redirect:/note/outbox/"+noticeId;
	}
	
	//읽음으로 체크
	@RequestMapping(value="/note/eyechk", method=RequestMethod.GET)
	@ResponseBody
	public void authnoteEyeChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteEyeChk(request, noticeid);
	}
	
	//중요 체크
	@RequestMapping(value="/note/importchk", method=RequestMethod.GET)
	@ResponseBody
	public void authnoteimportChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteImportChk(request, noticeid);
	}
	
	//휴지통으로 이동
	@RequestMapping(value="/note/trashchk", method=RequestMethod.GET)
	@ResponseBody
	public void authnoteTrashChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteTrashChk(request, noticeid);
	}
	
	//삭제 
	@RequestMapping(value="/note/delchk", method=RequestMethod.GET)
	@ResponseBody
	public void authnoteDeleteChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteDeleteChk(request, noticeid);
	}
	
	//보관함 되돌리기 
	@RequestMapping(value="/note/returnchk", method=RequestMethod.GET)
	@ResponseBody
	public void authnoteReturnChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteReturnChk(request, noticeid);			//return으로 수정
	}
	
	//첨부파일 다운로드
	@RequestMapping(value="/note/download/{fileId}", method=RequestMethod.GET)
	public ModelAndView notedownload(HttpServletRequest request, @PathVariable int fileId) {
		ModelAndView mView = commonService.noteDownload(request, fileId);
		mView.setViewName("fileDownView");
		return mView;
	}
	
	//쪽지팝업(ajax)	
	@RequestMapping(value="/note/summary",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> noteSummary(HttpServletRequest request) {
		List<Map<String,Object>> recentlyNote = ntService.noteSummary(request);
		return recentlyNote;
	}
}