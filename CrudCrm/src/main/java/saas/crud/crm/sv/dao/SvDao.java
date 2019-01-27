package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
import saas.crud.crm.sv.dto.ServiceDto;

public interface SvDao {
	// 서비스 List
	public List<Map<String,Object>> svList(Map<String,Object> param);
	// 서비스 전체 건수 
	public int svServiceTotalRows(Map<String,Object> param);
	// 서비스 Insert
	public int svInsert(ServiceDto serviceDto);
	// 서비스 Update
	public void svUpdate(ServiceDto serviceDto);
	// 서비스 Delete
	public void svDelete(ServiceDto serviceDto);
	// 서비스 진행단계 Update
	public void svStepUpdate(ServiceDto serviceDto);
	// 현상파악 Insert
	public void rewardInsert(RewardDto rewardDto);
	// 현상파악 Upate
	public void rewardUpdate(RewardDto rewardDto);
	// 처리결과 Insert
	public void ractInsert(RactDto ractDto);
	// 처리결과 Update
	public void ractUpdate(RactDto ractDto);
	// 서비스 Read
	public Map<String,Object> serviceRead(Map<String,Object> param);
	// 현상파악 Read
	public Map<String,Object> rewardRead(Map<String,Object> param);
	// 처리결과 Read
	public Map<String,Object> ractRead(Map<String,Object> param);
	// 처리이력 Tab
	public List<Map<String, Object>> svTabRact(RactDto ractDto);
	// 이관이력 Tab
	public List<Map<String, Object>> conveyTabList(ConveyDto conveyDto);
	// 이관 추가
	public void conveyInsert(ConveyDto conveyDto);
	// 캘린더
	public List<Map<String,Object>> svCalList(RewardDto rewardDto);
	
	// voc 제품등록
	public void svGoodsInsert(Map<String,Object> param);
	// voc 상담예약
	public void svReservInsert(Map<String,Object> param);
	// voc 최근 서비스 한건
	public Map<String,Object> svTopDesc(Map<String,Object> param);
	// voc 최근 상담예약 한건
	public Map<String,Object> svTopResv(Map<String,Object> param);
	// voc 최근 이관 한건
	public Map<String,Object> svTopConvey(Map<String,Object> param);
	
	public List<Map<String,Object>> svRewardOwner(RewardDto rewardDto);

}