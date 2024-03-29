package saas.crud.crm.cp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

@Repository
public class CampaignDaoImpl implements CampaignDao{

	@Autowired
	private SqlSession session;
	
	// 캠페인 List
	@Override
	public List<Map<String, Object>> campList(Map<String, Object> search) {
		List<Map<String,Object>> campList = session.selectList("cp.list",search); 
		return campList;
	}
	// 캠페인 총개수
	@Override
	public int campTotalRows(Map<String, Object> search) {
		return session.selectOne("cp.totalRows",search);
	}
	// 캠페인 Insert
	@Override
	public int campInsert(CampaignDto campaignDto) {
		session.insert("cp.insert",campaignDto);
		int campNo = campaignDto.getCampno();
		return campNo;
	}
	// 캠페인 상세
	@Override
	public Map<String, Object> campRead(Map<String,Object> param) {
		return session.selectOne("cp.detail",param);
	}
	// 캠페인 수정
	@Override
	public void campUpdate(CampaignDto campaignDto) {
		session.update("cp.update",campaignDto);
	}
	// 캠페인 삭제
	@Override
	public void campDelete(CampaignDto campaignDto) {
		session.update("cp.delete",campaignDto);
	}
	// 캠페인 타겟 이력 추가
	@Override
	public void campTargetHistInsert(Map<String,Object> param) {
		session.insert("cp.targetHistInsert",param);
	}
	// 캠페인 타겟 추가
	@Override
	public void campTargetInsert(Map<String, Object> param) {
		session.insert("cp.targetInsert",param);
	}
	// 캠페인 타겟 삭제 ( 타겟을 수정하는 경우 campNO,siteId로 확인해서 지워버림)
	@Override
	public void campTargetDelete(Map<String, Object> param) {
		session.delete("cp.targetDelete",param);
	}
	// 추출 고객 추가 ( 타겟에 의해서 추출된 고객들을 추출고객테이블에 Insert)
	@Override
	public void campTargetCustInsert(Map<String, Object> param) {
		session.insert("cp.targetCustInsert",param);
	}
	// 캠페인 추출 화면 Read
	@Override
	public List<Map<String, Object>> campTargetRead(Map<String,Object> param) {
		List<Map<String,Object>> campTargetList = session.selectList("cp.targetList",param);
		return campTargetList;
	}
	// 캠페인 추출 대상  수
	@Override
	public int campTargetCustCnt(CampaignDto campaignDto) {
		int targetCustCnt = session.selectOne("cp.targetCustCnt",campaignDto);
		return targetCustCnt;
	}
	// 캠페인 추출 대상 리스트
	@Override
	public List<Map<String, Object>> campTargetCustList(Map<String,Object> search) {
		List<Map<String,Object>> campTargetCustList = session.selectList("cp.targetCustList",search);
		return campTargetCustList;
	}
	// 캠페인 발송 insert
	@Override
	public void campFormInsert(CampaignFormDto campaignFormDto) {
		session.insert("cp.formInsert",campaignFormDto);
		
	}
	@Override
	public Map<String, Object> campFormRead(Map<String,Object> param) {
		return session.selectOne("cp.formRead",param);
	}

	//캠페인 발송 Update
	@Override
	public void campFormUpdate(CampaignFormDto campaignFormDto) {
		session.update("cp.formUpdate",campaignFormDto);
	}
	//캠페인 테스트 발송
	@Override
	public void campTestSend(Map<String, Object> param) {
		session.insert("cp.testSend",param);
	}
	
	// 캠페인 발송
	@Override
	public void campSend(Map<String,Object> param) {
		session.update("cp.send",param);
	}
	// 캠페인 대상 고객 전체삭제
	@Override
	public void campTargetCustDelete(Map<String, Object> param) {
		
		session.delete("cp.targetCustDelete",param);
	}
	// 캠페인 추출 이력 List
	@Override
	public List<Map<String, Object>> campTabTargetHistory(Map<String, Object> param) {
		
		List<Map<String,Object>> tabHistory = session.selectList("cp.tabHistory",param);
		return tabHistory;
	}
	// 캠페인 추출 이력 Cnt
	@Override
	public int targetOrderMax(Map<String, Object> param) {
		
		return session.selectOne("cp.targetOrderMax",param);
	}
	// 캠페인 대상 추출 고객수
	@Override
	public int campTargetCustRows(Map<String, Object> search) {
		
		return session.selectOne("cp.campTargetCustRows",search);
	}
	//캠페인 단계 진행
	@Override
	public void campStepUpdate(CampaignDto campaignDto) {
		
		session.update("cp.stepUpdate",campaignDto);
	}
	// 캠페인 일정 List(캘린더)
	@Override
	public List<Map<String, Object>> campCalList(CampaignDto campaignDto) {
		
		List<Map<String,Object>> campCalList = session.selectList("cp.calList",campaignDto);
		return campCalList;
	}


	// 캠페인 등록시 첨부파일
	@Override
	public List<Map<String, Object>> campFile(CampaignDto campaignDto) {
		
		List<Map<String, Object>> campFile = session.selectList("cp.campaignFile", campaignDto);
		return campFile;
	}
	@Override
	public List<CampaignFormDto> campFormList(CampaignFormDto campaignFormDto) {
		
		List<CampaignFormDto> campFormList = session.selectList("cp.campaignFormList",campaignFormDto);
		
		return campFormList;
	}
	

}