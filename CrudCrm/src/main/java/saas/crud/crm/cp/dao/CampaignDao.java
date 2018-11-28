package saas.crud.crm.cp.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.cp.dto.CampaignDto;

public interface CampaignDao {
	
	public List<Map<String,Object>> campList(Map<String,Object> search);
	
	public int campTotalRows(Map<String,Object> search);
	
	public int campInsert(CampaignDto campaignDto);
	
	public Map<String,Object> campRead(CampaignDto campaignDto);
	
	public void campUpdate(CampaignDto campaignDto);
	
	public void campDelete(CampaignDto campaignDto);
	
	public void campTargetInsert(Map<String,Object> param);
	
	public void campTargetHistInsert(Map<String,Object> param);
	
	public int campTargetHistCount(Map<String,Object> param);
	
	public void campTargetDelete(Map<String,Object> param);

	public void campTargetCustInsert(Map<String,Object> param);
}
