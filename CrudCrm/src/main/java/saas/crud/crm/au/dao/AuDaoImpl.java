package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.UserDto;

@Repository
public class AuDaoImpl implements AuDao{

	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Map<String, Object>> urList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("au.list",search);
	}

	@Override
	public int urTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("au.totalRows",search);
	}

	@Override
	public Map<String, Object> urRead(UserDto userDto) {
		// TODO Auto-generated method stub
		return session.selectOne("au.detail",userDto);
	}

	@Override
	public int urInsert(UserDto userDto) {
		// TODO Auto-generated method stub
		session.insert("au.insert",userDto);
		int userNo = userDto.getUserno();
		
		return userNo;
	}

	@Override
	public void urUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		session.update("au.update",userDto);
	}

	@Override
	public void urDelete(UserDto userDto) {
		// TODO Auto-generated method stub
		session.update("au.delete",userDto);
	}

	@Override
	public int urIdCheck(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("au.idcheck",userId);
	}
}
