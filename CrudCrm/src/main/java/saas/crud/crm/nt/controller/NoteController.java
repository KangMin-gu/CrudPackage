package saas.crud.crm.nt.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.service.NoteService;

@Controller
public class NoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);
	
	@Autowired
	private NoteService ntService;
	
	//받은 통지
	@RequestMapping(value="/note/inbox", method=RequestMethod.GET)
	public ModelAndView noteInbox(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지상세
	@RequestMapping(value="/note/inbox/{noticeid}", method=RequestMethod.GET)
	public ModelAndView noteInDetail(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//보낸 통지
	@RequestMapping(value="/note/outbox", method=RequestMethod.GET)
	public ModelAndView noteOutbox(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//보낸 통지상세
	@RequestMapping(value="/note/outbox/{noticeid}", method=RequestMethod.GET)
	public ModelAndView noteOutDetail(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notedetail");
		return mView;
	}
	
	//통지 발송 폼
	@RequestMapping(value="/note/send", method=RequestMethod.GET)
	public ModelAndView noteSendForm(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/noteform");
		return mView;
	}
	
	//통지 발송
	@RequestMapping(value="/note/send", method=RequestMethod.POST)
	public ModelAndView notesend(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//휴지통
	@RequestMapping(value="/note/trush", method=RequestMethod.GET)
	public ModelAndView noteTrush(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}	
	
	//받은 통지 휴지통이동
	@RequestMapping(value="/note/trush/{noticeid}", method=RequestMethod.GET)
	public ModelAndView noteInTrush(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}
	
	//받은 통지 삭제
	@RequestMapping(value="/note/trush/{noticeid}", method=RequestMethod.PUT)
	public ModelAndView noteInTrushDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("nt/notelist");
		return mView;
	}
}
