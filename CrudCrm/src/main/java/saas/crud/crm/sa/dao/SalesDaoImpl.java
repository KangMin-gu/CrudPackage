package saas.crud.crm.sa.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

@Repository
public class SalesDaoImpl implements SalesDao {

	@Autowired 
	private SqlSession session;
	
	//영업목록 카운팅
	@Override
	public int salesListCount(Map<String, Object> searchVal) {
		int totalCnt = session.selectOne("sales.salesListCount",searchVal);
		return totalCnt;
	}
	//영업 리스트
	@Override
	public List<Map<String, Object>> salesList(Map<String, Object> searchVal) {
		List<Map<String,Object>> salesList = session.selectList("sales.salesList",searchVal);
		return salesList;
	}
	//영업상세
	@Override
	public Map<String, Object> salesDetail(SalesDto salesDto) {
		Map<String,Object> salesDetail = session.selectOne("sales.salesDetail",salesDto);
		return salesDetail;
	}
	//영업추가
	@Override
	public int salesInsert(SalesDto salesDto) {
		session.insert("sales.salesInsert",salesDto);
		int salesNo = salesDto.getSalesno();
		return salesNo;
	}
	//영업수정
	@Override
	public int salesUpdate(SalesDto salesDto) {
		session.update("sales.salesUpdate",salesDto);
		int salesNo = salesDto.getSalesno();
		return salesNo;
	}
	//영업삭제
	@Override
	public int salesDelete(SalesDto salesDto) {
		int res = session.update("sales.salesDelete",salesDto);
		return res;
	}
	
	//관련고객 영업용
	@Override
	public List<Map<String, Object>> salesCustList(SalesDto SalesDto) {
		List<Map<String, Object>> saCustList = new ArrayList<Map<String,Object>>();
		saCustList = session.selectList("sales.salesCustList",SalesDto);
		return saCustList;
	}
	//거래처-영업리스트
	@Override
	public List<Map<String, Object>> cliSalesList(Map<String, Object> prm) {
		List<Map<String,Object>> cliSalesList = session.selectList("sales.cliSalesList",prm);
		return cliSalesList;
	}

}
