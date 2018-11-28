package saas.crud.crm.cp.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.cp.dto.CampaignDto;

public interface CampaignService {
	
	public ModelAndView campList(HttpServletRequest request); 
	
	public int campInsert(HttpServletRequest request,CampaignDto campaignDto);
	
	public ModelAndView campRead(HttpServletRequest request, int campNo);
	
	public void campUpdate(HttpServletRequest request, CampaignDto campaignDto);
	
	public void campDelete(HttpServletRequest request, int campNo);
	
	public void campMultiDelete(HttpServletRequest reuqest);
	
	public void campTargetInsert(HttpServletRequest request);

}
