package saas.crud.crm.cp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.service.CampaignService;

@Controller
public class CampaignController {
	
	private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);
	@Autowired
	
	private CampaignService campaignService;
	// 캠페인 List
	@RequestMapping(value = "/campaign", method=RequestMethod.GET)
	public ModelAndView authCampaignList(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		mView.setViewName("cp/campList");
		return mView;
	}
	// 캠페인 List
	@RequestMapping(value = "/campaign", method=RequestMethod.POST)
	public ModelAndView authCampaignSearchList(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		mView.setViewName("cp/campList");
		return mView;
	}
	//캠페인 상세
	@RequestMapping(value="/campaign/{campNo}",method=RequestMethod.GET)
	public ModelAndView authCampaignRead(HttpServletRequest request,@PathVariable int campNo) {
		
		ModelAndView mView = campaignService.campRead(request,campNo);
		mView.setViewName("cp/campRead");
		return mView;
	}
	//캠페인 추가 화면
	@RequestMapping(value="/campaign/post", method=RequestMethod.GET)
	public ModelAndView authCampaignInsert(){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("cp/campInsert");
		return mView;
	}
	// 캠페인 추가
	@RequestMapping(value="/campaign/post", method=RequestMethod.POST)
	public ModelAndView authCampaignInsertSet(HttpServletRequest request, CampaignDto campaignDto) {
		
		ModelAndView mView = new ModelAndView();
		
		int campNo = campaignService.campInsert(request, campaignDto);
		
		mView.setViewName("redirect:/campaign/"+campNo);
		
		return mView;
	}
	// 캠페인 수정 화면
	@RequestMapping(value="/campaign/post/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignUpdate(HttpServletRequest request, @PathVariable int campNo) {
		
		ModelAndView mView = campaignService.campRead(request,campNo);
		
		mView.setViewName("cp/campUpdate");
		
		return mView;
	}
	//캠페인 수정
	@RequestMapping(value="/campaign/post/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignUpdateSet(HttpServletRequest request, @ModelAttribute CampaignDto campaignDto) {
		
		ModelAndView mView = new ModelAndView();
		
		campaignService.campUpdate(request,campaignDto);
		
		int campNo = campaignDto.getCampno();
		
		mView.setViewName("redirect:/campaign/"+campNo);
		
		return mView;
		
	}
	//캠페인 삭제
	@RequestMapping(value="/campaign/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignDelete(HttpServletRequest request,@PathVariable int campNo) {
		ModelAndView mView = new ModelAndView();
		
		campaignService.campDelete(request,campNo);
		
		mView.setViewName("redirect:/campaign");
		return mView;
	}
	//캠페인 다중삭제
	
	@RequestMapping(value="/campaign/delete", method=RequestMethod.POST)
	public ModelAndView authCampaignMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		campaignService.campMultiDelete(request);
		mView.setViewName("redirect:/campaign");
		return mView;
	}
	//캠페인 다중삭제
	
	@RequestMapping(value="/campaign/target/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignTargetInsert(HttpServletRequest request,@PathVariable int campNo) {
		ModelAndView mView = campaignService.campRead(request,campNo);
		mView.setViewName("cp/campTargetInsert");
		return mView;
	}
	@RequestMapping(value="/campaign/target/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignTargetInsertSet(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		campaignService.campTargetInsert(request);
		mView.setViewName("cp/campTargetInsert");
		return mView;
	}
	
	
	
}
