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
		return session.selectList("code.list",search);
	}

	// 코드 통합 숫자
	@Override
	public int codeTotalRow(Map<String, Object> search) {
		return session.selectOne("code.totalRow",search);
	}
	
	// 코드 상세 정보
	@Override
	public Map<String, Object> codeRead(CodeDto codeDto) {
		return session.selectOne("code.detail",codeDto);
	}

	// 코드 추가
	@Override
	public int codeInsert(CodeDto codeDto) {
		session.insert("code.insert",codeDto);
		int codeNo = codeDto.getCodeno();
		
		return codeNo;
	}

	// 코드 수정
	@Override
	public void codeUpdate(CodeDto codeDto) {
		session.update("code.update",codeDto);
		
	}

	// 코드 삭제
	@Override
	public void codeDelete(CodeDto codeDto) {
		session.update("code.delete",codeDto);
	}

	// 상위 코드 명
	@Override
	public List<Map<String, Object>> upperCodeList(Map<String, Object> search) {
		return session.selectList("code.upperlist",search);
	}

	@Override
	public List<CodeDto> getCodeList(String codeGrp) {
		List<CodeDto> getCodeList = session.selectList("code.getCodeList",codeGrp);
		return getCodeList;
	}

	@Override
	public List<CodeDto> grpCodeList() {
		List<CodeDto> grpCodeList = session.selectList("code.grpCodeList");
		return grpCodeList;
	}
	// 상위 코드 값으로 하위 코드 값을 가져옴
	@Override
	public List<CodeDto> getUpperCodeGrp(CodeDto codeDto) {
		List<CodeDto> upperGrpCodeList = session.selectList("code.getUpperCodeGrp",codeDto);
		return upperGrpCodeList;
	}

	@Override
	public int getCodeNo(CodeDto codeDto) {
		int codeNo = session.selectOne("code.getCodeNo",codeDto);
		return codeNo;
	}

}
