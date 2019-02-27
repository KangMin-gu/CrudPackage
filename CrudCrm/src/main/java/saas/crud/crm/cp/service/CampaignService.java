package saas.crud.crm.cp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

public interface CampaignService {
	
	public ModelAndView campList(HttpServletRequest request); 
	
	public int campInsert(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CampaignDto campaignDto);
	
	public ModelAndView campRead(HttpServletRequest request, int campNo);
	
	public void campUpdate(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CampaignDto campaignDto);
	
	public void campDelete(HttpServletRequest request, int campNo);
	
	public void campMultiDelete(HttpServletRequest reuqest);
	
	public void campTargetInsert(HttpServletRequest request,int campNo);
	
	public void campFormInsertUpdate(HttpServletResponse response, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request,@ModelAttribute CampaignFormDto campaignFormDto,@PathVariable int campNo);
	
	public void campTestSend(HttpServletRequest request, int campNo);
	
	public void campSend(HttpServletRequest request, int campNo);
	
	public List<Map<String,Object>> campTabTargetHistory(HttpServletRequest request, int campNo);
	
	public Map<String,Object> campTabTargetCustList(HttpServletRequest request, int campNo);
	
	public List<Map<String,Object>> campTargetRead(HttpServletRequest request, int campNo);
	
	public ModelAndView campCalList(HttpServletRequest request);
	
	
	
	
}