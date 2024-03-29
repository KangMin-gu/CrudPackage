package saas.crud.crm.cp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.au.service.ContentService;
import saas.crud.crm.common.CommonService;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;
import saas.crud.crm.cp.service.CampaignService;

@Controller
public class CampaignController {
	
	private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Autowired
	private CampaignService campaignService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ContentService contentService;
	
	// 캠페인 List
	@RequestMapping(value = "/campaign", method=RequestMethod.GET)
	public ModelAndView authCampaignList(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campList");
		return mView;
	}
	// 캠페인 List
	@RequestMapping(value = "/campaign", method=RequestMethod.POST)
	public ModelAndView authCampaignSearchList(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
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
	public ModelAndView authCampaignInsert(@ModelAttribute CampaignDto campaignDto){
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campInsert");
		return mView;
	}
	// 캠페인 추가
	@RequestMapping(value="/campaign/post", method=RequestMethod.POST)
	public ModelAndView authCampaignInsertSet(HttpServletResponse response,HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest ,CampaignDto campaignDto) {
		
		ModelAndView mView = new ModelAndView();
		
		int campNo = campaignService.campInsert(response, request, multipartHttpServletRequest, campaignDto);
		
		mView.setViewName("redirect:/campaign/"+campNo);
		
		return mView;
	}
	// 캠페인 수정 화면
	@RequestMapping(value="/campaign/post/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignUpdate(HttpServletRequest request, @PathVariable int campNo,@ModelAttribute CampaignDto campaignDto) {
		
		ModelAndView mView = campaignService.campRead(request,campNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);		
		mView.setViewName("cp/campUpdate");
		
		return mView;
	}
	//캠페인 수정
	@RequestMapping(value="/campaign/post/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignUpdateSet(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest,@ModelAttribute CampaignDto campaignDto) {
		
		ModelAndView mView = new ModelAndView();
		
		campaignService.campUpdate(response, request, multipartHttpServletRequest, campaignDto);
		
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
	// 캠페인 추출 입력 화면
	@RequestMapping(value="/campaign/target/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignTargetInsert(HttpServletRequest request,@PathVariable int campNo) {
		ModelAndView mView = campaignService.campRead(request,campNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campTargetInsert");
		return mView;
	}
	//캠페인 추출 Insert
	@RequestMapping(value="/campaign/target/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignTargetInsertSet(HttpServletRequest request, @PathVariable int campNo) {
		ModelAndView mView = new ModelAndView();
		campaignService.campTargetInsert(request, campNo);
		mView.setViewName("redirect:/campaign/"+campNo+"/#wizard-t-1");
		return mView;
	}
	// 캠페인 발송 Email 화면
	@RequestMapping(value="/campaign/email/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignEmailSend(HttpServletRequest request, @PathVariable int campNo, @ModelAttribute CampaignFormDto campaignFromDto) {
		ModelAndView mView = campaignService.campRead(request,campNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campSend");
		return mView;
	}
	// 캠페인 발송 Sms 화면
	@RequestMapping(value="/campaign/sms/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignSmsSend(HttpServletRequest request, @PathVariable int campNo, @ModelAttribute CampaignFormDto campaignFormDto) {
		ModelAndView mView = campaignService.campRead(request,campNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campSend");
		return mView;
	}
	// 캠페인 발송 Mms 화면
	@RequestMapping(value="/campaign/mms/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignMmsSend(HttpServletRequest request, @PathVariable int campNo, @ModelAttribute CampaignFormDto campaignFormDto) {
		ModelAndView mView = campaignService.campRead(request,campNo);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campSend");
		return mView;
	}
	// 캠페인 발송 폼 저장
	@RequestMapping(value="/campaignform/{campNo}",method=RequestMethod.POST)
	public ModelAndView authCampaignFormUpdate(HttpServletResponse response, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request,@ModelAttribute CampaignFormDto campaignFormDto,@PathVariable int campNo) {
		ModelAndView mView = new ModelAndView();
		
		campaignService.campFormInsertUpdate(response, multipartHttpServletRequest, request, campaignFormDto,campNo);
		
		mView.setViewName("redirect:/campaign/"+campNo+"/#wizard-t-2");
		
		return mView;
	}
	
	@RequestMapping(value="/campaign/test/{campNo}", method=RequestMethod.POST)
	@ResponseBody
	public int authCampaignTestSend(HttpServletRequest request, @PathVariable int campNo) {
		campaignService.campTestSend(request,campNo);
		return 0;
	}
	
	// 서식 팝업
	@RequestMapping(value="/popcontents", method=RequestMethod.GET)
	public ModelAndView authPopContents(HttpServletRequest request) {
		ModelAndView mView = contentService.contentList(request);
		mView.setViewName("cp/popContents");
		return mView;
	}
	@RequestMapping(value="/campaign/send/{campNo}", method=RequestMethod.POST)
	public ModelAndView authCampaignSend(HttpServletRequest request, @PathVariable int campNo) {
		ModelAndView mView = new ModelAndView();
		
		campaignService.campSend(request,campNo);
		mView.setViewName("redirect:/campaign");
		return mView;
	}
	
	@RequestMapping(value="/tab/targetHistory/{campNo}", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> authTabTargetHistory(HttpServletRequest request,@PathVariable int campNo){
		
 		List<Map<String,Object>> tabHistory= campaignService.campTabTargetHistory(request,campNo);
		
		return tabHistory;
	}
	
	@RequestMapping(value="/poptarget", method=RequestMethod.GET)
	public ModelAndView authPopCampTarget(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		
		mView.setViewName("cp/popTarget");
		return mView;
	}
	@RequestMapping(value="/poptarget", method=RequestMethod.POST)
	public ModelAndView authPopCampTargetSearch(HttpServletRequest request) {
		
		ModelAndView mView = campaignService.campList(request);
		
		mView.setViewName("cp/popTarget");
		return mView;
	}
	
	@RequestMapping(value="/tab/targetCust/{campNo}",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authTabTargetCust(HttpServletRequest request,@PathVariable int campNo){
		
		Map<String,Object> targetCust = campaignService.campTabTargetCustList(request, campNo);
		
		return targetCust;
		
	}
	
	@RequestMapping(value="/poptarget/{campNo}",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> authPopTargetRead(HttpServletRequest request,@PathVariable int campNo){
		
		List<Map<String,Object>> targetList = campaignService.campTargetRead(request, campNo);
		
		return targetList;
		
	}
	
	//캘린더메인-리스트
	@RequestMapping(value="/campaign/cal",method=RequestMethod.GET)
	public ModelAndView authsaCalendar(HttpServletRequest request) {
		ModelAndView mView = campaignService.campCalList(request);
		mView.setViewName("cp/calendar/campCalMain");
		return mView;
	}
	
	@RequestMapping(value="/campContents",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> authCampContents(HttpServletRequest request){
		
		List<Map<String,Object>> contents = contentService.contentUseDescList(request);
		
		return contents;
		
	}
	
	//첨부파일 다운로드
	@RequestMapping(value="/campaign/download/{fileId}", method=RequestMethod.GET)
	public ModelAndView authfileDownload(HttpServletRequest request, @PathVariable int fileId) {
		ModelAndView mView = commonService.noteDownload(request, fileId);
		mView.setViewName("fileDownView");
		return mView;
	}
	
	@RequestMapping(value="/campaign/cust", method=RequestMethod.GET)
	public ModelAndView authcampaignTargetList(HttpServletRequest request) {
		ModelAndView mView = campaignService.campList(request);
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("cp/campList");
		return mView;	
	}
	
	@RequestMapping(value="/campaign/cust/{campNo}", method=RequestMethod.GET)
	public ModelAndView authcampaignTargetDetail(HttpServletRequest request,@PathVariable int campNo){
		
		ModelAndView mView = new ModelAndView();
		
		Map<String,Object> targetCust = campaignService.campTabTargetCustList(request, campNo);
		mView.addAllObjects(targetCust);
		mView.setViewName("cp/campCustList");
		mView.addObject("campno",campNo);
		
		return mView;
	}
	
	@RequestMapping(value="/campaign/cal/{campNo}", method=RequestMethod.GET)
	public ModelAndView authCampaignCalPopUp(HttpServletRequest request, @PathVariable int campNo) {
		
		ModelAndView mView = campaignService.campRead(request, campNo);
		mView.setViewName("cp/calendar/campCalPopUp");
		
		return mView;
	}
	
}