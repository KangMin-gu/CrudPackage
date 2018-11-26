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

}
