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

	@Override
	public List<Map<String, Object>> codeList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("code.list",search);
	}

	@Override
	public int codeTotalRow(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("code.totalRow",search);
	}
	
	@Override
	public Map<String, Object> codeRead(int codeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("code.detail",codeNo);
	}

	@Override
	public int codeInsert(CodeDto codeDto) {
		// TODO Auto-generated method stub
		session.insert("code.insert",codeDto);
		int codeNo = codeDto.getCodeno();
		
		return codeNo;
	}

	@Override
	public void codeUpdate(CodeDto codeDto) {
		// TODO Auto-generated method stub
		
		session.update("code.update",codeDto);
		
	}

	@Override
	public void codeDelete(int codeNo) {
		// TODO Auto-generated method stub
		session.update("code.delete",codeNo);
	}



}
