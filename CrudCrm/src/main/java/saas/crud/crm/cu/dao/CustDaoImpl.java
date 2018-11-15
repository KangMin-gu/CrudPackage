package saas.crud.crm.cu.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;



@Repository
public class CustDaoImpl implements CustDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int totalCnt(Map<String, Object> map) {
		int totalcnt = session.selectOne("customer.totalcnt",map);
		return totalcnt;
	}

	@Override
	public List<Map<String,Object>> custList(Map<String, Object> searchVal) {
		List<Map<String,Object>> custList = session.selectList("customer.custList",searchVal);
		return custList;
	}
	

	
	
	@Override
	public Map<String,Object> custDetail(Map<String,Object> custVal){
		Map<String,Object> map = session.selectOne("customer.custDetail",custVal);
		return map;
	}
	
	@Override
	public Map<String,Object> custUpdateForm(int custno){
		Map<String,Object> map = session.selectOne("customer.custUpdateForm",custno);
		return map;
	}

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

	@Override
	public void custformInsertDeny(CustDenyDto custDenyDto) {
		session.insert("customer.custformInsertDeny", custDenyDto);

	}

	@Override
	public int custformUpdate(CustDto custDto) {
		int res = session.insert("customer.custformUpdate", custDto);
		return res;
	}

	@Override
	public int custformUpdateDeny(CustDenyDto custDenyDto) {
		int res = session.insert("customer.custformUpdateDeny", custDenyDto);
		return res;
	}

	


}
