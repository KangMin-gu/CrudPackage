package saas.crud.crm.cu.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;



@Repository
public class CustDaoImpl implements CustDao {
	
	@Autowired
	private SqlSession session;

	//고객리스트 총자료수 
	@Override
	public int totalCnt(Map<String, Object> map) {
		int totalcnt = session.selectOne("customer.totalcnt",map);
		return totalcnt;
	}
	//고객리스트 
	@Override
	public List<Map<String,Object>> custList(Map<String, Object> searchVal) {
		List<Map<String,Object>> custList = session.selectList("customer.custList",searchVal);
		return custList;
	}
	
	//고객상세정보
	@Override
	public Map<String,Object> custDetail(Map<String,Object> custVal){
		Map<String,Object> map = session.selectOne("customer.custDetail",custVal);
		return map;
	}
	//고객 삭제
	@Override
	public int custDelete(CustDto custDto) {
		int res = session.update("customer.custDelete",custDto);
		return res;
	}

	//고객추가 - 추가한 pk값 리턴
	@Override
	public int custformInsert(CustDto custDto) {
		session.insert("customer.custformInsert", custDto);
		int custno = custDto.getCustno();
		return custno;
	}
	//고객추가 - 수신거부테이블 
	@Override
	public void custformInsertDeny(CustDenyDto custDenyDto) {
		session.insert("customer.custformInsertDeny", custDenyDto);
	}
	//고객추가 - 관련고객 테이블 추가
	@Override
	public void mergeRelCli(CustDto custDto) {
		session.insert("customer.mergeRelCli", custDto);
	}
	
	//고객 수정 폼(바인딩 정보)
	@Override
	public Map<String,Object> custUpdateForm(int custno){
		Map<String,Object> map = session.selectOne("customer.custUpdateForm",custno);
		return map;
	}
	//고객 수정 
	@Override
	public int custformUpdate(CustDto custDto) {
		int res = session.insert("customer.custformUpdate", custDto);
		return res;
	}
	//고객 수정 - 수신거부테이블
	@Override
	public int custformUpdateDeny(CustDenyDto custDenyDto) {
		int res = session.insert("customer.custformUpdateDeny", custDenyDto);
		return res;
	}
	//고객 상세 탭 - 캠페인 리스트 카운터
	@Override
	public int custTabCampListCnt(Map<String, Object> searchVal) {
		int res = session.selectOne("customer.custTabCampListCnt",searchVal);
		return 0;
	}
	//고객 상세 탭 - 캠페인 리스트
	@Override
	public List<Map<String, Object>> custTabCampList(Map<String, Object> searchVal) {
		List<Map<String, Object>> campList = session.selectList("customer.custTabCampList",searchVal);
		return campList;
	}


	


}
