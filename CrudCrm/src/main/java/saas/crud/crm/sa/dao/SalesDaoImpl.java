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
import saas.crud.crm.sa.dto.SaleStateDto;
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
	//영업단계 2탭-영업단계-리스트 카운터
	@Override
	public int salesStateListCnt(Map<String, Object> searchVal) {
		int res = session.selectOne("sales.salesStateListCnt", searchVal);
		return res;
	}
	//영업상세 2탭-영업단계-리스트
	@Override
	public List<Map<String, Object>> salesStateList(Map<String, Object> searchVal) {
		List<Map<String, Object>> salesStateList = session.selectList("sales.salesStateList",searchVal);
		return salesStateList;
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
	//영업-추가,수정 시 영업-스케쥴 merge
	@Override
	public void mergeSalesSch(SalesDto salesDto) {
		session.insert("sales.mergeSalesSch",salesDto);
	}

	//영업삭제
	@Override
	public int salesDelete(SalesDto salesDto) {
		int res = session.update("sales.salesDelete",salesDto);
		return res;
	}
	//영업삭제-멀티
	@Override
	public int salesDelete(Map<String, Object> prm) {
		int res = session.update("sales.salesDelete",prm);
		return res;
	}
	
	
	//거래처화면-영업리스트
	@Override
	public List<Map<String, Object>> cliSalesList(Map<String, Object> prm) {
		List<Map<String,Object>> cliSalesList = session.selectList("sales.cliSalesList",prm);
		return cliSalesList;
	}
	
	//영업 상세- 영업관련고객카운터
	@Override
	public int salesCustListCnt(Map<String, Object> searchVal) {
		int res = session.selectOne("sales.salesCustListCnt",searchVal);
		return res;
	}
	//영업 상세 2탭 - 영업관련고객 리스트
	@Override
	public List<Map<String, Object>> salesCustList(Map<String, Object> prm) {
		List<Map<String, Object>> salesCustList = session.selectList("sales.salesCustList",prm);
		return salesCustList;
	}
	//영업 상세 3탭 - 접촉리스트 카운터
	@Override
	public int salesContListCnt(Map<String, Object> searchVal) {
		int res = session.selectOne("sales.salesContListCnt",searchVal);
		return res;
	}
	//영업 상세 3탭 - 접촉 리스트 
	@Override
	public List<Map<String, Object>> salesContList(Map<String, Object> prmMAp) {
		List contList = session.selectList("sales.salesContList",prmMAp);
		return contList;
	}	
		
	//관련고객팝업 -추가
	@Override
	public int salesCustInsert(SalesCustDto salesCustDto) {
		int res = session.insert("sales.salesCustInsert",salesCustDto);
		return res;
	}
	//관련고객팝업-상세
	@Override
	public Map<String, Object> salesCustDetail(SalesCustDto salesCustDto) {
		Map<String,Object> salesCustDetail = session.selectOne("sales.salesCustDetail",salesCustDto);
		return salesCustDetail;
	}
	//관련고객 팝업-삭제
	@Override
	public int salesCustDelete(SalesCustDto salesCustDto) {
		int res = session.update("sales.salesCustDelete",salesCustDto);
		return res;
	}
	//관련고객 팝업-수정
	@Override
	public int salesCustUpdate(SalesCustDto salesCustDto) {
		int res = session.update("sales.salesCustUpdate",salesCustDto);
		return res;
	}
	
	//영업단계-추가실행
	@Override
	public int salesStateInsert(Map<String,Object> insVal) {
		int res = session.insert("sales.salesStateInsert",insVal);
		return res;
	}
	
	//스케쥴리스트
	@Override
	public List<Map<String, Object>> salesSchList(Map<String, Object> schVal) {
		List<Map<String, Object>> schList = session.selectList("sales.salesSchList",schVal);
		return schList;
	}
	
	//스케쥴추가
	@Override
	public int salesSchInsert(Map<String, Object> schVal) {
		int res = session.insert("sales.salesSchInsert",schVal);
		return res;
	}
	
	//영업일정 수정
	@Override
	public int salesSchUpdate(Map<String, Object> schVal) {
		int res = session.update("sales.salesSchUpdate",schVal);
		return res;
	}
	//영업일정 상세
	@Override
	public Map<String, Object> salesSchDetail(Map<String, Object> schVal) {
		Map<String, Object> schDetail = session.selectOne("sales.salesSchDetail", schVal);
		return schDetail;
	}
	//영업 공통일정 리스트
	@Override
	public List<Map<String, Object>> salesComSchList(Map<String, Object> schVal) {
		List<Map<String, Object>> comSchList = session.selectList("sales.salesComSchList",schVal);
		return comSchList;
	}
	//영업 공통일정 추가
	@Override
	public int salesComSchInsert(Map<String, Object> schVal) {
		int res = session.insert("sales.salesComSchInsert",schVal);
		return res;
	}
	//영업 공통일정 상세
	@Override
	public Map<String, Object> salesComSchDetail(Map<String, Object> schVal) {
		Map<String,Object> comSchDetail = session.selectOne("sales.salesComSchDetail", schVal);
		return comSchDetail;
	}
	//영업-스케쥴추가 (공통일정 drag를 통한 추가)
	@Override
	public int salesSchInsertFromCom(Map<String, Object> schVal) {
		session.insert("salesSchInsertFromCom", schVal);
		int schno = Integer.parseInt(schVal.get("schno").toString());//insert한 id 반환 
		return schno;
	}
	
	//영업 공통일정 - 수정
	@Override
	public int salesComSchUpdate(Map<String, Object> schVal) {
		int res = session.update("sales.salesComSchUpdate",schVal);
		return res;
	}
	//고객-상세탭-영업리스트 카운터
	@Override
	public int custTabSalesListCnt(Map<String, Object> searchVal) {
		int res = session.selectOne("sales.custTabSalesListCnt",searchVal);
		return res;
	}
	//고객-상세탭-영업리스트
	@Override
	public List<Map<String, Object>> custTabSalesList(Map<String, Object> searchVal) {
		List<Map<String,Object>> salesList = new ArrayList<Map<String,Object>>();
		salesList = session.selectList("sales.custTabSalesList",searchVal);
		return salesList;
	}
	
	

	
}
