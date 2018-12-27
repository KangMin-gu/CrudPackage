package saas.crud.crm.cp.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.cp.dto.CampaignContentsDto;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

public interface CampaignDao {
	
	public List<Map<String,Object>> campList(Map<String,Object> search);
	
	public int campTotalRows(Map<String,Object> search);
	
	public int campInsert(CampaignDto campaignDto);
	
	public Map<String,Object> campRead(Map<String,Object> param);
	
	public void campUpdate(CampaignDto campaignDto);
	
	public void campDelete(CampaignDto campaignDto);
	
	public void campTargetInsert(Map<String,Object> param);
	
	public void campTargetHistInsert(Map<String,Object> param);
	
	public void campTargetDelete(Map<String,Object> param);

	public void campTargetCustInsert(Map<String,Object> param);
	
	public void campTargetCustDelete(Map<String,Object> param);
	
	public List<Map<String,Object>> campTargetRead(Map<String,Object> param);
	
	public int campTargetCustCnt(CampaignDto campaignDto);
	
	public List<Map<String,Object>> campTargetCustList(Map<String,Object> search);
	
	public void campFormInsert(CampaignFormDto campaignFormDto);
	
	public Map<String,Object> campFormRead(Map<String,Object> param);
	
	public void campFormUpdate(CampaignFormDto campaignFormDto);
	
	public void campTestSend(Map<String,Object> param);
	
	
	public List<Map<String,Object>> campContentsList(Map<String,Object> search);
	
	public int campContentsTotalRows(Map<String,Object> search);
	
	public int campContentsInsert(CampaignContentsDto campaignContentsDto);
	
	public Map<String,Object> campContentsRead(CampaignContentsDto campaignContentsDto);
	
	public void campContentsUpdate(CampaignContentsDto campaignContentsDto);
	
	public void campContentsDelete(CampaignContentsDto campaignContentsDto);
	
	public void campSend(Map<String,Object> param);
	
	public List<Map<String,Object>> campTabTargetHistory(Map<String, Object> param);
	
	public int targetOrderMax(Map<String, Object> param);
	
	public int campTargetCustRows(Map<String,Object> search);
	
	public void campStepUpdate(CampaignDto campaignDto);
	
	public List<Map<String,Object>> campCalList(CampaignDto campaignDto);
	
	public List<Map<String,Object>> campContentsUseDescList(Map<String,Object> param);
	
	public List<Map<String,Object>> campFile(CampaignDto campaignDto);
	
	public List<CampaignFormDto> campFormList(CampaignFormDto campaignFormDto);
	
}
