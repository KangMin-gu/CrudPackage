package saas.crud.crm.nt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.dto.NoteDto;
import saas.crud.crm.nt.service.NoteService;

@Controller
public class NoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);
	
	@Autowired
	private NoteService ntService;
	
	//받은 통지
	@RequestMapping(value="/note/inbox", method=RequestMethod.GET)
	public ModelAndView authNoteInbox(HttpServletRequest request) {
		ModelAndView mView = ntService.noteInbox(request);		
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 검색
	@RequestMapping(value="/note/inbox", method=RequestMethod.POST)
	public ModelAndView authNoteInsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteInbox(request);	
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 상세
	@RequestMapping(value="/note/inbox/{noticeId}", method=RequestMethod.GET)
	public ModelAndView noteDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//보낸 통지
	@RequestMapping(value="/note/outbox", method=RequestMethod.GET)
	public ModelAndView noteOutbox(HttpServletRequest request) {
		ModelAndView mView = ntService.noteOutbox(request);
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 검색
	@RequestMapping(value="/note/outbox", method=RequestMethod.POST)
	public ModelAndView authNoteOutsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteOutbox(request);
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//보낸 통지상세
	@RequestMapping(value="/note/outbox/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteOutDetail(@PathVariable int noticeId, HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//중요 메세지함
	@RequestMapping(value="/note/import", method=RequestMethod.GET)
	public ModelAndView authnoteImport(HttpServletRequest request) {
		ModelAndView mView = ntService.noteImport(request);
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//중요 메세지함 검색
	@RequestMapping(value="/note/import", method=RequestMethod.POST)
	public ModelAndView authnoteImportsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteImport(request);
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//중요 통지 상세
	@RequestMapping(value="/note/import/{noticeId}", method=RequestMethod.GET)
	public ModelAndView noteImportDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//휴지통 메세지함
	@RequestMapping(value="/note/trash", method=RequestMethod.GET)
	public ModelAndView authnoteTrash(HttpServletRequest request) {
		ModelAndView mView = ntService.noteTrash(request);
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//휴지통 메세지함 검색
	@RequestMapping(value="/note/trash", method=RequestMethod.POST)
	public ModelAndView authnoteTrashsearch(HttpServletRequest request) {
		ModelAndView mView = ntService.noteTrash(request);
		mView.setViewName("nt/notelist");
		return mView;
	}	
	
	//휴지통 통지 상세
	@RequestMapping(value="/note/trash/{noticeId}", method=RequestMethod.GET)
	public ModelAndView authnoteTrashDetail(@PathVariable int noticeId,HttpServletRequest request) {
		ModelAndView mView = ntService.noteDetail(noticeId, request);
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//읽음으로 체크
	@RequestMapping(value="/note/eyechk", method=RequestMethod.GET)
	@ResponseBody
	public void noteEyeChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteEyeChk(request, noticeid);
	}
	
	//중요 체크
	@RequestMapping(value="/note/importchk", method=RequestMethod.GET)
	@ResponseBody
	public void noteimportChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteImportChk(request, noticeid);
	}
	
	//휴지통으로 이동
	@RequestMapping(value="/note/trashchk", method=RequestMethod.GET)
	@ResponseBody
	public void noteTrashChk(HttpServletRequest request, @RequestParam(value="checkArr[]") List<Integer> noticeid) {
		ntService.noteTrashChk(request, noticeid);
	}
	
}
