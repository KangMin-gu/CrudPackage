package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.CodeDto;

@Repository
public class CodeDaoImpl implements CodeDao {
	
	@Autowired
	SqlSession session;

	// 코드 List 검색
	@Override
	public List<Map<String, Object>> codeList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("code.list",search);
	}

	// 코드 통합 숫자
	@Override
	public int codeTotalRow(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("code.totalRow",search);
	}
	
	// 코드 상세 정보
	@Override
	public Map<String, Object> codeRead(CodeDto codeDto) {
		// TODO Auto-generated method stub
		return session.selectOne("code.detail",codeDto);
	}

	// 코드 추가
	@Override
	public int codeInsert(CodeDto codeDto) {
		// TODO Auto-generated method stub
		session.insert("code.insert",codeDto);
		int codeNo = codeDto.getCodeno();
		
		return codeNo;
	}

	// 코드 수정
	@Override
	public void codeUpdate(CodeDto codeDto) {
		// TODO Auto-generated method stub
		
		session.update("code.update",codeDto);
		
	}

	// 코드 삭제
	@Override
	public void codeDelete(CodeDto codeDto) {
		// TODO Auto-generated method stub
		session.update("code.delete",codeDto);
	}

	// 상위 코드 명
	@Override
	public List<Map<String, Object>> upperCodeList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("code.upperlist",search);
	}

	@Override
	public List<Map<String, Object>> getCodeList() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> getCodeList = session.selectList("code.getCodeList");
		return getCodeList;
	}

}
