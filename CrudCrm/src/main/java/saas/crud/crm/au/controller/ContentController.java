package saas.crud.crm.au.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.ContentDto;
import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.ContentService;


@Controller
public class ContentController {
	
	@Autowired
	private CodeService codeService;
	@Autowired
	private ContentService contentService;
	
	// 서식관리 List
	@RequestMapping(value="/ad/content", method=RequestMethod.GET)
	public ModelAndView authCampaignContents(HttpServletRequest request) {
		ModelAndView mView = contentService.contentList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("au/content/contentsList");
		return mView;
	}
	// 서식관리 List 검색조건
	@RequestMapping(value="/ad/content", method=RequestMethod.POST)
	public ModelAndView authCampaignContentsSearch(HttpServletRequest request) {
		ModelAndView mView = contentService.contentList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("au/content/contentsList");
		return mView;
	}
		//서식관리 추가 화면
		@RequestMapping(value="/ad/content/post", method=RequestMethod.GET)
		public ModelAndView authCampaignContentsInsert(@ModelAttribute ContentDto contentDto){
			ModelAndView mView = new ModelAndView();
			Map<String,Object> code = codeService.getCode();
			mView.addAllObjects(code);
			mView.setViewName("au/content/contentsInsert");
			return mView;
		}
		// 서식 추가
		@RequestMapping(value="/ad/content/post", method=RequestMethod.POST)
		public ModelAndView authCampaignContentsInsertSet(HttpServletRequest request, @ModelAttribute ContentDto contentDto){
			ModelAndView mView = new ModelAndView();
			
			int contentNo = contentService.contentInsert(request, contentDto);
			mView.setViewName("redirect:/ad/content/"+contentNo);
			return mView;
		}
		
		//서식관리 상세
		@RequestMapping(value="/ad/content/{contentNo}", method=RequestMethod.GET)
		public ModelAndView authCampaignContentsDetail(HttpServletRequest request,@PathVariable int contentNo){
			ModelAndView mView = contentService.contentRead(request,contentNo);
			
			mView.setViewName("au/content/contentsRead");
			return mView;
		}
		
		//서식관리 수정화면
		@RequestMapping(value="/ad/content/post/{contentNo}", method=RequestMethod.GET)
		public ModelAndView authCampaignContentsUpdate(HttpServletRequest request,@PathVariable int contentNo,  @ModelAttribute ContentDto contentDto) {
			ModelAndView mView = contentService.contentRead(request, contentNo);
			Map<String,Object> code = codeService.getCode();
			mView.addAllObjects(code);
			mView.setViewName("au/content/contentsUpdate");
			return mView;
		}
		// 서식관리 수정
		@RequestMapping(value="/ad/content/post/{contentNo}", method=RequestMethod.POST)
		public ModelAndView authCampaignContentsUpdateSet(HttpServletRequest request,@ModelAttribute ContentDto contentDto,@PathVariable int contentNo) {
			ModelAndView mView = new ModelAndView();
			contentService.contentUpdate(request, contentDto);
			mView.setViewName("redirect:/ad/content/"+contentNo);
			return mView;
		}
		// 서식관리 단일삭제
		@RequestMapping(value="/ad/content/{contentNo}", method=RequestMethod.POST)
		public ModelAndView authCampaignContentsDelete(HttpServletRequest request,@PathVariable int contentNo) {
			ModelAndView mView = new ModelAndView();
			contentService.contentDelete(request,contentNo);
			mView.setViewName("redirect:/ad/content");
			return mView;
		}
		// 서식관리 멀티삭제
		@RequestMapping(value="/ad/content/delete", method=RequestMethod.POST)
		public ModelAndView authCampaignContentsDelete(HttpServletRequest request) {
			ModelAndView mView = new ModelAndView();
			contentService.contentMultiDelete(request);
			mView.setViewName("redirect:/ad/content");
			return mView;
		}

}
