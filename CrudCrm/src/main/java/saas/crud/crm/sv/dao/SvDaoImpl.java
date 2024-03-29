package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.ProductDto;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
import saas.crud.crm.sv.dto.ServiceDto;

@Repository
public class SvDaoImpl implements SvDao{

	@Autowired
	private SqlSession session;
	// 서비스 List
	@Override
	public List<Map<String, Object>> svList(Map<String, Object> param) {
		List<Map<String,Object>> svList = session.selectList("sv.svList",param);
		
		return svList;
	}
	// 서비스 전체 수
	@Override
	public int svServiceTotalRows(Map<String, Object> param) {
		
		return session.selectOne("sv.svServiceTotalRows",param);
	}
	//서비스 Insert
	@Override
	public int svInsert(ServiceDto serviceDto) {
		session.insert("sv.svInsert",serviceDto);
		int serviceNo = serviceDto.getServiceno();
		return serviceNo;
	}
	// 서비스 Update
	@Override
	public void svUpdate(ServiceDto serviceDto) {
		session.update("sv.svUpdate",serviceDto);
	}
	// 서비스 Delete
	@Override
	public void svDelete(ServiceDto serviceDto) {
		session.update("sv.svDelete",serviceDto);
	}
	// 진행단계 update
	@Override
	public void svStepUpdate(ServiceDto serviceDto) {
		session.update("sv.svStep",serviceDto);
	}
	// 현상파악 Insert
	@Override
	public void rewardInsert(RewardDto rewardDto) {
		session.insert("sv.rewardInsert", rewardDto);
	}
	// 현상파악 Update
	@Override
	public void rewardUpdate(RewardDto rewardDto) {
		session.update("sv.rewardUpdate", rewardDto);
	}
	// 처리결과 Insert
	@Override
	public void ractInsert(RactDto ractDto) {
		session.insert("sv.ractInsert", ractDto);
	}
	// 처리결과 Update
	@Override
	public void ractUpdate(RactDto ractDto) {
		session.update("sv.ractUpdate", ractDto);
	}
	// 서비스 Read
	@Override
	public Map<String, Object> serviceRead(Map<String, Object> param) {
		return session.selectOne("sv.serviceRead",param);
	}
	// 현상파악 Read
	@Override
	public Map<String, Object> rewardRead(Map<String, Object> param) {
		return session.selectOne("sv.rewardRead",param);
	}
	// 처리결과 Read
	@Override
	public Map<String, Object> ractRead(Map<String, Object> param) {
		return session.selectOne("sv.ractRead",param);
	}
	// 서비스 처리이력 탭
	@Override
	public List<Map<String, Object>> svTabRact(RactDto ractDto) {
		
		
		return session.selectList("sv.tabRact",ractDto);
	}
	// 서비스 이관 이력
	@Override
	public List<Map<String, Object>> conveyTabList(ConveyDto conveyDto) {
		
		return session.selectList("sv.tabConvey",conveyDto);
	}
	// 이관 추가
	@Override
	public void conveyInsert(ConveyDto conveyDto) {
		
		session.insert("sv.conveyInsert",conveyDto);
	}
	// 서비스 캘린더
	@Override
	public List<Map<String, Object>> svCalList(RewardDto rewardDto) {
		
		
		List<Map<String,Object>> svCalList = session.selectList("sv.calList",rewardDto);
		return svCalList;
	}
	// VOC 서비스 제품등록
	@Override
	public void svProductInsert(Map<String, Object> param) {
		session.insert("sv.svProductInsert",param);
	}
	// VOC 상담 예약
	@Override
	public void svReservInsert(Map<String, Object> param) {
		session.insert("sv.svReservInsert",param);
	}
	//VOC 최근 서비스 한건 가져오기
	@Override
	public Map<String, Object> svTopDesc(Map<String, Object> param) {
		Map<String,Object> svTopList = session.selectOne("sv.topList",param);
		return svTopList;
	}
	//VOC 최근 상담예약 한건 가져오기
	@Override
	public Map<String, Object> svTopResv(Map<String, Object> param) {
		Map<String,Object> svTopResv = session.selectOne("sv.topReserv",param);
		return svTopResv;
	}
	//VOC 최근 이관 한건 가져오기
	@Override
	public Map<String, Object> svTopConvey(Map<String, Object> param) {
		Map<String,Object> svTopConvey = session.selectOne("sv.topConvey",param);
		return svTopConvey;
	}
	//VOC 최근 현상파악 한건 가져오기
	@Override
	public Map<String, Object> svTopReward(Map<String, Object> param) {
		Map<String,Object> svTopReward = session.selectOne("sv.topReward",param);
		return svTopReward;
	}
	@Override
	public List<Map<String, Object>> svCalRewardOwner(RewardDto rewardDto) {

		List<Map<String,Object>> svCalRewardOwner = session.selectList("sv.calRewardOwner",rewardDto);
		return svCalRewardOwner;
	}
	@Override
	public List<Map<String,Object>> svCalRewardOwnerList(Map<String,Object> param){
		List<Map<String,Object>> svCalRewardOwnerList = session.selectList("sv.calRewardOwnerList",param);
		return svCalRewardOwnerList;
	}
	
	@Override
	public List<ProductDto> svProductRead(Map<String,Object> param){
		List<ProductDto> svProductRead = session.selectList("sv.svProductRead",param);
		
		return svProductRead;		
	}
	
	
}