package saas.crud.crm.cp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.cp.dto.CampaignDto;

@Repository
public class CampaignDaoImpl implements CampaignDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String, Object>> campList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> campList = session.selectList("cp.list",search); 
		return campList;
	}

	@Override
	public int campTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.totalRows",search);
	}

	@Override
	public int campInsert(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.insert("cp.insert",campaignDto);
		int campNo = campaignDto.getCampno();
		return campNo;
	}

	@Override
	public Map<String, Object> campRead(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.detail",campaignDto);
	}

	@Override
	public void campUpdate(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.update("cp.update",campaignDto);
	}

	@Override
	public void campDelete(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.update("cp.delete",campaignDto);
	}

	@Override
	public void campTargetHistInsert(Map<String,Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetHistInsert",param);
	}

	@Override
	public void campTargetInsert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetInsert",param);
	}
	@Override
	public int campTargetHistCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		int order = session.selectOne("cp.targetHistCount",param);
		
		return order;
	}

	@Override
	public void campTargetDelete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.delete("cp.targetDelete",param);
	}

	@Override
	public void campTargetCustInsert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetCustInsert",param);
	}
	
	

}
