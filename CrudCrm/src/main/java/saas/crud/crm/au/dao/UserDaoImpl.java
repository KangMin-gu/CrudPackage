package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

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

	@Override
	public void userHistory(Map<String,Object> param) {
		session.insert("user.loginHistory",param);
	}
	
	//공지사항
	@Override
	public List<Map<String, Object>> crudNotice() {
		List<Map<String, Object>> crudNotice = session.selectList("user.crudNotice");
		return crudNotice;
	}

	@Override
	public Map<String, Object> useInfo(String userId) {
		Map<String, Object> useInfo = session.selectOne("user.useCheck", userId);
		return useInfo;
	}

	@Override
	public Map<String, Object> userInfo(int userNo) {
		Map<String, Object> useInfo = session.selectOne("user.useInfo", userNo);
		return useInfo;
	}
	
}
