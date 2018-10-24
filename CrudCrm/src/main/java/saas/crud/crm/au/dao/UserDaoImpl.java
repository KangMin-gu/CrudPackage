package saas.crud.crm.au.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public UserDto getData(String userId) {
		UserDto urDto = session.selectOne("idCheck", userId);
		
		return urDto;
	}
	
}
