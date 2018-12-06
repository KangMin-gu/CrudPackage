package saas.crud.crm.cp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.cp.dto.CampaignContentsDto;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

public interface CampaignService {
	
	public ModelAndView campList(HttpServletRequest request); 
	
	public int campInsert(HttpServletRequest request,CampaignDto campaignDto);
	
	public ModelAndView campRead(HttpServletRequest request, int campNo);
	
	public void campUpdate(HttpServletRequest request, CampaignDto campaignDto);
	
	public void campDelete(HttpServletRequest request, int campNo);
	
	public void campMultiDelete(HttpServletRequest reuqest);
	
	public void campTargetInsert(HttpServletRequest request,int campNo);
	
	public List<Map<String,Object>> campTargetCustList(HttpServletRequest request, int campNo);
	
	public int campFormInsertUpdate(HttpServletRequest request, CampaignFormDto campaignFormDto);
	
	public void campTestSend(HttpServletRequest request, int campNo);
	
	public ModelAndView campContentsList(HttpServletRequest request);
	
	public int campContentsInsert(HttpServletRequest request, CampaignContentsDto campaignContentsDto);
	
	public ModelAndView campContentsRead(HttpServletRequest request, int no);
	
	public void campContentsUpdate(HttpServletRequest request, CampaignContentsDto campaignContentsDto);
	
	public void campContentsDelete(HttpServletRequest request, int no);
	
	public void campContentesMultiDelete(HttpServletRequest request);
	
	public void campSend(HttpServletRequest request, int campNo);
	
	public List<Map<String,Object>> campTabTargetHistory(HttpServletRequest request, int campNo);

}
