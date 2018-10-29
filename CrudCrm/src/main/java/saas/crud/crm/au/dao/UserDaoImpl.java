package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Map<String, Object> getData(String userId) {
		
		Map<String, Object> urInfo= session.selectOne("user.idCheck", userId);
		
		return urInfo;
	}

	@Override
	public List<Map<String,String>> getMenu(String userId) {
		
		List<Map<String,String>> urMenu = session.selectList("user.urMenu", userId);
		
		return urMenu;
	}
	
}