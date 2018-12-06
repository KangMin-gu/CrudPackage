package saas.crud.crm.cp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.cp.dto.CampaignContentsDto;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

@Repository
public class CampaignDaoImpl implements CampaignDao{

	@Autowired
	private SqlSession session;
	
	// 캠페인 List
	@Override
	public List<Map<String, Object>> campList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> campList = session.selectList("cp.list",search); 
		return campList;
	}
	// 캠페인 총개수
	@Override
	public int campTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.totalRows",search);
	}
	// 캠페인 Insert
	@Override
	public int campInsert(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.insert("cp.insert",campaignDto);
		int campNo = campaignDto.getCampno();
		return campNo;
	}
	// 캠페인 상세
	@Override
	public Map<String, Object> campRead(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.detail",campaignDto);
	}
	// 캠페인 수정
	@Override
	public void campUpdate(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.update("cp.update",campaignDto);
	}
	// 캠페인 삭제
	@Override
	public void campDelete(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		session.update("cp.delete",campaignDto);
	}
	// 캠페인 타겟 이력 추가
	@Override
	public void campTargetHistInsert(Map<String,Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetHistInsert",param);
	}
	// 캠페인 타겟 추가
	@Override
	public void campTargetInsert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetInsert",param);
	}
	// 캠페인 이력 갯수확인 ( 갯수를 확인해서 +1 해서 order를 추가함)
	@Override
	public int campTargetHistCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		int order = session.selectOne("cp.targetHistCount",param);
		
		return order;
	}
	// 캠페인 타겟 삭제 ( 타겟을 수정하는 경우 campNO,siteId로 확인해서 지워버림)
	@Override
	public void campTargetDelete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.delete("cp.targetDelete",param);
	}
	// 추출 고객 추가 ( 타겟에 의해서 추출된 고객들을 추출고객테이블에 Insert)
	@Override
	public void campTargetCustInsert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.targetCustInsert",param);
	}
	@Override
	public List<Map<String, Object>> campTargetRead(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> campTargetList = session.selectList("cp.targetList",campaignDto);
		return campTargetList;
	}
	@Override
	public int campTargetCustCnt(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		int targetCustCnt = session.selectOne("cp.targetCustCnt",campaignDto);
		return targetCustCnt;
	}
	@Override
	public List<Map<String, Object>> campTargetCustList(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> campTargetCustList = session.selectList("cp.targetCustList",campaignDto);
		return campTargetCustList;
	}
	@Override
	public void campFormInsert(CampaignFormDto campaignFormDto) {
		// TODO Auto-generated method stub
		session.insert("cp.formInsert",campaignFormDto);
		
	}
	@Override
	public Map<String, Object> campFormRead(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.formRead",campaignDto);
	}
	@Override
	public void campFormUpdate(CampaignFormDto campaignFormDto) {
		// TODO Auto-generated method stub
		session.update("cp.formUpdate",campaignFormDto);
	}
	@Override
	public void campTestSend(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.insert("cp.testSend",param);
	}
	@Override
	public List<Map<String, Object>> campContentsList(Map<String,Object> search) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> campContentList = session.selectList("cp.contentsList",search);
		return campContentList;
	}
	@Override
	public int campContentsTotalRows(Map<String,Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.contentsTotalRows",search);
	}
	@Override
	public int campContentsInsert(CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		
		session.insert("cp.contentsInsert",campaignContentsDto);
		int no = campaignContentsDto.getNo();
		return no;
	}
	@Override
	public Map<String, Object> campContentsRead(CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		return session.selectOne("cp.contentsRead",campaignContentsDto);
	}
	@Override
	public void campContentsUpdate(CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		session.update("cp.contentsUpdate",campaignContentsDto);
	}
	@Override
	public void campContentsDelete(CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		session.update("cp.contentsDelete",campaignContentsDto);
	}
	@Override
	public void campSend(Map<String,Object> param) {
		// TODO Auto-generated method stub
		session.update("cp.send",param);
	}
	@Override
	public void campTargetCustDelete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		session.delete("cp.targetCustDelete",param);
	}
	@Override
	public List<Map<String, Object>> campTabTargetHistory(CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> tabHistory = session.selectList("cp.tabHistory",campaignDto);
		return tabHistory;
	}
	

}
